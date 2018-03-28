
Imports System
Imports System.Data
Imports System.Collections
Imports System.Configuration
Imports System.Threading
Imports System.Globalization
Imports System.Data.OleDb
Imports System.IO
Imports System.Data.SqlClient

Partial Class Edit_Pic
    Inherits System.Web.UI.Page
    Dim objConn As New SqlConnection
    Dim objCmd As SqlCommand
    Dim strConnString, strSQL As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        strConnString = "Server=172.30.203.155;Uid=sa;PASSWORD=1234;database= SA_System;Max Pool Size=400;Connect Timeout=600;"
        objConn.ConnectionString = strConnString
        objConn.Open()
        If Not Page.IsPostBack() Then
            BindData()
        End If

        Dim UserLogin As UserClass = CType(Session("User"), UserClass)

        GridView1.Visible = False
        'GridView2.Visible = False
        If Session("Login") = 1 Then
            'GridView2.Visible = True
            'Me.Td2.Visible = False
            UserClass.login_page("0", "Edit_Pic.aspx", "View")
        Else

            UserClass.CheckLogin(Page)

            If Not func.CheckUserPermissions("Edit_Pic.aspx", "S") Then
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
                GridView1.Visible = True
                Me.Panel1.Visible = True
                'Else
                UserClass.login_page(UserLogin.UserName, "Edit_Pic.aspx", "View")
            End If
        End If
    End Sub
    Protected Sub ViewData()
        '*** DataTable ***'
        Dim dtAdapter As SqlDataAdapter
        Dim dt As New DataTable
        dtAdapter = New SqlDataAdapter(strSQL, objConn)
        objCmd = dtAdapter.SelectCommand
        objCmd.Parameters.Add("@Substation", SqlDbType.VarChar).Value = Request.QueryString("Substation")
        strSQL = "SELECT * FROM scada.feeder_name_amr WHERE substation = @Substation "
        dtAdapter.Fill(dt)
        dt = Nothing
    End Sub
    Protected Sub BindData()
        Try
            objCmd.Parameters.Add("@Substation", SqlDbType.VarChar).Value = Request.QueryString("Substation")
            uploadSqlDataSource.SelectCommand = func.SqlBuilder(uploadSqlDataSource.SelectCommand, "2=2  and [substation] = @Substation ".Replace("2=2 and ", ""))
            'uploadDetailsView.DataBind()
            Me.uploadSqlDataSource.DataBind()
            'dbGrid_upload.DataBind()
            'uploadSqlDataSource.SelectCommand = func.SqlBuilder(uploadSqlDataSource.SelectCommand, "2=2  and [ID_BU] = @ID_BU ".Replace("2=2 and ", ""))
            'uploadDetailsView.DataBind()
            'Me.uploadSqlDataSource.DataBind()
            'Me.dbGrid_upload.DataBind()
        Catch ex As Exception
            'lblMessage.Text += "Error description" & ": " & ex.Message & "<p>"
        End Try
    End Sub
    Protected Sub uploadDetailsView_ItemInserting(ByVal sender As Object, ByVal e As DetailsViewInsertEventArgs)

        'Me.SqlDataSource1.Insert()
        Insert_Work_To_Pic()
        'Dim fupath As FileUpload = CType(uploadDetailsView.FindControl("Uploadfldpath"), FileUpload)
        'Dim txtpath As TextBox = CType(uploadDetailsView.FindControl("fldpath"), TextBox)
        'If fupath.PostedFile.ContentLength > 0 Then

        '    Dim sFileName As String = fupath.PostedFile.FileName
        '    sFileName = sFileName.Remove(0, sFileName.LastIndexOfAny("\/".ToCharArray()) + 1)

        '    fupath.PostedFile.SaveAs(Server.MapPath("upload/" + sFileName))
        '    e.Values("path") = sFileName
        'Else
        '    e.Values("path") = DBNull.Value
        'End If
    End Sub

    Protected Sub uploadSqlDataSource_Inserted(ByVal sender As Object, ByVal e As SqlDataSourceStatusEventArgs)
        If e.Exception Is Nothing Then
            ' lblMessage.Text = "<b>" + "Record inserted" + "</b><p>"
        Else
            'lblMessage.Text += "Error description" + ": " + e.Exception.Message + "<p>"
            ' e.ExceptionHandled = True
        End If

        '#If (DEBUG) Then
        '    lblMessage.Text += "<p>InsertCommand = " + uploadSqlDataSource.InsertCommand + "<p>"
        '    For Each p As System.Data.Common.DbParameter In e.Command.Parameters
        '        lblMessage.Text += p.ParameterName + "(" + p.DbType.ToString() + ")=" + p.Value.ToString() + "<br>"
        '    Next p
        '#End If
    End Sub
    Protected Sub Insert_Work_To_Pic()
        'Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        Dim Ds As New DataSet
        Dim Dt As DataTable
        Dim Dr As DataRow
        Dim StrCon As New SqlConnection("Server=172.30.203.155;Uid=sa;PASSWORD=1234;database= SA_System;Max Pool Size=400;Connect Timeout=600;")
        Dim Adpt As New SqlDataAdapter("SELECT * FROM scada.feeder_amr_profile WHERE 2<>2", StrCon)
        Adpt.Fill(Ds, "feeder_amr_profile")
        Dt = Ds.Tables("feeder_amr_profile")
        Dr = Dt.NewRow
        Dr("substation") = Request.QueryString("Substation")
        Dr("PATH_PIC") = Me.FileUpload1.FileName
        Dr("detail") = fldpath.Text
        Dr("season") = Me.RadioButtonList1.Text
        Dt.Rows.Add(Dr)
        Dim cdb As New SqlCommandBuilder(Adpt)
        Adpt.Update(Ds, "feeder_amr_profile")
        Ds.AcceptChanges()
        'Show_PIC_FILE_ID()
        'Me.WORK_UPDATE_STATUS("7", "1", "1", "-", Me.DropDownList1.SelectedValue, Me.DropDownList5.SelectedValue, UserLogin.UserName)
        'Me.WORK_UPDATE_STATUS("7", "2", "1", "-", Me.Uploadfldpath.FileName, Me.DropDownList5.SelectedValue, UserLogin.UserName)
    End Sub

    Protected Sub Button1_Click1(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        'Insert_file()
        insert_date_data()
        Insert_Work_To_Pic()
        'Me.SqlDataSource1.DataBind()
        Me.GridView1.DataBind()
    End Sub
    Private Sub insert_date_data()
        Dim savePath As String
        Dim irow As Integer = 0
        Dim num_check As Integer = 0
        Dim myDSource As SqlDataSource
        myDSource = New SqlDataSource()
        'Dim dd, mm, yy As Integer
        'Dim date_1 As String
        'myDSource.ConnectionString = "Data Source=peasvr:1521/peadbn3;Persist Security Info=True;User ID=sde;Password=sde#p5159"
        myDSource.ConnectionString = "Server=172.30.203.155;Uid=sa;PASSWORD=1234;database= SA_System;Max Pool Size=400;Connect Timeout=600;"
        myDSource.ProviderName = "System.Data.SqlClient"
        Dim sql_insert As String = "INSERT INTO scada.[feeder_load01] (season,region,substation,Date1,MW,file_name)VALUES('"
        Dim sql_insert2 As String


        If (Me.FileUpload1.HasFile) Then
            'Get the name of the file to upload.
            Dim fileName As String = FileUpload1.FileName
            Dim locationName As String = FileUpload1.FileContent.Position
            ' Append the name of the file to upload to the path.
            Dim MyStringRow As String

            Dim iarr As Object
            Dim irr_code As New Object
            Try
                'savePath = Server.MapPath("G:\vspp_profile\" + fileName)
                savePath = "D:\vspp_profile\" + fileName
                'savePath = "C:\" + fileName
                FileUpload1.SaveAs(savePath)
            Catch x1 As Exception

                'Me.lblMessage2.Text = x1.Message
                'UserClass.err_mass_icg(Session("User_icg"), "FileUpload", x1.Message)

            End Try
            'Dim MyFileStream As New FileStream("z:\report\Online_Status_N3RCS_Dig2.txt", FileMode.Open, FileAccess.Read)
            'Dim MyFileStream As New FileStream("E:\ISU_N3\AA\ตค.csv", FileMode.Open, FileAccess.Read)
            'Dim MyFileStream As New FileStream("C:\1\Online_Status_N3RCS_Dig.txt", FileMode.Open, FileAccess.Read)
            Dim MyFileStream As New FileStream(savePath, FileMode.Open, FileAccess.Read)
            Dim MyStreamReader As New StreamReader(MyFileStream, System.Text.Encoding.GetEncoding(874))

            Do

                MyStringRow = MyStreamReader.ReadLine
                iarr = Split(MyStringRow, ",")

                If MyStreamReader.EndOfStream Then
                    irow = 1
                Else
                    If num_check >= 1 Then
                        Try
                            sql_insert2 = sql_insert & Me.RadioButtonList1.SelectedValue.ToString & "','" & iarr(0) & "','" & iarr(1) & "','" & iarr(2) & "'," & iarr(3) & ",'" & fileName & "')"
                            myDSource.InsertCommand = sql_insert2
                            myDSource.Insert()
                            num_check += 1
                            Me.Label1.Text = "Insert Complete"
                        Catch x1 As Exception
                            If x1.Message = "Unable to cast object of type 'System.Object' to type 'System.Collections.IEnumerable'." Then
                                'Me.lblMessage2.Visible = True
                                'Me.lblMessage2.Text = "รูปแบบการจัดเรียงแถวในไฟล์ที่ต้องการอัพโหลด ไม่รองรับกับโปรแกรม โปรดใช้รูปแบบ File ให้เหมาะสม"
                                'UserClass.err_mass_icg(Session("User_icg"), Mid(iarr(1), 1, 4), x1.Message & " = " & iarr(0) & "','" & Mid(iarr(1), 1, 4) & "','" & Mid(iarr(1), 5, 4) & "','" & iarr(2) & "','" & iarr(3) & "','" & iarr(5) & "','" & iarr(6) & "','" & iarr(7))
                            Else
                                Me.Label1.Text = x1.Message.ToString
                                'UserClass.err_mass_icg(Session("User_icg"), Mid(iarr(1), 1, 4), x1.Message & " = " & iarr(0) & "','" & Mid(iarr(1), 1, 4) & "','" & Mid(iarr(1), 5, 4) & "','" & iarr(2) & "','" & iarr(3) & "','" & iarr(5) & "','" & iarr(6) & "','" & iarr(7))

                            End If
                            'File.Delete(savePath)
                        End Try
                    Else
                        num_check += 1
                    End If
                    
                End If

            Loop Until irow = 1
        End If

    End Sub
    Protected Sub Insert_file()
        Dim fupath As FileUpload = FileUpload1 'CType(uploadDetailsView.FindControl("Uploadfldpath"), FileUpload)
        Dim txtpath As TextBox = fldpath 'CType(uploadDetailsView.FindControl("fldpath"), TextBox)
        If fupath.PostedFile.ContentLength > 0 Then
            Dim sFileName As String = fupath.PostedFile.FileName
            sFileName = sFileName.Remove(0, sFileName.LastIndexOfAny("\/".ToCharArray()) + 1)
            'fupath.PostedFile.SaveAs(Server.MapPath("G:\vspp_profile\" + sFileName))
            fupath.PostedFile.SaveAs("D:\vspp_profile\" + sFileName)
        End If
        Insert_Work_To_Pic()
    End Sub
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
            Try

          
            Dim strSQL As String
            'strConnString = "Server=172.29.84.96;Uid=sa2;PASSWORD=Pea123; database= Load_star;Max Pool Size=400;Connect Timeout=600;"
            'objConn.ConnectionString = strConnString
            'objConn.Open()
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
                objConn.Close()
                Me.Label1.Text = "Delete Complete"
            Catch x1 As Exception

                'Me.lblMessage2.Text = x1.Message
                'UserClass.err_mass_icg(Session("User_icg"), "FileUpload", x1.Message)
                Me.Label1.Text = x1.Message.ToString
            End Try
        End If

    End Sub

    'Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click

    '    Me.Label_temp.Visible = True
    '    strSQL = "UPDATE counter.VSPP_PIC SET Detail = @Detail " & _
    '                      " WHERE " & Me.Label_temp.Text

    '    objCmd = New SqlCommand(strSQL, objConn)
    '    'objCmd.Parameters.Add("@Detail", SqlDbType.VarChar).Value = TextBox3.Text
    '    'objCmd.Parameters.Add("@RUN_ID", SqlDbType.Int).Value = Request.QueryString("DOCUMENT_ID")
    '    ' objCmd.Parameters.Add("@DATE_CREATE", SqlDbType.DateTime).Value = Date.Now

    '    objCmd.ExecuteNonQuery()
    '    'Me.TextBox3.Text = ""
    '    Me.Label_temp.Visible = False
    '    'Me.Panel2.Visible = False
    '    Me.Panel1.Visible = True
    '    Me.GridView1.DataBind()

    'End Sub
    'Protected Sub btnDelete_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnDelete.Click
    '    Dim sWhere As String = Request.Form("chDelete")
    '    'Dim i As Integer = 99
    '    If (Not String.IsNullOrEmpty(sWhere)) Then
    '        Try
    '            For Each s As String In sWhere.Split(",")
    '                Dim iRowIndex As Integer = Convert.ToInt32(s)
    '                GridView1.DeleteRow(iRowIndex)
    '                'i = dbGrid_upload
    '                'Me.WORK_UPDATE_STATUS("1", "1", "3", "-", "-", i)
    '            Next s
    '            'Me.WORK_TO_NAME_SqlDataSource.Delete()

    '            'Me.SqlDataSource1.Delete()
    '        Catch ex As Exception
    '            lblMessage.Text += "Error description" + ": " + ex.Message + "<p>"
    '        End Try

    '    End If

    '    'Dim index As Integer = Convert.ToInt32(e.CommandArgument)
    '    'Dim dkKeys As DataKey = GridView1.DataKeys(index)

    '    'Label_temp.Text = Convert.ToString(dkKeys(0))

    '    'BindData()
    'End Sub





    Protected Sub RadioButtonList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonList1.SelectedIndexChanged
        If Me.RadioButtonList1.SelectedValue = "All Season" Then
            CheckBoxList1.Items(0).Selected = True
            CheckBoxList1.Items(1).Selected = True
            CheckBoxList1.Items(2).Selected = True
            CheckBoxList1.Items(3).Selected = True

        Else

            CheckBoxList1.Items(0).Selected = False
            CheckBoxList1.Items(1).Selected = False
            CheckBoxList1.Items(2).Selected = False
            CheckBoxList1.Items(3).Selected = False


        End If
    End Sub
End Class
