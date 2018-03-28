<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Forget_pass.aspx.vb" Inherits="Forget_pass" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>ลงทะเบียนเข้าใช้งาน</title>
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
    <form id="form1" method="post" runat="server">
     
        <table width="100%" border="0">
            <tr>
                <td valign="middle" align="center" style="height: 456px">
                    <asp:Panel ID="Panel1" runat="server" Enabled="true" Width="329px" HorizontalAlign="Center"
                        CssClass="shade">
                        <table class="loginForm" cellspacing="0" cellpadding="4" border="0">
                            <tr>
                                <td colspan="2" class="blackshade" align="center">
                                    <strong><font size="+1">ลืมรหัสผ่าน</font></strong></td>
                            </tr>
                            <tr>
                                <td colspan="2" style="text-align: center" valign="middle">
                                    VSPP Reporting&nbsp;</td>
                            </tr>
                           
                            <tr>
                                <td valign="top" align="right" class="style2">
                                    รหัสประจำตัว<br /> (ใช้เป็น USER NAME) :</td>
                                <td align="left" style="width: 192px">
                                    &nbsp;<asp:TextBox ID="tb_pea_id" runat="server" Width="125px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tb_pea_id"
                                        ErrorMessage="RequiredFieldValidator" ValidationGroup="A1" Width="144px">ยังไม่ได้กรอกรหัสประจำตัว</asp:RequiredFieldValidator></td>
                            </tr>
                           
                          
                            <tr>
                                <td valign="top" align="right" class="style2">
                                    วันบรรจุ(dd/MM/yyyy):</td>
                                <td align="left" style="width: 192px">
                                    &nbsp;<asp:TextBox ID="fldDATE_INSERT" runat="server" />
                                    <a href="javascript:var v=show_mycalendar('dd/MM/yyyy', false,false, 'document.form1.fldDATE_INSERT');"/>
                                        <img src="images/cal.gif" width="16" height="16" border="0" alt='"Click Here to Pick up the date"'/></td>
                            </tr>
                            <tr>
                                <td valign="top" align="right" class="style2">
                                    วันเกิด(dd/MM/yyyy):</td>
                                <td align="left" style="width: 192px">
                                    &nbsp;<asp:TextBox ID="birth" runat="server" />
                                    <a href="javascript:var v=show_mycalendar('dd/MM/yyyy', false,false, 'document.form1.birth');"/>
                                        <img src="images/cal.gif" width="16" height="16" border="0" alt='"Click Here to Pick up the date"'/></td>
                            </tr>
                              <tr>
                                <td valign="top" align="right" class="style2">
                                    รหัสผ่าน :</td>
                                <td align="left" style="width: 192px">
                                    &nbsp;<asp:TextBox ID="pass" runat="server" TextMode="Password" Width="125px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td valign="top" align="right" class="style2">
                                    ยืนยันรหัสผ่าน:</td>
                                <td align="left" style="width: 192px">
                                    &nbsp;<asp:TextBox ID="cpass" runat="server" TextMode="Password" Width="127px"></asp:TextBox></td>
                            </tr>
                           
                            <tr>
                                <td align="center" colspan="2" style="height: 28px">
                                    &nbsp;
                                    <asp:Button ID="cmdLogin" runat="server" CssClass="buttonM" Text="เปลี่ยนรหัสผ่าน" CausesValidation="False" ValidationGroup="A1"></asp:Button>&nbsp;</td>
                            </tr>
                        </table>
                        <p>
                            <asp:Label ID="lblMessage" runat="server" CssClass="errormsg" ForeColor="Red"></asp:Label></p>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>