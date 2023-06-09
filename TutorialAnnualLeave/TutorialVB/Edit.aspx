<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Edit.aspx.vb" Inherits="Edit" %>
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
					<div class="header">Edit Booking</div>
					<asp:LinkButton ID="LinkButtonDelete" runat="server" OnClick="LinkButtonDelete_Click">Delete</asp:LinkButton>
					<br />
					<br />
				</td>
			</tr>
			<tr>
				<td align="right">Start:</td>
				<td><asp:TextBox ID="TextBoxStart" runat="server" Width="200px"></asp:TextBox></td>
			</tr>
			<tr>
				<td align="right">End:</td>
				<td><asp:TextBox ID="TextBoxEnd" runat="server" Width="200px"></asp:TextBox></td>
			</tr>
			<tr>
				<td align="right">Person:</td>
				<td><asp:DropDownList ID="DropDownListPerson" runat="server" Width="200px" Enabled="false" ></asp:DropDownList></td>
			</tr>
			<tr>
				<td align="right"></td>
				<td>
					<asp:Button ID="ButtonOK" runat="server" OnClick="ButtonOK_Click" Text="  OK  " />
					<asp:Button ID="ButtonCancel" runat="server" Text="Cancel" OnClick="ButtonCancel_Click" />
				</td>
			</tr>
		</table>

		</div>
	</form>
</body>
</html>