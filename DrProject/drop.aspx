<%@ Page Language="C#" AutoEventWireup="true" CodeFile="drop.aspx.cs" Inherits="DrProject.drop" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" style="height: 22px">
            <asp:ListItem>Ok</asp:ListItem>
            <asp:ListItem>Yes</asp:ListItem>
        </asp:DropDownList>
    </form>
</body>
</html>
