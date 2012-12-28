Imports System
Imports System.Data
Imports System.Data.Common
Imports System.Collections.Generic
Imports System.Web
Imports System.Collections
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Web.Script.Serialization
Imports System.Web.Script.Services

' To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
<System.Web.Script.Services.ScriptService()> _
<WebService(Namespace:="http://tempuri.org/")> _
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Public Class WebService
    Inherits System.Web.Services.WebService

    <WebMethod()> _
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Function Upload() As String
        ' This is just a simulation of upload functionality. Upon successful upload into input table, return the session id to the user for tracking later.
        Dim js As New JavaScriptSerializer
        Dim db As New DBHelper
        Dim res As New Dictionary(Of String, Object)
        Dim sql As String
        Dim sessionid As String
        Dim rowCount As Integer
        sessionid = Guid.NewGuid().ToString().Replace("-", "")
        sql = "INSERT INTO `vendor_file` (`tic_import_date`, `sys`, `vend_num`, `vend_site_id`, `vend_type`, `vend_commod`, `vend_name`, `vend_name2`, `vend_name3`, `vend_name4`, `tax_id`, `payment_terms`, `address1`, `address2`, `address3`, `address4`, `po_box`, `city`, `state`, `zip`, `country`, `telephone`, `fax`, `email`, `website`, `flex1`, `flex2`, `flex3`, `flex4`, `spend`, `custacctnumber`, `created_on`, `created_by`, `session_id`)" & _
              "SELECT NOW() AS `tic_import_date`, `sys`, `vend_num`, `vend_site_id`, `vend_type`, `vend_commod`, `vend_name`, `vend_name2`, `vend_name3`, `vend_name4`, `tax_id`, `payment_terms`, `address1`, `address2`, `address3`, `address4`, `po_box`, `city`, `state`, `zip`, `country`, `telephone`, `fax`, `email`, `website`, `flex1`, `flex2`, `flex3`, `flex4`, `spend`, `custacctnumber`, `created_on`, `created_by`, '" & sessionid & "' AS session_id " & _
              "FROM vendor_file WHERE session_id IS NULL;"
        Try
            db.ExecuteNonQuery(CommandType.Text, sql)
            sql = String.Format("INSERT INTO `vendor_queue`(session_id, state, source) VALUES ('{0}','PENDING','vendor_file');", sessionid)
            rowCount = db.ExecuteNonQuery(CommandType.Text, sql)
            res.Add("result", 1)
            res.Add("message", "The records have been successfully loaded.")
            res.Add("sessionid", sessionid)
        Catch ex As Exception
            res.Add("result", 0)
            res.Add("message", ex.Message)
        End Try
        Return js.Serialize(res)
    End Function

    <WebMethod()> _
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Function ProcessTracker(ByVal sessionid As String, ByVal lastlogid As Integer) As String
        ' This is just a simulation of upload functionality. Upon successful upload into input table, return the session id to the user for tracking later.
        Dim js As New JavaScriptSerializer
        Dim db As New DBHelper
        Dim rdr As DbDataReader
        Dim res As New Dictionary(Of String, Object)
        Dim row As Dictionary(Of String, Object)
        Dim rows As New List(Of Dictionary(Of String, Object))
        Dim sql As String
        Dim list As New List(Of Object)
        Dim logId As String
        Dim totalProcessTime As TimeSpan
        sql = String.Format("SELECT status_update, activity, log_id FROM event_log WHERE session_id = '{0}' AND log_id > {1} ORDER BY log_id, activity; SELECT state, process_starts_on, process_ends_on FROM vendor_queue WHERE session_id = '{0}';", sessionid, lastlogid)
        Try
            rdr = db.ExecuteReader(CommandType.Text, sql)
            While rdr.Read
                row = New Dictionary(Of String, Object)
                row.Add("status", rdr.GetString(0))
                row.Add("activity", rdr.GetString(1))
                rows.Add(row)
                logId = rdr.GetString(2)
            End While
            res.Add("result", 1)
            If rows.Count > 0 Then
                res.Add("row_count", rows.Count)
                res.Add("last_log_id", logId)
                res.Add("detailed_statuses", rows)
            End If
            rdr.NextResult()
            While rdr.Read
                res.Add("status", rdr.GetString(0))
                If rdr.GetString(0) = "SUCCESSFUL" Then
                    totalProcessTime = rdr.GetDateTime(2) - rdr.GetDateTime(1)
                    res.Add("total_process_time", totalProcessTime.Minutes & " minutes " & totalProcessTime.Seconds & " seconds")
                End If

            End While
        Catch ex As Exception
            res.Add("result", 0)
            res.Add("message", ex.Message)
        End Try
        Return js.Serialize(res)
    End Function

End Class
