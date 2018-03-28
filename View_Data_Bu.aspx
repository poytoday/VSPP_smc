<%@ Page Language="VB" AutoEventWireup="false" CodeFile="View_Data_Bu.aspx.vb" Inherits="View_Data_Bu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="poy" TagName="footer" Src="~/UC_footer.ascx" %>
<%@ Register TagPrefix="poy" TagName="header" Src="~/UC_header.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>&#3619;&#3634;&#3618;&#3621;&#3632;&#3648;&#3629;&#3637;&#3618;&#3604;&#3610;&#3619;&#3636;&#3625;&#3633;&#3607;&#3607;&#3633;&#3657;&#3591;&#3627;&#3617;&#3604;
    </title>
    <link href="include/style.css" type="text/css" rel="stylesheet" />
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <link rel="stylesheet" href="images/CitrusIsland.css" type="text/css" />
    <link href="images/CitrusIsland.css" rel="stylesheet" type="text/css" />
    <script language="JavaScript" src="include/calendar.js">
        var bSelected = false;
        function ChSel() {
            var theForm = document.forms['frmList'];
            if (!theForm) theForm = document.frmList;
            bSelected = !bSelected;
            var i;
            for (i = 0; i < theForm.chDelete.length; ++i) theForm.chDelete[i].checked = bSelected;
        }

        function OnKeyDown() {
            e = window.event;
            if (e.keyCode == 13) {
                e.cancel = true;
                var theForm = document.forms['frmList'];
                if (!theForm) theForm = document.frmList;
                theForm.btnSearch.click();
            }
        }
    

    </script>
