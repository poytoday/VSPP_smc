<%@ Page Language="VB" AutoEventWireup="false" CodeFile="vdo.aspx.vb" Inherits="vdo" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="poy" TagName="footer" Src="~/UC_footer.ascx" %>
<%@ Register TagPrefix="poy" TagName="header" Src="~/UC_header.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ลงฃื่อเข้าใช้งาน</title>
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
                <li ><a href="Login.aspx">Login</a> </li>
                <li><a href="View_Data_Bu.aspx">Data</a> </li>
                <li><a href="Default.aspx">VSPP</a></li>
                <li><a href="Add_pro.aspx">Cattalog</a></li>
                <li><a href="Report.aspx">Report</a></li>
                <li><a href="admin.aspx">Admin</a></li>
                <li><a href="Mylink.aspx">My Link</a></li>
                <li><a href="User_profile.aspx">Profile</a></li>
                <li id="current" onclick="return LI1_onclick()"><a href="vdo.aspx">E-Leanning</a> </li>
                
            </ul>
        </div>
    <form id="form1" runat="server">
        <div>
            <object classid="CLSID:6BF52A52-394A-11d3-B153-00C04F79FAA6" viewastext style="height: 300px;
                width: 400px">
                <param name="autoStart" value="False">
                <param name="URL" value="./upload/kik.3gp">
                <param name="enabled" value="True">
                <param name="balance" value="0">
                <param name="currentPosition" value="0">
                <param name="enableContextMenu" value="True">
                <param name="fullScreen" value="False">
                <param name="mute" value="False">
                <param name="playCount" value="1">
                <param name="rate" value="1">
                <param name="stretchToFit" value="False">
                <param name="uiMode" value="full">
            </object>
        </div>
    </form>
        <div>
            <poy:footer ID="footer1" runat="server" />
        </div>
    </div>
</body>
</html>