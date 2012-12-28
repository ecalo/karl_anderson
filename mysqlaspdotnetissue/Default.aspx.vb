Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Web.Configuration
Imports System.Net.Mail
Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub calltask(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAssign.Click
        Try

            Dim db As New DBHelper
            db.ExecuteNonQuery(CommandType.Text, "CALL ;")
        Catch ex As Exception
            Response.Write(ex.Message)
        End Try

    End Sub
End Class