</head>
<body>
    <div id="wrap">
        <poy:header ID="footer2" runat="server" />
        <div id="menu">
            <ul>
                <li><a href="Login.aspx">Login</a></li>
                <li id="current" onclick="return LI1_onclick()"><a href="View_Data_Bu.aspx">VSPP</a>
                </li>
                <li><a href="Default.aspx">DATA</a></li>
                <li><a href="amr_data.aspx">AMR Load</a></li>
                 <li ><a href="load01.aspx">Load01 Data</a></li>
            
            </ul>
        </div>
        <form id="frmList" runat="server" defaultbutton='btnSearch' defaultfocus='txtSearchValue'>
        <panel id="pnlForm1" runat="server" visible="True">
            
                    <table id="Table1" cellspacing="1" cellpadding="5" border="0" bgcolor="black" style="width: 100%">
                        <tr>
                            <td id="tdSearch" runat="server" class="shade" valign="middle" width="800">
                                <b>
                                    <%--<asp:LinkButton ID="btnAdd" runat="server" OnClick="btnAdd_Click">Add new</asp:LinkButton>--%>
                                    &nbsp;&nbsp; Search for:&nbsp; </b>
                                <asp:DropDownList ID="ddlSearchField" runat="server">
                                    <asp:ListItem Value="Any Field">Any field</asp:ListItem>
                                    <asp:ListItem Value="name_amr">&#3594;&#3639;&#3656;&#3629;&#3610;&#3619;&#3636;&#3625;&#3633;&#3607;/&#3610;&#3640;&#3588;&#3588;&#3621;</asp:ListItem>
                                    <asp:ListItem Value="Substation">Substation</asp:ListItem>
                                    <asp:ListItem Value="location">Location</asp:ListItem>
                                    <asp:ListItem Value="profile">Profile</asp:ListItem>
                                    <asp:ListItem Value="meter_point">Meter Point</asp:ListItem>
                                </asp:DropDownList>
                                <asp:DropDownList ID="ddlSearchOperation" runat="server" Width="112px">
                                    <asp:ListItem Value="Contains">Contains</asp:ListItem>
                                    <asp:ListItem Value="Equals">Equals</asp:ListItem>
                                    <asp:ListItem Value="Starts with ...">Starts with ...</asp:ListItem>
                                   <%-- <asp:ListItem Value="More than ...">More than ...</asp:ListItem>
                                    <asp:ListItem Value="Less than ...">Less than ...</asp:ListItem>
                                    <asp:ListItem Value="Equal or more than ...">Equal or more than ...</asp:ListItem>
                                    <asp:ListItem Value="Equal or less than ...">Equal or less than ...</asp:ListItem>--%>
                                    <asp:ListItem Value="IsNull">Empty</asp:ListItem>
                                </asp:DropDownList>
                                <asp:TextBox ID="txtSearchValue" runat="server" Width="136px"></asp:TextBox>
                                <asp:Button ID="btnSearch" runat="server" CssClass="button" Text="Search" OnClick="btnSearch_Click">
                                </asp:Button>
                                <asp:Button ID="btnShowAll" runat="server" CssClass="button" Text="Show all" OnClick="btnShowAll_Click">
                                </asp:Button>&nbsp;&nbsp;&nbsp;
                            </td>
                            <td id="tdInfo" runat="server" class="shade" align="center" width="100" style="height: 30px">
                                <asp:Label ID="lblCount" runat="server" Height="16px">found:&nbsp;0</asp:Label>
                                <asp:Label ID="lblPage" runat="server">Page&nbsp;<%=IIF(dbGrid_upload.PageCount =0,0,dbGrid_upload.PageIndex + 1)
                  %>&nbsp;of&nbsp;<%=dbGrid_upload.PageCount%></asp:Label>
             
                            </td>
                            <td id="Td2" runat="server" class="shade" align="center" width="100" style="height: 30px">
                                Records Per Page:
                                <asp:DropDownList ID="ddlPagerCount" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlPagerCount_SelectedIndexChanged"
                                    Width="56px">
                                    <asp:ListItem Value="100">100</asp:ListItem>
                                    <asp:ListItem Value="20">20</asp:ListItem>
                                    <asp:ListItem Value="30">30</asp:ListItem>
                                    <asp:ListItem Value="50">50</asp:ListItem>
                                    <asp:ListItem Value="200">200</asp:ListItem>
                                    <asp:ListItem Value="500">500</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td id="Td3" runat="server" class="shade" valign="middle">
                               <%-- <a href="#" onclick="ChSel()">Select/Unselect all</a>
                                <asp:LinkButton ID="btnDelete" runat="server" OnClick="btnDelete_Click">Delete selected</asp:LinkButton>&nbsp;--%>
                                <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label></td>
                           
                        </tr>
                    </table>
                   </panel>
        &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
        &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
        &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
        &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
        <asp:GridView ID="dbGrid_upload" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" BorderStyle="Dotted" CssClass="Grid" DataKeyNames="meter_point,Substation"
            DataSourceID="uploadSqlDataSource" EmptyDataText="No records found" OnPageIndexChanged="dbGrid_upload_PageIndexChanged"
            OnRowCommand="dbGrid_upload_RowCommand" OnRowCreated="dbGrid_upload_RowCreated"
            OnRowDataBound="dbGrid_upload_RowDataBound" OnRowDeleted="dbGrid_upload_RowDeleted"
            OnSorted="dbGrid_upload_Sorted" Width="100%" PageSize="100">
            <SelectedRowStyle CssClass="GridSelected" />
            <AlternatingRowStyle CssClass="GridItemOdd" />
            <RowStyle CssClass="shade" />
            <EmptyDataRowStyle BorderStyle="None" BorderWidth="0px" Font-Bold="True" HorizontalAlign="Center"
                VerticalAlign="Middle" />
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" />
            <Columns>
                <%--<asp:TemplateField HeaderImageUrl="images\icon_delete.gif">
                                <ItemStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <input name="chDelete" type="checkbox" value='<%#DataBinder.Eval(Container,"RowIndex")%>' />
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                <%--<asp:ButtonField CommandName="cmdView" HeaderImageUrl="images\icon_view.gif" HeaderText="&#3648;&#3619;&#3637;&#3618;&#3585;&#3604;&#3641;&#3619;&#3634;&#3618;&#3621;&#3632;&#3648;&#3629;&#3637;&#3618;&#3604;&#3605;&#3634;&#3617;&#3610;&#3640;&#3588;&#3588;&#3621;"
                                Text="View" />--%>
                <%--  <asp:BoundField DataField="DOCUMENT_DETAIL" HeaderText="&#3626;&#3606;&#3634;&#3609;&#3607;&#3637;&#3656;&#3656;&#3605;&#3633;&#3657;&#3591;&#3650;&#3619;&#3591;&#3652;&#3615;&#3615;&#3657;&#3634; :" ReadOnly="True"
                                SortExpression="DOCUMENT_DETAIL" />--%>
                <%--<asp:BoundField DataField="DATE_CREATE" DataFormatString="{0:dd/MMM/yyyy}" HeaderText="&#3623;&#3633;&#3609;&#3607;&#3637;&#3656;&#3629;&#3609;&#3640;&#3617;&#3633;&#3605;&#3636;&#3619;&#3633;&#3610;&#3595;&#3639;&#3657;&#3629;&#3652;&#3615;&#3615;&#3657;&#3634;"
                                ReadOnly="True" SortExpression="DATE_CREATE">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>--%>
                <%--<asp:BoundField DataField="Date_Sale" DataFormatString="{0:dd/MMM/yyyy}" HeaderText="&#3623;&#3633;&#3609;&#3607;&#3637;&#3656;&#3648;&#3619;&#3636;&#3656;&#3617;&#3605;&#3657;&#3609;&#3595;&#3639;&#3657;&#3629;&#3586;&#3634;&#3618;&#3652;&#3615;&#3615;&#3657;&#3634;"
                                ReadOnly="True" SortExpression="Date_Sale">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>--%>
                <%--<asp:BoundField DataField="c1" HeaderText="&#3586;&#3609;&#3634;&#3604;&#3612;&#3641;&#3657;&#3612;&#3621;&#3636;&#3605;" ReadOnly="True" SortExpression="c1">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TEAM_OWER" HeaderText="&#3648;&#3621;&#3586;&#3607;&#3637;&#3656;&#3626;&#3633;&#3597;&#3597;&#3634;" ReadOnly="True" SortExpression="TEAM_OWER">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="DOCUMENT_TYPE" HeaderText="&#3648;&#3610;&#3629;&#3619;&#3660;&#3650;&#3607;&#3619;&#3612;&#3641;&#3657;&#3605;&#3636;&#3604;&#3605;&#3656;&#3629;" ReadOnly="True"
                                SortExpression="DOCUMENT_TYPE" />
                            <asp:BoundField DataField="DOCUMENT_DETAIL" HeaderText="&#3587;&#3639;&#3656;&#3629;&#3612;&#3641;&#3657;&#3611;&#3619;&#3632;&#3626;&#3634;&#3609;&#3591;&#3634;&#3609;" ReadOnly="True"
                                SortExpression="DOCUMENT_DETAIL" />
                            <asp:BoundField DataField="c1" HeaderText="&#3627;&#3617;&#3634;&#3618;&#3648;&#3627;&#3605;&#3640;" ReadOnly="True" SortExpression="c1">
                                <ItemStyle HorizontalAlign="Center" />--%>
                <asp:ButtonField CommandName="cmdEdit" HeaderImageUrl="images\icon_edit.gif" Text="Edit" />
                <asp:ButtonField CommandName="cmdView" HeaderImageUrl="images\icon_view.gif" Text="Profile" />
                <%--<asp:ButtonField CommandName="cmdStatus" HeaderImageUrl="images\icon_edit.gif" Text="Status" />--%>
                <asp:BoundField DataField="region_eng" HeaderText="Region" ReadOnly="True" SortExpression="region_eng">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="name_amr" HeaderText="&#3594;&#3639;&#3656;&#3629;&#3610;&#3619;&#3636;&#3625;&#3633;&#3607;/&#3610;&#3640;&#3588;&#3588;&#3621;"
                    ReadOnly="True" SortExpression="name_amr">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="location" HeaderText="&#3626;&#3606;&#3634;&#3609;&#3607;&#3637;&#3656;"
                    ReadOnly="True" SortExpression="location"></asp:BoundField>
                    <asp:BoundField DataField="feeder" HeaderText="Feeder"
                    ReadOnly="True" SortExpression="feeder"></asp:BoundField>
                <asp:BoundField DataField="Substation" HeaderText="Substation" ReadOnly="True" SortExpression="Substation">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="meter_point" HeaderText="Meter Point" ReadOnly="True"
                    SortExpression="meter_point" />
                <asp:BoundField DataField="profile" HeaderText="Profile" ReadOnly="True" SortExpression="profile">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>
        <poy:footer ID="footer1" runat="server" />
        </form>
    </div>
    <asp:SqlDataSource ID="uploadSqlDataSource" SelectCommand="SELECT region_eng, meter_point, substation, name_amr, location, profile, feeder FROM scada.feeder_amr_name ORDER BY region_eng, profile, substation"
        ConnectionString="<%$ ConnectionStrings:SA_SystemConnectionString %>"
        OnSelected="uploadSqlDataSource_Selected" runat="server"></asp:SqlDataSource>
</body>
</html>
