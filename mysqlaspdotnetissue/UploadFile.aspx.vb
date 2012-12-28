Imports System
Imports System.Web
Imports System.Web.Services
Imports System.Web.Script.Services

<ScriptService()> _
Partial Class UploadFile
    Inherits System.Web.UI.Page

    <WebMethod()> _
    Public Function HelloWorld() As String
        Return "Hello World"
    End Function
End Class
