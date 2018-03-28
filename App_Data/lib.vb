#region "Imports"
Imports System
Imports System.Configuration
Imports System.Data
Imports System.Collections
Imports System.Web
Imports System.Web.UI.WebControls

Imports System.Net.Mail

#End Region

Public Class func

Public Shared Function str2date(ByVal sDate As String, ByVal sFormat As String) As DateTime
	If sDate = String.Empty Then
        Return DateTime.MinValue
	End If
    
	If sFormat = "CultureInfo.CurrentCulture.DateTimeFormat.ShortDatePattern" Then
		sFormat = System.Globalization.CultureInfo.CurrentCulture.DateTimeFormat.ShortDatePattern
	End If
	
    sDate = sDate.Trim()
	If sFormat.IndexOfAny("ms:".ToCharArray()) >= 0 AndAlso sDate.Length < 19 Then
		If sDate.Split(" ".ToCharArray()).Length > 1 AndAlso sDate.Length = 16 Then
			sDate += ":00"
		Else
			sDate += " 00:00:00"
		End If
	End If
    
	Return System.Xml.XmlConvert.ToDateTime(sDate, sFormat)
    
End Function

Public Shared Function date2str(ByVal dtDate As DateTime, ByVal sFormat As String) As String
	If dtDate = DateTime.MinValue Then
        Return String.Empty
	End If
    
	If sFormat = "CultureInfo.CurrentCulture.DateTimeFormat.ShortDatePattern" Then
	   sFormat = System.Globalization.CultureInfo.CurrentCulture.DateTimeFormat.ShortDatePattern
	End If
    
	Return System.Xml.XmlConvert.ToString(dtDate, sFormat)
    
End Function

Public Shared Sub GetMenu(ByVal ddlQuickJump As DropDownList, ByVal sCaption As String)
	ddlQuickJump.Items.Clear()
	ddlQuickJump.Items.Add(New ListItem("Back to menu", "menu.aspx"))

    ddlQuickJump.Items.Add(new ListItem("dbo.upload", "upload_list.aspx"))

    ddlQuickJump.Items.Add(new ListItem("dbo.WORK_INSERT", "WORK_INSERT_list.aspx"))

	If ddlQuickJump.Items.FindByText(sCaption) Is Nothing Then
		ddlQuickJump.Items.Add(New ListItem("", ""))
		ddlQuickJump.Items.FindByText("").Selected = True
	Else
		ddlQuickJump.Items.FindByText(sCaption).Selected = True
	End If
    
End Sub

Public Shared Function GetSqlDataSource(ByVal sSQLSelect As String) As SqlDataSource
	Dim cts As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("Project1ConnectionString")
	Dim sds As SqlDataSource = New SqlDataSource(cts.ProviderName, cts.ConnectionString, sSQLSelect)
	sds.DataSourceMode = SqlDataSourceMode.DataReader
	
    Return sds    
End Function

Public Shared Function BuildParameterName(ByVal sFieldName As String) As String
	Dim sReturn As String = ""

    For i As Integer = 0 To sFieldName.Length - 1
		If sFieldName.Chars(i) = "[" OrElse sFieldName(i) = "]" Then
            Continue For
		End If
		If (sFieldName.Chars(i) >= "A" AndAlso sFieldName.Chars(i) <= "Z") _
            OrElse (sFieldName(i) >= "a" AndAlso sFieldName.Chars(i) <= "z") _
            OrElse (sFieldName(i) >= "0" AndAlso sFieldName.Chars(i) <= "9") _
            OrElse sFieldName.Chars(i) = "_" Then
			sReturn += sFieldName.Chars(i)
		Else
			sReturn += "_"
		End If
    Next i

	Return sReturn    
End Function

Public Shared Function SqlBuilder(ByVal sSQL As String, ByVal sAddString As String) As String
	If sAddString = String.Empty Then
        Return sSQL.Trim()
	End If

	Dim iPos As Integer = sSQL.ToLower().IndexOf(" where ")
	If iPos < 0 Then
		sAddString = " where " + sAddString + " "
        Dim groupByPos As Integer = sSQL.ToLower().IndexOf(" group by ")
        If groupByPos > 0 Then
            sSQL = sSQL.Insert(groupByPos, sAddString)
        Else
            Dim orderByPos As Integer = sSQL.ToLower().IndexOf(" order by ")
            If orderByPos < 0 Then
                sSQL += sAddString
            Else
                sSQL = sSQL.Insert(orderByPos, sAddString)
            End If
        End If    
	Else
		iPos += 7
		If sSQL.Length > iPos Then
		sAddString += " And "
		End If
		sSQL = sSQL.Insert(iPos, sAddString)
	End If

	Return sSQL.Trim()
