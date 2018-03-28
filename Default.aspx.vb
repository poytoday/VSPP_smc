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
Partial Class _Default
    Inherits System.Web.UI.Page
    'Protected Sub UPDATE_STATUS(ByVal solution As String, ByVal Before As String, ByVal After As String, ByVal Type As String, ByVal UserName As String)
    '    Dim Ds As New DataSet
    '    Dim Dt As DataTable
    '    Dim Dr As DataRow
    '    Dim StrCon As New SqlConnection("Server=172.30.203.155; uid=sa;pwd=1234; database= SA_System")
    '    Dim Adpt As New SqlDataAdapter("SELECT * FROM counter.[VSPP_LOG]", StrCon)
    '    Adpt.Fill(Ds, "VSPP_LOG")
    '    Dt = Ds.Tables("VSPP_LOG")
    '    Dr = Dt.NewRow
    '    Dr("Solution") = solution
    '    Dr("Before") = Before
    '    Dr("After") = After
    '    Dr("UserName") = UserName
    '    Dr("Type") = Type
    '    Dr("Date_status") = Date.Now
    '    Dt.Rows.Add(Dr)
    '    Dim cdb As New SqlCommandBuilder(Adpt)
    '    Adpt.Update(Ds, "VSPP_LOG")
    '    Ds.AcceptChanges()
    'End Sub

    Protected Sub LB_Insert_BU_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LB_Insert_BU.Click
        Dim Ds As New DataSet
        Dim Dt As DataTable
        Dim Dr As DataRow
        'Dim Date_F As String
        Dim StrCon As New SqlConnection("Server=172.30.203.155; uid=sa;pwd=1234; database= SA_System")
        Dim Adpt As New SqlDataAdapter("SELECT * FROM scada.feeder_amr_name", StrCon)
        Adpt.Fill(Ds, "Business")
        Dt = Ds.Tables("Business")
        Dr = Dt.NewRow
        Dr("name_amr") = Me.txt_name.Text
        Dr("location") = Me.txt_Location.Text
        Dr("region_eng") = Me.RadioButtonList1.SelectedValue
        Dr("meter_point") = Me.txt_meter.Text
        Dr("substation") = Me.txt_sub.Text
        Dr("profile") = Me.RadioButtonList2.SelectedValue
        Dr("feeder") = Me.txt_feeder.Text

        Dt.Rows.Add(Dr)
        Dim cdb As New SqlCommandBuilder(Adpt)
        Adpt.Update(Ds, "Business")
        Ds.AcceptChanges()
        'UPDATE_STATUS_List()
        'Me.UPDATE_STATUS("CREATE", "-", Me.txt_name.Text, "GEN_TYPE", "0")
        'Me.rfvUserName.Text = "เพิ่ม" & Me.txtName.Text & "ลงฐานข้อมูลแล้ว")
        'Me.SqlDataSource1.DataBind()
        'Me.DD_SUB.DataBind()
        'UserClass.Insert_Status_BU(Request.QueryString("ID_BU"), "ไม่ระบุ", Date.Now, "0")
        Response.Redirect("View_Data_Bu.aspx")
    End Sub
    'Function Conver_date(ByVal Date_F)
    '    Dim strString As String = Date_F
    '    Dim strSplit1 As Array
    '    ' Dim strSplit2 As String
    '    'Dim i As Integer
    '    strSplit1 = strString.Split("/")
    '    'If strSplit1(2) > 2012 Then
    '    strSplit1(2) = strSplit1(2) + 543
    '    ' End If
    '    Date_F = (strSplit1(0)) + "/" + (strSplit1(1)) + "/" + (strSplit1(2))
    '    'Me.Label9.Text = strSplit2
    '    Return Date_F
    'End Function
    'Protected Sub UPDATE_STATUS_List()
    '    Dim UserLogin As UserClass = CType(Session("User"), UserClass)

    '    Me.DropDownList1.Visible = True
    '    Me.SqlDataSource7.DataBind()
    '    Me.DropDownList1.DataBind()
    '    Dim Ds As New DataSet
    '    Dim Dt As DataTable
    '    Dim Dr As DataRow
    '    Dim StrCon As New SqlConnection("Server=172.30.203.155; uid=sa;pwd=1234; database= SA_System")
    '    Dim Adpt As New SqlDataAdapter("SELECT * FROM counter.[VSPP_STATUS_List]", StrCon)
    '    Adpt.Fill(Ds, "VSPP_STATUS_List")
    '    Dt = Ds.Tables("VSPP_STATUS_List")
    '    Dr = Dt.NewRow
    '    Dr("ID_BU") = Me.DropDownList1.Text
    '    Dr("Status") = "ไม่ระบุ"
    '    Dr("Date") = Date.Now
    '    Dr("Note") = "Start"
    '    Dr("User_name") = UserLogin.UserName
    '    Dr("Date_Update") = Date.Now
    '    Dt.Rows.Add(Dr)
    '    Dim cdb As New SqlCommandBuilder(Adpt)
    '    Adpt.Update(Ds, "VSPP_STATUS_List")
    '    Ds.AcceptChanges()
    '    Me.UPDATE_STATUS("CREATE", Me.DropDownList1.Text, "-", "ID_BU", UserLogin.UserName)
    '    Me.DropDownList1.Visible = False
    'End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("Login") = 0 Then
            Dim UserLogin As UserClass = CType(Session("User"), UserClass)
            UserClass.CheckLogin(Page)
            UserClass.login_page(UserLogin.UserName, "Default.aspx", "View")
            If Not func.CheckUserPermissions("Default.aspx", "S") Then
                Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
                Response.End()
            End If
        Else
            Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
            Response.End()
        End If

    End Sub

    'Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Unload
    '    Dim UserLogin As UserClass = CType(Session("User"), UserClass)
    '    If Session("Login") = 0 Then
    '        UserClass.login_page(UserLogin.UserName, "Default.aspx", "Logout")
    '    Else
    '        UserClass.login_page("0", "Default.aspx", "Logout")
    '    End If

    'End Sub
End Class
