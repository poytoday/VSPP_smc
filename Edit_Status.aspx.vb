Imports System.Data
Imports System.Data.SqlClient

Partial Class Edit_Status


    Inherits System.Web.UI.Page
    Dim objConn As New SqlConnection
    Dim objCmd As SqlCommand
    Dim strConnString, strSQL As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        strConnString = "Server=172.30.203.155;Uid=sa;PASSWORD=1234;database= SA_System;Max Pool Size=400;Connect Timeout=600;"
        objConn.ConnectionString = strConnString
        objConn.Open()
        Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        If Session("Login") = 1 Then
            Me.Panel1.Visible = False
            UserClass.login_page("0", "Edit_Status.aspx", "View")
        Else
            UserClass.CheckLogin(Page)
            If Not func.CheckUserPermissions("Edit_Status.aspx", "S") Then
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
                'GridView1.Visible = True
                Me.Panel1.Visible = True
                Me.GridView2.Visible = False
                Me.GridView1.Visible = True
                UserClass.login_page(UserLogin.UserName, "Edit_Status.aspx", "View")
                'Else
            End If
        End If
        If Not Page.IsPostBack() Then
            BindData()
            'ViewData()
        End If

    End Sub
    Protected Sub ViewData()
        '*** DataTable ***'
        Dim dtAdapter As SqlDataAdapter
        Dim dt As New DataTable
        dtAdapter = New SqlDataAdapter(strSQL, objConn)
        objCmd = dtAdapter.SelectCommand
        objCmd.Parameters.Add("@ID_BU", SqlDbType.Int).Value = Request.QueryString("ID_BU")
        strSQL = "SELECT * FROM Business WHERE ID_BU = @ID_BU "
        dtAdapter.Fill(dt)
        dt = Nothing
    End Sub
    Protected Sub BindData()
        Try
            'objCmd.Parameters.Add("@ID_BU", SqlDbType.Int).Value = Request.QueryString("ID_BU")
            uploadSqlDataSource.SelectCommand = func.SqlBuilder(uploadSqlDataSource.SelectCommand, "2=2  and [ID_BU] = " & Request.QueryString("ID_BU").Replace("2=2 and ", ""))
            Me.uploadSqlDataSource.DataBind()
            dbGrid_upload.DataBind()


            Me.SqlDataSource1.SelectCommand = func.SqlBuilder(SqlDataSource1.SelectCommand, "2=2  and [ID_BU] = " & Request.QueryString("ID_BU").Replace("2=2 and ", ""))
            Me.SqlDataSource1.DataBind()
            Me.GridView1.DataBind()
            'uploadSqlDataSource.SelectCommand = func.SqlBuilder(uploadSqlDataSource.SelectCommand, "2=2  and [ID_BU] = @ID_BU ".Replace("2=2 and ", ""))
            'uploadDetailsView.DataBind()
            'Me.uploadSqlDataSource.DataBind()
            'Me.dbGrid_upload.DataBind()
        Catch ex As Exception
            lblMessage.Text += "Error description" & ": " & ex.Message & "<p>"
        End Try
    End Sub
    Protected Sub LB_Insert_BU_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LB_Insert_BU.Click
        Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        UserClass.Insert_Status_BU(Request.QueryString("ID_BU"), DD_status.Text, fldDATE_INSERT.Text, UserLogin.UserName, txt_Note.Text)
        UPDATE_STATUS_TO_BU()
        BindData()
    End Sub
    Protected Sub UPDATE_STATUS_TO_BU()
        '*** DataTable ***'
        'Dim dtAdapter As SqlDataAdapter
        'Dim dt As New DataTable
        'dtAdapter = New SqlDataAdapter(strSQL, objConn)
        'objCmd = dtAdapter.SelectCommand
        'objCmd.Parameters.Add("@ID_BU", SqlDbType.Int).Value = Request.QueryString("ID_BU")
        'strSQL = "UPDATE Business SET Status = '" & Me.DD_status.Text & "' WHERE ID_BU = @ID_BU "
        'dtAdapter.Fill(dt)
        'dt = Nothing
        strSQL = "UPDATE Business SET Status = '" & Me.DD_status.Text & "' WHERE ID_BU = @ID_BU "
        objCmd = New SqlCommand(strSQL, objConn)
        objCmd.Parameters.Add("@ID_BU", SqlDbType.Int).Value = Request.QueryString("ID_BU")
        objCmd.ExecuteNonQuery()
        'Me.UPDATE_STATUS("MODIFY", Me.Label2.Text, TextBox13.Text, "Feeder", "0")
        objCmd.ExecuteNonQuery()
    End Sub
End Class
