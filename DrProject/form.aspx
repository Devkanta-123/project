<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="form.aspx.cs" Inherits="DrProject.form" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <style type="text/css">
        body
        {
            font-family: Arial;
            font-size: 10pt;
        }
        table
        {
            border: 1px solid #ccc;
            border-collapse: collapse;
            background-color: #fff;
        }
        table th
        {
            background-color: #B8DBFD;
            color: #333;
            font-weight: bold;
        }
        table th, table td
        {
            padding: 5px;
            border: 1px solid #ccc;
        }
        table, table table td
        {
            border: 0px solid #ccc;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div id="dvGrid" style="padding: 10px; width: 450px">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" OnRowDataBound="OnRowDataBound"
                    DataKeyNames="id" OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit"
                    PageSize="7" AllowPaging="true" OnPageIndexChanging="OnPaging" OnRowUpdating="OnRowUpdating"
                OnRowDeleting="OnRowDeleting" EmptyDataText="No records has been added." Width="450">
                    <Columns>
                        <asp:TemplateField HeaderText="Name" ItemStyle-Width="150">
                            <ItemTemplate>
                                <asp:Label ID="lblName" runat="server" Text='<%# Eval("fname") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtName" runat="server" Text='<%# Eval("fname") %>' Width="140"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Country" ItemStyle-Width="150">
                            <ItemTemplate>
                                <asp:Label ID="lblCountry" runat="server" Text='<%# Eval("lname") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtCountry" runat="server" Text='<%# Eval("lname") %>' Width="140"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Emailid" ItemStyle-Width="150">
                            <ItemTemplate>
                                <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("emailid") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEmail" runat="server" Text='<%# Eval("emailid") %>' Width="140"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ButtonType="Link" ShowEditButton="true" ShowDeleteButton="true"
                            ItemStyle-Width="150" />
                    </Columns>
                </asp:GridView>
               
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
      
        <asp:TextBox ID="input_date_travel_strat" runat="server" Type="date"></asp:TextBox>
<asp:Button ID="Button1" Text="Submit" OnClick="Button_Click" runat="server" />
<br />
<asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="The date must be greater than today" ForeColor="Red"
    ControlToValidate="input_date_travel_strat" Operator="GreaterThanEqual" Type="Date" Display="Dynamic" />
        <p>
            
        </p>
    </form>
    
   
    
</body>
</html>