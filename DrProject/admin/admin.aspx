<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="DrProject.admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    	<link rel="stylesheet" href="/css/vendors_css.css" />
	  
	<!-- Style-->  
	<link rel="stylesheet" href="/css/style.css"/>
	<link rel="stylesheet" href="/css/skin_color.css"/>
	  <link rel="icon" href="https://medical-admin-template.multipurposethemes.com/images/favicon.ico"/>
</head>
<body class="hold-transition light-skin sidebar-mini theme-primary fixed">

    <form id="form1" runat="server">
        <div class="wrapper">
	<div id="loader">

		  <header class="main-header">
	<div class="d-flex align-items-center logo-box justify-content-start">	
		<!-- Logo -->
		<a href="index.html" class="logo">
		  <!-- logo-->
		 
		  <div class="logo-lg">
			  <span class="light-logo"><img src="/images/medusind.png" alt="logo"/></span>
			
		  </div>
		</a>	
	</div>  
    <!-- Header Navbar -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
	  <div class="app-menu">
		<ul class="header-megamenu nav">
			<li class="btn-group nav-item">
				<a href="#" class="waves-effect waves-light nav-link push-btn btn-primary-light" data-toggle="push-menu" role="button">
					<i class="icon-Menu"><span class="path1"></span><span class="path2"></span></i>
			    </a>
			</li>
			<li class="btn-group d-lg-inline-flex d-none">
				<div class="app-menu">
					
				</div>
			</li>
		</ul> 
	  </div>
		
      <div class="navbar-custom-menu r-side">
        <ul class="nav navbar-nav">			
			<!-- User Account-->
			<li class="dropdown user user-menu">
			
			
				<a href="#" class="waves-effect waves-light dropdown-toggle w-auto l-h-12 bg-transparent p-0 no-shadow" data-bs-toggle="dropdown" title="User">
					<div class="d-flex pt-1">
						<div class="text-end me-15">
							<div class="text-end me-10">
					      <asp:Label ID ="Label2" runat="server" class="pt-5 fs-14 mb-0 fw-800 text-primary" ></asp:Label>
							</div>
							

						</div>
						
						<div class="d-flex justify-content-between align-items-center">
	                     <img src="/images/admin.png" alt="" class="me-10 avatar rounded-circle"  />
										
							</div>
					</div>
				</a>
			</li>	
			  
          <!-- Control Sidebar Toggle Button -->
        
			
        </ul>
      </div>
    </nav>
  </header>
