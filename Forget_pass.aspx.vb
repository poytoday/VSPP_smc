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
Partial Class Forget_pass
    Inherits System.Web.UI.Page
    Dim objConn As New SqlConnection
    Dim objCmd As SqlCommand
    Dim strConnString, strSQL As String

    Protected Sub cmdLogin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdLogin.Click
        strConnString = "Server=172.30.203.155;Uid=sa;PASSWORD=1234;database= SA_System;Max Pool Size=400;Connect Timeout=600;"
        objConn.ConnectionString = strConnString
        objConn.Open()
        Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        Dim dtAdapter As SqlDataAdapter
        Dim dt As New DataTable
        strSQL = "SELECT * FROM [Names] WHERE ID_PEA = " & tb_pea_id.Text
        dtAdapter = New SqlDataAdapter(strSQL, objConn)
        objCmd = dtAdapter.SelectCommand
        dtAdapter.Fill(dt)
        If dt.Rows(0)("DATE_WORK").ToString = Me.fldDATE_INSERT.Text & " 00:00:00" Then
            If dt.Rows(0)("DATE_BIRTH").ToString = Me.birth.Text & " 00:00:00" Then
                If Me.pass.Text <> "" And Me.cpass.Text = "" Then
                    Me.lblMessage.Text = "ขออภัย ยังไม่ได้ยืนยัน รหัสผ่าน"
                ElseIf Me.pass.Text = "" And Me.cpass.Text <> "" Then
                    Me.lblMessage.Text = "ขออภัย ยังไม่ได้ใส่ รหัสผ่าน"
                ElseIf Me.pass.Text <> "" And Me.cpass.Text <> "" Then
                    If Me.pass.Text <> Me.cpass.Text Then
                        'Me.lblMessage.Visible = True
                        Me.lblMessage.Text = "ขออภัย รหัสผ่านไม่ตรงกัน"
                    Else
                        strSQL = "UPDATE [user] SET password " & " = '" & Me.pass.Text & _
                                                                    "' WHERE userid = " & tb_pea_id.Text
                        objCmd = New SqlCommand(strSQL, objConn)
                        objCmd.ExecuteNonQuery()
                        Me.Panel1.Visible = False
                        Response.Write("<p>" + "คลิกที่นี่เพื่อทำการ " + "<a href=""Login.aspx"">&nbsp;" + "Login" + "</a></p>")
                    End If
                End If
            End If
        End If
        objConn.Close()
    End Sub
End Class
