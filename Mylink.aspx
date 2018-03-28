<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Mylink.aspx.vb" Inherits="Mylink" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="poy" TagName="footer" Src="~/UC_footer.ascx" %>
<%@ Register TagPrefix="poy" TagName="header" Src="~/UC_header.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Address ที่ชอบ</title>
    <link href="include/style.css" type="text/css" rel="stylesheet" />
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <link rel="stylesheet" href="images/CitrusIsland.css" type="text/css" />
    <script language="JavaScript" src="include/calendar.js"></script>
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
                <li><a href="admin.aspx">Admin</a></li>
                <li id="current" onclick="return LI1_onclick()"><a href="Mylink.aspx">My Link</a></li>
                <li><a href="User_profile.aspx">Profile</a></li>
                <li><a href="vdo.aspx">E-Leanning</a> </li>
            </ul>
        </div>
        <form id="form1" runat="server">
        <table>
            <tr>
                <td style="height: 26px; width: 65px;">
                    Address
                </td>
                <td style="width: 235px; height: 26px">
                    <asp:TextBox ID="TextBox1" runat="server" Width="80%"></asp:TextBox>
                </td>
                <td style="height: 26px">
                    คำอธิบายรายละเอียด
                </td>
                <td style="width: 261px; height: 26px">
                    <asp:TextBox ID="TextBox2" runat="server" Width="80%"></asp:TextBox>
                </td>
                <td style="height: 26px">
                    <asp:Button ID="Button1" runat="server" Text="Add Link" />
                </td>
            </tr>
        </table>
        &nbsp;<asp:GridView ID="dbGrid_upload" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" BorderStyle="Dotted" CssClass="Grid" DataKeyNames="RUN_ID"
            DataSourceID="SqlDataSource1" EmptyDataText="No records found" Width="100%">
            <RowStyle CssClass="shade" />
            <EmptyDataRowStyle BorderStyle="None" BorderWidth="0px" Font-Bold="True" HorizontalAlign="Center"
                VerticalAlign="Middle" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="Detail" HeaderText="&#3619;&#3634;&#3618;&#3619;&#3632;&#3648;&#3629;&#3637;&#3618;&#3604;"
                    SortExpression="Detail" />
                <asp:HyperLinkField DataNavigateUrlFields="address" DataTextField="address" HeaderText="Address" />
                <asp:BoundField DataField="Date_Insert" HeaderText="&#3623;&#3633;&#3609;&#3607;&#3637;&#3656;&#3626;&#3619;&#3657;&#3634;&#3591;"
                    SortExpression="Date_Insert" ReadOnly="True" />
            </Columns>
            <SelectedRowStyle CssClass="GridSelected" />
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" />
            <AlternatingRowStyle CssClass="GridItemOdd" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:VSPP %>"
            SelectCommand="SELECT * FROM counter.[MY_LINK]" DeleteCommand="DELETE FROM counter.[MY_LINK] WHERE [RUN_ID] = @RUN_ID"
            InsertCommand="INSERT INTO counter.[MY_LINK] ([Address], [Detail], [userid], [Date_Insert]) VALUES (@Address, @Detail, @userid, @Date_Insert)"
            UpdateCommand="UPDATE counter.[MY_LINK] SET [Detail] = @Detail WHERE [RUN_ID] = @RUN_ID">
            <DeleteParameters>
                <asp:Parameter Name="RUN_ID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="Detail" Type="String" />
                <asp:Parameter Name="userid" Type="String" />
                <asp:Parameter DbType="Datetime" Name="Date_Insert" />
                <asp:Parameter Name="RUN_ID" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="Detail" Type="String" />
                <asp:Parameter Name="userid" Type="String" />
                <asp:Parameter DbType="Datetime" Name="Date_Insert" />
            </InsertParameters>
        </asp:SqlDataSource>
        <poy:footer ID="footer1" runat="server" />
        </form>
    </div>
</body>
</html>
