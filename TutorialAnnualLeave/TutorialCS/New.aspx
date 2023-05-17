<%@ Page Language="C#" AutoEventWireup="true" CodeFile="New.aspx.cs" Inherits="New" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>New event</title>
    <link href='css/main.css' type="text/css" rel="stylesheet" /> 
</head>
<body class="dialog">
    <form id="form1" runat="server">
    <div>
        <table border="0" cellspacing="4" cellpadding="0">
            <tr>
                <td align="right"></td>
                <td>
                    <div class="header">New Booking</div>
                </td>
            </tr>
            <tr>
                <td align="right">Start:</td>
                <td><asp:TextBox ID="TextBoxStart" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td align="right">End:</td>
                <td><asp:TextBox ID="TextBoxEnd" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td align="right">Person:</td>
                <td><asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList></td>
            </tr>
            <tr>
                <td align="right"></td>
                <td>
                    <asp:Button ID="ButtonOK" runat="server" OnClick="ButtonOK_Click" Text="OK" />
                    <asp:Button ID="ButtonCancel" runat="server" Text="Cancel" OnClick="ButtonCancel_Click" />
                </td>
            </tr>
        </table>
        
        </div>
    </form>
</body>
</html>
