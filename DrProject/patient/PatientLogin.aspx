<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PatientLogin.aspx.cs" Inherits="DrProject.patient.PatientLogin" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	 <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Login Pages</title>
    <link rel="stylesheet" href="/css/vendors_css.css" />
	<link rel="stylesheet" href="/css/style.css" />
	<link rel="stylesheet" href="/css/skin_color.css"/>	
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>


<body class="hold-transition theme-primary bg-img" style="background-image: url(/images/auth-bg/dr2.jpg)">

    <div class="container h-p10">
	
<div class="col-12">
				<div class="row justify-content-center g-0">
					<div class="col-lg-5 col-md-5 col-12">
						<div class="bg-white rounded10 shadow-lg">
							<div class="content-top-agile p-20 pb-0">
								<h2 class="text-primary">Let's Get Started</h2>
								<p class="mb-0">Patient Login Pages</p>						
							</div>
								  
    <form id="form1" runat="server">
						<div class="p-40">

	  
							<div class="form-group">
										<div class="form-group">
										<div class="input-group mb-6">
			<span class="input-group-text bg-transparent"><i class="ti-user"></i></span>
		 <asp:TextBox ID="emailid" runat="server"  autocomplete="off" class="form-control ps-15 bg-transparent" placeholder="Email ID..."></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="emailid" Display="Dynamic" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
        
										</div>

                                       </div>

									</div>

							<div class="form-group">
										<div class="input-group mb-3">
											<span class="input-group-text  bg-transparent"><i class="ti-lock"></i></span>
                                            
            <asp:TextBox ID="password" runat="server"  autocomplete="off"    class="form-control ps-20 bg-transparent"  placeholder="password"  OnTextChanged="password_TextChanged" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="password" Display="Dynamic" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
          
											
										</div>

									</div>
							
					<div class="text-center">
						<p class="mt-15 mb-0">Don't have an account? <a href="register.aspx" class="text-warning ms-5">Patient Sign Up</a></p>
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



	  
	  
</body>
</html>
