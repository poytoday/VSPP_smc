Imports System
Imports System.Data
Imports System.Collections
Imports System.Configuration
Imports System.Threading
Imports System.Globalization
Imports System.Data.OleDb
Imports System.IO
Imports System.Data.SqlClient

Partial Class load01
    Inherits System.Web.UI.Page
    Dim objConn As New SqlConnection
    Dim objCmd As SqlCommand
    Dim strConnString, strSQL As String
    Protected Sub dbGrid_upload_RowCommand(ByVal source As Object, ByVal e As GridViewCommandEventArgs)

        If e.CommandName = "Page" OrElse e.CommandName = "Sort" Then Exit Sub

        Dim index As Integer = Convert.ToInt32(e.CommandArgument)
        Dim dkKeys As DataKey = GridView1.DataKeys(index)

        'Dim sKeysArg As String = ""
        'For Each s As String In dkKeys.Values.Keys
        '    sKeysArg += s + " = '" + Convert.ToString(dkKeys(0)) & "'"
        '    Label_temp.Text = sKeysArg
        'Next s
        'If sKeysArg = String.Empty Then
        '    Exit Sub
        'End If


        'Me.Panel1.Visible = False
        ''Me.Panel2.Visible = True
        'Dim dtAdapter As SqlDataAdapter
        'Dim dt As New DataTable
        'strSQL = "SELECT * FROM scada.[feeder_amr_profile] WHERE " & sKeysArg
        'dtAdapter = New SqlDataAdapter(strSQL, objConn)
        'objCmd = dtAdapter.SelectCommand
        ''  objCmd.Parameters.Add("@DOCUMENT_ID", SqlDbType.Int).Value = Request.QueryString("DOCUMENT_ID")
        'dtAdapter.Fill(dt)

        'If dt.Rows.Count > 0 Then
        '    ' Me.ImgPic.ImageUrl = "ViewImg.aspx?FilesID=" & dt.Rows(0)("FilesID")
        '    'Me.TextBox3.Text = dt.Rows(0)("Detail")

        'End If
        ''Me.Panel1.Visible = True
        '' Me.Panel2.Visible = False
        'dt = Nothing


        If e.CommandName = "cmdEdit" Then

            'strSQL = "SELECT * FROM scada.[feeder_load01] WHERE file_name = '" & Convert.ToString(dkKeys(1)) & "'"
            Label_temp.Text = Convert.ToString(dkKeys(0))
            Me.SqlDataSource2.DataBind()
            Me.dbGrid_upload0.DataBind()

        End If
        If e.CommandName = "cmdDelete" Then
            Dim strSQL As String
            strSQL = "DELETE FROM scada.[feeder_amr_profile] WHERE PATH_PIC = '" & Convert.ToString(dkKeys(0)) & "'"
            '& Request.QueryString("pmcm_id")
            objCmd = New SqlCommand(strSQL, objConn)
            objCmd.ExecuteNonQuery()
            Me.SqlDataSource1.DataBind()

            strSQL = "DELETE FROM scada.[feeder_load01] WHERE file_name = '" & Convert.ToString(dkKeys(0)) & "'"
            '& Request.QueryString("pmcm_id")
            objCmd = New SqlCommand(strSQL, objConn)
            objCmd.ExecuteNonQuery()
            Me.SqlDataSource2.DataBind()

            Me.GridView1.DataBind()
            Me.dbGrid_upload0.DataBind()
            'Me.dbGrid_upload0.DataBind()

        End If

    End Sub
End Class
