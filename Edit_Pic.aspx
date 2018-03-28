<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Edit_Pic.aspx.vb" Inherits="Edit_Pic" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="poy" TagName="footer" Src="~/UC_footer.ascx" %>
<%@ Register TagPrefix="poy" TagName="header" Src="~/UC_header.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Load01 Profile
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
                <li id="current" onclick="return LI1_onclick()"><a href="Default.aspx">Data</a>
                </li>
                <li><a href="View_Data_Bu.aspx">VSPP</a></li>
                <li><a href="amr_data.aspx">AMR Load</a></li>
                <li><a href="load01.aspx">Load01 Data</a></li>
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
                    &#3619;&#3634;&#3618;&#3621;&#3632;&#3648;&#3629;&#3637;&#3618;&#3604;&#3610;&#3619;&#3636;&#3625;&#3633;&#3607;
                    <asp:GridView ID="dbGrid_upload" runat="server" AutoGenerateColumns="False" BorderStyle="Dotted"
                        CssClass="Grid" DataKeyNames="Substation" DataSourceID="uploadSqlDataSource"
                        EmptyDataText="No records found" Width="99%">
                        <RowStyle CssClass="shade" />
                        <EmptyDataRowStyle BorderStyle="None" BorderWidth="0px" Font-Bold="True" HorizontalAlign="Center"
                            VerticalAlign="Middle" />
                        <Columns>
                            <asp:BoundField DataField="region_eng" HeaderText="Region" ReadOnly="True" SortExpression="region_eng">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="name_amr" HeaderText="&#3594;&#3639;&#3656;&#3629;&#3610;&#3619;&#3636;&#3625;&#3633;&#3607;/&#3610;&#3640;&#3588;&#3588;&#3621;"
                                ReadOnly="True" SortExpression="name_amr">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="location" HeaderText="&#3626;&#3606;&#3634;&#3609;&#3607;&#3637;&#3656;"
                                ReadOnly="True" SortExpression="location"></asp:BoundField>
                            <asp:BoundField DataField="Substation" HeaderText="Substation" ReadOnly="True" SortExpression="Substation">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="meter_point" HeaderText="Meter Point" ReadOnly="True"
                                SortExpression="meter_point">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="profile" HeaderText="Profile" ReadOnly="True" SortExpression="profile">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                        </Columns>
                        <SelectedRowStyle CssClass="GridSelected" />
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" />
                        <AlternatingRowStyle CssClass="GridItemOdd" />
                    </asp:GridView>
                    <br />
                    &#3619;&#3634;&#3618;&#3621;&#3632;&#3648;&#3629;&#3637;&#3618;&#3604;&#3586;&#3657;&#3629;&#3617;&#3641;&#3621;
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
            <tr>
                <td style="width: 726px" width="99%">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BorderStyle="Dotted"
                        CssClass="Grid" DataSourceID="SqlDataSource1" EmptyDataText="No records found"
                        OnRowCommand="dbGrid_upload_RowCommand" Width="99%" DataKeyNames="PATH_PIC">
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
                                    <a href='<%#"getfile.aspx?filename=D:\vspp_profile\" + Server.UrlPathEncode(Convert.ToString(Eval("PATH_PIC"))) + "&table=[dbo].[upload]"%>'>
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
                            <asp:ButtonField CommandName="cmdDelete" HeaderImageUrl="~/images/icon_delete.gif"
                                Text="Delete">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:ButtonField>
                        </Columns>
                        <SelectedRowStyle CssClass="GridSelected" />
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" />
                        <AlternatingRowStyle CssClass="GridItemOdd" />
                    </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" OnInserted="uploadSqlDataSource_Inserted"
            ConnectionString="<%$ ConnectionStrings:SA_SystemConnectionString %>"
            SelectCommand="SELECT scada.feeder_amr_profile.RUN_ID, scada.feeder_amr_profile.season, scada.feeder_amr_profile.PATH_PIC, scada.feeder_amr_profile.detail, scada.feeder_amr_name.meter_point, scada.feeder_amr_name.substation FROM scada.feeder_amr_profile INNER JOIN scada.feeder_amr_name ON scada.feeder_amr_profile.substation = scada.feeder_amr_name.substation WHERE (scada.feeder_amr_name.meter_point = @meter_point1) AND (scada.feeder_amr_name.profile = 'LOAD01') AND (scada.feeder_amr_name.substation = @substation1)"
            DeleteCommand="DELETE FROM scada.feeder_load01 WHERE (file_name = @file_name)">
            <DeleteParameters>
                <asp:Parameter Name="file_name" />
            </DeleteParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="meter_point1" QueryStringField="meter_point" />
                <asp:QueryStringParameter Name="substation1" QueryStringField="substation" />
            </SelectParameters>
        </asp:SqlDataSource>
                </td>
            </tr>
            <%--<tr>
                <td id="Td2" runat="server" class="style1" valign="middle">
                    <a href="#" onclick="ChSel()">Select/Unselect all</a>
                    <asp:LinkButton ID="btnDelete" runat="server" OnClick="btnDelete_Click">Delete selected</asp:LinkButton>&nbsp;
                    <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Width="504px"></asp:Label>
                </td>
            </tr>--%>
        </table>
        <asp:Panel ID="Panel1" runat="server" Width="99%" Visible="False">
            <table>
                <tr>
                    <td style="width: 145px">
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" Height="56px" RepeatDirection="Horizontal"
                            Width="67px" AutoPostBack="True">
                            <asp:ListItem>All Season</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td>
                        <asp:CheckBoxList ID="CheckBoxList1" runat="server" RepeatDirection="Horizontal"
                            Width="500px">
                            <asp:ListItem>Summer Mon-Fri</asp:ListItem>
                            <asp:ListItem>Summer Sat-Sun</asp:ListItem>
                            <asp:ListItem>Winter Mon-Fri</asp:ListItem>
                            <asp:ListItem>Winter Sat-Sun</asp:ListItem>
                        </asp:CheckBoxList>
                        <br />
                        <asp:FileUpload ID="FileUpload1" runat="server" onchange="var path=document.forms.form1.Uploadfldpath.value; var wpos=path.lastIndexOf('\\'); var upos=path.lastIndexOf('/'); var pos=wpos; if(upos>wpos) pos=upos; document.forms.form1.fldpath.value=path.substr(pos+1);"
                            size="50" /><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="FileUpload1"
                            Display="Dynamic" ErrorMessage="&#3652;&#3617;&#3656;&#3617;&#3637;&#3586;&#3657;&#3629;&#3617;&#3641;&#3621; "
                            ValidationGroup="A" Width="168px"></asp:RequiredFieldValidator>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td style="height: 23px; width: 145px;">
                        &#3619;&#3634;&#3618;&#3621;&#3632;&#3648;&#3629;&#3637;&#3618;&#3604;
                    </td>
                    <td style="height: 23px">
                        <asp:TextBox ID="fldpath" runat="server" Text='<%# Bind("path") %>' Width="320px"></asp:TextBox>&nbsp;
                    </td>
                </tr>
                <%--<tr>
                    <td style="width: 145px">
                        <asp:Label ID="Label1" runat="server" Text="&#3588;&#3635;&#3629;&#3608;&#3636;&#3610;&#3634;&#3618;&#3619;&#3641;&#3611;&#3616;&#3634;&#3614;"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" Width="320px"></asp:TextBox>
                    </td>
                </tr>--%>
                <caption>
                    &nbsp; &#3648;&#3614;&#3636;&#3656;&#3617;&#3619;&#3641;&#3611;&#3616;&#3634;&#3614;/&#3648;&#3629;&#3585;&#3626;&#3634;&#3619;&#3611;&#3619;&#3632;&#3585;&#3629;&#3610;
                    :
                    <tr>
                        <td style="width: 145px">
                            <asp:Button ID="Button1" runat="server" Text="Add File" ValidationGroup="A" />
                        </td>
                        <td>
                            <asp:Label ID="Label1" runat="server" ForeColor="#FF3300"></asp:Label>
                        
                        </td>
                    </tr>
                </caption>
            </table>
        </asp:Panel>
        <%--<asp:ButtonField CommandName="cmdEdit" HeaderImageUrl="images\icon_edit.gif" Text="Edit" />--%>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SA_SystemConnectionString %>"
            SelectCommand="SELECT region, season, Date1, substation, MW, file_name FROM scada.feeder_load01 WHERE (file_name = @file_name) ORDER BY substation, Date1">
            <SelectParameters>
                <asp:ControlParameter ControlID="Label_temp" Name="file_name" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="uploadSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:SA_SystemConnectionString %>" SelectCommand="SELECT region_eng, meter_point, substation, name_amr, location, profile FROM scada.feeder_amr_name WHERE (substation = @Substation1) AND (meter_point = @meter_point1)">
            <SelectParameters>
                <asp:QueryStringParameter Name="Substation1" QueryStringField="Sunstation"
                    DefaultValue="" />
