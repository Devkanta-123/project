<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="treatment2.aspx.cs" Inherits="DrProject.doctor.treatment2" %>

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
           <td>Appointment ID</td>    
           <td>    
               <asp:TextBox ID="appointment_id" runat="server" ReadOnly="true" />    
           </td>  
           <td>date</td>    
           <td>    
               <asp:TextBox ID="start_date" type="date" runat="server" />    
           </td>  
       </tr>    
           
             
       </tr>    
       <tr>    
               
       </tr>    
       <tr>    
           <td align="center">    
                <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />    
           </td>    
           <td align="center">    
<%--               <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />    --%>
           </td>    
       </tr>    
   </table>    </div>
        </div>
    </form>
</body>
</html>
