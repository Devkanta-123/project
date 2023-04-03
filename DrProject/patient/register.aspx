<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="DrProject.patient.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> Patient Register Pages</title>
        <link rel="stylesheet" href="/css/vendors_css.css" />
	<link rel="stylesheet" href="/css/style.css" />
	<link rel="stylesheet" href="/css/skin_color.css"/>	

</head>

   
<body class="hold-transition theme-primary bg-img" style="background-image: url(/images/auth-bg/dr2.jpg)">
	
	<div class="container h-p100">
		<div class="row align-items-center justify-content-md-center h-p100">
			
			<div class="col-12">
				<div class="row justify-content-center g-0">
					<div class="col-lg-5 col-md-5 col-12">
						<div class="bg-white rounded10 shadow-lg">
    <form id="form1" runat="server">
							<div class="content-top-agile p-20 pb-0">
								<h2 class="text-primary">Get started with Us</h2>
								<h6 class="text-warning"> Register a new Patient</h6>
													
							</div>
        	<div class="p-40">
         
                
                <div class="form-group">
										<div class="input-group mb-3">
											<span class="input-group-text bg-transparent"><i class="ti-user"> </i></span>
											<asp:TextBox ID="fullname" runat="server" placeholder="Full Name" AutoComplete="off"  class="form-control ps-15 bg-transparent" ></asp:TextBox>
                                            &nbsp;&nbsp;
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="fullname" Display="Dynamic" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
										</div>
									</div>
            

            <div class="form-group">
			<div class="input-group mb-3">
                <span class="input-group-text bg-transparent"><i class="ti-email"></i></span>
                <asp:TextBox ID="emailid" runat="server"  class="form-control ps-15 bg-transparent" placeholder="Email ID" AutoComplete="off" ></asp:TextBox>
				 &nbsp;&nbsp;
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="emailid" Display="Dynamic" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
			</div>
               <div class="form-group">
			<div class="input-group mb-3">
           <span class="input-group-text bg-transparent"><i class="ti-lock"></i></span>
                <asp:TextBox ID="password" runat="server" class="form-control ps-15 bg-transparent" placeholder="Password" TextMode="Password" AutoComplete="off" ></asp:TextBox>
				 &nbsp;&nbsp;
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="password" Display="Dynamic" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
             </div>
			</div>
             <div class="form-group">
			<div class="input-group mb-3">
				 <span class="input-group-text bg-transparent"><i class="ti-location-pin"></i></span>
                <asp:TextBox ID="address" runat="server"  class="form-control ps-15 bg-transparent" placeholder="Address" AutoComplete="off" ></asp:TextBox>
				 &nbsp;&nbsp;
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="address" Display="Dynamic" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
             </div>
				 <div class="input-group mb-3">
			 <span class="input-group-text bg-transparent"><i class="ti-user"></i></span>
                     <asp:DropDownList ID="gender" runat="server"  class="form-control ps-15 bg-transparent">
                         <asp:ListItem >Male</asp:ListItem>
                         <asp:ListItem >Female</asp:ListItem>
                     </asp:DropDownList>
                </div>
			</div>
				 <div class="form-group">
			<div class="input-group mb-3">
				 <span class="input-group-text bg-transparent"><i class="ti-image">
                 
                 </i></span>
                <asp:TextBox ID="age" runat="server"  class="form-control ps-15 bg-transparent" placeholder="Age"  TextMode="Number" AutoComplete="off" ></asp:TextBox>
				 &nbsp;&nbsp;
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="age"  Display="Dynamic" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
             </div>
			</div>
               <div class="form-group">
			<div class="input-group mb-3">
				 <span class="input-group-text bg-transparent"><i class="ti-mobile"></i></span>
               <asp:TextBox ID="phone" runat="server" class="form-control ps-15 bg-transparent" placeholder="Phone Number" TextMode="Number"  AutoComplete="off" ></asp:TextBox>
				 &nbsp;&nbsp;
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="phone" Display="Dynamic" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
             </div>
			</div>
				<div class="form-group">
			<div class="input-group mb-3">
				 <span class="input-group-text bg-transparent"><i class="ti-save-alt"></i></span>
              	<asp:FileUpload  ID ="profile" runat="server" />
             </div>
			</div>


			


				<div class="row">
										<div class="col-12">
										  <div class="checkbox">
											<input type="checkbox" id="basic_checkbox_1"  required="required" title="Required" />

											<label for="basic_checkbox_1">I agree to the <a href="#" class="text-warning"><b>Terms</b></a></label>
										  </div>
										</div>
				            	<div class="text-center">
									<p class="mt-15 mb-0">Already have an account?<a href="Patientlogin.aspx" class="text-danger ms-5"> Sign In</a></p>
								</div>
					<br/>
					<br/>
										<div class="col-12 text-center">
										<asp:Button ID="registerbtn" runat="server" Text="Register"   class="btn btn-info margin-top-10" OnClick="registerbtn_Click" />
										</div>	
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
