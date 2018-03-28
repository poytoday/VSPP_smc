Imports System.Data
Imports System.Data.SqlClient

Partial Class Update_Status_List
    Inherits System.Web.UI.Page
    Dim objConn As New SqlConnection
    Dim objCmd As SqlCommand
    Dim strConnString, strSQL As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        strConnString = "Server=172.30.203.155;Uid=sa;PASSWORD=1234;database= SA_System;Max Pool Size=400;Connect Timeout=600;"
        objConn.ConnectionString = strConnString
        objConn.Open()
    End Sub

    'Protected Sub LB_Insert_BU_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LB_Insert_BU.Click
    '    Dim Ds As New DataSet
    '    Dim Dt As DataTable
    '    Dim Dr As DataRow
    '    Dim StrCon As New SqlConnection("Server=172.30.203.155; uid=sa;pwd=1234; database= SA_System")
    '    Dim Adpt As New SqlDataAdapter("SELECT * FROM [VSPP_STATUS_List]", StrCon)
    '    Adpt.Fill(Ds, "VSPP_STATUS_List")
    '    Dt = Ds.Tables("VSPP_STATUS_List")
    '    Dr = Dt.NewRow
    '    Dr("ID_BU") = Request.QueryString("ID_BU")
    '    Dr("Status") = "ไม่ระบุ"
    '    Dr("Date") = Date.Now
    '    Dr("User_name") = "0"
    '    Dr("Date_Update") = Date.Now
    '    Dt.Rows.Add(Dr)
    '    Dim cdb As New SqlCommandBuilder(Adpt)
    '    Adpt.Update(Ds, "VSPP_STATUS_List")
    '    Ds.AcceptChanges()
    'End Sub
End Class
