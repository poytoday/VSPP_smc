
Partial Class Report
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim UserLogin As UserClass = CType(Session("User"), UserClass)


        If Session("Login") = 1 Then

            UserClass.login_page("0", "Report.aspx", "View")
        Else
            UserClass.CheckLogin(Page)
            UserClass.login_page(UserLogin.UserName, "Report.aspx", "View")

        End If
    End Sub
End Class
