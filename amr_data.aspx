<%@ Page Language="VB" AutoEventWireup="false" CodeFile="amr_data.aspx.vb" Inherits="amr_data" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="poy" TagName="footer" Src="~/UC_footer.ascx" %>
<%@ Register TagPrefix="poy" TagName="header" Src="~/UC_header.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>AMR Data
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
                <li id="current"><a href="amr_data.aspx" onclick="return LI1_onclick()">AMR Load</a></li>
                 <li ><a href="load01.aspx">Load01 Data</a></li>
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
                    &#3619;&#3634;&#3618;&#3621;&#3632;&#3648;&#3629;&#3637;&#3618;&#3604; Load AMR<asp:GridView
                        ID="dbGrid_upload" runat="server" AutoGenerateColumns="False" BorderStyle="Dotted"
                        CssClass="Grid" DataKeyNames="meter_point,substation" DataSourceID="uploadSqlDataSource"
                        EmptyDataText="No records found" Width="99%">
                        <RowStyle CssClass="shade" />
                        <EmptyDataRowStyle BorderStyle="None" BorderWidth="0px" Font-Bold="True" HorizontalAlign="Center"
                            VerticalAlign="Middle" />
                        <Columns>
                            <asp:BoundField DataField="Date1" HeaderText="Date/Time AMR" SortExpression="Date1">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ADDC" HeaderText="ADDC" SortExpression="ADDC">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="region_eng" HeaderText="Region" SortExpression="region_eng">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                             <asp:BoundField DataField="name_amr" HeaderText="&#3610;&#3619;&#3636;&#3625;&#3633;&#3607;" ReadOnly="True" SortExpression="name_amr">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="substation" HeaderText="substation" ReadOnly="True" SortExpression="substation">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="meter_point" HeaderText="Meter Point" ReadOnly="True"
                                SortExpression="meter_point">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="MW" HeaderText="MW" ReadOnly="True" 
                                SortExpression="MW" DataFormatString="{0:F4}">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                             <asp:BoundField DataField="Date_insert1" HeaderText="Date/Time Gen" SortExpression="Date_insert1">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <%--<asp:BoundField DataField="MWq" HeaderText="MWq" SortExpression="MWq" />--%>
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
                </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="uploadSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:SA_SystemConnectionString %>" 
            
            SelectCommand="SELECT ADDC, region_eng, meter_point, substation, Date1, MW, name_amr, Date_insert1 FROM scada.View_amr_to_scada ORDER BY ADDC, region_eng, substation">
        </asp:SqlDataSource>
        </form>
</body>
</html>
