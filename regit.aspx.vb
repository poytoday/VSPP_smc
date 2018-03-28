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
Partial Class regit
    Inherits System.Web.UI.Page
    Protected Sub cmdLogin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdLogin.Click
        'Insert_Name()
        Insert_User()
        'If CheckBox1.Checked = True Then
        Insert_promission("Mylink.aspx", "S")
        Insert_promission("Edit_Bu.aspx", "S")
        Insert_promission("Edit_Pic.aspx", "S")
        Insert_promission("Edit_Status.aspx", "S")
        Insert_promission("Default.aspx", "S")
        Insert_promission("View_Data_Bu.aspx", "S")
        Insert_promission("Add_pro.aspx", "S")
        'Else
        '    Insert_promission("Mylink.aspx", "S")
        '    Insert_promission("Edit_Bu.aspx", "N")
        '    Insert_promission("Edit_Pic.aspx", "N")
        '    Insert_promission("Edit_Status.aspx", "N")
        '    Insert_promission("Default.aspx", "N")
        '    Insert_promission("View_Data_Bu.aspx", "N")
        '    Insert_promission("Add_pro.aspx", "N")
        'End If

        Me.Panel1.Visible = False
        Response.Write("<p>" + "คลิกที่นี่เพื่อทำการ " + "<a href=""Login.aspx"">&nbsp;" + "Login" + "</a></p>")
    End Sub

    Protected Sub Insert_Name()
        'Dim Ds As New DataSet
        'Dim Dt As DataTable
        'Dim Dr As DataRow
        'Dim StrCon As New SqlConnection("Server=172.30.203.155; uid=sa;pwd=1234; database= SA_System")
        'Dim Adpt As New SqlDataAdapter("SELECT * FROM [Names]", StrCon)
        'Adpt.Fill(Ds, "Names")
        'Dt = Ds.Tables("Names")
        'Dr = Dt.NewRow
        'Dr("Name") = Me.DropDownList1.Text
        'Dr("ID_PEA") = Me.tb_pea_id.Text
        'Dr("First_Name") = Me.firstname.Text
        'Dr("Last_Name") = Me.lastname.Text
        'Dr("Position") = Me.position.Text
        'Dr("office") = Me.TB_Office.Text
        ''2/23/2012 12:00:00 AM
        ''Dr("DATE_WORK") = DateTime.ParseExact(fldDATE_INSERT.Text, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture)
        ''Dr("DATE_BIRTH") = DateTime.ParseExact(birth.Text, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture)
        'Dt.Rows.Add(Dr)
        'Dim cdb As New SqlCommandBuilder(Adpt)
        'Adpt.Update(Ds, "Names")
        'Ds.AcceptChanges()
    End Sub
    Protected Sub Insert_User()
        Dim Ds As New DataSet
        Dim Dt As DataTable
        Dim Dr As DataRow
        Dim StrCon As New SqlConnection("Server=172.30.203.155; uid=sa;pwd=1234; database= SA_System")
        Dim Adpt As New SqlDataAdapter("SELECT * FROM counter.[user]", StrCon)
        Adpt.Fill(Ds, "user")
        Dt = Ds.Tables("user")
        Dr = Dt.NewRow
        Dr("userid") = Me.tb_pea_id.Text
        Dr("password") = Me.pass.Text
        Dr("create_date") = Date.Now
        Dr("firstpage") = "View_Data_Bu.aspx"
        Dr("office") = Me.TB_Office.Text
        Dr("active_flag") = "True"
        Dr("update_date") = Date.Now
        'If Me.CheckBox1.Checked = True Then
        'Dr("Requert_Admin") = "True"
        'Else
        Dr("Requert_Admin") = "False"
        'End If
        Dt.Rows.Add(Dr)
        Dim cdb As New SqlCommandBuilder(Adpt)
        Adpt.Update(Ds, "user")
        Ds.AcceptChanges()
    End Sub
    Protected Sub Insert_promission(ByVal page As String, ByVal permission As String)
        Dim Ds As New DataSet
        Dim Dt As DataTable
        Dim Dr As DataRow
        Dim StrCon As New SqlConnection("Server=172.30.203.155; uid=sa;pwd=1234; database= SA_System")
        Dim Adpt As New SqlDataAdapter("SELECT * FROM counter.[user_permissions]", StrCon)
        Adpt.Fill(Ds, "user_permissions")
        Dt = Ds.Tables("user_permissions")
        Dr = Dt.NewRow
        Dr("userid") = Me.tb_pea_id.Text
        Dr("action") = "S"
        Dr("permission") = permission
        Dr("tablename") = page
        Dt.Rows.Add(Dr)
        Dim cdb As New SqlCommandBuilder(Adpt)
        Adpt.Update(Ds, "user_permissions")
        Ds.AcceptChanges()
    End Sub
   
End Class