End Function

Public Shared Function WhereBuilder(ByVal sWhere As String, ByVal sAdd As String) As String
	Return WhereBuilder(sWhere, sAdd, "And")
End Function

Public Shared Function WhereBuilder(ByVal sWhere As String, ByVal sAdd As String, ByVal sLogicalOperator As String) As String
    If sAdd = String.Empty Then
        Return sWhere.Trim()
	End If
    
	If sWhere = String.Empty Then
        Return sAdd
	End If
    
	Dim sReturn As String = ""
	If sWhere.Trim().EndsWith(sLogicalOperator, StringComparison.OrdinalIgnoreCase) Then
		sReturn = sWhere.Trim() + " " + sAdd
	Else
		sReturn = sWhere.Trim() + " " + sLogicalOperator + " " + sAdd
	End If
    
	Return sReturn
End Function

Public Shared Sub AddGlyph(ByVal grid As GridView, ByVal item As GridViewRow)
	Dim glyph As Label = New Label()
	If grid.SortDirection = SortDirection.Ascending Then
		glyph.Text = "&nbsp" + ("<IMG src=""Images/down.gif"" border=0/>")
	Else
		glyph.Text = "&nbsp" + ("<IMG src=""Images/up.gif"" border=0/>")
	End If

    For i As Integer = 0 To grid.Columns.Count - 1
		Dim colExpr As String = grid.Columns(i).SortExpression
		If colExpr <> String.Empty AndAlso colExpr = grid.SortExpression Then
            item.Cells(i).Controls.Add(glyph)
		End If
		If item.Cells(i).Controls.Count > 0 AndAlso TypeOf (item.Cells(i).Controls(0)) Is LinkButton Then
			CType(item.Cells(i).Controls(0), LinkButton).CssClass = grid.HeaderStyle.CssClass
		Else
			item.Cells(i).CssClass = grid.HeaderStyle.CssClass
		End If
    Next i
End Sub

  'Date as ddl
Public Shared Sub DateToDropDownList(ByVal dt As DateTime, ByRef ddlDay As System.Web.UI.WebControls.DropDownList, ByRef ddlMonth As System.Web.UI.WebControls.DropDownList, ByRef ddlYear As System.Web.UI.WebControls.DropDownList)
  Dim i As Integer
  i = (IIf(dt.Year = 1, DateTime.Now.Year, dt.Year)) - 50
  While i <= (IIf(dt.Year = 1, DateTime.Now.Year, dt.Year)) + 50
	ddlYear.Items.Add(New System.Web.UI.WebControls.ListItem(i.ToString(), i.ToString()))
	i += 1
  End While

  If dt = DateTime.MinValue Then
    Exit Sub
  End If

  ddlDay.SelectedValue = dt.Day.ToString()
  ddlMonth.SelectedValue = dt.Month.ToString()
  If dt.Year = 1 Then
	  ddlYear.SelectedValue = System.Convert.ToString(DateTime.Now.Year)
  Else
	  ddlYear.SelectedValue = System.Convert.ToString(dt.Year)
  End If
End Sub

Public Shared Function DropDownListToDate(ByRef ddlDay As System.Web.UI.WebControls.DropDownList, ByRef ddlMonth As System.Web.UI.WebControls.DropDownList, ByRef ddlYear As System.Web.UI.WebControls.DropDownList) As Object
  Dim sDayRequiredDate, sMonthdtRequiredDate, sYeardtRequiredDate As String

  sDayRequiredDate = ddlDay.SelectedValue
  sMonthdtRequiredDate = ddlMonth.SelectedValue
  sYeardtRequiredDate = ddlYear.SelectedValue

  If sDayRequiredDate = String.Empty AndAlso sMonthdtRequiredDate = String.Empty AndAlso sYeardtRequiredDate = String.Empty Then
    Return Nothing
  ElseIf sDayRequiredDate = String.Empty OrElse sMonthdtRequiredDate = String.Empty OrElse sYeardtRequiredDate = String.Empty Then
	  Throw New System.Exception("Invalid Datetime format")
  End If

  If sDayRequiredDate.Length < 2 Then
    sDayRequiredDate = "0" + sDayRequiredDate
  End If
  If sMonthdtRequiredDate.Length < 2 Then
    sMonthdtRequiredDate = "0" + sMonthdtRequiredDate
  End If

  Return System.Xml.XmlConvert.ToDateTime(sDayRequiredDate + "/" + sMonthdtRequiredDate + "/" + sYeardtRequiredDate, "dd/MM/yyyy")
