<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Report_All.aspx.vb" Inherits="Report_All" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>รายละเอียดบริษัท</title>
    <link href="include/style.css" type="text/css" rel="stylesheet" />
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <%--<link rel="stylesheet" href="images/CitrusIsland.css" type="text/css" />--%>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="dbGrid_upload" runat="server" AutoGenerateColumns="False" BorderStyle="Dotted"
                CssClass="Grid" DataKeyNames="ID_BU" DataSourceID="uploadSqlDataSource" EmptyDataText="No records found"
                Width="100%">
                <RowStyle CssClass="shade" />
                <EmptyDataRowStyle BorderStyle="None" BorderWidth="0px" Font-Bold="True" HorizontalAlign="Center"
                    VerticalAlign="Middle" />
                <Columns>
                    <asp:BoundField DataField="Name_BU" HeaderText="ชื่อบริษัท/บุคคล" SortExpression="Name_BU" />
                    <asp:BoundField DataField="Location" HeaderText="สถานที่่ตั้งโรงไฟฟ้า" SortExpression="Location" />
                    <asp:BoundField DataField="Gen" HeaderText="ประเภทโรงไฟฟ้า" SortExpression="Gen" />
                    <asp:BoundField DataField="Oil" HeaderText="ประเภทเชื้อเพลิง" SortExpression="Oil" />
                    <asp:BoundField DataField="Adder" HeaderText="Adder" SortExpression="Adder" />
                    <asp:BoundField DataField="Power" HeaderText="กำลังการผลิต(MW)" SortExpression="Power" />
                    <asp:BoundField DataField="Sale_Power" HeaderText="ปริมาณการขายตามสัญญา(MW)" SortExpression="Sale_Power" />
                    <asp:BoundField DataField="Voltage" HeaderText="แรงดันที่เชื่อมโยง" SortExpression="Voltage" />
                    <asp:BoundField DataField="Substation" HeaderText="สถานีไฟฟ้า" SortExpression="Substation" />
                    <asp:BoundField DataField="Feeder" HeaderText=" วงจรไฟฟ้า" SortExpression="Feeder" />
                    <asp:BoundField DataField="Gen_Side" HeaderText="ขนาดผู้ผลิต" SortExpression="Gen_Side" />
                    <asp:BoundField DataField="Status" HeaderText="สถานะ" SortExpression="Status" />
                    <asp:BoundField DataField="Promiss" HeaderText=" เลขที่สัญญา" SortExpression="Promiss" />
                    <asp:BoundField DataField="Tel" HeaderText="เบอร์โทรผู้ติดต่อ" SortExpression="Tel" />
                    <asp:BoundField DataField="Tel_Name" HeaderText="ฃื่อผู้ประสานงาน" SortExpression="Tel_Name" />
                    <asp:BoundField DataField="Note" HeaderText="หมายเหตุ" SortExpression="Note" />
                    <asp:BoundField DataField="SCOD" HeaderText="SCOD" SortExpression="SCOD" DataFormatString="{0:dd/MMM/yyyy}" />
                </Columns>
                <SelectedRowStyle CssClass="GridSelected" />
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" />
                <AlternatingRowStyle CssClass="GridItemOdd" />
            </asp:GridView>
            Export Data&nbsp;
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/Excel2.jpg" />
            <asp:SqlDataSource ID="uploadSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:VSPP %>"
                ProviderName="<%$ ConnectionStrings:VSPP.providerName %>" SelectCommand="SELECT * FROM [Business] WHERE ([Status_Flax] = 'Y')">
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
