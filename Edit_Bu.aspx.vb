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
Partial Class Edit_Bu
    Inherits System.Web.UI.Page
    Dim objConn As New SqlConnection
    Dim objCmd As SqlCommand
    Dim strConnString, strSQL As String



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Me.BT_Delete.Attributes.Add("OnClick", "return confirm('Are you sure delete?');")
        Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        If Session("Login") = 0 Then

            UserClass.CheckLogin(Page)
            If Not func.CheckUserPermissions("Edit_Status.aspx", "S") Then
                Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
                Response.End()
                'lblMessage.Text = "User Login " & UserLogin.UserName
                'lblMessage.Text = ""
                'GridView1.Visible = True
                ' GridView1.Visible = False
            Else

                UserClass.login_page(UserLogin.UserName, "Edit_Bu.aspx", "View")
            End If
        Else
            Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
            Response.End()
        End If
        'Me.BT_Delete.Attributes.Add("OnClick", "return confirm('Are you sure delete?');")
        strConnString = "Server=172.30.203.155;Uid=sa;PASSWORD=1234;database= SA_System;Max Pool Size=400;Connect Timeout=600;"
        objConn.ConnectionString = strConnString
        objConn.Open()
        If Not Page.IsPostBack() Then
            ViewData()
        End If

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim dtAdapter As SqlDataAdapter
        Dim dt As New DataTable
        strSQL = "SELECT * FROM scada.feeder_amr_name WHERE substation = @substation and  meter_point = @meter_point"
        dtAdapter = New SqlDataAdapter(strSQL, objConn)
        objCmd = dtAdapter.SelectCommand
        objCmd.Parameters.Add("@substation", SqlDbType.VarChar).Value = Request.QueryString("Substation")

        objCmd.Parameters.Add("@meter_point", SqlDbType.VarChar).Value = Request.QueryString("meter_point")
        dtAdapter.Fill(dt)
        If dt.Rows(0)("name_amr") <> Me.TextBox1.Text Then
            Compare_data_With_update(Me.TextBox1.Text, "name_amr")
        End If
        If dt.Rows(0)("location") <> Me.TextBox2.Text Then
            Compare_data_With_update(Me.TextBox2.Text, "location")
        End If
        If dt.Rows(0)("substation") <> Me.TextBox3.Text Then
            Compare_data_With_update(Me.TextBox3.Text, "substation")
        End If
        If dt.Rows(0)("meter_point") <> Me.TextBox4.Text Then
            Compare_data_With_update(Me.TextBox4.Text, "meter_point")
        End If
        If dt.Rows(0)("region_eng") <> Me.RadioButtonList1.SelectedValue Then
            Compare_data_With_update(Me.RadioButtonList1.SelectedValue, "region_eng")
        End If
        If dt.Rows(0)("profile") <> Me.RadioButtonList2.SelectedValue Then
            Compare_data_With_update(Me.RadioButtonList2.SelectedValue, "profile")
        End If
        If dt.Rows(0)("feeder") <> Me.txt_feeder.Text Then
            Compare_data_With_update(Me.txt_feeder.Text, "feeder")
        End If
        Response.Redirect("View_Data_Bu.aspx")

    End Sub
    Protected Sub Compare_data_With_update(ByVal after As String, ByVal Type As String)
        Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        'UPDATE_STATUS("MODIFY", before, after, "Name_BU", UserLogin.UserName)
        strSQL = "UPDATE scada.feeder_amr_name SET " & Type & " = '" & after & _
                                 "' WHERE substation = '" & Request.QueryString("Substation") & "'" & " and   meter_point ='" & Request.QueryString("meter_point") & "'"
        objCmd = New SqlCommand(strSQL, objConn)
        objCmd.ExecuteNonQuery()


        'If Type = "substation" Then
        '    strSQL = "UPDATE scada.feeder_amr_profile SET " & Type & " = '" & after & _
        '                           "' WHERE substation = '" & Request.QueryString("Substation") & "'" & " and   meter_point ='" & Request.QueryString("meter_point") & "'"
        '    objCmd = New SqlCommand(strSQL, objConn)
        '    objCmd.ExecuteNonQuery()
        'End If
    End Sub
    Protected Sub ViewData()
        '*** DataTable ***'
        Dim dtAdapter As SqlDataAdapter
        Dim dt As New DataTable
        strSQL = "SELECT * FROM scada.feeder_amr_name WHERE substation = @substation"
        dtAdapter = New SqlDataAdapter(strSQL, objConn)
        objCmd = dtAdapter.SelectCommand
        objCmd.Parameters.Add("@substation", SqlDbType.VarChar).Value = Request.QueryString("Substation")
        dtAdapter.Fill(dt)

        If dt.Rows.Count > 0 Then
            ' Me.ImgPic.ImageUrl = "ViewImg.aspx?FilesID=" & dt.Rows(0)("FilesID")
            'textbox1.Text = dt.Rows(0)("Name_BU")
            'Me.txt_Location.Text = dt.Rows(0)("Location")
            'Me.DD_Gen.Text = dt.Rows(0)("Gen")
            'Me.DD_OIL.Text = dt.Rows(0)("Oil")
            'Me.DD_ADDER.Text = dt.Rows(0)("Adder")
            'Me.DD_Voltage.Text = dt.Rows(0)("Voltage")
            'Me.txt_Sale_Power.Text = dt.Rows(0)("Sale_Power")
            'Me.txt_Power.Text = dt.Rows(0)("Power")
            'Me.DD_SUB.Text = dt.Rows(0)("Substation")
            'Me.DD_Feeder.Text = dt.Rows(0)("Feeder")
            'Me.fldDATE_INSERT.Text = dt.Rows(0)("SCOD")
            ''Me.txt_Date_sale.Text = dt.Rows(0)("Date_Sale")
            'Me.DD_Gen_Side.Text = dt.Rows(0)("Gen_Side")
            'Me.txt_Promiss.Text = dt.Rows(0)("Promiss")
            'Me.txt_tel.Text = dt.Rows(0)("Tel")
            'Me.txt_tel_name.Text = dt.Rows(0)("Tel_Name")
            'Me.DD_status.Text = dt.Rows(0)("Status")
            'Me.txt_Note.Text = dt.Rows(0)("Note")
            Me.TextBox1.Text = dt.Rows(0)("name_amr")
            Me.TextBox2.Text = dt.Rows(0)("location")
            Me.TextBox3.Text = dt.Rows(0)("substation")
            Me.TextBox4.Text = dt.Rows(0)("meter_point")
            Me.RadioButtonList1.SelectedValue = dt.Rows(0)("region_eng")
            Me.RadioButtonList2.SelectedValue = dt.Rows(0)("profile")
            Me.txt_feeder.Text = dt.Rows(0)("feeder")
        End If

        dt = Nothing
    End Sub
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
    Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Unload
        objConn.Close()
        objConn = Nothing
    End Sub

    Protected Sub BT_Delete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BT_Delete.Click
        Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        'UPDATE_STATUS("DELETE", "-", Me.txt_name.Text, "BU_NAME", UserLogin.UserName)
        'UPDATE_STATUS("DELETE", Request.QueryString("ID_BU"), "-", "ID_BU", UserLogin.UserName)
        strSQL = "DELETE FROM scada.feeder_amr_name " & _
                                 " WHERE meter_point = '" & Request.QueryString("meter_point") & "' AND substation = '" & Request.QueryString("Substation") & "'"
        objCmd = New SqlCommand(strSQL, objConn)
        objCmd.ExecuteNonQuery()
        Response.Redirect("View_Data_Bu.aspx")
    End Sub


End Class