<!-- #include file = "sidepanel.html"-->

		 <div class="content-wrapper">
	  <div class="container-full">
		<!-- Main content -->
	
			
			<div class="row">
				<div class="col-xxxl-9 col-xl-8 col-12">
					
						<!-- card -->
					<div class="row">
						<div class="col-lg-4 col-12">
							<div class="box">
								<div class="box-body">
									<div class="d-flex align-items-center">
										<div class="me-15">
											<img src="https://medical-admin-template.multipurposethemes.com/images/svg-icon/color-svg/custom-20.svg" alt="" class="w-120" />
										</div>
										<div>
											<h4 class="mb-0">Total Patients</h4>
											<asp:Label ID="Label3" runat="server" Text="1234" class="mb-3" ></asp:Label>
                                          
										</div>
									</div>
								</div>
							</div>
						</div>
							<div class="col-lg-4 col-12">
							<div class="box">
								<div class="box-body">
									<div class="d-flex align-items-center">
										<div class="me-15">
											<img src="https://medical-admin-template.multipurposethemes.com/images/svg-icon/color-svg/custom-18.svg" alt="" class="w-120" />
										</div>
										<div>
											<h4 class="mb-0">Total Doctor  <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#modal-center">+</button>
                                                
                                            </h4>
										<asp:Label ID="Label4" runat="server" Text="" class="mb-3" ></asp:Label>
											<br/>
											

										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-12">
							<div class="box">
								<div class="box-body">
									<div class="d-flex align-items-center">
										<div class="me-15">
											<img src="https://medical-admin-template.multipurposethemes.com/images/svg-icon/color-svg/custom-19.svg" alt="" class="w-120" />
										</div>
										<div>
											<h4 class="mb-0">Total Doctor</h4>
											
											<h3 class="mb-0">245</h3>
										</div>
									</div>
								</div>
							</div>
						</div>
							<div class="col-12">
						  <div class="box">
							<div class="box-header with-border">
							  <h4 class="box-title">Admitted Patient</h4>
							  <div class="box-controls pull-right">
								<div class="lookup lookup-circle lookup-right">
								
								</div>
							  </div>
							</div>
							<div class="box-body no-padding">
								<div class="table-responsive">
								  	<table class="table mb-0">
										<tbody>
											<tr class="bg-info-light">
											 
											</tr>
											<asp:GridView ID="fetchpatient" runat="server">
                                                </asp:GridView>
											
											
											<tr>
											 
											</tr>
										</tbody>
									</table>
								</div>
							</div>		
							  
							<div class="box-footer bg-light py-10 with-border">
							  
							</div>
						  </div>
						</div>

			
	<div class="modal center-modal fade" id="modal-center" tabindex="-1">
	  <div class="modal-dialog">
		<div class="modal-content">
		  <div class="modal-body">
			<h4 class="box-title text-info mb-0"><i class="ti-user me-15"></i> Personal Info</h4>
			          	<div class="row">
								  <div class="col-md-6">
									<div class="form-group">
									  <label class="form-label">First Name</label>
										<asp:TextBox ID="fname" runat="server"  class="form-control" placeholder="First Name..." AutoComplete="off" ></asp:TextBox>
				                 &nbsp;&nbsp;
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="fname" Display="Dynamic" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator> 									
									</div>
								  </div>

								  <div class="col-md-6">
									<div class="form-group">
									  <label class="form-label">Last Name</label>
										<asp:TextBox ID="lname" runat="server"  class="form-control" placeholder="last Name..." AutoComplete="off" ></asp:TextBox>
				                 &nbsp;&nbsp;
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="lname" Display="Dynamic" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>					  
									</div>
								  </div>
		               </div>
			   <div class="row">
								  <div class="col-md-6">
									<div class="form-group">
									  <label class="form-label">E-mail</label>
										<asp:TextBox ID="emailid" runat="server"  class="form-control" placeholder="E-MailId..." AutoComplete="off" ></asp:TextBox>
				                 &nbsp;&nbsp;
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="emailid" Display="Dynamic" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>

									 
									</div>
								  </div>
								  <div class="col-md-6">
									<div class="form-group">
									  <label class="form-label">Password</label>
										<asp:TextBox ID="password" runat="server"  class="form-control" placeholder="Password..." AutoComplete="off" ></asp:TextBox>
				                 &nbsp;&nbsp;
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="password" Display="Dynamic" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
									 
									</div>
								  </div>
								</div>

			  <div class="row">
								  <div class="col-md-6">
									<div class="form-group">
									  <label class="form-label">Designation</label>
										<asp:TextBox ID="designation" runat="server"  class="form-control" placeholder="Designation..." AutoComplete="off" ></asp:TextBox>
				                 &nbsp;&nbsp;
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="designation" Display="Dynamic" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
									 
									</div>
								  </div>
								  <div class="col-md-6">
									<div class="form-group">
									  <label class="form-label">Phone No</label>
										<asp:TextBox ID="phno" runat="server"  class="form-control" placeholder="Phone No..." AutoComplete="off" ></asp:TextBox>
				                 &nbsp;&nbsp;
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="phno" Display="Dynamic" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
								
									</div>
								  </div>

		               </div>
			   <div class="row">
								  <div class="col-md-6">
									<div class="form-group">
									  <label class="form-label">DOB</label>
						        <asp:TextBox ID="dob" runat="server" type="date"   class="form-control" ></asp:TextBox>
										<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="dob" Display="Dynamic" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
									</div>
								  </div>
				    <div class="col-md-6">
									<div class="form-group">
			<label class="form-label">Department</label>
			<asp:DropDownList ID="department" runat="server" class="form-control"  >
             
              </asp:DropDownList>

		               </div>
		               </div>
		               </div>

			   <div class="row">
								  <div class="col-md-6">
									<div class="form-group">
									  <label class="form-label">Address</label>
										<asp:TextBox ID="address" runat="server"  class="form-control" placeholder="Address..." AutoComplete="off" ></asp:TextBox>
				                 &nbsp;&nbsp;
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="address" Display="Dynamic" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
									  
									</div>
								  </div>
								  <div class="col-md-6">
									<div class="form-group">
									  <label class="form-label">Experience</label>
										<asp:TextBox ID="experience" runat="server"  class="form-control" placeholder="Experience..." AutoComplete="off" ></asp:TextBox>
				                 &nbsp;&nbsp;
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="experience" Display="Dynamic" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
									  
									</div>
								  </div>

		               </div>
			                   <div class="form-group">
								  <label class="form-label">Select Profile</label>
								 <asp:FileUpload ID="profile" runat="server" />
								</div>
		  <div class="modal-footer modal-footer-uniform">
			<button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
			
		<asp:Button  ID="regdoc" runat="server" Text="Save"   OnClick="regtDoc_Click" class="btn btn-primary float-end"/>
		  </div>
		</div>
	  </div>
	</div>
					</div>

					</div>
					</div>
					</div>
					</div>
					</div>
		
		  </div>
		  </div>


    </form>

   <script src="/js/vendors.min.js"></script>
	<script src="/js/pages/chat-popup.js"></script>
    <script src="/css/assets/icons/feather-icons/feather.min.js"></script>
	
	<script src="/css/assets/vendor_components/apexcharts-bundle/dist/apexcharts.js"></script>
	<script src="/css/assets/vendor_components/OwlCarousel2/dist/owl.carousel.js"></script>
	



</body>
</html>
