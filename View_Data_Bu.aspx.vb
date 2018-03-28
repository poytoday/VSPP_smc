#Region " Imports "
Imports System
Imports System.Data
Imports System.Web.UI.WebControls
Imports System.Collections
Imports System.Configuration
Imports System.Threading
Imports System.Globalization
Imports System.data.OleDb
Imports System.IO
Imports System.Data.SqlClient
#End Region
Partial Class View_Data_Bu
    Inherits System.Web.UI.Page
    Dim objConn As New SqlConnection
    Dim objCmd As SqlCommand
    Dim strConnString, strSQL As String
    Private iDefaultRecordsPerPage As Integer = 100
    Private bSort As Boolean = True

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)

        ' lblMessage.Text = ""
        dbGrid_upload.Visible = True

        Dim sCulture As String = ConfigurationManager.AppSettings("LCID")
        If Not String.IsNullOrEmpty(sCulture) Then
            Dim nCulture As Integer = Integer.Parse(sCulture)
            System.Threading.Thread.CurrentThread.CurrentCulture = New System.Globalization.CultureInfo(nCulture, False)
        End If

        If Not Page.IsPostBack Then

            'func.GetMenu(ddlQuickJump, "dbo.upload")

            'btnDelete.Attributes.Add("onclick", "return confirm('" + "Do you really want to delete these records?" + "');")

            BuildDataSource()

        End If ' ! Page.IsPostBack

    End Sub

    Private Sub BuildDataSource()
        Try
            Dim sSqlWhere As String = ""
            uploadSqlDataSource.SelectParameters.Clear()

            If Not (Session("dbGrid_upload_SearchSQL") Is Nothing) Then
                sSqlWhere = func.WhereBuilder(sSqlWhere, "(" + Session("dbGrid_upload_SearchSQL").ToString() + ")", "And")
            End If
            If Not Session("dbGrid_upload_SearchParams") Is Nothing Then
                Dim Params As ParameterCollection = CType(Session("dbGrid_upload_SearchParams"), ParameterCollection)
                For Each p As Parameter In Params
                    txtSearchValue.Text = p.DefaultValue
                    uploadSqlDataSource.SelectParameters.Add(p)
                Next p
            End If

            If Not (Session("dbGrid_upload_AdvSearch") Is Nothing) Then
                sSqlWhere = func.WhereBuilder(sSqlWhere, Session("dbGrid_upload_AdvSearch").ToString())
            End If
            If Not Session("dbGrid_upload_AdvParam") Is Nothing Then
                Dim Params As ParameterCollection = CType(Session("dbGrid_upload_AdvParam"), ParameterCollection)
                For Each p As Parameter In Params
                    uploadSqlDataSource.SelectParameters.Add(p)
                Next p
            End If

            If sSqlWhere <> String.Empty Then
                uploadSqlDataSource.SelectCommand = func.SqlBuilder(uploadSqlDataSource.SelectCommand, sSqlWhere)
            End If

            dbGrid_upload.DataBind()
            'GridView1.DataBind()

            If Not Session("dbGrid_upload_SortExpression") Is Nothing Then
                bSort = False
                dbGrid_upload.Sort(CStr(Session("dbGrid_upload_SortExpression")), CType(Session("dbGrid_upload_SortDirection"), SortDirection))
                bSort = True
            End If

            If Not Session("dbGrid_upload_CurrentPageCount") Is Nothing Then
                ddlPagerCount.SelectedValue = CStr(Session("dbGrid_upload_CurrentPageCount"))
                dbGrid_upload.PageSize = Convert.ToInt32(ddlPagerCount.SelectedValue)
                'GridView1.PageSize = Convert.ToInt32(ddlPagerCount.SelectedValue)
            Else
                If ddlPagerCount.Items.FindByValue(iDefaultRecordsPerPage.ToString()) Is Nothing Then
                    ddlPagerCount.Items.Add(iDefaultRecordsPerPage.ToString())
                End If
                ddlPagerCount.SelectedValue = iDefaultRecordsPerPage.ToString()
                dbGrid_upload.PageSize = iDefaultRecordsPerPage
                'GridView1.PageSize = iDefaultRecordsPerPage
            End If

            Dim iCurrentPageIndex As Integer
            If Session("dbGrid_upload_CurrentPageIndex") Is Nothing Then
                iCurrentPageIndex = 0
            Else
                iCurrentPageIndex = Convert.ToInt32(Session("dbGrid_upload_CurrentPageIndex"))
            End If

            If dbGrid_upload.PageCount >= iCurrentPageIndex Then
                dbGrid_upload.PageIndex = iCurrentPageIndex
            Else
                dbGrid_upload.PageIndex = 0
                Session("dbGrid_upload_CurrentPageIndex") = 0
            End If
        Catch ex As Exception
            lblMessage.Text += "Error description" + ": " + ex.Message + "<p>"
            dbGrid_upload.Visible = False
        Finally
