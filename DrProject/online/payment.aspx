<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="payment.aspx.cs" Inherits="DrProject.online.payment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

        </div>
        <asp:TextBox ID="txtOrder" runat="server"></asp:TextBox>
        <br />
        <br />
        <br />
        <asp:TextBox ID="txtCustomer" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:TextBox ID="txtMobileNumber" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:TextBox ID="txtAmount" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="btnCheckout" runat="server" Text="Button" OnClick="btnCheckout_Click" />
    </form>
</body>
</html>
