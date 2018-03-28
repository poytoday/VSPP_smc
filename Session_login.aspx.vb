
Partial Class Session_login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("Login") = 1
        Response.Redirect("View_Data_Bu.aspx")
    End Sub
End Class
