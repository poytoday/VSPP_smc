<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Report.aspx.vb" Inherits="Report" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="poy" TagName="footer" Src="~/UC_footer.ascx" %>
<%@ Register TagPrefix="poy" TagName="header" Src="~/UC_header.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>&#3648;&#3621;&#3639;&#3629;&#3585;&#3619;&#3641;&#3611;&#3649;&#3610;&#3610;&#3619;&#3634;&#3618;&#3591;&#3634;&#3609;
    </title>
    <link href="include/style.css" type="text/css" rel="stylesheet" />
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <link rel="stylesheet" href="images/CitrusIsland.css" type="text/css" />
    <link href="images/CitrusIsland.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            width: 399px;
            height: 121px;
        }
        .style2
        {
            width: 200px;
            height: 121px;
        }
    </style>
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
                <li id="current" onclick="return LI1_onclick()"><a href="Report.aspx">Report</a>
                </li>
                <li><a href="admin.aspx">Admin</a></li>
                <li><a href="Mylink.aspx">My Link</a></li>
                <li><a href="User_profile.aspx">Profile</a></li>
                <li><a href="vdo.aspx">E-Leanning</a> </li>
            </ul>
        </div>
        <form id="form1" runat="server">
        <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:counterConnectionString %>"
            SelectCommand="SELECT * FROM counter.[battery]"></asp:SqlDataSource>
        <div>
            <h1>
                <li><a href="Report_All.aspx">&#3648;&#3619;&#3637;&#3618;&#3585;&#3604;&#3641;&#3586;&#3657;&#3629;&#3617;&#3641;&#3621;&#3586;&#3629;&#3591;&#3610;&#3619;&#3636;&#3625;&#3633;&#3607;&#3631;&#3607;&#3633;&#3657;&#3591;&#3627;&#3617;&#3604;</a>
                </li>
                <asp:GridView ID="GridView11" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                    BorderStyle="Dotted" CssClass="Grid" DataSourceID="SqlDataSource10" EmptyDataText="No records found"
                    Width="792px" HorizontalAlign="Justify">
                    <RowStyle CssClass="shade" />
                    <EmptyDataRowStyle BorderStyle="None" BorderWidth="0px" Font-Bold="True" HorizontalAlign="Center"
                        VerticalAlign="Middle" />
                    <Columns>
                        <asp:BoundField DataField="COUNT" HeaderText="&#3592;&#3635;&#3609;&#3623;&#3609;&#3610;&#3619;&#3636;&#3625;&#3633;&#3607;&#3607;&#3633;&#3657;&#3591;&#3627;&#3617;&#3604;(&#3649;&#3627;&#3656;&#3591;)"
                            ReadOnly="True" SortExpression="COUNT">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="count_Name_Sum" HeaderText="&#3592;&#3635;&#3609;&#3623;&#3609;&#3610;&#3619;&#3636;&#3625;&#3633;&#3607;&#3607;&#3633;&#3657;&#3591;&#3627;&#3617;&#3604;(&#3610;&#3619;&#3636;&#3625;&#3633;&#3607;)"
                            ReadOnly="True" SortExpression="count_Name_Sum">
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:BoundField>
                    </Columns>
                    <SelectedRowStyle CssClass="GridSelected" />
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" />
                    <AlternatingRowStyle CssClass="GridItemOdd" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:VSPP %>"
                    SelectCommand="SELECT COUNT(*) AS COUNT, COUNT(DISTINCT Name_BU) AS count_Name_Sum FROM counter.Business">
                </asp:SqlDataSource>
            </h1>
            <h1>
                <li>&#3611;&#3619;&#3636;&#3617;&#3634;&#3603;&#3585;&#3635;&#3621;&#3633;&#3591;&#3585;&#3634;&#3619;&#3586;&#3634;&#3618;&#3649;&#3621;&#3632;&#3585;&#3635;&#3621;&#3633;&#3591;&#3585;&#3634;&#3619;&#3612;&#3621;&#3636;&#3605;
                </li>
                <table>
                    <tr>
                        <td>
                            <asp:GridView ID="GridView7" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                                BorderStyle="Dotted" CssClass="Grid" DataSourceID="SqlDataSource8" EmptyDataText="No records found"
                                Width="792px" HorizontalAlign="Center">
                                <RowStyle CssClass="shade" />
                                <EmptyDataRowStyle BorderStyle="None" BorderWidth="0px" Font-Bold="True" HorizontalAlign="Center"
                                    VerticalAlign="Middle" />
                                <Columns>
                                    <asp:BoundField DataField="Sum_Sale" HeaderText="&#3611;&#3619;&#3636;&#3617;&#3634;&#3603;&#3585;&#3634;&#3619;&#3586;&#3634;&#3618;&#3607;&#3633;&#3657;&#3591;&#3627;&#3617;&#3604;(MW)"
                                        ReadOnly="True" SortExpression="Sum_Sale">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" Width="100px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Sum_Power" HeaderText="&#3585;&#3635;&#3621;&#3633;&#3591;&#3585;&#3634;&#3619;&#3612;&#3621;&#3636;&#3588;&#3607;&#3633;&#3657;&#3591;&#3627;&#3617;&#3604;(MW)"
                                        ReadOnly="True" SortExpression="Sum_Power">
                                        <ItemStyle HorizontalAlign="Center" Width="100px" />
                                    </asp:BoundField>
                                </Columns>
                                <SelectedRowStyle CssClass="GridSelected" />
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" />
                                <AlternatingRowStyle CssClass="GridItemOdd" />
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:GridView ID="GridView8" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                                BorderStyle="Dotted" CssClass="Grid" DataSourceID="SqlDataSource8" EmptyDataText="No records found"
                                Width="792px" HorizontalAlign="Center">
                                <RowStyle CssClass="shade" />
                                <EmptyDataRowStyle BorderStyle="None" BorderWidth="0px" Font-Bold="True" HorizontalAlign="Center"
                                    VerticalAlign="Middle" />
                                <Columns>
                                    <asp:BoundField DataField="AVG_Sale" HeaderText="&#3611;&#3619;&#3636;&#3617;&#3634;&#3603;&#3585;&#3634;&#3619;&#3586;&#3634;&#3618;&#3648;&#3593;&#3621;&#3637;&#3656;&#3618;(MW)"
                                        ReadOnly="True" SortExpression="AVG_Sale" DataFormatString="{0:f}">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" Width="100px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="AVG_Power" HeaderText="&#3585;&#3635;&#3621;&#3633;&#3591;&#3585;&#3634;&#3619;&#3612;&#3621;&#3636;&#3588;&#3648;&#3593;&#3621;&#3637;&#3656;&#3618;(MW)"
                                        ReadOnly="True" SortExpression="AVG_Power" DataFormatString="{0:f}">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" Width="100px" />
                                    </asp:BoundField>
                                </Columns>
                                <SelectedRowStyle CssClass="GridSelected" />
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" />
                                <AlternatingRowStyle CssClass="GridItemOdd" />
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:GridView ID="GridView10" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                                BorderStyle="Dotted" CssClass="Grid" DataSourceID="SqlDataSource8" EmptyDataText="No records found"
                                Width="792px" HorizontalAlign="Center">
                                <RowStyle CssClass="shade" />
                                <EmptyDataRowStyle BorderStyle="None" BorderWidth="0px" Font-Bold="True" HorizontalAlign="Center"
                                    VerticalAlign="Middle" />
                                <Columns>
                                    <asp:BoundField DataField="MIN_Sale" HeaderText="&#3611;&#3619;&#3636;&#3617;&#3634;&#3603;&#3585;&#3634;&#3619;&#3586;&#3634;&#3618;&#3605;&#3656;&#3635;&#3626;&#3640;&#3604;(MW)"
                                        ReadOnly="True" SortExpression="MIN_Sale">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" Width="100px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="MIN_Power" HeaderText="&#3585;&#3635;&#3621;&#3633;&#3591;&#3585;&#3634;&#3619;&#3612;&#3621;&#3636;&#3588;&#3605;&#3656;&#3635;&#3626;&#3640;&#3604;(MW)"
                                        ReadOnly="True" SortExpression="MIN_Power">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" Width="100px" />
                                    </asp:BoundField>
                                </Columns>
                                <SelectedRowStyle CssClass="GridSelected" />
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" />
                                <AlternatingRowStyle CssClass="GridItemOdd" />
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
                <asp:GridView ID="GridView9" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                    BorderStyle="Dotted" CssClass="Grid" DataSourceID="SqlDataSource8" EmptyDataText="No records found"
                    Width="792px" HorizontalAlign="Center">
                    <RowStyle CssClass="shade" />
                    <EmptyDataRowStyle BorderStyle="None" BorderWidth="0px" Font-Bold="True" HorizontalAlign="Center"
                        VerticalAlign="Middle" />
                    <Columns>
                        <asp:BoundField DataField="MAX_Sale" HeaderText="&#3611;&#3619;&#3636;&#3617;&#3634;&#3603;&#3585;&#3634;&#3619;&#3586;&#3634;&#3618;&#3626;&#3641;&#3591;&#3626;&#3640;&#3604;(MW)"
                            ReadOnly="True" SortExpression="MAX_Sale">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="100px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="MAX_Power" HeaderText="&#3585;&#3635;&#3621;&#3633;&#3591;&#3585;&#3634;&#3619;&#3612;&#3621;&#3636;&#3588;&#3626;&#3641;&#3591;&#3626;&#3640;&#3604;(MW)"
                            ReadOnly="True" SortExpression="MAX_Power">
                            <ItemStyle HorizontalAlign="Center" Width="100px" />
                        </asp:BoundField>
                    </Columns>
                    <SelectedRowStyle CssClass="GridSelected" />
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" />
                    <AlternatingRowStyle CssClass="GridItemOdd" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:VSPP %>"
                    SelectCommand="SELECT     SUM(Sale_Power) AS Sum_Sale, SUM(Power) AS Sum_Power, AVG(Sale_Power) AS AVG_Sale, AVG(Power) AS AVG_Power, MAX(Sale_Power) &#13;&#10;                      AS MAX_Sale, MAX(Power) AS MAX_Power, MIN(Sale_Power) AS MIN_Sale, MIN(Power) AS MIN_Power&#13;&#10;FROM         counter.Business">
                </asp:SqlDataSource>
                <li>&#3592;&#3635;&#3609;&#3623;&#3609;&#3610;&#3619;&#3636;&#3625;&#3633;&#3607;&#3649;&#3618;&#3585;&#3605;&#3634;&#3617;&#3611;&#3619;&#3632;&#3648;&#3616;&#3607;&#3605;&#3656;&#3634;&#3591;&#3654;</li>
            </h1>
            <table>
                <tr>
                    <td style="height: 17px">
                        &#3626;&#3606;&#3634;&#3609;&#3632;
                    </td>
                    <td style="height: 17px">
                        &#3611;&#3619;&#3632;&#3648;&#3616;&#3607;&#3650;&#3619;&#3591;&#3652;&#3615;&#3615;&#3657;&#3634;
                    </td>
                    <td style="height: 17px">
                        &#3648;&#3594;&#3639;&#3657;&#3629;&#3648;&#3614;&#3621;&#3636;&#3591;
                    </td>
                    <td style="height: 17px">
                        Adder
                    </td>
                </tr>
                <tr>
                    <td style="width: 200px; height: 126px;" valign="top">
                        <asp:GridView ID="dbGrid_upload" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                            BorderStyle="Dotted" CssClass="Grid" DataKeyNames="Status_Type" DataSourceID="SqlDataSource1"
                            EmptyDataText="No records found" Width="99%" HorizontalAlign="Center">
                            <RowStyle CssClass="shade" />
                            <EmptyDataRowStyle BorderStyle="None" BorderWidth="0px" Font-Bold="True" HorizontalAlign="Center"
                                VerticalAlign="Middle" />
                            <Columns>
                                <asp:BoundField DataField="Status_Type" HeaderText="&#3626;&#3606;&#3634;&#3609;&#3632;"
                                    ReadOnly="True" SortExpression="Status_Type" />
                                <asp:BoundField DataField="Count" HeaderText="&#3592;&#3635;&#3609;&#3623;&#3609;(&#3610;&#3619;&#3636;&#3625;&#3633;&#3607;)"
                                    ReadOnly="True" SortExpression="Count">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:HyperLinkField DataNavigateUrlFields="Status_Type" DataNavigateUrlFormatString="Report_By_Status.aspx?Status={0}"
                                    HeaderImageUrl="~/images/icon_edit.gif" HeaderText="&#3648;&#3619;&#3637;&#3618;&#3585;&#3604;&#3641;"
                                    NavigateUrl="~/admin_promiss.aspx" Text="Link">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:HyperLinkField>
                            </Columns>
                            <SelectedRowStyle CssClass="GridSelected" />
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" />
                            <AlternatingRowStyle CssClass="GridItemOdd" />
                        </asp:GridView>
                    </td>
                    <td style="width: 200px; height: 126px;" valign="top">
                        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                            BorderStyle="Dotted" CssClass="Grid" DataKeyNames="GEN_TYPE" DataSourceID="SqlDataSource2"
                            EmptyDataText="No records found" Width="99%" HorizontalAlign="Justify">
                            <RowStyle CssClass="shade" />
                            <EmptyDataRowStyle BorderStyle="None" BorderWidth="0px" Font-Bold="True" HorizontalAlign="Center"
                                VerticalAlign="Middle" />
                            <Columns>
                                <asp:BoundField DataField="GEN_TYPE" HeaderText="&#3611;&#3619;&#3632;&#3648;&#3606;&#3607;&#3650;&#3619;&#3591;&#3652;&#3615;&#3615;&#3657;&#3634;"
                                    ReadOnly="True" SortExpression="GEN_TYPE" />
                                <asp:BoundField DataField="Count" HeaderText="&#3592;&#3635;&#3609;&#3623;&#3609;(&#3610;&#3619;&#3636;&#3625;&#3633;&#3607;)"
                                    ReadOnly="True" SortExpression="Count">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:HyperLinkField DataNavigateUrlFields="GEN_TYPE" DataNavigateUrlFormatString="Report_By_Status.aspx?GEN={0}"
                                    HeaderImageUrl="~/images/icon_edit.gif" HeaderText="&#3648;&#3619;&#3637;&#3618;&#3585;&#3604;&#3641;"
                                    NavigateUrl="~/admin_promiss.aspx" Text="Link" />
                            </Columns>
                            <SelectedRowStyle CssClass="GridSelected" />
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" />
                            <AlternatingRowStyle CssClass="GridItemOdd" />
                        </asp:GridView>
                    </td>
                    <td style="width: 200px; height: 126px;" valign="top">
                        <asp:GridView ID="GridView2" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                            BorderStyle="Dotted" CssClass="Grid" DataKeyNames="OIL_TYPE" DataSourceID="SqlDataSource3"
                            EmptyDataText="No records found" Width="99%">
                            <RowStyle CssClass="shade" />
                            <EmptyDataRowStyle BorderStyle="None" BorderWidth="0px" Font-Bold="True" HorizontalAlign="Center"
                                VerticalAlign="Middle" />
                            <Columns>
                                <asp:BoundField DataField="OIL_TYPE" HeaderText="&#3611;&#3619;&#3632;&#3648;&#3616;&#3607;&#3648;&#3594;&#3639;&#3656;&#3629;&#3648;&#3614;&#3621;&#3636;&#3591;"
                                    ReadOnly="True" SortExpression="OIL_TYPE" />
                                <asp:BoundField DataField="Count" HeaderText="&#3592;&#3635;&#3609;&#3623;&#3609;(&#3610;&#3619;&#3636;&#3625;&#3633;&#3607;)"
                                    ReadOnly="True" SortExpression="Count">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:HyperLinkField DataNavigateUrlFields="OIL_TYPE" DataNavigateUrlFormatString="Report_By_Status.aspx?Oil={0}"
                                    HeaderImageUrl="~/images/icon_edit.gif" HeaderText="&#3648;&#3619;&#3637;&#3618;&#3585;&#3604;&#3641;"
                                    NavigateUrl="~/admin_promiss.aspx" Text="Link" />
                            </Columns>
                            <SelectedRowStyle CssClass="GridSelected" />
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" />
                            <AlternatingRowStyle CssClass="GridItemOdd" />
                        </asp:GridView>
                    </td>
                    <td style="width: 200px; height: 126px;" valign="top">
                        <asp:GridView ID="GridView3" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                            BorderStyle="Dotted" CssClass="Grid" DataKeyNames="ADDER_TYPE" DataSourceID="SqlDataSource4"
                            EmptyDataText="No records found" Width="99%">
                            <RowStyle CssClass="shade" />
                            <EmptyDataRowStyle BorderStyle="None" BorderWidth="0px" Font-Bold="True" HorizontalAlign="Center"
                                VerticalAlign="Middle" />
                            <Columns>
                                <asp:BoundField DataField="ADDER_TYPE" HeaderText="ADDER" ReadOnly="True" SortExpression="ADDER_TYPE" />
                                <asp:BoundField DataField="Count" HeaderText="&#3592;&#3635;&#3609;&#3623;&#3609;(&#3610;&#3619;&#3636;&#3625;&#3633;&#3607;)"
                                    ReadOnly="True" SortExpression="Count">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:HyperLinkField DataNavigateUrlFields="ADDER_TYPE" DataNavigateUrlFormatString="Report_By_Status.aspx?Adder={0}"
                                    HeaderImageUrl="~/images/icon_edit.gif" HeaderText="&#3648;&#3619;&#3637;&#3618;&#3585;&#3604;&#3641;"
                                    NavigateUrl="~/admin_promiss.aspx" Text="Link" />
                            </Columns>
                            <SelectedRowStyle CssClass="GridSelected" />
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" />
                            <AlternatingRowStyle CssClass="GridItemOdd" />
                        </asp:GridView>
                        &nbsp;
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <td style="width: 399px">
                        &#3626;&#3606;&#3634;&#3609;&#3637;&#3652;&#3615;&#3615;&#3657;&#3634;
                    </td>
                    <td>
                        &#3586;&#3609;&#3634;&#3604;&#3612;&#3641;&#3657;&#3612;&#3621;&#3636;&#3605;
                    </td>
                    <td>
                        &#3649;&#3619;&#3591;&#3604;&#3633;&#3609;&#3607;&#3637;&#3656;&#3648;&#3594;&#3639;&#3656;&#3629;&#3617;&#3650;&#3618;&#3591;
                    </td>
                </tr>
                <tr>
                    <td valign="top" class="style1">
                        <asp:GridView ID="GridView4" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                            BorderStyle="Dotted" CssClass="Grid" DataKeyNames="Sub_name" DataSourceID="SqlDataSource5"
                            EmptyDataText="No records found" Width="99%">
                            <RowStyle CssClass="shade" />
                            <EmptyDataRowStyle BorderStyle="None" BorderWidth="0px" Font-Bold="True" HorizontalAlign="Center"
                                VerticalAlign="Middle" />
                            <Columns>
                                <asp:BoundField DataField="Sub_name" HeaderText="&#3626;&#3606;&#3634;&#3609;&#3637;&#3652;&#3615;&#3615;&#3657;&#3634;"
                                    ReadOnly="True" SortExpression="Sub_name" />
                                <asp:BoundField DataField="Sum_Sale_Power" HeaderText="&#3611;&#3619;&#3636;&#3617;&#3634;&#3603;&#3585;&#3634;&#3619;&#3586;&#3634;&#3618;(MW)"
                                    ReadOnly="True" SortExpression="Sum_Sale_Power">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Sum_Power" HeaderText="&#3585;&#3635;&#3621;&#3633;&#3591;&#3585;&#3634;&#3619;&#3612;&#3621;&#3636;&#3588;(MW)"
                                    ReadOnly="True" SortExpression="Sum_Power">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Count_BU" HeaderText="&#3592;&#3635;&#3609;&#3623;&#3609;(&#3610;&#3619;&#3636;&#3625;&#3633;&#3607;)"
                                    ReadOnly="True" SortExpression="Count_BU">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:HyperLinkField DataNavigateUrlFields="Sub_name" DataNavigateUrlFormatString="Report_By_Status.aspx?Substation={0}"
                                    HeaderImageUrl="~/images/icon_edit.gif" HeaderText="&#3648;&#3619;&#3637;&#3618;&#3585;&#3604;&#3641;"
                                    NavigateUrl="~/admin_promiss.aspx" Text="Link" />
                            </Columns>
                            <SelectedRowStyle CssClass="GridSelected" />
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" />
                            <AlternatingRowStyle CssClass="GridItemOdd" />
                        </asp:GridView>
                    </td>
                    <td valign="top" class="style2">
                        <asp:GridView ID="GridView5" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                            BorderStyle="Dotted" CssClass="Grid" DataKeyNames="SIDE_TYPE" DataSourceID="SqlDataSource6"
                            EmptyDataText="No records found" Width="99%">
                            <RowStyle CssClass="shade" />
                            <EmptyDataRowStyle BorderStyle="None" BorderWidth="0px" Font-Bold="True" HorizontalAlign="Center"
                                VerticalAlign="Middle" />
                            <Columns>
                                <asp:BoundField DataField="SIDE_TYPE" HeaderText="&#3586;&#3609;&#3634;&#3604;&#3612;&#3641;&#3657;&#3612;&#3621;&#3636;&#3605;"
                                    ReadOnly="True" SortExpression="SIDE_TYPE" />
                                <asp:BoundField DataField="Count" HeaderText="&#3592;&#3635;&#3609;&#3623;&#3609;(&#3610;&#3619;&#3636;&#3625;&#3633;&#3607;)"
                                    ReadOnly="True" SortExpression="Count">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:HyperLinkField DataNavigateUrlFields="SIDE_TYPE" DataNavigateUrlFormatString="Report_By_Status.aspx?Gen_Side={0}"
                                    HeaderImageUrl="~/images/icon_edit.gif" HeaderText="&#3648;&#3619;&#3637;&#3618;&#3585;&#3604;&#3641;"
                                    NavigateUrl="~/admin_promiss.aspx" Text="Link" />
                            </Columns>
                            <SelectedRowStyle CssClass="GridSelected" />
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" />
                            <AlternatingRowStyle CssClass="GridItemOdd" />
                        </asp:GridView>
                        &nbsp;
                    </td>
                    <td valign="top" class="style2">
                        <asp:GridView ID="GridView6" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                            BorderStyle="Dotted" CssClass="Grid" DataKeyNames="Voltage" DataSourceID="SqlDataSource7"
                            EmptyDataText="No records found" Width="99%">
                            <RowStyle CssClass="shade" />
                            <EmptyDataRowStyle BorderStyle="None" BorderWidth="0px" Font-Bold="True" HorizontalAlign="Center"
                                VerticalAlign="Middle" />
                            <Columns>
                                <asp:BoundField DataField="Voltage" HeaderText="&#3649;&#3619;&#3591;&#3604;&#3633;&#3609;"
                                    ReadOnly="True" SortExpression="Voltage" />
                                <asp:BoundField DataField="Count" HeaderText="&#3592;&#3635;&#3609;&#3623;&#3609;(&#3610;&#3619;&#3636;&#3625;&#3633;&#3607;)"
                                    ReadOnly="True" SortExpression="Count">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:HyperLinkField DataNavigateUrlFields="Voltage" DataNavigateUrlFormatString="Report_By_Status.aspx?Voltage={0}"
                                    HeaderImageUrl="~/images/icon_edit.gif" HeaderText="&#3648;&#3619;&#3637;&#3618;&#3585;&#3604;&#3641;"
                                    NavigateUrl="~/admin_promiss.aspx" Text="Link" />
                            </Columns>
                            <SelectedRowStyle CssClass="GridSelected" />
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" />
                            <AlternatingRowStyle CssClass="GridItemOdd" />
                        </asp:GridView>
                    </td>
                    <%--<td style="width: 100px; height: 238px">
                        </td>--%>
                </tr>
            </table>
            <table>
                <tr>
                    <td>
                        &#3592;&#3635;&#3609;&#3623;&#3609;&#3610;&#3619;&#3636;&#3625;&#3633;&#3607;
                        <asp:GridView ID="GridView12" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                            BorderStyle="Dotted" CssClass="Grid" DataSourceID="SqlDataSource11" EmptyDataText="No records found"
                            Width="99%">
                            <RowStyle CssClass="shade" />
                            <Columns>
                                <asp:BoundField DataField="Name_BU" HeaderText="&#3619;&#3634;&#3618;&#3594;&#3639;&#3656;&#3629;&#3610;&#3619;&#3636;&#3625;&#3633;&#3607;"
                                    SortExpression="Name_BU">
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="count_Name" HeaderText="&#3592;&#3635;&#3609;&#3623;&#3609;&#3626;&#3606;&#3634;&#3609;&#3607;&#3637;&#3656;(&#3649;&#3627;&#3656;&#3591;)"
                                    ReadOnly="True" SortExpression="count_Name">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:HyperLinkField DataNavigateUrlFields="Name_BU" DataNavigateUrlFormatString="Report_By_Status.aspx?Name_BU={0}"
                                    HeaderImageUrl="~/images/icon_edit.gif" HeaderText="&#3648;&#3619;&#3637;&#3618;&#3585;&#3604;&#3641;"
                                    NavigateUrl="~/admin_promiss.aspx" Text="Link" />
                            </Columns>
                            <EmptyDataRowStyle BorderStyle="None" BorderWidth="0px" Font-Bold="True" HorizontalAlign="Center"
                                VerticalAlign="Middle" />
                        </asp:GridView>
                    </td>
                </tr>
            </table>
            <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:VSPP %>"
                SelectCommand="SELECT     COUNT(Business.Name_BU) AS Count, VSPP_Volt.Voltage&#13;&#10;FROM         counter.Business INNER JOIN&#13;&#10;                      counter.VSPP_Volt ON Business.Voltage = VSPP_Volt.Voltage&#13;&#10;GROUP BY VSPP_Volt.Voltage&#13;&#10;ORDER BY Count DESC">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:VSPP %>"
                SelectCommand="SELECT     Name_BU, COUNT_BIG(*) AS count_Name
