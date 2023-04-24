<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DataPass.aspx.cs" Inherits="DrProject.DataPass" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>  
            <asp:GridView ID="GridView1" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White" runat="server" AutoGenerateColumns="false" OnRowCommand="GridView1_RowCommand">  
                <Columns>  
                    <asp:BoundField DataField="id" HeaderText="EmpId" />  
                    <asp:BoundField DataField="dept_name" HeaderText="EmpName" />  
                    <asp:BoundField DataField="status" HeaderText="Job" />  
                    <asp:BoundField DataField="dept_pic" HeaderText="EmpSalary" /> 
                    <asp:TemplateField>  
                        <ItemTemplate>  
                            <asp:Button ID="btnEdit" runat="server" Width="60" Text="Edit" CommandName="EditButton" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />  
                        </ItemTemplate>  
                    </asp:TemplateField>  
                </Columns>  
            </asp:GridView>  
        </div> 
    </form>
</body>
</html>
