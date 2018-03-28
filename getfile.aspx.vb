#region " Imports "
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Web
Imports System.Collections
Imports System.IO
Imports System.Web.UI.WebControls
#End Region

Public Partial Class GetFile
    Inherits System.Web.UI.Page

Private Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        ' UserClass.CheckLogin(Page)

    Dim sKeyFields As String = Request.QueryString("key")
    Dim sTableName As String = Request.QueryString("table")
    Dim sDataFieldName As String = Request.QueryString("field")
    Dim sFileName As String = Request.QueryString("filename")

    If sKeyFields Is Nothing Then
        fGetFile(sFileName)
    Else
        GetFileFromDB(sKeyFields, sTableName, sFileName, sDataFieldName)
    End If
End Sub

Private Sub fGetFile(ByVal sFileName As String)
    If sFileName = String.Empty Then
        Exit Sub
    End If
        Try
            'Dim fStream As FileStream = New FileStream(Server.MapPath(sFileName), FileMode.OpenOrCreate, FileAccess.Read)
            Dim fStream As FileStream = New FileStream(sFileName, FileMode.OpenOrCreate, FileAccess.Read)
            Dim b As Byte() = New Byte(fStream.Length - 1) {}
            While (fStream.Read(b, 0, CInt(Fix(fStream.Length))) > 0)
            End While

            fStream.Close()
            DownloadFile(b, sFileName)
        Catch ex As Exception
            Response.Write(ex.Message)
        End Try
End Sub

Private Sub GetFileFromDB(ByVal sKeyFields As String, ByVal sTableName As String, ByVal sFileName As String, ByVal sDataFieldName As String)
    If sKeyFields = String.Empty OrElse sTableName = String.Empty OrElse sFileName = String.Empty Then
        Exit Sub
    End If

    Dim sSQLSelect As String
    If sFileName = String.Empty Then
        sSQLSelect = "select " & "[" & sDataFieldName & "] from " & sTableName & " where 2=2 "
    Else
        sSQLSelect = "select " & "[" & sFileName & "]," & "[" & sDataFieldName & "] from " & sTableName & " where 2=2 "
    End If

        Dim cts As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("Device_saConnectionString")
    Dim sds As SqlDataSource = New SqlDataSource()
    Try
        sds.ConnectionString = cts.ConnectionString
        sds.ProviderName = cts.ProviderName
        sds.DataSourceMode = SqlDataSourceMode.DataReader
        sds.SelectCommand = sSQLSelect

        For Each s As String In sKeyFields.Split(";".ToCharArray())
            If s.Split("=").Length <> 2 Then
                Continue For
            End If
            Dim sFieldName As String = s.Split("=")(0)
            sds.SelectCommand &= " And [" & sFieldName & "]=@" & func.BuildParameterName(sFieldName)
            sds.SelectParameters.Add(func.BuildParameterName(sFieldName), s.Split("=")(1))
        Next s

        Dim IDs As IEnumerable = sds.Select(System.Web.UI.DataSourceSelectArguments.Empty)
        For Each row As System.Data.Common.DbDataRecord In IDs
            If row(sDataFieldName) Is DBNull.Value Then
                Exit Sub
            End If
            If sFileName <> String.Empty AndAlso Not (row(sFileName) Is DBNull.Value) Then
                sFileName = Convert.ToString(row(sFileName))
            Else
                sFileName = "file.bin"
            End If

            Dim b As Byte() = CType(row(sDataFieldName), Byte())
            DownloadFile(b, sFileName)
            Exit For
        Next row
    Catch ex As Exception
        Response.Write(ex.Message)
    Finally
        sds.Dispose()
    End Try    
End Sub

Private Sub DownloadFile(ByVal b As Byte(), ByVal sFileName As String)
    If b.Length = 0 Then
        Exit Sub
    End If
    Dim sContentType As String = "application/octet-stream"
    Select Case sFileName.Remove(0, sFileName.Length-4)
        Case ".asf"
            sContentType = "video/x-ms-asf"
        Case ".avi"
            sContentType = "video/avi"
        Case ".doc"
            sContentType = "application/msword"
        Case ".zip"
            sContentType = "application/zip"
        Case ".xls"
            sContentType = "application/vnd.ms-excel"
        Case ".gif"
            sContentType = "image/gif"
        Case ".jpg", "jpeg"
            sContentType = "image/jpeg"
        Case ".wav"
            sContentType = "audio/wav"
        Case ".mp3"
            sContentType = "audio/mpeg3"
        Case ".mpg", "mpeg"
            sContentType = "video/mpeg"
        Case ".rtf"
            sContentType = "application/rtf"
        Case ".htm", "html"
            sContentType = "text/html"
        Case ".asp"
            sContentType = "text/asp"
        Case ".pdf"
            ContentType = "application/pdf"
    End Select

    Response.AddHeader("Content-Disposition", "attachment;Filename=" & sFileName.Remove(0, sFileName.LastIndexOfAny("\/".ToCharArray()) + 1))
    Response.AddHeader("Content-Length", b.Length.ToString())
    Response.ContentType = sContentType
    Response.BinaryWrite(b)
    Response.End()
    
End Sub

End Class