<asp:QueryStringParameter QueryStringField="meter_point" DefaultValue="" Name="meter_point1"></asp:QueryStringParameter>
            </SelectParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="meter_point" QueryStringField="meter_point" Type="string"
                    DefaultValue="0" />
            </SelectParameters>
        </asp:SqlDataSource>
        &#3619;&#3634;&#3618;&#3621;&#3632;&#3648;&#3629;&#3637;&#3618;&#3604; Load01
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
        </form>
        <asp:Label ID="Label_temp" runat="server" Text="Label" Visible="False" Width="216px"></asp:Label></div>
    <%--<asp:Panel ID="Panel2" runat="server" Visible="False" Width="89%">
            <table>
                <tr>
                    <td style="width: 121px">
                        &#3649;&#3585;&#3657;&#3652;&#3586;&#3619;&#3641;&#3611;&#3616;&#3634;&#3614;&#3611;&#3619;&#3632;&#3585;&#3629;&#3610; :
                    </td>
                    <td>
                        <asp:FileUpload ID="FileUpload1" runat="server" onchange="var path=document.forms.form1.Uploadfldpath.value; var wpos=path.lastIndexOf('\\'); var upos=path.lastIndexOf('/'); var pos=wpos; if(upos>wpos) pos=upos; document.forms.form1.fldpath.value=path.substr(pos+1);"
                            size="50" /><br />
                    </td>
                </tr>
                <tr>
                    <td style="height: 23px; width: 121px;">
                        <asp:Label ID="Label2" runat="server" class="visible">Store as</asp:Label>
                    </td>
                    <td style="height: 23px">
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("path") %>' Width="320px"></asp:TextBox>&nbsp;
                    </td>
                </tr>
                <tr>
                    <td style="width: 121px">
                        <asp:Label ID="Label3" runat="server" Text="&#3588;&#3635;&#3629;&#3608;&#3636;&#3610;&#3634;&#3618;&#3619;&#3641;&#3611;&#3616;&#3634;&#3614;"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server" Width="320px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 121px">
                        <asp:Button ID="Button2" runat="server" Text="&#3649;&#3585;&#3657;&#3652;&#3586;&#3619;&#3641;&#3611;&#3616;&#3634;&#3614;"
                            Width="104px" />
                    </td>
                </tr>
            </table>
        </asp:Panel>--%>
</body>
</html>
