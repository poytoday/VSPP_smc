<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="poy" TagName="footer" Src="~/UC_footer.ascx" %>
<%@ Register TagPrefix="poy" TagName="header" Src="~/UC_header.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Login </title>
    <link href="include/style.css" type="text/css" rel="stylesheet" />
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <link rel="stylesheet" href="images/CitrusIsland.css" type="text/css" />

    <script language="JavaScript" src="include/calendar.js"></script>

    <script language="JavaScript">
  
    var bSelected=false;
    function ChSel()
    {
        var theForm = document.forms['frmList'];
        if (!theForm) theForm = document.frmList;
        bSelected = !bSelected; 
        var i;
        for (i=0;i<theForm.chDelete.length;++i) theForm.chDelete[i].checked=bSelected;
    } 
    
    function OnKeyDown()
    {
        e = window.event;
        if (e.keyCode == 13)
        {
            e.cancel = true;
            var theForm = document.forms['frmList'];
            if (!theForm) theForm = document.frmList;                
            theForm.btnSearch.click();              
        }
    }
    

    </script>

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
                <li id="current" onclick="return LI1_onclick()"><a href="Login.aspx">Login</a> </li>
                <li><a href="View_Data_Bu.aspx">VSPP</a></li>
                 <li><a href="Default.aspx">Data</a> </li>
                  <li><a href="amr_data.aspx">AMR Load</a></li>
                   <li ><a href="load01.aspx">Load01 Data</a></li>
                <%--li><a href="Add_pro.aspx">Cattalog</a></li>
                <li><a href="Report.aspx">Report</a></li>
                <li><a href="admin.aspx">Admin</a></li>
                <li><a href="Mylink.aspx">My Link</a></li>
                <li><a href="User_profile.aspx">Profile</a></li>
                <li><a href="vdo.aspx">E-Leanning</a> </li>--%>
            </ul>
        </div>
        <form id="frmList" runat="server">
            <div>
                <table height="100%" width="100%" border="0">
                    <tr>
                        <td valign="middle" align="center">
                            <asp:Panel ID="Panel1" runat="server" Enabled="true" Width="330" HorizontalAlign="Center"
                                CssClass="shade">
                                <table class="loginForm" cellspacing="0" cellpadding="4" width="330" border="0">
                                    <tr>
                                        <td colspan="2" class="blackshade" align="center" style="height: 27px">
                                            <strong><font size="+1"><span style="font-size: 13pt">&nbsp;<asp:Label ID="Label1"
                                                runat="server" CssClass="errormsg" ForeColor="#FF8000">&#3621;&#3591;&#3594;&#3639;&#3656;&#3629;&#3648;&#3586;&#3657;&#3634;&#3651;&#3594;&#3657;</asp:Label></span></font></strong></td>
                                    </tr>
                                    <%--<tr>
                                        <td colspan="3">
                                            <strong><span style="font-size: 13pt">Login &nbsp; </span></strong>
                                            <img src="images/users.gif" />&nbsp;</td>
                                    </tr>--%>
                                    <tr>
                                        <td valign="top" align="right" style="width: 83px">
                                            Username:&nbsp;
                                        </td>
                                        <td align="left" style="width: 178px">
                                            <asp:TextBox ID="txtUserName" TabIndex="1" runat="server" Width="150" CssClass="control"></asp:TextBox><br />
                                            <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ErrorMessage="Username can not be empty."
                                                ControlToValidate="txtUserName" Display="Dynamic" Width="208px"></asp:RequiredFieldValidator></td>
                                    </tr>
                                    <tr>
                                        <td valign="top" align="right" style="width: 83px">
                                            Password:&nbsp;</td>
                                        <td align="left" style="width: 178px">
                                            <asp:TextBox ID="txtPassword" TabIndex="2" runat="server" Width="150" CssClass="control"
                                                TextMode="Password"></asp:TextBox><br />
                                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="Password is required"
                                                ControlToValidate="txtPassword" Display="Dynamic"></asp:RequiredFieldValidator></td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2">
                                            <asp:CheckBox ID="chbSavePassword" runat="server" TextAlign="Left" CssClass="checkbox"
                                                Text="Remember Password" Width="232px"></asp:CheckBox></td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2" style="height: 20px">
                                            &nbsp;
                                            <asp:Button ID="cmdLogin" runat="server" CssClass="buttonM" OnClick="cmdLogin_Click"
                                                Text="Submit"></asp:Button>
                                         </td>
                                    </tr>
                                </table>
                                <p>
                                    &nbsp;<asp:Label ID="lblMessage" runat="server" CssClass="errormsg" ForeColor="Red"></asp:Label></p>
                                <p>
                                    &nbsp;<asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Session_login.aspx"
                                        Width="264px">&#3648;&#3586;&#3657;&#3634;&#3651;&#3594;&#3657;&#3591;&#3634;&#3609;&#3650;&#3604;&#3618;&#3652;&#3617;&#3656;&#3605;&#3657;&#3629;&#3591; Login</asp:HyperLink>&nbsp;
                                </p>
                                <p>
                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/regit.aspx" Width="104px">&#3621;&#3591;&#3607;&#3632;&#3648;&#3610;&#3637;&#3618;&#3609;&#3651;&#3627;&#3617;&#3656;</asp:HyperLink>
                       
                        </p>
                        <p>
                            &nbsp;<asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Forget_pass.aspx"
                                Width="264px">&#3621;&#3639;&#3617;&#3619;&#3627;&#3633;&#3626;&#3612;&#3656;&#3634;&#3609;</asp:HyperLink>&nbsp;
                        </p>
                        </asp:Panel>
                    </tr>
                </table>
            </div>
        </form>
        <div>
            <poy:footer ID="footer1" runat="server" />
        </div>
    </div>
</body>
</html>
