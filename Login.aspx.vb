
Partial Class Login
    Inherits System.Web.UI.Page
    Dim userLogin As UserClass = New UserClass()
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        lblMessage.Text = ""
       
        If (Not Page.IsPostBack) Then
            If String.IsNullOrEmpty(ConfigurationManager.AppSettings("LoginMethod")) OrElse (ConfigurationManager.AppSettings("LoginMethod")).ToUpper() = "WITHOUTLOGIN" Then
                Redirect()
                Exit Sub
            End If
            '
            If Not IsNothing(Request.QueryString("user")) Then
                txtUserName.Text = Request.QueryString("user")
                txtPassword.Attributes.Add("value", "")
            Else
                If Request.Browser.Cookies Then
                    If Not IsNothing(Request.Cookies("UserInfo")) Then
                        txtUserName.Text = Request.Cookies("UserInfo")("UserLogin")
                        txtPassword.Attributes.Add("value", Request.Cookies("UserInfo")("UserPwd"))
                        chbSavePassword.Checked = True
                    End If
                    chbSavePassword.Visible = True
                Else
                    chbSavePassword.Visible = False
                End If
            End If
            Session.Clear()
        End If
        If txtUserName.Text = String.Empty Then
            Page.SetFocus(txtUserName)
        Else
            Page.SetFocus(txtPassword)
        End If
    End Sub

    Protected Sub cmdLogin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdLogin.Click
        Session("Login") = 0
        Dim aCookie As HttpCookie = New HttpCookie("UserInfo")
        Try
            userLogin = userLogin.Login(txtUserName.Text, txtPassword.Text)
            If Not IsNothing(userLogin) AndAlso userLogin.ID <> Guid.Empty Then
                Session("User") = userLogin
                UserClass.login_page(userLogin.UserName, "Login.aspx", "Login")
                If Request.Browser.Cookies Then
                    If chbSavePassword.Checked Then
                        aCookie("UserLogin_vspp_smc") = txtUserName.Text
                        aCookie("UserPwd_vspp_smc") = txtPassword.Text
                        aCookie.Expires = DateTime.Now.AddYears(1)
                    Else
                        aCookie.Expires = DateTime.Now
                    End If
                    Response.Cookies.Add(aCookie)
                End If
            Else
                userLogin = Nothing
                Session("User") = Nothing
                lblMessage.Text = "Invalid Login"
            End If
        Catch
            userLogin = Nothing
            Session("User") = Nothing
            lblMessage.Text = "Invalid Login"
        End Try
        If Not IsNothing(userLogin) Then
            Redirect()
        End If
    End Sub

    Protected Sub Redirect()
        Dim sStartPageURL As String = ""
        If Not IsNothing(Request.QueryString("url")) Then
            sStartPageURL = Request.QueryString("url")

        Else
            sStartPageURL = "View_Data_Bu.aspx"
            ''
        End If

        If sStartPageURL = String.Empty Then
            Response.Write("<script language=javascript>alert('" + "Start page isn't set" + "');</script>")
        Else
            Response.Redirect(sStartPageURL)
        End If
    End Sub

    Protected Sub chbSavePassword_CheckedChanged(sender As Object, e As EventArgs) Handles chbSavePassword.CheckedChanged

    End Sub
End Class
