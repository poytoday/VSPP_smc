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
Partial Class Mylink
    Inherits System.Web.UI.Page
    Dim objConn As New SqlConnection
    Dim objCmd As SqlCommand
    Dim strConnString, strSQL As String

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        Dim Ds As New DataSet
        Dim Dt As DataTable
        Dim Dr As DataRow
        Dim StrCon As New SqlConnection("Server=172.30.203.155; uid=sa;pwd=1234; database= SA_System")
        Dim Adpt As New SqlDataAdapter("SELECT * FROM counter.MY_LINK", StrCon)
        Adpt.Fill(Ds, "MY_LINK")
        Dt = Ds.Tables("MY_LINK")
        Dr = Dt.NewRow
        Dr("Address") = Me.TextBox1.Text
        Dr("Detail") = Me.TextBox2.Text
        Dr("userid") = UserLogin.UserName
        Dr("Date_Insert") = Date.Now
        Dt.Rows.Add(Dr)
        Dim cdb As New SqlCommandBuilder(Adpt)
        Adpt.Update(Ds, "MY_LINK")
        Ds.AcceptChanges()
        'Me.UPDATE_STATUS("CREATE", "-", Me.txtName.Text, "GEN_TYPE", "0")
        'Me.rfvUserName.Text = "เพิ่ม" & Me.txtName.Text & "ลงฐานข้อมูลแล้ว")
        Me.TextBox1.Text = ""
        Me.TextBox2.Text = ""
        'Me.SqlDataSource1.DataBind()
        Me.dbGrid_upload.DataBind()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        If Session("Login") = 0 Then
            UserClass.CheckLogin(Page)
            If Not func.CheckUserPermissions("Mylink.aspx", "S") Then
                Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
                Response.End()
            Else
                BindData()

                UserClass.login_page(UserLogin.UserName, "Mylink.aspx", "View")
            End If
        Else
            Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
            Response.End()
        End If
    End Sub
    Protected Sub BindData()
        Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        Try
            'objCmd.Parameters.Add("@ID_BU", SqlDbType.Int).Value = Request.QueryString("ID_BU")
            SqlDataSource1.SelectCommand = func.SqlBuilder(SqlDataSource1.SelectCommand, "2=2  and [userid] = " & UserLogin.UserName.Replace("2=2 and ", ""))
            'uploadDetailsView.DataBind()
            Me.SqlDataSource1.DataBind()
            'dbGrid_upload.DataBind()
            'uploadSqlDataSource.SelectCommand = func.SqlBuilder(uploadSqlDataSource.SelectCommand, "2=2  and [ID_BU] = @ID_BU ".Replace("2=2 and ", ""))
            'uploadDetailsView.DataBind()
            'Me.uploadSqlDataSource.DataBind()
            'Me.dbGrid_upload.DataBind()
        Catch ex As Exception
            'lblMessage.Text += "Error description" & ": " & ex.Message & "<p>"
        End Try
    End Sub
End Class
