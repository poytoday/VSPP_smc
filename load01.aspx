<%@ Page Language="VB" AutoEventWireup="false" CodeFile="load01.aspx.vb" Inherits="load01" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="poy" TagName="footer" Src="~/UC_footer.ascx" %>
<%@ Register TagPrefix="poy" TagName="header" Src="~/UC_header.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Insert Profile
    </title>
    <link href="include/style.css" type="text/css" rel="stylesheet" />
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <link rel="stylesheet" href="images/CitrusIsland.css" type="text/css" />
    <link href="images/CitrusIsland.css" rel="stylesheet" type="text/css" />
    <script language="JavaScript">
        var bSelected = false;
        function ChSel() {
            var theForm = document.forms['form1'];
            if (!theForm) theForm = document.form1;
            bSelected = !bSelected;
            var i;
            for (i = 0; i < theForm.chDelete.length; ++i) theForm.chDelete[i].checked = bSelected;
        }

        function OnKeyDown() {
            e = window.event;
            if (e.keyCode == 13) {
                e.cancel = true;
                var theForm = document.forms['form1'];
                if (!theForm) theForm = document.form1;
                theForm.btnSearch.click();
            }
        }
    
    </script>
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
                <li ><a href="amr_data.aspx" >AMR Load</a></li>
                <li id="current" onclick="return LI1_onclick()"><a href="load01.aspx">Load01 Data</a></li>

                <li>
                    <%--<a href="Report.aspx">Report</a>--%></li>
                <li>
                    <%--<a href="admin.aspx">Admin</a>--%></li>
                <%--   <li><a href="Mylink.aspx">My Link</a></li>--%>
            </ul>
        </div>
        <form id="form1" runat="server">
        <table width="99%">
            <tr>
                <td style="width: 726px" width="99%">
                    &#3619;&#3634;&#3618;&#3621;&#3632;&#3648;&#3629;&#3637;&#3618;&#3604; Load 01<br />
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BorderStyle="Dotted"
                        CssClass="Grid" DataSourceID="SqlDataSource1" EmptyDataText="No records found" OnRowCommand="dbGrid_upload_RowCommand" 
                       Width="99%" DataKeyNames="PATH_PIC">
                        <RowStyle CssClass="shade" />
                        <EmptyDataRowStyle BorderStyle="None" BorderWidth="0px" Font-Bold="True" HorizontalAlign="Center"
                            VerticalAlign="Middle" />
                        <Columns>
                            <%--<asp:TemplateField HeaderImageUrl="images\icon_delete.gif">
                                <ItemStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <input name="chDelete" type="checkbox" value='<%#DataBinder.Eval(Container,"RowIndex")%>' />
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                            <%--<asp:BoundField DataField="ADDC" HeaderText="ADDC" SortExpression="ADDC">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>--%>
                              <asp:BoundField DataField="region_eng" HeaderText="Region" SortExpression="region_eng">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                              <asp:BoundField DataField="name_amr" HeaderText="&#3610;&#3619;&#3636;&#3625;&#3633;&#3607;" SortExpression="name_amr" >
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                              <asp:BoundField DataField="season" HeaderText="season" SortExpression="season">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="PATH_PIC" HeaderText="File Name" SortExpression="PATH_PIC">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Detail" HeaderText="&#3619;&#3634;&#3618;&#3621;&#3632;&#3648;&#3629;&#3637;&#3618;&#3604;"
                                SortExpression="Detail" />
                            <asp:TemplateField HeaderText="View">
                                <ItemTemplate>
                                    <a href='<%#"getfile.aspx?filename=D:/vspp_profile/" + Server.UrlPathEncode(Convert.ToString(Eval("PATH_PIC"))) + "&table=[dbo].[upload]"%>'>
                                        <asp:Image ID="imgpath" runat="server" AlternateText='<%#Convert.ToString(Eval("PATH_PIC"))%>'
                                            ImageUrl="images/file.gif" Visible='<%# Not Convert.IsDBNull(Eval("PATH_PIC"))%>'>
                                        </asp:Image>
                                    </a>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:ButtonField CommandName="cmdEdit" HeaderImageUrl="images\icon_edit.gif" Text="Load">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:ButtonField>
                            <%--<asp:ButtonField CommandName="cmdDelete" HeaderImageUrl="~/images/icon_delete.gif"
                                Text="Delete">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:ButtonField>--%>
                        </Columns>
                        <SelectedRowStyle CssClass="GridSelected" />
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" />
                        <AlternatingRowStyle CssClass="GridItemOdd" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td style="width: 726px">
                    <%--<asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BorderStyle="Dotted"
                        CssClass="Grid" DataSourceID="SqlDataSource1" EmptyDataText="No records found"
                        OnRowCommand="dbGrid_upload_RowCommand" Width="100%" DataKeyNames="RUN_ID">
                        <RowStyle CssClass="shade" />
                        <EmptyDataRowStyle BorderStyle="None" BorderWidth="0px" Font-Bold="True" HorizontalAlign="Center"
                            VerticalAlign="Middle" />
                        <Columns>
                            <asp:BoundField DataField="Type" HeaderText="&#3611;&#3619;&#3632;&#3648;&#3616;&#3607;" SortExpression="Type">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Detail" HeaderText="&#3619;&#3634;&#3618;&#3621;&#3632;&#3648;&#3629;&#3637;&#3618;&#3604;&#3619;&#3641;&#3611;&#3616;&#3634;&#3614;&#3649;&#3621;&#3632;&#3648;&#3629;&#3585;&#3626;&#3634;&#3619;"
                                SortExpression="Detail" />
                            <asp:TemplateField HeaderText="View">
                                <ItemTemplate>
                                    <a href='<%#"getfile.aspx?filename=upload/"+Server.UrlPathEncode(Convert.ToString(Eval("PATH_PIC")))+"&table=[dbo].[upload]"%>'>
                                        <asp:Image ID="imgpath" runat="server" AlternateText='<%#Convert.ToString(Eval("PATH_PIC"))%>'
                                            ImageUrl="images/file.gif" Visible='<%# Not Convert.IsDBNull(Eval("PATH_PIC"))%>'>
                                        </asp:Image>
                                    </a>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <SelectedRowStyle CssClass="GridSelected" />
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" />
                        <AlternatingRowStyle CssClass="GridItemOdd" />
                    </asp:GridView>--%>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SA_SystemConnectionString %>"
            SelectCommand="SELECT region, season, Date1, substation, MW, file_name FROM scada.feeder_load01 WHERE (file_name = @file_name) ORDER BY substation, Date1">
            <SelectParameters>
                <asp:ControlParameter ControlID="Label_temp" Name="file_name" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:SA_SystemConnectionString %>"
            SelectCommand="SELECT scada.feeder_amr_profile.RUN_ID, scada.feeder_amr_profile.season, scada.feeder_amr_profile.substation, scada.feeder_amr_profile.PATH_PIC, scada.feeder_amr_profile.detail, scada.feeder_amr_name.name_amr, scada.feeder_amr_name.region_eng FROM scada.feeder_amr_profile INNER JOIN scada.feeder_amr_name ON scada.feeder_amr_profile.substation = scada.feeder_amr_name.substation WHERE (scada.feeder_amr_name.profile = 'LOAD01') ORDER BY scada.feeder_amr_name.profile, scada.feeder_amr_name.region_eng, scada.feeder_amr_profile.substation"
            DeleteCommand="DELETE FROM scada.feeder_load01 WHERE (file_name = @file_name)">
            <DeleteParameters>
                <asp:Parameter Name="file_name" />
            </DeleteParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="dbGrid_upload0" runat="server" AutoGenerateColumns="False" BorderStyle="Dotted"
            CssClass="Grid" DataSourceID="SqlDataSource2" EmptyDataText="No records found"
            Width="99%">
            <RowStyle CssClass="shade" />
            <Columns>
                <asp:BoundField DataField="region" HeaderText="region" ReadOnly="True" SortExpression="region" />
                <asp:BoundField DataField="season" HeaderText="season" ReadOnly="True" SortExpression="season" />
                <asp:BoundField DataField="Date1" HeaderText="Date/Time" ReadOnly="True" SortExpression="Date1" />
                <asp:BoundField DataField="substation" HeaderText="Substation" ReadOnly="True" SortExpression="substation">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="MW" HeaderText="MW" SortExpression="MW">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="file_name" HeaderText="file_name" SortExpression="file_name" />
            </Columns>
            <EmptyDataRowStyle BorderStyle="None" BorderWidth="0px" Font-Bold="True" HorizontalAlign="Center"
                VerticalAlign="Middle" />
            <SelectedRowStyle CssClass="GridSelected" />
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" />
            <AlternatingRowStyle CssClass="GridItemOdd" />
        </asp:GridView>
        <asp:Label ID="Label_temp" runat="server" Text="Label" Visible="False" Width="216px"></asp:Label>
                </td>
            </tr>
        </table>
        </form>
</body>
</html>
