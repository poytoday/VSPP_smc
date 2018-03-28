<%@ Page Language="VB" AutoEventWireup="false" CodeFile="admin_promiss.aspx.vb" Inherits="admin_promiss" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="poy" TagName="footer" Src="~/UC_footer.ascx" %>
<%@ Register TagPrefix="poy" TagName="header" Src="~/UC_header.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>แก้ไขสิทธิ์การเข้าถึง</title>
    <link href="include/style.css" type="text/css" rel="stylesheet" />
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <link rel="stylesheet" href="images/CitrusIsland.css" type="text/css" />
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
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="RUN_ID"
                DataSourceID="SqlDataSource1" Width="99%">
                <Columns>
                    <asp:CommandField ShowEditButton="True" />
                    <asp:BoundField DataField="RUN_ID" HeaderText="RUN_ID" InsertVisible="False" ReadOnly="True"
                        SortExpression="RUN_ID" />
                    <asp:BoundField DataField="userid" HeaderText="userid" SortExpression="userid" />
                    <asp:BoundField DataField="tablename" HeaderText="tablename" SortExpression="tablename" />
                    <asp:BoundField DataField="permission" HeaderText="permission" SortExpression="permission" />
                    <asp:BoundField DataField="action" HeaderText="action" SortExpression="action" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:VSPP %>"
                SelectCommand="SELECT [RUN_ID], [userid], [tablename], [permission], [action] FROM [user_permissions] WHERE ([userid] = @userid)"
                DeleteCommand="DELETE FROM [user_permissions] WHERE [RUN_ID] = @RUN_ID" InsertCommand="INSERT INTO [user_permissions] ([userid], [tablename], [permission], [action]) VALUES (@userid, @tablename, @permission, @action)"
                UpdateCommand="UPDATE [user_permissions] SET [userid] = @userid, [tablename] = @tablename, [permission] = @permission, [action] = @action WHERE [RUN_ID] = @RUN_ID">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="-1" Name="userid" QueryStringField="userid"
                        Type="String" />
                </SelectParameters>
                <DeleteParameters>
                    <asp:Parameter Name="RUN_ID" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="userid" Type="String" />
                    <asp:Parameter Name="tablename" Type="String" />
                    <asp:Parameter Name="permission" Type="String" />
                    <asp:Parameter Name="action" Type="String" />
                    <asp:Parameter Name="RUN_ID" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="userid" Type="String" />
                    <asp:Parameter Name="tablename" Type="String" />
                    <asp:Parameter Name="permission" Type="String" />
                    <asp:Parameter Name="action" Type="String" />
                </InsertParameters>
            </asp:SqlDataSource>
            <poy:footer ID="footer1" runat="server" />
        </form>
    </div>
</body>
</html>
