<%@ Page Language="VB" AutoEventWireup="false" CodeFile="User_profile.aspx.vb" Inherits="User_profile" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="poy" TagName="footer" Src="~/UC_footer.ascx" %>
<%@ Register TagPrefix="poy" TagName="header" Src="~/UC_header.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>แก้ไขสิทธิ์การเข้าถึง</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <link rel="stylesheet" href="images/CitrusIsland.css" type="text/css" />
    <link href="images/CitrusIsland.css" rel="stylesheet" type="text/css" />
      <link href="include/style.css" type="text/css" rel="stylesheet" />
    <script language="javascript" src="include/calendar.js"></script>
    
    <style type="text/css">
        .style1
        {
            width: 698px;
        }
        .loginForm
        {
            width: 305px;
        }
        .style2
        {
            width: 123px;
        }
    </style>
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
                <li><a href="Mylink.aspx">My Link</a></li>
                <li id="current" onclick="return LI1_onclick()"><a href="User_profile.aspx">Profile</a></li>
                <li><a href="vdo.aspx">E-Leanning</a> </li>
            </ul>
        </div>
        <form id="form1" method="post" runat="server">
            <table width="100%" border="0">
                <tr>
                    <td valign="middle" align="center" style="height: 406px">
                        <asp:Panel ID="Panel1" runat="server" Enabled="true" Width="329px" HorizontalAlign="Center"
                            CssClass="shade">
                            <table class="loginForm" cellspacing="0" cellpadding="4" border="0" style="width: 328px">
                                <tr>
                                    <td colspan="2" class="blackshade" align="center" style="height: 17px">
                                        <strong><font size="+1">
                                            <asp:Label ID="Label2" runat="server" CssClass="errormsg" ForeColor="#FF8000">Edit Profile</asp:Label></font></strong></td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="text-align: center" valign="middle">
                                        VSPP Reporting&nbsp;</td>
                                </tr>
                                 <tr>
                                    <td valign="top" align="right" class="style2" style="width: 288px">
                                        รหัสประจำตัว&nbsp; :<br />
                                        (ใช้เป็น USER NAME) :</td>
                                    <td align="left" style="width: 228px">
                                        &nbsp;<asp:Label ID="Label1" runat="server" Height="24px" Text="Label" Width="168px" ForeColor="Red"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td valign="top" align="right" class="style2" style="width: 288px">
                                        คำนำหน้า:&nbsp;</td>
                                    <td align="left" style="width: 228px">
                                        &nbsp;<asp:DropDownList ID="DropDownList1" runat="server" Width="128px">
                                            <asp:ListItem>นาย</asp:ListItem>
                                            <asp:ListItem>นาง</asp:ListItem>
                                            <asp:ListItem>นางสาว</asp:ListItem>
                                        </asp:DropDownList></td>
                                </tr>
                                <tr>
                                    <td valign="top" align="right" class="style2" style="width: 288px">
                                        ชื่อ:&nbsp;</td>
                                    <td align="left" style="width: 228px">
                                        &nbsp;<asp:TextBox ID="firstname" runat="server" Width="125px"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td valign="top" align="right" class="style2" style="width: 288px">
                                        นามสกุล</td>
                                    <td align="left" style="width: 228px">
                                        &nbsp;<asp:TextBox ID="lastname" runat="server" Width="125px"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td valign="top" align="right" class="style2" style="width: 288px">
                                        ตำแหน่ง</td>
                                    <td align="left" style="width: 228px">
                                        &nbsp;<asp:TextBox ID="position" runat="server" Width="125px"></asp:TextBox></td>
                                </tr>
                               
                                <tr>
                                    <td valign="top" align="right" class="style2" style="width: 288px">
                                        สังกัด.:&nbsp;</td>
                                    <td align="left" style="width: 228px">
                                        &nbsp;<asp:TextBox ID="TB_Office" runat="server" Width="125px"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td valign="top" align="right" class="style2" style="width: 288px">
                                        วันบรรจุ(dd/MM/yyyy):</td>
                                    <td align="left" style="width: 228px">
                                        &nbsp;<asp:TextBox ID="fldDATE_INSERT" runat="server" />
                                        <a href="javascript:var v=show_mycalendar('dd/MM/yyyy', false,false, 'document.form1.fldDATE_INSERT');" />
                                        <img src="images/cal.gif" width="16" height="16" border="0" alt='"Click Here to Pick up the date"' /></td>
                                </tr>
                                <tr>
                                    <td valign="top" align="right" class="style2" style="width: 288px">
                                        วันเกิด(dd/MM/yyyy):</td>
                                    <td align="left" style="width: 228px">
                                        &nbsp;<asp:TextBox ID="birth" runat="server" />
                                        <a href="javascript:var v=show_mycalendar('dd/MM/yyyy', false,false, 'document.form1.birth');" />
                                        <img src="images/cal.gif" width="16" height="16" border="0" alt='"Click Here to Pick up the date"' /></td>
                                </tr>
                                <tr id = trpass>
                                    <td valign="top" align="right" class="style2" style="width: 288px">
                                        &#3619;&#3627;&#3633;&#3626;&#3612;&#3656;&#3634;&#3609;&#3651;&#3627;&#3617;&#3656;
                                        :</td>
                                    <td align="left" style="width: 228px">
                                        &nbsp;<asp:TextBox ID="pass" runat="server" TextMode="Password" Width="125px"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td valign="top" align="right" class="style2" style="width: 288px">
                                        ยืนยันรหัสผ่าน:</td>
                                    <td align="left" style="width: 228px">
                                        &nbsp;<asp:TextBox ID="cpass" runat="server" TextMode="Password" Width="127px"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2" style="height: 28px">
                                        &nbsp;<asp:Button ID="cmdLogin" runat="server" CssClass="buttonM" Text="Update" CausesValidation="False">
                                        </asp:Button></td>
                                </tr>
                            </table>
                            <p>
                                <asp:Label ID="lblMessage" runat="server" CssClass="errormsg" ForeColor="Red"></asp:Label></p>
                        </asp:Panel>
                        &nbsp;
                    </td>
                </tr>
            </table>
            <br />
            <poy:footer ID="footer1" runat="server" />
        </form>
    </div>
</body>
</html>