End Function

  'lookup column as ddl
Public Shared Sub LoadDataToLookUp(ByRef ddlLookUp As DropDownList, ByVal sSQLSelect As String, ByVal sCurrentValue As String)
	ddlLookUp.Items.Clear()	
	ddlLookUp.DataSource = GetSqlDataSource(sSQLSelect)
	ddlLookUp.DataBind()    
	ddlLookUp.Items.Insert(0, "")
    ddlLookUp.SelectedValue = Nothing    
	If Not (ddlLookUp.Items.FindByValue(sCurrentValue) Is Nothing) Then
        ddlLookUp.SelectedValue = sCurrentValue
	Else
		ddlLookUp.SelectedIndex = 0
	End If
End Sub

'lookup column as rbl
Public Shared Sub LoadDataToLookUp(ByRef ddlLookUp As System.Web.UI.WebControls.RadioButtonList, ByVal sSQLSelect As String, ByVal sCurrentValue As String)
	ddlLookUp.Items.Clear()
	ddlLookUp.DataSource = GetSqlDataSource(sSQLSelect)
	ddlLookUp.DataBind()
	ddlLookUp.Items.Insert(0, "")
    ddlLookUp.SelectedValue = Nothing      
	If Not (ddlLookUp.Items.FindByValue(sCurrentValue) Is Nothing) Then
        ddlLookUp.SelectedValue = sCurrentValue
	Else
		ddlLookUp.SelectedIndex = 0
	End If
End Sub

Public Shared Sub LoadDataToLookUp(ByRef ddlLookUp As System.Web.UI.WebControls.ListBox, ByVal sSQLSelect As String, ByVal sCurrentValue As String)
	ddlLookUp.Items.Clear()
	ddlLookUp.DataSource = GetSqlDataSource(sSQLSelect)
	ddlLookUp.DataBind()
	ddlLookUp.Items.Insert(0, "")
	ddlLookUp.SelectedValue = Nothing    
    For Each s As String In sCurrentValue.Split(",")
        If Not IsNothing(ddlLookUp.Items.FindByValue(s)) Then
             ddlLookUp.Items.FindByValue(s).Selected = True
        End If
    Next

    If String.IsNullOrEmpty(ddlLookUp.SelectedValue) Then
            ddlLookUp.SelectedIndex = 0
    End If    
End Sub

Public Shared Function GetLookupValue(ByVal sDisplayField As String, ByVal sLinkField As String, ByVal sTable As String, ByVal sValue As String, ByVal TType As TypeCode, Optional ByVal isMultiline As Boolean = False) As String
	Dim sGetLookupValue As String = ""
	Dim cts As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("Project1ConnectionString")

    Dim sqlSelect As String = "SELECT " + sDisplayField + " FROM " + sTable + " WHERE "
    Dim sds As SqlDataSource = New SqlDataSource()

    Try

        sds.ProviderName = cts.ProviderName
        sds.ConnectionString = cts.ConnectionString

        If isMultiline Then
            Dim i As Integer = 0
            For Each s As String In sValue.Split(",")
                Dim paramName = "param" + i.ToString()
                sqlSelect += sLinkField + "=@" + paramName + " Or "
                sds.SelectParameters.Add(paramName, TType, s)
                i += 1
            Next
            If sqlSelect.Length > 2 Then sqlSelect = sqlSelect.Remove(sqlSelect.Length - 3)
        Else
            sqlSelect += sLinkField + "= @LinkField"
            sds.SelectParameters.Add("LinkField", TType, sValue)
        End If
        
        sds.SelectCommand = sqlSelect
        sds.DataSourceMode = SqlDataSourceMode.DataReader

        Dim dbDr As System.Data.Common.DbDataReader = CType(sds.Select(System.Web.UI.DataSourceSelectArguments.Empty), System.Data.Common.DbDataReader)
        If dbDr.HasRows Then
            If isMultiline Then
                While (dbDr.Read())
                    sGetLookupValue += dbDr(0).ToString() + ","
                End While
                sGetLookupValue = sGetLookupValue.Trim(",".ToCharArray())
            Else
                If dbDr.Read() Then sGetLookupValue = dbDr(0).ToString()
            End If
        End If
		dbDr.Dispose()
	 Finally
		 sds.Dispose()
	 End Try

	 Return sGetLookupValue
