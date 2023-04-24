<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DataPass2.aspx.cs" Inherits="DrProject.DataPass2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>    
   <table>    
       <tr>    
           <td>EmpId</td>    
           <td>    
               <asp:TextBox ID="app_id" runat="server" ReadOnly="true" />    
           </td>    
       </tr>    
       <tr>    
           <td>EmpName</td>    
           <td>    
               <asp:TextBox ID="dept_name" runat="server" />    
           </td>    
       </tr>    
       <tr>    
           <td>Job</td>    
           <td>    
               <asp:TextBox ID="status" runat="server" />    
           </td>    
       </tr>    
       <tr>    
           <td>EmpSalary</td>    
           <td>    
               <asp:TextBox ID="dept_pics" runat="server" />    
           </td>    
       </tr>    
       <tr>    
               
       </tr>    
       <tr>    
           <td align="center">    
                <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />    
           </td>    
           <td align="center">    
               <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />    
           </td>    
       </tr>    
   </table>    </div> 
    </form>
</body>
</html>
