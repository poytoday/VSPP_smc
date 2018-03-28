<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="poy" TagName="footer" Src="~/UC_footer.ascx" %>
<%@ Register TagPrefix="poy" TagName="header" Src="~/UC_header.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>VSPP Insert</title>
    <link href="include/style.css" type="text/css" rel="stylesheet" />
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <link rel="stylesheet" href="images/CitrusIsland.css" type="text/css" />
    <script language="JavaScript" src="include/calendar.js"></script>
    <style type="text/css">
        .auto-style1 {
            height: 45px;
            width: 1602px;
        }
        .auto-style2 {
            width: 1602px;
        }
    </style>
</head>
<body>
    <div id="wrap">
        <poy:header ID="footer2" runat="server" />
        <div id="menu">
            <ul>
                <li><a href="Login.aspx">Login</a></li>
                <li><a href="View_Data_Bu.aspx">VSPP</a> </li>
                <li id="current" onclick="return LI1_onclick()"><a href="Default.aspx">DATA</a></li>
                 <li><a href="amr_data.aspx">AMR Load</a></li>
                     <li ><a href="load01.aspx">Load01 Data</a></li>
                         <%-- <li><a href="Report.aspx">Report</a></li>
                <li><a href="admin.aspx">Admin</a></li>
                <li><a href="Mylink.aspx">My Link</a></li>--%>            <%--    <li><a href="User_profile.aspx">Profile</a></li>--%>                    <%--<li><a href="vdo.aspx">E-Leanning</a> </li>--%>
            </ul>
        </div>
        <form id="form1" runat="server">
        <asp:Panel ID="pnlForm" runat="server" Visible="true" Width="99%">
            <table width="99%" cssclass="Grid">
                <tr>
                    <td align="right" class="auto-style1">
                        &#3594;&#3639;&#3656;&#3629;&#3610;&#3619;&#3636;&#3625;&#3633;&#3607;/&#3610;&#3640;&#3588;&#3588;&#3621;
                        :
                    </td>
                    <td style="width: 411px; height: 45px;">
                        <asp:TextBox ID="txt_name" runat="server" Width="238px"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ControlToValidate="txt_name"
                            Display="Dynamic" ErrorMessage="&#3652;&#3617;&#3656;&#3617;&#3637;&#3586;&#3657;&#3629;&#3617;&#3641;&#3621; &#3594;&#3639;&#3656;&#3629;&#3610;&#3619;&#3636;&#3625;&#3633;&#3607;/&#3610;&#3640;&#3588;&#3588;&#3621;."
                            ValidationGroup="A" Width="136px"></asp:RequiredFieldValidator>
                    </td>
                    <td style="width: 853px; height: 45px;" align="right">
                        &#3626;&#3606;&#3634;&#3609;&#3607;&#3637;&#3656;&#3656;&#3605;&#3633;&#3657;&#3591;&#3650;&#3619;&#3591;&#3652;&#3615;&#3615;&#3657;&#3634;
                        :
                    </td>
                    <td style="width: 673px; height: 45px;">
                        <asp:TextBox ID="txt_Location" runat="server" Width="275px"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_Location"
                            Display="Dynamic" ErrorMessage="&#3652;&#3617;&#3656;&#3617;&#3637;&#3586;&#3657;&#3629;&#3617;&#3641;&#3621; &#3626;&#3606;&#3634;&#3609;&#3607;&#3637;&#3656;&#3656;&#3605;&#3633;&#3657;&#3591;&#3650;&#3619;&#3591;&#3652;&#3615;&#3615;&#3657;&#3634;."
                            ValidationGroup="A" Width="168px"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right" class="auto-style1">
                        Substation :
                    </td>
                    <td style="width: 411px; height: 45px;">
                        <asp:TextBox ID="txt_sub" runat="server" Width="160px"></asp:TextBox>    <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ControlToValidate="txt_sub" Display="Dynamic" 
                            ErrorMessage="&#3652;&#3617;&#3656;&#3617;&#3637;&#3586;&#3657;&#3629;&#3617;&#3641;&#3621; Substation" ValidationGroup="A" Width="168px"></asp:RequiredFieldValidator>
                    </td>
                    <td style="width: 853px; height: 45px;" align="right">
                        Meter_point:
                    </td>
                    <td style="width: 673px; height: 45px;">
                        <asp:TextBox ID="txt_meter" runat="server" Width="160px"></asp:TextBox>    <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="txt_meter" Display="Dynamic" 
                            ErrorMessage="&#3652;&#3617;&#3656;&#3617;&#3637;&#3586;&#3657;&#3629;&#3617;&#3641;&#3621; Meter Point" ValidationGroup="A" Width="168px"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2" align="right">
                        Feeder :</td>
                    <td>
                        <asp:TextBox ID="txt_feeder" runat="server" Width="160px">-</asp:TextBox>

                        &nbsp;(Ex. AAA01)</td>
                    <td>

                    </td>
                    <td>

                        &nbsp;</td>
                    
                </tr>
                <tr>
                    <td align="right" class="auto-style1">
                        Region :
                    </td>
                    <td style="width: 411px; height: 57px;">
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatColumns="6" 
                            RepeatDirection="Horizontal" CellSpacing="20">
                            <asp:ListItem>N1</asp:ListItem>
                            <asp:ListItem>N2</asp:ListItem>
                            <asp:ListItem>N3</asp:ListItem>
                            <asp:ListItem>NE1</asp:ListItem>
                              <asp:ListItem>NE2</asp:ListItem>
                                <asp:ListItem>NE3</asp:ListItem>
                                 <asp:ListItem>C1</asp:ListItem>
                            <asp:ListItem>C2</asp:ListItem>
                            <asp:ListItem>C3</asp:ListItem>
                             <asp:ListItem>S1</asp:ListItem>
                            <asp:ListItem>S2</asp:ListItem>
                            <asp:ListItem>S3</asp:ListItem>
                            
                        </asp:RadioButtonList>
                    </td>
                    <td style="width: 853px; height: 57px;" align="right">
                        Profile&nbsp; :
                    </td>
                    <td style="width: 673px; height: 57px;">
                        <asp:RadioButtonList ID="RadioButtonList2" runat="server" RepeatColumns="10" 
                            CellSpacing="20" RepeatDirection="Horizontal">
                          <asp:ListItem>RCS&AMR</asp:ListItem>
                        <asp:ListItem>RCS</asp:ListItem>
                            <asp:ListItem>AMR</asp:ListItem>
                            <asp:ListItem>LOAD01</asp:ListItem>
                           
                        </asp:RadioButtonList>
                    </td>
                </tr>
         
            </table>
            <asp:LinkButton ID="LB_Insert_BU" runat="server" ValidationGroup="A" Width="112px">&#3648;&#3614;&#3636;&#3656;&#3617;&#3627;&#3609;&#3656;&#3623;&#3618;&#3591;&#3634;&#3609;</asp:LinkButton>
            <%--<table>
                <tr>
                    <td style="width: 204px; height: 40px;" align="right">
                        &#3627;&#3617;&#3634;&#3618;&#3648;&#3627;&#3605;&#3640; :
                    </td>
                    <td style="width: 505px; height: 40px;">
                        <asp:TextBox ID="txt_Note" runat="server" Height="104px" TextMode="MultiLine" Width="416px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 204px; height: 57px;" align="right">
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource7"
                            DataTextField="MAX_ID" DataValueField="MAX_ID" Visible="False">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:VSPP %>"
                            SelectCommand="SELECT MAX(ID_BU) AS MAX_ID FROM counter.Business"></asp:SqlDataSource>
                        <asp:LinkButton ID="LB_Insert_BU" runat="server" ValidationGroup="A" Width="112px">&#3648;&#3614;&#3636;&#3656;&#3617;&#3627;&#3609;&#3656;&#3623;&#3618;&#3591;&#3634;&#3609;</asp:LinkButton>&nbsp;
                    </td>
                </tr>
                <caption>
                    --%&gt;
                </caption>
            </table>--%>
            <poy:footer ID="footer1" runat="server" />
            <%--<input id="btnReset" type="reset" value="Reset" onclick="return btnReset_onclick()" />--%>
        </asp:Panel>
        </form>
        <div>
            &nbsp;</div>
    </div>
</body>
</html>
