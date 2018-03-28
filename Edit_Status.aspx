<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Edit_Status.aspx.vb" Inherits="Edit_Status" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="poy" TagName="footer" Src="~/UC_footer.ascx" %>
<%@ Register TagPrefix="poy" TagName="header" Src="~/UC_header.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>&#3648;&#3614;&#3636;&#3656;&#3617;&#3586;&#3657;&#3629;&#3617;&#3641;&#3621;&#3626;&#3606;&#3634;&#3609;&#3632;&#3586;&#3629;&#3591;&#3610;&#3619;&#3636;&#3625;&#3633;&#3607;&#3631;</title>
    <link href="include/style.css" type="text/css" rel="stylesheet" />
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <link rel="stylesheet" href="images/CitrusIsland.css" type="text/css" />
    <script language="JavaScript" src="include/calendar.js"></script>
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
                <li id="current" onclick="return LI1_onclick()"><a href="View_Data_Bu.aspx">Data</a>
                </li>
                <li><a href="Default.aspx">VSPP</a></li>
                <li><a href="Add_pro.aspx">Cattalog</a></li>
                <li><a href="Report.aspx">Report</a></li>
                <li><a href="admin.aspx">Admin</a></li>
                <li><a href="Mylink.aspx">My Link</a></li>
                <li><a href="User_profile.aspx">Profile</a></li>
                <li><a href="vdo.aspx">E-Leanning</a> </li>
            </ul>
        </div>
        <form id="form1" runat="server">
        &#3619;&#3634;&#3618;&#3621;&#3632;&#3648;&#3629;&#3637;&#3618;&#3604;&#3610;&#3619;&#3636;&#3625;&#3633;&#3607;
        <asp:Label ID="lblMessage" runat="server" Width="608px"></asp:Label>
        <asp:GridView ID="dbGrid_upload" runat="server" AutoGenerateColumns="False" BorderStyle="Dotted"
            CssClass="Grid" DataKeyNames="ID_BU" DataSourceID="uploadSqlDataSource" EmptyDataText="No records found"
            Width="100%">
            <RowStyle CssClass="shade" />
            <EmptyDataRowStyle BorderStyle="None" BorderWidth="0px" Font-Bold="True" HorizontalAlign="Center"
                VerticalAlign="Middle" />
            <Columns>
                <asp:BoundField DataField="Name_BU" HeaderText=" &#3594;&#3639;&#3656;&#3629;&#3610;&#3619;&#3636;&#3625;&#3633;&#3607;/&#3610;&#3640;&#3588;&#3588;&#3621;" ReadOnly="True"
                    SortExpression="Name_BU">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Gen" HeaderText="&#3611;&#3619;&#3632;&#3648;&#3616;&#3607;&#3650;&#3619;&#3591;&#3652;&#3615;&#3615;&#3657;&#3634;" ReadOnly="True" SortExpression="Gen">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Oil" HeaderText="&#3611;&#3619;&#3632;&#3648;&#3616;&#3607;&#3648;&#3594;&#3639;&#3657;&#3629;&#3648;&#3614;&#3621;&#3636;&#3591;" ReadOnly="True" SortExpression="Oil">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Adder" HeaderText="Adder" ReadOnly="True" SortExpression="Adder">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Sale_Power" HeaderText="&#3611;&#3619;&#3636;&#3617;&#3634;&#3603;&#3585;&#3634;&#3619;&#3586;&#3634;&#3618; (MW)" ReadOnly="True"
                    SortExpression="Sale_Power">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Power" HeaderText="&#3585;&#3635;&#3621;&#3633;&#3591;&#3585;&#3634;&#3619;&#3612;&#3621;&#3636;&#3605;(MW)" ReadOnly="True" SortExpression="Power">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Substation" HeaderText="&#3626;&#3606;&#3634;&#3609;&#3637;&#3652;&#3615;&#3615;&#3657;&#3634;" ReadOnly="True" SortExpression="Substation">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Feeder" HeaderText="&#3623;&#3591;&#3592;&#3619;&#3652;&#3615;&#3615;&#3657;&#3634;" ReadOnly="True" SortExpression="Feeder">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Date_Sale" DataFormatString="{0:dd/MMM/yyyy}" HeaderText="&#3623;&#3633;&#3609;&#3607;&#3637;&#3656;&#3648;&#3619;&#3636;&#3656;&#3617;&#3605;&#3657;&#3609;&#3595;&#3639;&#3657;&#3629;&#3586;&#3634;&#3618;&#3652;&#3615;&#3615;&#3657;&#3634;"
                    ReadOnly="True" SortExpression="Date_Sale">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
            </Columns>
            <SelectedRowStyle CssClass="GridSelected" />
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" />
            <AlternatingRowStyle CssClass="GridItemOdd" />
        </asp:GridView>
        <br />
        &#3619;&#3634;&#3618;&#3621;&#3632;&#3648;&#3629;&#3637;&#3618;&#3604;&#3626;&#3606;&#3634;&#3609;&#3632;&nbsp;
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:VSPP %>"
            DeleteCommand="DELETE FROM counter.[VSPP_STATUS_List] WHERE [ID_Status_list] = @ID_Status_list"
            InsertCommand="INSERT INTO counter.[VSPP_STATUS_List] ([ID_BU], [Status], [Date], [User_name], [Date_Update], [Note]) VALUES (@ID_BU, @Status, @Date, @User_name, @Date_Update, @Note)"
            SelectCommand="SELECT * FROM counter.[VSPP_STATUS_List] WHERE ([ID_BU] = @ID_BU)" UpdateCommand="UPDATE counter.[VSPP_STATUS_List] SET [ID_BU] = @ID_BU, [Status] = @Status, [Date] = @Date, [User_name] = @User_name, [Date_Update] = @Date_Update, [Note] = @Note WHERE [ID_Status_list] = @ID_Status_list">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="-1" Name="ID_BU" QueryStringField="ID_BU"
                    Type="Int32" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="ID_Status_list" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="ID_BU" Type="Int32" />
                <asp:Parameter Name="Status" Type="String" />
                <asp:Parameter DbType="Date" Name="Date" />
                <asp:Parameter Name="User_name" Type="String" />
                <asp:Parameter DbType="Date" Name="Date_Update" />
                <asp:Parameter Name="Note" Type="String" />
                <asp:Parameter Name="ID_Status_list" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="ID_BU" Type="Int32" />
                <asp:Parameter Name="Status" Type="String" />
                <asp:Parameter DbType="Date" Name="Date" />
                <asp:Parameter Name="User_name" Type="String" />
                <asp:Parameter DbType="Date" Name="Date_Update" />
                <asp:Parameter Name="Note" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BorderStyle="Dotted"
            CssClass="Grid" DataSourceID="SqlDataSource1" EmptyDataText="No records found"
            Width="100%">
            <RowStyle CssClass="shade" />
            <EmptyDataRowStyle BorderStyle="None" BorderWidth="0px" Font-Bold="True" HorizontalAlign="Center"
                VerticalAlign="Middle" />
            <SelectedRowStyle CssClass="GridSelected" />
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" />
            <AlternatingRowStyle CssClass="GridItemOdd" />
            <Columns>
                <asp:BoundField DataField="Status" HeaderText="&#3626;&#3606;&#3634;&#3609;&#3632;" ReadOnly="True" SortExpression="Status">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Date" HeaderText="&#3623;&#3633;&#3609;&#3607;&#3637;&#3656;&#3648;&#3611;&#3621;&#3637;&#3656;&#3618;&#3609;&#3626;&#3606;&#3634;&#3609;&#3632;" ReadOnly="True"
                    SortExpression="Date" DataFormatString="{0:dd/MMM/yyyy}">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Note" HeaderText="&#3627;&#3617;&#3634;&#3618;&#3648;&#3627;&#3605;&#3640;" ReadOnly="True" SortExpression="Note">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <%--<asp:BoundField DataField="User_name" HeaderText="&#3612;&#3641;&#3657;&#3648;&#3614;&#3636;&#3656;&#3617;&#3626;&#3606;&#3634;&#3609;&#3632;" ReadOnly="True"
                        SortExpression="User_name">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>--%>
                <%--<asp:BoundField DataField="Date_Update" DataFormatString="{0:dd/MMM/yyyy}" HeaderText="&#3623;&#3633;&#3609;&#3607;&#3637;&#3656;&#3649;&#3585;&#3657;&#3652;&#3586;"
                        ReadOnly="True" SortExpression="Date_Update">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>--%>
            </Columns>
        </asp:GridView>
        <asp:Panel ID="Panel1" runat="server" Width="99%" Visible="False">
            &nbsp;<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BorderStyle="Dotted"
                CssClass="Grid" DataSourceID="SqlDataSource2" EmptyDataText="No records found"
                Width="100%" DataKeyNames="ID_Status_list">
                <RowStyle CssClass="shade" />
                <EmptyDataRowStyle BorderStyle="None" BorderWidth="0px" Font-Bold="True" HorizontalAlign="Center"
                    VerticalAlign="Middle" />
                <SelectedRowStyle CssClass="GridSelected" />
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" />
                <AlternatingRowStyle CssClass="GridItemOdd" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" />
                    <asp:BoundField DataField="Status" HeaderText="&#3626;&#3606;&#3634;&#3609;&#3632;"
                        SortExpression="Status">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Date" HeaderText="&#3623;&#3633;&#3609;&#3607;&#3637;&#3656;&#3648;&#3611;&#3621;&#3637;&#3656;&#3618;&#3609;&#3626;&#3606;&#3634;&#3609;&#3632;"
                        SortExpression="Date" DataFormatString="{0:dd/MMM/yyyy}">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Note" HeaderText="&#3627;&#3617;&#3634;&#3618;&#3648;&#3627;&#3605;&#3640;"
                        SortExpression="Note">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
            <table style="width: 832px">
                <tr>
                    <td style="width: 78px">
                        &#3626;&#3606;&#3634;&#3609;&#3632; :
                    </td>
                    <td style="width: 514px">
                        <asp:DropDownList ID="DD_status" runat="server" DataSourceID="SqlDataSource6" DataTextField="Status_Type"
                            DataValueField="Status_Type" Width="192px">
                        </asp:DropDownList>
                    </td>
                    <td style="width: 219px" align="right">
                        &#3623;&#3633;&#3609;&#3607;&#3637;&#3656; (dd/MM/YYYY):
                    </td>
                    <td style="width: 322px">
                        <asp:TextBox ID="fldDATE_INSERT" runat="server" Width="104px" />&nbsp; <a href="javascript:var v=show_mycalendar('dd/MM/YYYY', false,false, 'document.form1.fldDATE_INSERT');">
                            <img src="images/cal.gif" width="16" height="16" border="0" alt='"Click Here to Pick up the date"'>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="fldDATE_INSERT"
                                Display="Dynamic" ErrorMessage="&#3652;&#3617;&#3656;&#3617;&#3637;&#3586;&#3657;&#3629;&#3617;&#3641;&#3621; &#3623;&#3633;&#3609;&#3607;&#3637;&#3656;&#3629;&#3609;&#3640;&#3617;&#3633;&#3605;&#3636;&#3619;&#3633;&#3610;&#3595;&#3639;&#3657;&#3629;&#3652;&#3615;&#3615;&#3657;&#3634; ."
                                Height="16px" ValidationGroup="A" Width="160px"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right" style="width: 78px; height: 40px">
                        &#3627;&#3617;&#3634;&#3618;&#3648;&#3627;&#3605;&#3640; :
                    </td>
                    <td style="width: 514px; height: 40px">
                        <asp:TextBox ID="txt_Note" runat="server" Height="72px" TextMode="MultiLine" Width="352px"></asp:TextBox>
                    </td>
                    <td style="width: 78px">
                        <asp:LinkButton ID="LB_Insert_BU" runat="server" ValidationGroup="A" Width="50px">&#3648;&#3614;&#3636;&#3656;&#3617;&#3626;&#3606;&#3634;&#3609;&#3632;</asp:LinkButton>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <poy:footer ID="footer1" runat="server" />
        </form>
        <asp:SqlDataSource ID="uploadSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:VSPP %>"
            ProviderName="<%$ ConnectionStrings:VSPP.providerName %>" SelectCommand="SELECT * FROM counter.[Business] ">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:VSPP %>"
            SelectCommand="SELECT * FROM counter.[VSPP_STATUS_List]" DeleteCommand="DELETE FROM counter.[VSPP_STATUS_List] WHERE [ID_Status_list] = @ID_Status_list"
            InsertCommand="INSERT INTO counter.[VSPP_STATUS_List] ([ID_BU], [Status], [Date], [User_name], [Date_Update], [Note]) VALUES (@ID_BU, @Status, @Date, @User_name, @Date_Update, @Note)"
            UpdateCommand="UPDATE counter.[VSPP_STATUS_List] SET [ID_BU] = @ID_BU, [Status] = @Status, [Date] = @Date, [User_name] = @User_name, [Date_Update] = @Date_Update, [Note] = @Note WHERE [ID_Status_list] = @ID_Status_list">
            <DeleteParameters>
                <asp:Parameter Name="ID_Status_list" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="ID_BU" Type="Int32" />
                <asp:Parameter Name="Status" Type="String" />
                <asp:Parameter DbType="Date" Name="Date" />
                <asp:Parameter Name="User_name" Type="String" />
                <asp:Parameter DbType="Date" Name="Date_Update" />
                <asp:Parameter Name="Note" Type="String" />
                <asp:Parameter Name="ID_Status_list" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="ID_BU" Type="Int32" />
                <asp:Parameter Name="Status" Type="String" />
                <asp:Parameter DbType="Date" Name="Date" />
                <asp:Parameter Name="User_name" Type="String" />
                <asp:Parameter DbType="Date" Name="Date_Update" />
                <asp:Parameter Name="Note" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:VSPP %>"
            SelectCommand="SELECT Status_Type FROM counter.VSPP_STATUS ORDER BY ID_STATUS DESC">
        </asp:SqlDataSource>
    </div>
</body>
</html>
