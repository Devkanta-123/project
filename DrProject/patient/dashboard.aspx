<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="DrProject.patient.patient" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="/css/vendors_css.css" />
    <!-- Style-->
    <link rel="stylesheet" href="/css/style.css" />
    <link rel="stylesheet" href="/css/skin_color.css" />
    <link rel="icon" href="https://medical-admin-template.multipurposethemes.com/images/favicon.ico" />
</head>
<body class="hold-transition light-skin sidebar-mini theme-primary fixed">

    <form id="form1" runat="server">


        <header class="main-header">
            <div class="d-flex align-items-center logo-box justify-content-start">
                <!-- Logo -->
                <a href="index.html" class="logo">
                    <!-- logo-->

                    <div class="logo-lg">
                        <span class="light-logo">
                            <img src="/images/medusind.png" alt="logo" /></span>

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

                        <li class="dropdown user user-menu">
                            <a href="#" class="waves-effect waves-light dropdown-toggle w-auto l-h-12 bg-transparent p-0 no-shadow" data-bs-toggle="dropdown" title="User">
                                <div class="d-flex pt-1">
                                    <div class="text-end me-15">
                                        <div class="text-end me-10">
                                           
                                        </div>
                                        <div class="text-end me-10">
                                            <asp:Label ID="Label3" runat="server" class="pt-5 fs-14 mb-0 fw-800 text-success"></asp:Label>
                                        </div>

                                    </div>

                                    <div class="d-flex justify-content-between align-items-center">
                                        <asp:Image ID="profile" runat="server" class="me-10 avatar rounded-circle" />

                                    </div>
                                </div>
                            </a>

                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <!--#include file = "sidepanel.html" -->
        <div class="content-wrapper">
            <div class="container-full">

                <div class="row">

                    <!--Cards-->
                    		<div class="col-xl-3 col-lg-6 col-12">
							<div class="box">
								<div class="box-body">
									<div class="mb-15 d-flex justify-content-between align-items-center">
										<h4 class="my-0">BP Count</h4>
										<i class="text-primary fs-18 mdi mdi-heart-pulse"></i>
									</div>
									<div class="mb-10 d-flex justify-content-between align-items-center">
										<h4 class="fw-400 my-0">0</h4>
										<p class="my-0">Upper</p>
									</div>
									<div class="d-flex justify-content-between align-items-center">
										<h4 class="fw-400 my-0">0</h4>
										<p class="my-0">Lower</p>
									</div>
								</div>
							</div>
							<div class="box">
								<div class="box-body">
									<div class="mb-3 pb-1 d-flex justify-content-between align-items-center">
										<h4 class="my-0">Bill Due</h4>
										<i class="text-primary fs-18 mdi mdi-wallet"></i>
									</div>
									<div>
										<h5 class="fw-300 my-0">$0</h5>
									</div>
								</div>
							</div>
						</div>

                    <div class="col-xl-8 col-11">			
						  <div class="box">
							<div class="box-header">
							  <h4 class="box-title">BMI INDEX</h4>
							  <div class="box-controls pull-right">
								<div class="lookup lookup-circle lookup-right">
								  <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#modal-center">UPDATE</button>
								</div>
							  </div>
							</div>
							<div class="box-body">
							  	<div class="flexbox bb-1 mb-15">
									<div><p><span class="text-mute">Patient Name:</span> <strong><asp:Label ID="Label7" runat="server" class="pt-5 fs-14 mb-0 fw-800 text-primary"></asp:Label></strong></p></div>
									<div><p><span class="text-mute">Patient Id:</span> <strong><asp:Label ID="Label8" runat="server" class="pt-5 fs-14 mb-0 fw-800 text-primary"></asp:Label></strong></p></div>
							  	</div>	
								  <div class="row">						
									<div class="col-12">
										<div class="row bb-1 pb-10">							
											<div class="col-4">							  
												<img class="img-fluid float-start w-30 mt-10 me-10" src="../images/weight.png" alt="">
												<div>
													<p class="mb-0"><small>Weight</small></p> 
													<h5 class="mb-0"><span><asp:Label ID="Label9" runat="server" Text="0" class="pt-5 fs-14 mb-0 fw-800 text-primary"></asp:Label>KG
                                                      
                                                        </span></h5>
												</div>
											</div>							
											<div class="col-4 bs-1 be-1">							  
												<img class="img-fluid float-start w-30 mt-10 me-10" src="../images/human.png" alt="">
												<div>
													<p class="mb-0"><small>Height</small></p> 
													<h5 class=" mb-0"><span><asp:Label ID="Label10" runat="server" Text="0" class="pt-5 fs-14 mb-0 fw-800 text-primary"></asp:Label>CM</span></h5>
												</div>
											</div>							
											<div class="col-4">							  
												<img class="img-fluid float-start w-30 mt-10 me-10" src="../images/bmi.png" alt="">
												<div>
													<p class="mb-0"><small>BMI</small></p> 
													<h5 class="mb-0"><span><asp:Label ID="Label11" runat="server" Text="0" class="pt-5 fs-14 mb-0 fw-800 text-primary"></asp:Label></span></h5>
													<h5 class="mb-0"><span><asp:Label ID="Label12" runat="server" Text="0" class="pt-5 fs-14 mb-0 fw-800 text-primary"></asp:Label></span></h5>
												</div>
											</div>
										</div>									
									</div>
								  </div>
							</div>						 
						  </div>	
						</div>

                              <div class="box">
						<div class="box-body">
							<span class="badge badge-success-light">Patient Profile</span>
                            <h4 class="ti-email"> <asp:Label ID="Label2" runat="server" class="pt-5 fs-14 mb-0 fw-800 text-primary"></asp:Label></h4>					
							    <div class="d-flex align-items-center">          
                                       <asp:Image ID="profile2" runat="server" class=" rounded-circle bg-info-light" Width="150" />
									<div class="text-start">
                                        	<h4 class="mt-20 mb-10"><asp:Label ID="Label15" runat="server" class="pt-5 fs-14 mb-0 fw-800 text-primary"></asp:Label></h4>
									  <h4 class="mt-20 mb-10"><asp:Label ID="Label4" runat="server" class="pt-5 fs-14 mb-0 fw-800 text-primary"></asp:Label></h4>	
                                        <p class="ti-location-pin">  <asp:Label ID="Label5" runat="server" class="pt-5 fs-14 mb-0 fw-800 text-primary"></asp:Label></p>
								<p class="mb-0 text-mute"><i class="ti-mobile"> </i> <span class="text-primary"><asp:Label ID="Label6" runat="server" class="pt-5 fs-14 mb-0 fw-800 text-primary"></asp:Label></span></p>
									  <small><asp:Label ID="Label1" runat="server" class="pt-5 fs-14 mb-0 fw-800 text-primary"></asp:Label></small>
                                        <button type="button" class="btn btn-warning btn-sm" data-bs-toggle="modal" data-bs-target="#modal-default">
					                     Logout
					                      </button> 
                                    
									</div>
							    </div>
						</div>					
					</div>

                </div>
            </div>
        </div>
        
	<div class="modal fade" id="modal-default">
	  <div class="modal-dialog" role="document">
		<div class="modal-content">
		  <div class="modal-header">
			<h4 class="modal-title">Are you Ready To Leave ?</h4>
			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		  </div>
		  <div class="modal-body">
			<p>Select "Logout" below if you are ready to end your current session.&hellip;</p>
		  </div>
		  <div class="modal-footer">
			<button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
			 
                 <asp:LinkButton ID="logout" runat="server"   class="btn btn-info float-end"  OnClick="logout_Click">Logout</asp:LinkButton>  
		  </div>
		</div>
		<!-- /.modal-content -->
	  </div>
	  <!-- /.modal-dialog -->
  </div>
        <div class="modal center-modal fade" id="modal-center" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body">
                        <h4 class="box-title text-info mb-0"><i class="ti-user me-15"></i>BMI Calculator</h4>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">Weight</label>
                                    <asp:TextBox ID="TextBox1" runat="server" class="form-control" placeholder="Enter weight..." AutoComplete="off"></asp:TextBox>
                                    &nbsp;&nbsp;
                             
                            </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">Height</label>
                                    <asp:TextBox ID="TextBox2" runat="server" class="form-control" placeholder="Enter Height..." AutoComplete="off"></asp:TextBox>
                                    &nbsp;&nbsp;
                           
                                </div>
                            </div>
                        </div>
                        </div>
                                   <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">BMI</label>
                                    <asp:TextBox ID="TextBox3" runat="server" class="form-control"  AutoComplete="off"></asp:TextBox>
                                    &nbsp;&nbsp;
                                </div>
                            </div>            
                            <div class="modal-footer modal-footer-uniform"> 
                           <asp:Button ID="save" class="btn btn-success" runat="server" Text="Update" OnClick="save_Click" />
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
        <script>
  function sum() {
      var txtFirstNumberValue = document.getElementById('TextBox1').value;
      var txtSecondNumberValue = document.getElementById('TextBox2').value;
      var result = parseInt(txtFirstNumberValue ) / (((parseInt(txtSecondNumberValue)/100)*(parseInt(txtSecondNumberValue)/100)));
      if (!isNaN(result))
      {
          document.getElementById('TextBox3').value = result;
      }
        }
        </script>
</body>
</html>