#If (DEBUG) Then

       ' lblMessage.Text += "<p>SQL = " + uploadSqlDataSource.SelectCommand + "<p>"
        For Each p As Parameter In uploadSqlDataSource.SelectParameters
            lblMessage.Text += p.Name + "(" + p.Type.ToString() + ")=" + p.DefaultValue + "<br>"
        Next p
#End If
        End Try
    End Sub

    Protected Sub dbGrid_upload_RowCreated(ByVal sender As Object, ByVal e As GridViewRowEventArgs)

        If e.Row.RowType = DataControlRowType.Header Then
            func.AddGlyph(dbGrid_upload, e.Row)
        End If

        If e.Row.RowType = DataControlRowType.DataRow Then

        End If
    End Sub

    Protected Sub dbGrid_upload_RowDataBound(ByVal sender As Object, ByVal e As GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim rowData As DataRowView
            rowData = CType(e.Row.DataItem, DataRowView)

        End If

    End Sub

    Protected Sub dbGrid_upload_RowCommand(ByVal source As Object, ByVal e As GridViewCommandEventArgs)

        If e.CommandName = "Page" OrElse e.CommandName = "Sort" Then Exit Sub

        Dim index As Integer = Convert.ToInt32(e.CommandArgument)
        Dim dkKeys As DataKey
        'If Me.GridView1.Visible = True Then

        '    dkKeys = GridView1.DataKeys(index)
        'Else
        dkKeys = dbGrid_upload.DataKeys(index)
        'End If


        'Dim sKeysArg As String = ""
        'For Each s As String In dkKeys.Values.Keys
        '    sKeysArg += s + "=" + Convert.ToString(dkKeys(s)) + "&"
        'Next s
        'If sKeysArg = String.Empty Then
        '    Exit Sub
        'End If

        If e.CommandName = "cmdEdit" Then
            Response.Redirect("Edit_Bu.aspx?meter_point=" + Convert.ToString(dkKeys(0)) + "&Substation=" + Convert.ToString(dkKeys(1)))
        End If

        If e.CommandName = "cmdView" Then
            Response.Redirect("Edit_Pic.aspx?meter_point=" + Convert.ToString(dkKeys(0)) + "&Substation=" + Convert.ToString(dkKeys(1)))
        End If
        'If e.CommandName = "cmdStatus" Then
        '    Response.Redirect("Edit_Status.aspx?" + sKeysArg)
        'End If

    End Sub

    Protected Sub dbGrid_upload_RowDeleted(ByVal sender As Object, ByVal e As GridViewDeletedEventArgs)
        lblMessage.Text = "<b>Record has been deleted!</b><br>"
    End Sub

    Protected Sub dbGrid_upload_PageIndexChanged(ByVal source As Object, ByVal e As EventArgs)
        If Session("Login") = 1 Then
            'Session("dbGrid_upload_CurrentPageIndex") = GridView1.PageIndex
        Else
            Session("dbGrid_upload_CurrentPageIndex") = dbGrid_upload.PageIndex

        End If
        BuildDataSource()
    End Sub

    Protected Sub dbGrid_upload_Sorted(ByVal sender As Object, ByVal e As EventArgs)
        Session("dbGrid_upload_SortExpression") = Nothing
        If bSort Then
            BuildDataSource()
        End If
        Session("dbGrid_upload_SortExpression") = dbGrid_upload.SortExpression
        Session("dbGrid_upload_SortDirection") = dbGrid_upload.SortDirection
    End Sub

    Protected Sub ddlPagerCount_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs)
        Session("dbGrid_upload_CurrentPageCount") = ddlPagerCount.SelectedValue
        Session("dbGrid_upload_CurrentPageIndex") = 0
        BuildDataSource()
    End Sub

    Protected Sub btnShowAll_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnShowAll.Click
        ViewState("bNoRecords") = False
        txtSearchValue.Text = ""
        ddlSearchOperation.SelectedIndex = 0
        ddlSearchField.SelectedIndex = 0

        Session("dbGrid_upload_CurrentPageIndex") = 0
        Session("dbGrid_upload_SearchSQL") = Nothing
        Session("dbGrid_upload_SearchParams") = Nothing
        Session("dbGrid_upload_AdvSearch") = Nothing
        Session("dbGrid_upload_AdvParam") = Nothing
        Session("htPeramupload") = Nothing

        Session("htPeramupload") = Nothing
        BuildDataSource()
    End Sub

    Protected Sub btnSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearch.Click
        If txtSearchValue.Text.Trim() = String.Empty AndAlso ddlSearchOperation.SelectedValue.ToString() <> "IsNull" Then Exit Sub

        Dim sSqlWhere As String = ""
        Dim Params As ParameterCollection = New ParameterCollection()

        If ddlSearchField.SelectedValue.ToString() = "Any Field" Then

            sSqlWhere = func.WhereBuilder(sSqlWhere, WhereOneField("name_amr", "Searchid", Params), "Or")

            sSqlWhere = func.WhereBuilder(sSqlWhere, WhereOneField("region_eng", "Searchpath", Params), "Or")

            sSqlWhere = func.WhereBuilder(sSqlWhere, WhereOneField("meter_point", "Searchid", Params), "Or")

            sSqlWhere = func.WhereBuilder(sSqlWhere, WhereOneField("location", "Searchpath", Params), "Or")

            sSqlWhere = func.WhereBuilder(sSqlWhere, WhereOneField("profile", "Searchpath", Params), "Or")

            sSqlWhere = func.WhereBuilder(sSqlWhere, WhereOneField("substation", "Searchpath", Params), "Or")
            sSqlWhere = func.WhereBuilder(sSqlWhere, WhereOneField("feeder", "Searchpath", Params), "Or")
        Else
            sSqlWhere = WhereOneField(ddlSearchField.SelectedValue.ToString(), func.BuildParameterName("Search" + ddlSearchField.SelectedValue.ToString()), Params)
        End If

        If sSqlWhere.Trim() <> "" Then
            Session("dbGrid_upload_SearchSQL") = sSqlWhere
            Session("dbGrid_upload_SearchParams") = Params
        Else
            Session("dbGrid_upload_SearchSQL") = "2<>2"
            Session("dbGrid_upload_SearchParams") = Nothing
        End If
        Session("dbGrid_upload_CurrentPageIndex") = 0
        BuildDataSource()
    End Sub

    Private Function WhereOneField(ByVal sSearchField As String, ByVal sParamName As String, ByVal Params As ParameterCollection) As String
        Dim sSearchOperation As String = ddlSearchOperation.SelectedValue
        Dim sValue As String = txtSearchValue.Text.TrimEnd()
        Dim sReturn As String = ""
        Dim sSearchType As String = ""
        Dim fieldType As TypeCode = GetFieldType(sSearchField)

        sSearchField = "[" + sSearchField + "]"

        If sSearchOperation = "IsNull" Then
            Return sSearchField + " is null"
        End If

        Try
            Dim o As Object = Convert.ChangeType(sValue, fieldType)
        Catch
            Return String.Empty
        End Try

        If Not (func.IsDate(sValue) OrElse func.IsNumeric(sValue)) Then

            sSearchType = "upper"

            sValue = sValue.ToUpper()
        End If

        Select Case sSearchOperation
            Case "Contains"
                sReturn = sSearchType + "(" + sSearchField + ") like '%" + sValue + "%'"
            Case "Starts with ..."
                sReturn = sSearchType + "(" + sSearchField + ") like '" + sValue + "%'"
            Case "Equals"
                sReturn = sSearchType + "(" + sSearchField + ") = @" + sParamName
                'Case "More than ..."
                '    sReturn = sSearchField + ">@" + sParamName
                'Case "Less than ..."
                '    sReturn = sSearchField + "<@" + sParamName
                'Case "Equal OrElse more than ..."
                '    sReturn = sSearchField + ">=@" + sParamName
                'Case "Equal OrElse less than ..."
                '    sReturn = sSearchField + "<=@" + sParamName
            Case Else
                sReturn = String.Empty
        End Select

        If sReturn <> String.Empty AndAlso (sSearchOperation <> "Contains" AndAlso sSearchOperation <> "Starts with ...") Then
            If func.IsNumeric(sValue) Then
                Params.Add(sParamName, sValue)
            Else
                Params.Add(sParamName, fieldType, sValue)
            End If
        End If
        Return sReturn
    End Function

    Protected Function GetFieldType(ByVal sField As String) As TypeCode
        Select Case sField

            Case "name_amr"
                Return TypeCode.String

            Case "region_eng"
                Return TypeCode.String

            Case "substation"
                Return TypeCode.String

            Case "profile"
                Return TypeCode.String

            Case "meter_point"
                Return TypeCode.String

            Case "feeder"
                Return TypeCode.String
           
            Case Else
                Return TypeCode.String
        End Select

    End Function

    Protected Sub btnDelete_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim sWhere As String = Request.Form("chDelete")
        Dim i As Integer = 99
        If (Not String.IsNullOrEmpty(sWhere)) Then
            Try
                For Each s As String In sWhere.Split(",")
                    Dim iRowIndex As Integer = Convert.ToInt32(s)
                    dbGrid_upload.DeleteRow(iRowIndex)
                    'i = dbGrid_upload.
                    'Me.WORK_UPDATE_STATUS("1", "1", "3", "-", "-", i)
                Next s
                'Me.WORK_TO_NAME_SqlDataSource.Delete()
            Catch ex As Exception
                lblMessage.Text += "Error description" + ": " + ex.Message + "<p>"
            End Try
        End If
        BuildDataSource()
    End Sub
    'Protected Sub btnAdd_Click(ByVal sender As Object, ByVal e As EventArgs)
    '    'Response.Redirect("Insert_work.aspx")
    '    Me.pnlForm1.Visible = False
    '    'Me.pnlForm.Visible = True
    'End Sub
    Protected Sub btnShow_Doc(ByVal sender As Object, ByVal e As EventArgs)
        'Response.Redirect("Insert_work.aspx")
        Me.pnlForm1.Visible = True
        ' Me.pnlForm.Visible = False
    End Sub
    Protected Sub hlkBackToMenu_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim sMenuURL As String = ConfigurationManager.AppSettings("MenuFile")
        If sMenuURL = String.Empty Then
            Response.Write("<script language=javascript>alert('Menu page isn't set');</script>")
            Exit Sub
        End If
        ClearSession()
        Response.Redirect(sMenuURL)
    End Sub

    Protected Sub ddlQuickJump_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs)
        ClearSession()
        'Response.Redirect(ddlQuickJump.SelectedItem.Value)
    End Sub

    Private Sub ClearSession()
        Session("dbGrid_upload_Sort") = Nothing

        Session("dbGrid_upload_SearchSQL") = Nothing
        Session("dbGrid_upload_SearchParams") = Nothing

        Session("dbGrid_upload_AdvSearch") = Nothing
        Session("dbGrid_upload_AdvParam") = Nothing
        Session("htPeramupload") = Nothing

        Session("htPeramupload") = Nothing
        Session("dbGrid_upload_CurrentPageIndex") = Nothing
        Session("dbGrid_upload_CurrentPageCount") = Nothing

        Session("dbGrid_upload_SortExpression") = Nothing
        Session("dbGrid_upload_SortDirection") = Nothing
    End Sub

    Protected Sub ShowWait()
        Response.Write("<div id='mydiv' align=center>&nbsp;</div>")
        Response.Write("<script>mydiv.innerText = '';</script>")
        Response.Write("<script language=javascript>;")
        Response.Write("var dots = 0;var dotmax = 10;function ShowWait()")
        Response.Write("{var output; output = '" + "Please wait" + "';dots++;if(dots>=dotmax)dots=1;")
        Response.Write("for(var x = 0;x < dots;x++){output += '.';}mydiv.innerText =  output;}")
        Response.Write("function StartShowWait(){mydiv.style.visibility = 'visible'; window.setInterval('ShowWait()',500);}")
        Response.Write("function HideWait(){mydiv.style.visibility = 'hidden';window.clearInterval();}")
        Response.Write("StartShowWait();</script>")
        Response.Flush()
    End Sub

    Protected Sub uploadSqlDataSource_Selected(ByVal sender As Object, ByVal e As SqlDataSourceStatusEventArgs)
        lblCount.Text = "Details found" + ": " + e.AffectedRows.ToString()
    End Sub

   
    'Protected Sub btnAdd_Click(ByVal sender As Object, ByVal e As EventArgs)
    '    Response.Redirect("Default.aspx")
    'End Sub

    Protected Sub Page_Load1(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim UserLogin As UserClass = CType(Session("User"), UserClass)

        dbGrid_upload.Visible = False
        'GridView1.Visible = False
        If Session("Login") = 1 Then
            'GridView1.Visible = True
            UserClass.login_page("0", "View_Data_Bu.aspx", "Login")
        Else

            UserClass.CheckLogin(Page)

            If Not func.CheckUserPermissions("View_Data_Bu.aspx", "S") Then
                Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
                Response.End()
                'lblMessage.Text = "User Login " & UserLogin.UserName
                'lblMessage.Text = ""
                'GridView1.Visible = True
                ' GridView1.Visible = False
            Else
                'If func.CheckUserPermissions("View_Data_Bu.aspx", "S") Then
                'Response.Write("<p>" + "You don't have permissions to access this table" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
                'Response.End()
                'lblMessage.Text = "User Login " & UserLogin.UserName
                'lblMessage.Text = ""
                'GridView1.Visible = True
                UserClass.login_page(UserLogin.UserName, "View_Data_Bu.aspx", "View")
                dbGrid_upload.Visible = True

                'Else
            End If
        End If
    End Sub

    'Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Unload
    '    Dim UserLogin As UserClass = CType(Session("User"), UserClass)
    '    If Session("Login") = 0 Then
    '        UserClass.login_page(UserLogin.UserName, "View_Data_Bu.aspx", "Logout")
    '    Else
    '        UserClass.login_page("0", "View_Data_Bu.aspx", "Logout")
    '    End If
    'End Sub

End Class
