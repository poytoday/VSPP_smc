<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Admin_user.aspx.vb" Inherits="Admin_user" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="poy" TagName="footer" Src="~/UC_footer.ascx" %>
<%@ Register TagPrefix="poy" TagName="header" Src="~/UC_header.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>&#3649;&#3585;&#3657;&#3652;&#3586;&#3626;&#3636;&#3607;&#3608;&#3636;&#3660;&#3585;&#3634;&#3619;&#3648;&#3586;&#3657;&#3634;&#3606;&#3638;&#3591;</title>
    <link href="include/style.css" type="text/css" rel="stylesheet" />
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <link rel="stylesheet" href="images/CitrusIsland.css" type="text/css" />
    <link href="images/CitrusIsland.css" rel="stylesheet" type="text/css" />
    <link href="images/CitrusIsland.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <div id="wrap">
        <poy:header ID="footer2" runat="server" />
        <div id="menu">
            <ul>
                <li><a href="Login.aspx">Login</a></li>
                <li><a href="View_Data_Bu.aspx">Data</a> </li>
                <li><a href="Default.aspx">VSPP</a></li>
                <li><a href="Add_pro.aspx">Cattalog</a></li>
                <li><a href="Report.aspx">Report</a></li>
                <li id="current" onclick="return LI1_onclick()"><a href="admin.aspx">Admin</a></li>
                <li><a href="Mylink.aspx">My Link</a></li>
                <li><a href="User_profile.aspx">Profile</a></li>
                <li><a href="vdo.aspx">E-Leanning</a> </li>
            </ul>
        </div>
        <form id="form1" runat="server">
        &nbsp; &nbsp;<br />
        i&#3619;&#3634;&#3618;&#3621;&#3632;&#3648;&#3629;&#3637;&#3618;&#3604;&#3612;&#3641;&#3657;&#3651;&#3594;&#3657;&#3591;&#3634;&#3609;<br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" BorderStyle="Dotted" CssClass="Grid" DataKeyNames="userid"
            DataSourceID="SqlDataSource1" EmptyDataText="No records found" PageSize="30"
            Width="99%">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="userid" HeaderText="userid" ReadOnly="True" SortExpression="userid" />
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:CheckBoxField DataField="active_flag" HeaderText="active_flag" SortExpression="active_flag" />
                <asp:BoundField DataField="office" HeaderText="office" SortExpression="office" />
                <asp:CheckBoxField DataField="Requert_Admin" HeaderText="Requert_Admin" SortExpression="Requert_Admin" />
                <asp:HyperLinkField DataNavigateUrlFields="userid" DataNavigateUrlFormatString="admin_promiss.aspx?userid={0}"
                    HeaderImageUrl="~/images/icon_edit.gif" HeaderText="&#3649;&#3585;&#3657;&#3652;&#3586;&#3626;&#3636;&#3607;&#3608;&#3660;"
                    NavigateUrl="~/admin_promiss.aspx" Text="Link" />
            </Columns>
            <FooterStyle HorizontalAlign="Center" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:VSPP %>"
            DeleteCommand="DELETE FROM [user] WHERE [userid] = @original_userid" InsertCommand="INSERT INTO [user] ([userid], [name], [active_flag], [office], [Requert_Admin]) VALUES (@userid, @name, @active_flag, @office, @Requert_Admin)"
            OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [userid], [name], [active_flag], [office], [Requert_Admin] FROM counter.[user] ORDER BY [create_date] DESC"
            UpdateCommand="UPDATE [user] SET [name] = @name, [active_flag] = @active_flag, [office] = @office, [Requert_Admin] = @Requert_Admin WHERE [userid] = @original_userid">
            <DeleteParameters>
                <asp:Parameter Name="original_userid" Type="String" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="active_flag" Type="Boolean" />
                <asp:Parameter Name="office" Type="String" />
                <asp:Parameter Name="Requert_Admin" Type="Boolean" />
                <asp:Parameter Name="original_userid" Type="String" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="userid" Type="String" />
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="active_flag" Type="Boolean" />
                <asp:Parameter Name="office" Type="String" />
                <asp:Parameter Name="Requert_Admin" Type="Boolean" />
            </InsertParameters>
        </asp:SqlDataSource>
        <br />
        <poy:footer ID="footer1" runat="server" />
        </form>
    </div>
</body>
</html>