FROM         counter.Business
GROUP BY Name_BU
ORDER BY count_Name DESC"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:VSPP %>"
                SelectCommand="SELECT COUNT(Business.Name_BU) AS Count, VSPP_SIDE.SIDE_TYPE FROM counter.Business INNER JOIN counter.VSPP_SIDE ON Business.Gen_Side = VSPP_SIDE.SIDE_TYPE GROUP BY VSPP_SIDE.SIDE_TYPE ORDER BY Count DESC">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:VSPP %>"
                SelectCommand="SELECT     COUNT(Business.Name_BU) AS Count, VSPP_OIL.OIL_TYPE&#13;&#10;FROM         counter.Business INNER JOIN&#13;&#10;                      counter.VSPP_OIL ON Business.Oil = VSPP_OIL.OIL_TYPE&#13;&#10;GROUP BY VSPP_OIL.OIL_TYPE order by count desc">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:VSPP %>"
                SelectCommand="SELECT     COUNT(Business.Name_BU) AS Count, VSPP_STATUS.Status_Type&#13;&#10;FROM         counter.Business INNER JOIN&#13;&#10;                      counter.VSPP_STATUS ON Business.Status = VSPP_STATUS.Status_Type&#13;&#10;GROUP BY VSPP_STATUS.Status_Type order by count desc">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:VSPP %>"
                SelectCommand="SELECT COUNT(Business.Name_BU) AS Count, VSPP_GEN.GEN_TYPE FROM counter.Business INNER JOIN counter.VSPP_GEN ON counter.Business.Gen = VSPP_GEN.GEN_TYPE GROUP BY VSPP_GEN.GEN_TYPE order by count desc">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:VSPP %>"
                SelectCommand="SELECT VSPP_SUB.Sub_name, SUM(Business.Power) AS Sum_Power, SUM(Business.Sale_Power) AS Sum_Sale_Power, COUNT(Business.Name_BU) AS Count_BU FROM counter.Business INNER JOIN counter.VSPP_SUB ON Business.Substation = VSPP_SUB.Sub_name GROUP BY VSPP_SUB.Sub_name ORDER BY VSPP_SUB.Sub_name">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:VSPP %>"
                SelectCommand="SELECT     COUNT(Business.Name_BU) AS Count, VSPP_ADDER_TYPE.ADDER_TYPE&#13;&#10;FROM         counter.Business INNER JOIN&#13;&#10;                      counter.VSPP_ADDER_TYPE ON Business.Adder = VSPP_ADDER_TYPE.ADDER_TYPE&#13;&#10;GROUP BY VSPP_ADDER_TYPE.ADDER_TYPE&#13;&#10;ORDER BY Count DESC">
            </asp:SqlDataSource>
            <poy:footer ID="footer1" runat="server" />
        </div>
        </form>
    </div>
</body>
</html>
