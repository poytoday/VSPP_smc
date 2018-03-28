Imports System.Data
Imports System.Data.SqlClient
Partial Class Report_By_Status
    Inherits System.Web.UI.Page
    Dim objConn As New SqlConnection
    Dim objCmd As SqlCommand
    Dim strConnString, strSQL As String
    Protected Sub dbGrid_upload_RowCommand(ByVal source As Object, ByVal e As GridViewCommandEventArgs)

        If e.CommandName = "Page" OrElse e.CommandName = "Sort" Then Exit Sub

        Dim index As Integer = Convert.ToInt32(e.CommandArgument)
        Dim dkKeys As DataKey
        dkKeys = GridView1.DataKeys(index)

        Dim sKeysArg As String = ""
        For Each s As String In dkKeys.Values.Keys
            sKeysArg += s + "=" + Convert.ToString(dkKeys(s)) + "&"
        Next s
        If sKeysArg = String.Empty Then
            Exit Sub
        End If

        If e.CommandName = "cmdEdit" Then
            Response.Redirect("Edit_Bu.aspx?" + sKeysArg)
        End If

        If e.CommandName = "cmdView" Then
            Response.Redirect("Edit_Pic.aspx?" + sKeysArg)
        End If
        If e.CommandName = "cmdStatus" Then
            Response.Redirect("Edit_Status.aspx?" + sKeysArg)
        End If

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        strConnString = "Server=172.30.203.155;Uid=sa;PASSWORD=1234;database= SA_System;Max Pool Size=400;Connect Timeout=600;"
        objConn.ConnectionString = strConnString
        objConn.Open()
        
        'UserClass.CheckLogin(Page)
        'If Not func.CheckUserPermissions("Edit_Status.aspx", "S") Then
        '    Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
        '    Response.End()
        '    'lblMessage.Text = "User Login " & UserLogin.UserName
        '    'lblMessage.Text = ""
        '    'GridView1.Visible = True
        '    ' GridView1.Visible = False

        'End If

        If Not Page.IsPostBack() Then
            BindData()
        End If
        'ViewData(
    End Sub
    Protected Sub BindData()
        Try
            'If Request.QueryString.Keys(0) = "Status" Then
            Me.SqlDataSource1.SelectCommand = func.SqlBuilder(SqlDataSource1.SelectCommand, "2=2  and " & Request.QueryString.Keys(0) & " = " & "'" & Request.QueryString.Item(0) & "'")
            Me.SqlDataSource1.DataBind()
            Me.GridView1.DataBind()

            'End If
        Catch ex As Exception
            'lblMessage.Text += "Error description" & ": " & ex.Message & "<p>"
        End Try
    End Sub
End Class
