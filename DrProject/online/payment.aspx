﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="payment.aspx.cs" Inherits="DrProject.online.payment" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>

 
</head>
<body>
    
<form id="form1" runat="server">
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
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
</form>

</body>
</html>
