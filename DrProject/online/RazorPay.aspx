<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RazorPay.aspx.cs" Inherits="DrProject.online.RazorPay" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
       
        <br />
        <br />
        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:TextBox ID="txtContact" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:TextBox ID="txtProduct" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:TextBox ID="txtAmount" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="btnCheckout" runat="server" Text="Button" OnClick="btnCheckout_Click" /> 
    </form>
</body>
</html>
