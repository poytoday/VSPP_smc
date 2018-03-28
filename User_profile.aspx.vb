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
Partial Class User_profile
    Inherits System.Web.UI.Page
    Dim objConn As New SqlConnection
    Dim objCmd As SqlCommand
    Dim strConnString, strSQL As String
    Protected Sub ViewData()
        Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        '*** DataTable ***'
        Dim dtAdapter As SqlDataAdapter
        Dim dt As New DataTable
        strSQL = "SELECT * FROM counter.[Names] WHERE ID_PEA = " & UserLogin.UserName
        dtAdapter = New SqlDataAdapter(strSQL, objConn)
        objCmd = dtAdapter.SelectCommand
        'objCmd.Parameters.Add("@ID_BU", SqlDbType.Int).Value = Request.QueryString("ID_BU")
        dtAdapter.Fill(dt)

        If dt.Rows.Count > 0 Then
            ' Me.ImgPic.ImageUrl = "ViewImg.aspx?FilesID=" & dt.Rows(0)("FilesID")
            Me.DropDownList1.Text = dt.Rows(0)("Name")
            Me.Label1.Text = dt.Rows(0)("ID_PEA")
            Me.firstname.Text = dt.Rows(0)("First_Name")
            Me.lastname.Text = dt.Rows(0)("Last_Name")
            Me.position.Text = dt.Rows(0)("Position")
            Me.TB_Office.Text = dt.Rows(0)("office")
            Me.fldDATE_INSERT.Text = dt.Rows(0)("DATE_WORK")
            Me.birth.Text = dt.Rows(0)("DATE_BIRTH")
        End If

        dt = Nothing
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        If Session("Login") = 0 Then
            UserClass.CheckLogin(Page)
            UserClass.login_page(UserLogin.UserName, "User_profile.aspx", "View")
        Else
            Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
            Response.End()
        End If
        '  Me.BT_Delete.Attributes.Add("OnClick", "return confirm('Are you sure delete?');")
        strConnString = "Server=172.30.203.155;Uid=sa;PASSWORD=1234;database= SA_System;Max Pool Size=400;Connect Timeout=600;"
        objConn.ConnectionString = strConnString
        objConn.Open()
        If Not Page.IsPostBack() Then
            ViewData()
        End If
    End Sub

    Protected Sub cmdLogin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdLogin.Click
        Dim date_A, date_B, date_C, birth, fldDATE_INSERT As String
        Dim arr As Array
        Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        Dim dtAdapter As SqlDataAdapter
        Dim dt As New DataTable
        strSQL = "SELECT * FROM [Names] WHERE ID_PEA = " & UserLogin.UserName
        dtAdapter = New SqlDataAdapter(strSQL, objConn)
        objCmd = dtAdapter.SelectCommand
        dtAdapter.Fill(dt)
        If dt.Rows(0)("Name") <> Me.DropDownList1.Text Then
            Compare_data_With_update(dt.Rows(0)("Name"), Me.DropDownList1.Text, "Name")
        End If
        If dt.Rows(0)("ID_PEA") <> Me.Label1.Text Then
            Compare_data_With_update(dt.Rows(0)("ID_PEA"), Me.TB_Office.Text, "ID_PEA")
        End If
        If dt.Rows(0)("First_Name") <> Me.firstname.Text Then
            Compare_data_With_update(dt.Rows(0)("First_Name"), Me.firstname.Text, "First_Name")
        End If
        If dt.Rows(0)("Last_Name") <> Me.lastname.Text Then
            Compare_data_With_update(dt.Rows(0)("Last_Name"), Me.lastname.Text, "Last_Name")
        End If
        If dt.Rows(0)("Position") <> Me.position.Text Then
            Compare_data_With_update(dt.Rows(0)("Position"), Me.position.Text, "Position")
        End If
        If dt.Rows(0)("office") <> Me.TB_Office.Text Then
            Compare_data_With_update(dt.Rows(0)("office"), Me.TB_Office.Text, "office")
        End If
        If dt.Rows(0)("DATE_WORK").ToString <> Me.fldDATE_INSERT.Text & "00:00:00" Then
            arr = Me.fldDATE_INSERT.Text.Split("/")
            date_A = arr(0)
            date_B = arr(1)
            date_C = arr(2)
            fldDATE_INSERT = date_B & "/" & date_A & "/" & date_C
            strSQL = "UPDATE Names SET DATE_WORK " & " = '" & fldDATE_INSERT & _
                                             "' WHERE ID_PEA = " & UserLogin.UserName
            objCmd = New SqlCommand(strSQL, objConn)
            objCmd.ExecuteNonQuery()
            UPDATE_STATUS("MODIFY", dt.Rows(0)("DATE_WORK"), Me.fldDATE_INSERT.Text & " 00:00:00", "DATE_WORK", UserLogin.UserName)

        End If
        If dt.Rows(0)("DATE_BIRTH").ToString <> Me.birth.Text & " 00:00:00" Then
            arr = Me.birth.Text.Split("/")
            date_A = arr(0)
            date_B = arr(1)
            date_C = arr(2)
            birth = date_B & "/" & date_A & "/" & date_C
            strSQL = "UPDATE Names SET DATE_BIRTH " & " = '" & birth & _
                                  "' WHERE ID_PEA = " & UserLogin.UserName
            objCmd = New SqlCommand(strSQL, objConn)
            objCmd.ExecuteNonQuery()
            UPDATE_STATUS("MODIFY", dt.Rows(0)("DATE_WORK"), Me.birth.Text & " 00:00:00", "DATE_BIRTH", UserLogin.UserName)
        End If


        If Me.pass.Text <> "" And Me.cpass.Text = "" Then
            Me.lblMessage.Text = "ขออภัย ยังไม่ได้ยืนยัน รหัสผ่าน"
        ElseIf Me.pass.Text = "" And Me.cpass.Text <> "" Then
            Me.lblMessage.Text = "ขออภัย ยังไม่ได้ใส่ รหัสผ่าน"
        ElseIf Me.pass.Text <> "" And Me.cpass.Text <> "" Then
            If Me.pass.Text <> Me.cpass.Text Then
                Me.lblMessage.Visible = True
                Me.lblMessage.Text = "ขออภัย รหัสผ่านไม่ตรงกัน"
            Else
                'strSQL = "SELECT * FROM [user] WHERE userid = " & UserLogin.UserName
                'dtAdapter = New SqlDataAdapter(strSQL, objConn)
                'objCmd = dtAdapter.SelectCommand
                'dtAdapter.Fill(dt)
                'Dim pass As String = dt.Rows(0)("password")
                'UPDATE_STATUS("MODIFY", pass, Me.pass.Text, "Password", UserLogin.UserName)

                strSQL = "UPDATE [user] SET password " & " = '" & Me.pass.Text & _
                                                            "' WHERE userid = " & UserLogin.UserName
                objCmd = New SqlCommand(strSQL, objConn)
                objCmd.ExecuteNonQuery()


            End If


        End If
        'Response.Redirect("View_Data_Bu.aspx")
    End Sub
    Protected Sub Compare_data_With_update(ByVal before As String, ByVal after As String, ByVal Type As String)
        Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        strSQL = "UPDATE Names SET " & Type & " = '" & after & _
                                 "' WHERE ID_PEA = " & UserLogin.UserName
        objCmd = New SqlCommand(strSQL, objConn)
        objCmd.ExecuteNonQuery()
        UPDATE_STATUS("MODIFY", before, after, "Name_BU", UserLogin.UserName)
    End Sub
    Protected Sub UPDATE_STATUS(ByVal solution As String, ByVal Before As String, ByVal After As String, ByVal Type As String, ByVal UserName As String)
        Dim Ds As New DataSet
        Dim Dt As DataTable
        Dim Dr As DataRow
        Dim StrCon As New SqlConnection("Server=172.30.203.155; uid=sa;pwd=1234; database= SA_System")
        Dim Adpt As New SqlDataAdapter("SELECT * FROM [VSPP_LOG]", StrCon)
        Adpt.Fill(Ds, "VSPP_LOG")
        Dt = Ds.Tables("VSPP_LOG")
        Dr = Dt.NewRow
        Dr("Solution") = solution
        Dr("Before") = Before
        Dr("After") = After
        Dr("UserName") = UserName
        Dr("Type") = Type
        Dr("Date_status") = Date.Now
        Dt.Rows.Add(Dr)
        Dim cdb As New SqlCommandBuilder(Adpt)
        Adpt.Update(Ds, "VSPP_LOG")
        Ds.AcceptChanges()
    End Sub
End Class
