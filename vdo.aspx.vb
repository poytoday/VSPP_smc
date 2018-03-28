Imports System.data.OleDb
Imports System.IO
Imports System.Data.SqlClient
Partial Class vdo
    Inherits System.Web.UI.Page
    'Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
    '    Dim ConnString = "Server=172.30.203.155;Initial ; uid=sa;pwd=1234; database= SA_System Integrated Security=True"
    '    Dim Conn = New SqlConnection(ConnString)
    '    Conn.Open()
    '    Dim download As HyperLink = CType(e.Row.FindControl("HyperLink3"), HyperLink)
    '    If Not IsNothing(download) Then
    '        download.Text = "HyperLink3"
    '        download.NavigateUrl = e.Row.DataItem("M_path")
    '    End If

    '    Dim hplBuy As HyperLink = CType(e.Row.FindControl("HyperLink4"), HyperLink)
    '    If Not IsNothing(hplBuy) Then
    '        hplBuy.Text = "คลิ๊ก ดู" 'สำหรับเลือกดูไฟล์ 
    '        hplBuy.NavigateUrl = "Cartoon.aspx?M_id=" & e.Row.DataItem("M_id")
    '    End If
    'End Sub

End Class
