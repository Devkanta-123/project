<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DrProject.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	 <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Login Pages</title>
    <link rel="stylesheet" href="css/vendors_css.css" />
	<link rel="stylesheet" href="css/style.css" />
	<link rel="stylesheet" href="css/skin_color.css"/>	

</head>


<body class="hold-transition theme-primary bg-img" style="background-image: url(images/auth-bg/dr2.jpg)">
<div class="container h-p10">
	
<div class="col-12">
				<div class="row justify-content-center g-0">
					<div class="col-lg-5 col-md-5 col-12">
						<div class="bg-white rounded10 shadow-lg">
							<div class="content-top-agile p-20 pb-0">
								<h2 class="text-primary">Let's Get Started</h2>
													
							</div>
							<div class="p-40">
								<form id="form1"    runat="server">
						<div class="p-40">
									<div class="form-group">
										<div class="form-group">
										<div class="input-group mb-6">
											<span class="input-group-text bg-transparent"><i class="ti-user"></i></span>
											    <asp:TextBox ID="username" runat="server"  autocomplete="off" class="form-control ps-15 bg-transparent" placeholder="Username"></asp:TextBox>

										&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="username" Display="Dynamic" ErrorMessage="This feild is required" ForeColor="Red"></asp:RequiredFieldValidator>
										</div>

                                       </div>

									</div>
									<div class="form-group">
										<div class="input-group mb-3">
											<span class="input-group-text  bg-transparent"><i class="ti-lock"></i></span>
                                               <asp:TextBox ID="password" runat="server" autocomplete="off"    class="form-control ps-20 bg-transparent"  placeholder="password"  OnTextChanged="password_TextChanged" TextMode="Password"></asp:TextBox>
											
										    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="password" Display="Dynamic" ErrorMessage="This field is required" ForeColor="Red" ValidateRequestMode="Enabled"></asp:RequiredFieldValidator>
											
										</div>

									</div>

									 
										  
											 
        <div class="form-group">
			 
	<asp:Label runat="server"   class="form-label" >Select User Type</asp:Label>
        <asp:DropDownList ID="DropDownList1"   class="form-select" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem>admin</asp:ListItem>
            <asp:ListItem>doctor</asp:ListItem>
            <asp:ListItem>patient</asp:ListItem>
        </asp:DropDownList>
			
      
        </div>
					<div class="text-center">
						<p class="mt-15 mb-0">Don't have an account? <a href="patient/register.aspx" class="text-warning ms-5">Patient Sign Up</a></p>
					</div>
							<br/>
							
	<div class="col-12 text-center">
 <asp:Button ID="btn_login" runat="server" Text="Login" class="btn btn-primary mt-10"  OnClick="btn_login_Click"/>
	</div>		
							
										
								</div>	
								</form>	
								
							</div>						
						</div>
						
					</div>
				</div>
			</div>
			</div>
	
	

	  
	  
</body>
</html>