End Function

'Upload binary file
Public Shared Function GetBinary(ByRef _InputFile As FileUpload) As Object
    If Not (_InputFile.PostedFile Is Nothing) Then
        Dim iImageSize As Integer = _InputFile.PostedFile.ContentLength
		If iImageSize = 0 Then
            Throw New System.Exception(" File '" + _InputFile.PostedFile.FileName + "' not found<br>")
		End If

        Dim ImageStream As System.IO.Stream = _InputFile.PostedFile.InputStream
		Dim ImageContent As Byte() = New Byte(iImageSize - 1){}
		ImageStream.Read(ImageContent, 0, iImageSize)
		Return ImageContent
    Else
        Return DBNull.Value
    End If
End Function

Public Shared Sub DeleteFile(ByVal sFileName As String)
    Dim fiDescription As System.IO.FileInfo = New System.IO.FileInfo(sFileName)
	If fiDescription.Exists Then
        fiDescription.Delete()
	End If
End Sub

Public Shared Function GetNavigateUrl(ByVal sValue As String, ByVal sLinkType As String) As String
    If sValue.StartsWith(sLinkType) Then
        Return (sValue)
    Else
        Return (sLinkType + sValue)
  End If
End Function

Public Shared Function ProcessLargeText(ByVal sValue As String, ByVal iNumberOfChars As Integer, ByVal tableName As String, ByVal param As String) As String
	Dim sProcessLargeText As String = ""
	If sValue.TrimStart().StartsWith("<a href") OrElse sValue = String.Empty OrElse sValue = "&nbsp;" Then
        Return sValue
	End If
	If iNumberOfChars > 0 Then
		If sValue.Length > iNumberOfChars AndAlso (Not sValue.TrimStart().StartsWith("<a href")) Then
            sProcessLargeText = sValue.Substring(0, iNumberOfChars).Replace("'","'") + " <a href=""#"" onClick=""javascript: pwin = window.open('',null,'height=300,width=400,status=yes,resizable=yes,toolbar=no,menubar=no,location=no,left=150,top=200,scrollbars=yes'); " + "pwin.location='" + tableName + "_fulltext.aspx?" + HttpUtility.HtmlEncode(param) + "';" + "return false;"">" + "More" + "&nbsp;...</a>"
		End If
	End If
	Return sProcessLargeText
End Function

Public Shared Sub SendMail(ByVal mailTo As String, ByVal subj As String, ByVal body As String)
	Dim mailSender As String = ConfigurationManager.AppSettings("MailSender")
	Dim mailSmtpServer As String = ConfigurationManager.AppSettings("MailSmtpServer")
	Dim mailSmtpPort As String = ConfigurationManager.AppSettings("MailSmtpPort")
	Dim mailSMTPUser As String = ConfigurationManager.AppSettings("MailSMTPUser")
	Dim mailSMTPPassword As String = ConfigurationManager.AppSettings("MailSMTPPassword")

	If String.IsNullOrEmpty(mailSender) OrElse String.IsNullOrEmpty(mailTo) Then
        Exit Sub
	End If
	Dim mail As MailMessage = New MailMessage(mailSender, mailTo, subj, body)

	'send the message
	Dim smtp As SmtpClient = New SmtpClient(mailSmtpServer)
	smtp.Port = Convert.ToInt32(mailSmtpPort)

	If mailSMTPUser <> "" Then
		'to authenticate we set the username AndAlso password properites on the SmtpClient
		smtp.Credentials = New System.Net.NetworkCredential(mailSMTPUser, mailSMTPPassword)
	End If
	smtp.Send(mail)
