<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Report_By_Status.aspx.vb" Inherits="Report_By_Status" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="poy" TagName="footer" Src="~/UC_footer.ascx" %>
<%@ Register TagPrefix="poy" TagName="header" Src="~/UC_header.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>รายชื่อบริษัท</title>
    <link href="include/style.css" type="text/css" rel="stylesheet" />
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <link rel="stylesheet" href="images/CitrusIsland.css" type="text/css" />
    <link href="images/CitrusIsland.css" rel="stylesheet" type="text/css" />
    <link href="images/CitrusIsland.css" rel="stylesheet" type="text/css" />
    <link href="images/CitrusIsland.css" rel="stylesheet" type="text/css" />
    <link href="images/CitrusIsland.css" rel="stylesheet" type="text/css" />
    <link href="images/CitrusIsland.css" rel="stylesheet" type="text/css" />
    <link href="images/CitrusIsland.css" rel="stylesheet" type="text/css" />
    <link href="images/CitrusIsland.css" rel="stylesheet" type="text/css" />
    <link href="images/CitrusIsland.css" rel="stylesheet" type="text/css" />
    <link href="images/CitrusIsland.css" rel="stylesheet" type="text/css" />
    <link href="images/CitrusIsland.css" rel="stylesheet" type="text/css" />
    <link href="images/CitrusIsland.css" rel="stylesheet" type="text/css" />
    <link href="images/CitrusIsland.css" rel="stylesheet" type="text/css" />
    <link href="images/CitrusIsland.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <div id="wrap">
        <poy:header ID="footer2" runat="server" />
        <div id="menu">
            <ul>
                <li><a href="Login.aspx">Login</a></li>
                <li><a href="View_Data_Bu.aspx">Data</a></li>
                <li><a href="Default.aspx">VSPP</a></li>
                <li><a href="Add_pro.aspx">Cattalog</a></li>
                <li id="current" onclick="return LI1_onclick()"><a href="Report.aspx">Report</a> </li>
                <li><a href="admin.aspx">Admin</a></li>
                <li><a href="Mylink.aspx">My Link</a></li>
                <li><a href="User_profile.aspx">Profile</a></li>
           <li ><a href="vdo.aspx">E-Leanning</a> </li> </ul>
        </div>
    <form id="form1" runat="server">
    <div>
        &nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:VSPP %>"
            SelectCommand="SELECT * FROM [Business]">
            <%--<SelectParameters>
                <asp:QueryStringParameter DefaultValue="-1" Name="Status_Type" QueryStringField="Status_Type"
                    Type="String" />
            </SelectParameters>--%>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True"
            AutoGenerateColumns="False" BorderStyle="Dotted" CssClass="Grid" DataKeyNames="ID_BU" OnRowCommand="dbGrid_upload_RowCommand"
            DataSourceID="SqlDataSource1" EmptyDataText="No records found"  Width="100%">
            <RowStyle CssClass="shade" />
            <EmptyDataRowStyle BorderStyle="None" BorderWidth="0px" Font-Bold="True" HorizontalAlign="Center"
                VerticalAlign="Middle" />
            <Columns>
                <asp:ButtonField CommandName="cmdView" HeaderImageUrl="images\icon_view.gif" Text="Pic\File" />
                <asp:ButtonField CommandName="cmdStatus" HeaderImageUrl="images\icon_edit.gif" Text="Status" />
                <asp:BoundField DataField="Name_BU" HeaderText="ชื่อบริษัท/บุคคล" ReadOnly="True"
                    SortExpression="Name_BU">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Gen" HeaderText="ประเภทโรงไฟฟ้า" ReadOnly="True" SortExpression="Gen">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Oil" HeaderText="ประเภทเชื้อเพลิง" ReadOnly="True" SortExpression="Oil">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Adder" HeaderText="Adder" ReadOnly="True" SortExpression="Adder">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Power" HeaderText="ปริมาณการขาย(MW)" ReadOnly="True" SortExpression="Power">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Sale_Power" HeaderText="กำลังการผลิต(MW)" ReadOnly="True"
                    SortExpression="Sale_Power">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Substation" HeaderText="สถานีไฟฟ้า" ReadOnly="True" SortExpression="Substation" />
                <asp:BoundField DataField="Feeder" HeaderText="วงจรไฟฟ้า" ReadOnly="True" SortExpression="Feeder" />
                <asp:BoundField DataField="Status" HeaderText="สถานะ" ReadOnly="True" SortExpression="Status">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
            </Columns>
            <SelectedRowStyle CssClass="GridSelected" />
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" />
            <AlternatingRowStyle CssClass="GridItemOdd" />
        </asp:GridView>
    
                <poy:footer ID="footer1" runat="server" />
            </div>
        </form>
</body>
</html>
