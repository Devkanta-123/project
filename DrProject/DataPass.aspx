<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DataPass.aspx.cs" Inherits="DrProject.DataPass" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
	<!-- Vendors Style-->
	<link rel="stylesheet" href="css/vendors_css.css"/>
	  
	<!-- Style-->  
	<link rel="stylesheet" href="css/style.css"/>
	<link rel="stylesheet" href="css/skin_color.css"/>
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
                            <asp:LinkButton ID="btnEdit" CssClass="btn btn-primary btn-sm"  CommandName="EditButton" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"  runat="server"><span class="badge badge-pill badge-danger"/>Approved</asp:LinkButton>

                         <asp:Button    runat="server" Width="60" Text="Edit"  />
                        </ItemTemplate>  
                    </asp:TemplateField>  
                </Columns>  
            </asp:GridView>  
        </div> 
    </form>
</body>
</html>