End Sub

Public Shared Function IsDate(ByVal dt As Object) As Boolean
    Try
        System.DateTime.Parse(dt.ToString())
		Return True
	Catch
		Return False
	End Try
End Function
Public Shared Function IsNumeric(ByVal oValue As Object) As Boolean
    Try
		Double.Parse(oValue.ToString())
		Return True
	Catch
		Return False
	End Try
End Function

End Class

Public Class UserClass

	Private _id As Guid
	'
	Private _userName As String
	Private _password As String

Public Property ID() As Guid
	Get
		Return _id
	End Get
	Set
		_id = Value
	End Set
End Property

Public Property UserName() As String
    Get
	  Return _userName
    End Get
	Set
		_userName = Value
	End Set
End Property

Public Property Password() As String
    Get
	  Return _password
    End Get
    Set
	  _password = Value
  End Set
End Property

Public Function Login(ByVal txtUser As String, ByVal txtPassword As String) As UserClass

    Dim UserLogin As UserClass = New UserClass()

	Dim sLoginFrom As String = ConfigurationManager.AppSettings("LoginFrom")
	If sLoginFrom = "DB" Then
        Dim sTable As String = ConfigurationManager.AppSettings("UserListTable")
		Dim sLogin As String = ConfigurationManager.AppSettings("FieldUserLogin")
		Dim sLoginType As String = ConfigurationManager.AppSettings("FieldUserLoginType")
		Dim sPwd As String = ConfigurationManager.AppSettings("FieldUserPwd")
		Dim sPwdType As String = ConfigurationManager.AppSettings("FieldUserPwdType")

        If sTable = String.Empty OrElse sLogin = String.Empty OrElse sPwd = String.Empty Then
            Return Nothing
        End If

        Dim sSQL As String = "select [" + sLogin + "],[" + sPwd + "]"

        sTable = sTable.Replace(".", "].[")
        sSQL += " from [" + sTable + "] where [" + sLogin + "] = @Login And [" + sPwd + "] = @Password "

		Dim cts As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("Project1ConnectionString")
		Dim sds As SqlDataSource = New SqlDataSource(cts.ProviderName, cts.ConnectionString, sSQL)
		Try
			sds.DataSourceMode = SqlDataSourceMode.DataReader
			sds.SelectParameters.Add("Login", CType(System.Enum.Parse(GetType(TypeCode), sLoginType), TypeCode), txtUser)
			sds.SelectParameters.Add("Password", CType(System.Enum.Parse(GetType(TypeCode), sPwdType), TypeCode),txtPassword)

			Dim dbDr As System.Data.Common.DbDataReader = CType(sds.Select(System.Web.UI.DataSourceSelectArguments.Empty), System.Data.Common.DbDataReader)

			If dbDr.HasRows AndAlso dbDr.Read() Then
				If dbDr(sLogin).ToString() = txtUser AndAlso dbDr(sPwd).ToString() = txtPassword Then
					UserLogin.ID = Guid.NewGuid()

				End If
			End If
			dbDr.Dispose()
		Finally
			sds.Dispose()
		End Try
	Else
		If txtUser = ConfigurationManager.AppSettings("UserLogin") AndAlso txtPassword = ConfigurationManager.AppSettings("UserPassword") Then
			UserLogin.ID = Guid.NewGuid()
		End If
	End If

  If UserLogin.ID = Guid.Empty Then
    Return Nothing
  Else
	UserLogin.UserName = txtUser
	Return UserLogin
  End If
End Function

Public Shared Sub CheckLogin(ByVal Page As System.Web.UI.Page)
	If String.IsNullOrEmpty(ConfigurationManager.AppSettings("LoginMethod")) OrElse (ConfigurationManager.AppSettings("LoginMethod")).ToUpper() = "WITHOUTLOGIN" Then
        Exit Sub
	End If
	If Page.Session("User") Is Nothing Then
        Page.Response.Redirect(ConfigurationManager.AppSettings("LoginFile") + "?url=" + Page.Request.RawUrl)
	End If
	If (CType(Page.Session("User"), UserClass)).ID = Guid.Empty Then
        Page.Response.Redirect(ConfigurationManager.AppSettings("LoginFile") + "?url=" + Page.Request.RawUrl)
	End If
End Sub

End Class