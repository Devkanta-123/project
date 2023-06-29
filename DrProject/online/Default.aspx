<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DrProject.online.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <asp:TextBox ID="txtOrder" runat="server"></asp:TextBox>
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
    <asp:Button ID="Button1" runat="server"  Text="Button" OnClick="Button1_Click" />
        </div>
    </form>
</body>
</html>
