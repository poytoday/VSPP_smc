<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Report_Status.aspx.vb" Inherits="Report_Status" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Status_Type"
            DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="Status_Type" HeaderText="Status_Type" ReadOnly="True"
                    SortExpression="Status_Type" />
                <asp:TemplateField HeaderText="รายชื่อ">
                    <ItemTemplate>
                        <asp:GridView ID="GridView2" runat="server">
                        </asp:GridView>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:VSPP %>"
            SelectCommand="SELECT [Status_Type] FROM [VSPP_STATUS]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:VSPP %>"
            SelectCommand="SELECT [Name_BU], [Location], [Gen], [Oil], [Adder], [Voltage], [Substation], [Feeder], [SCOD] FROM [Business] WHERE ([Status] = @Status)">
            <SelectParameters>
                <asp:Parameter Name="Status" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
