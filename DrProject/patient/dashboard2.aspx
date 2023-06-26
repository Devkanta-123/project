<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dashboard2.aspx.cs" Inherits="DrProject.patient.dashboard2" %>
	<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
	<link rel="stylesheet" href="css/custom.css "/>
    <link rel="stylesheet" href="/css/vendors_css.css" />
    <link rel="stylesheet" href="/css/style.css" />
    <link rel="stylesheet" href="/css/skin_color.css" />
    <link rel="icon" href="https://medical-admin-template.multipurposethemes.com/images/favicon.ico" />
    	 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
</head>
<body class="hold-transition light-skin sidebar-mini theme-primary fixed">
	  <form id="form1" runat="server">  
 	  <header class="main-header">
	<div class="d-flex align-items-center logo-box justify-content-start">	
		<!-- Logo -->
		<a href="dashboard.aspx" class="logo">
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
		
			<li class="dropdown user user-menu">
				<a href="#" class="waves-effect waves-light dropdown-toggle w-auto l-h-12 bg-transparent p-0 no-shadow" data-bs-toggle="dropdown" title="User">
					<div class="d-flex pt-1">
						<div class="text-end me-15">
							<div class="text-end me-10">
					      <asp:Label ID ="Label2" runat="server" class="pt-5 fs-14 mb-0 fw-800 text-primary" ></asp:Label>
							</div>
							<div class="text-end me-10">
								<asp:Label ID ="Label3" runat="server" class="pt-5 fs-14 mb-0 fw-800 text-success" ></asp:Label>
							</div>
							
							

						</div>
						
						<div class="d-flex justify-content-between align-items-center">
   
					<asp:Label ID="email" runat="server" visibility="true"  class="pt-5 fs-14 mb-0 fw-800 text-success"></asp:Label>
										
							</div>
					</div>
				</a>
				
			</li> 

				
						
        </ul>
      </div>
    </nav>
  </header>

	  		<!--#include file = "sidepanel.html" -->
	     <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper rounded-0">
	  <div class="container-full ">
		<!-- Main content -->
		<section class="content">
			<div class="row">
				<div class="col-xxxl-9 col-xl-12 col-12">
					<div class="row">
						<div class="col-xxxl-3 col-xl-4 col-lg-12  col-12">
							<div class="box-body">
								 <asp:Repeater ID="bodyinformation" runat="server">  
                                <ItemTemplate>  
								<div class="media-list">
									<div class="media p-0 bar-0 mb-30">
									  	<a class="align-self-start ms-0" href="#"><img class="avatar avatar-xl bg-white shadow rounded-circle pull-up" src="../images/svg-icon/medical/lungs.png" alt="..."></a>
									  	<div class="media-body align-self-center">
											<p class="mb-0">
											  	<a class="hover-success fs-16" href="#">Lungs</a>
											  	<span class="float-end text-fade">  <%# Eval("lungs") %></span>
											</p>
											<div class="w-p100">
												<div class="progress progress-sm mb-0 mt-5">
													<div class="progress-bar bg-lightgreen" role="progressbar" aria-valuenow="10" aria-valuemin="0" aria-valuemax="10" style="width:  <%# Eval("lungs") %>"></div>
												</div>
											</div>
									  	</div>
									</div>
									
									<div class="media p-0 bar-0 mb-30">
									  	<a class="align-self-start ms-0" href="#"><img class="avatar avatar-xl bg-white shadow rounded-circle pull-up" src="../images/svg-icon/medical/stomach.png" alt="..."></a>
									  	<div class="media-body align-self-center">
											<p class="mb-0">
											  	<a class="hover-success fs-16" href="#">Stomach</a>
											  	<span class="float-end text-fade"> <%# Eval("stomach") %></span>
											</p>
											<div class="w-p100">
												<div class="progress progress-sm mb-0 mt-5">
													<div class="progress-bar bg-lightgreen" role="progressbar" aria-valuenow="99" aria-valuemin="0" aria-valuemax="100" style="width: <%# Eval("stomach") %>"></div>
												</div>
											</div>
									  	</div>
									</div>
									
									<div class="media p-0 bar-0 mb-30">
									  	<a class="align-self-start ms-0" href="#"><img class="avatar avatar-xl bg-white shadow rounded-circle pull-up" src="../images/svg-icon/medical/liver.png" alt="..."></a>
									  	<div class="media-body align-self-center">
											<p class="mb-0">
											  	<a class="hover-success fs-16" href="#">Liver</a>
											  	<span class="float-end text-fade"> <%# Eval("liver") %></span>
											</p>
											<div class="w-p100">
												<div class="progress progress-sm mb-0 mt-5">
													<div class="progress-bar bg-lightgreen" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: <%# Eval("liver") %>"></div>
												</div>
											</div>
									  	</div>
									</div>
									  
									<div class="media p-0 bar-0 mb-30">
									  	<a class="align-self-start ms-0" href="#"><img class="avatar avatar-xl bg-white shadow rounded-circle pull-up p-5" src="../images/svg-icon/medical/heart.png" alt="..."></a>
									  	<div class="media-body align-self-center">
											<p class="mb-0">
											  	<a class="hover-success fs-16" href="#">Heart</a>
											  	<span class="float-end text-fade"> <%# Eval("heart") %></span>
											</p>
											<div class="w-p100">
												<div class="progress progress-sm mb-0 mt-5">
													<div class="progress-bar bg-lightgreen" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:  <%# Eval("heart") %>"></div>
												</div>
											</div>
									  	</div>
									</div>

									<div class="media p-0 bar-0 mb-30">
									  	<a class="align-self-start ms-0" href="#"><img class="avatar avatar-xl bg-white shadow rounded-circle pull-up p-5" src="../images/svg-icon/medical/brain.png" alt="..."></a>
									  	<div class="media-body align-self-center">
											<p class="mb-0">
											  	<a class="hover-success fs-16" href="#">Brain</a>
											  	<span class="float-end text-fade"> <%# Eval("brain") %></span>
											</p>
											<div class="w-p100">
												<div class="progress progress-sm mb-0 mt-5">
													<div class="progress-bar bg-lightgreen" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: <%# Eval("brain") %>"></div>
												</div>
											</div>
									  	</div>
									</div>
									 </ItemTemplate>  
                                     </asp:Repeater> 
								</div>
							</div>
						</div>
						<div class="col-xxxl-5 col-xl-4 col-lg-6 col-12">
							<div class="box">
								<div class="box-body d-flex p-0">
									<div class="flex-grow-1 px-30 pt-20 pb-20 flex-grow-1 bg-img min-h-350 back-body">
										<h1 class="fw-400">Body <br>Composition</h1>
										<div class="w-p50">
											<div id="donut-chart" style="max-height: 180px;"></div>
										</div>
										<div>
											<div class="row mt-20">
												<div class="col-xxxl-5 col-xl-6 col-lg-5 col-md-5 col-sm-5">
													<div class="align-items-start mb-20">
														<p class="m-0"><span class="badge badge-sm bg-lightgreen p-1 w-20"></span></p>
														<p class="mb-0"> <%# Eval("oxygen") %><span class="text-fade ms-10"> Oxygen</span></p>
													</div>
													<div class="align-items-start mb-20">
														<p class="m-0"><span class="badge badge-sm bg-lightorange p-1 w-20"></span></p>
														<p class="mb-0"> <%# Eval("carbon") %><span class="text-fade ms-10"> Carbon</span></p>
													</div>
													<div class="align-items-start mb-5">
														<p class="m-0"><span class="badge badge-sm bg-lilac p-1 w-20"></span></p>
														<p class="mb-0"> <%# Eval("hydrogen") %><span class="text-fade ms-0 ms-xl-10"> Hydrogen</span></p>
													</div>
												</div>
												<div class="col-xxxl-6 col-xl-6 col-lg-6 col-md-6 col-sm-5">
													<div class="align-items-start mb-20">
														<p class="m-0"><span class="badge badge-sm bg-Tacha p-1 w-20"></span></p>
														<p class="mb-0"> <%# Eval("nitrogen") %><span class="text-fade ms-10"> Nitrogen</span></p>
													</div>
													<div class="align-items-start mb-20">
														<p class="m-0"><span class="badge badge-sm bg-purple p-1 w-20"></span></p>
														<p class="mb-0"> <%# Eval("calcium") %> <span class="text-fade ms-10"> Calcium</span></p>
													</div>

													<div class="align-items-start mb-5">
														<p class="m-0"><span class="badge badge-sm bg-shadow-green p-1 w-20"></span></p>
														<p class="mb-0"> <%# Eval("other") %> <span class="text-fade ms-10"> Other</span></p>
													</div>
												</div>
											</div>

										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xxxl-4 col-xl-4 col-lg-6 col-12 ">
							<div class="box pull-up">
								<div class="flexbox align-items-center px-20 pt-20">
									<label class="toggler toggler-danger fs-16">
										<input type="checkbox" checked="">
									</label>
									<div class="dropdown">
										<a data-bs-toggle="dropdown" href="#" aria-expanded="false" class=""><i class="ti-settings text-fade"></i></a>
										<div class="dropdown-menu dropdown-menu-end" style="">
											<a class="dropdown-item" href="#"><i class="fa fa-user"></i> Profile</a>
											<a class="dropdown-item" href="#"><i class="fa fa-picture-o"></i> Shots</a>
											<a class="dropdown-item" href="#"><i class="ti-check"></i> Follow</a>
											<div class="dropdown-divider"></div>
											<a class="dropdown-item" href="#"><i class="fa fa-ban"></i> Block</a>
										</div>
									</div>
								</div>
								<div class="box-body px-0 pt-0 bb-1 text-center">
									<div class="avatar avatar-xl">
										<img src="../images/avatar/avatar-13.png" class="rounded-circle bg-lightgreen" alt="">
									</div>
									<h4 class="mt-20 mb-0">Andrien Bertrand</h4>
									<p class="mb-0 text-light">Last Chekin : 04 jan 2022</p>
									<div class="mt-20">
										<div class="row justify-content-center text-start">
											<label class="col-xxxl-3 col-xl-4 col-lg-4 col-md-3 col-sm-3 col-3  text-light">Sex</label>
											<div class="col-xxxl-4 col-xl-4 col-lg-4 col-md-4 col-sm-4 col-4">
												<p class="mb-0">: Male</p>
											</div>
										</div>
										<div class="row justify-content-center text-start mt-10">
											<label class="col-xxxl-3 col-xl-4 col-lg-4 col-md-3 col-sm-3 col-3  text-light">Age</label>
											<div class="col-xxxl-4 col-xl-4 col-lg-4 col-md-4 col-sm-4 col-4">
												<p class="mb-0">: 78</p>
											</div>
										</div>
										<div class="row justify-content-center text-start mt-10">
											<label class="col-xxxl-3 col-xl-4 col-lg-4 col-md-3 col-sm-3 col-3 text-light">Dept.</label>
											<div class="col-xxxl-4 col-xl-4 col-lg-4 col-md-4 col-sm-4 col-4">
												<p class="mb-0">: Cardiology</p>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="box box-body pull-up" href="#">
								<div>
									<h4 class="box-title mb-0">Latest Diagnosis</h4>
									<ul class="box-controls pull-right">
									  	<li class="dropdown">
											<a data-bs-toggle="dropdown" href="#" class="px-10 pt-0"><i class="ti-more-alt rotate-90 px-0"></i></a>
											<div class="dropdown-menu dropdown-menu-end">
										  		<a class="dropdown-item" href="#"><i class="ti-import"></i> Import</a>
										  		<a class="dropdown-item" href="#"><i class="ti-export"></i> Export</a>
										  		<a class="dropdown-item" href="#"><i class="ti-printer"></i> Print</a>
										  	<div class="dropdown-divider"></div>
										  	<a class="dropdown-item" href="#"><i class="ti-settings"></i> Settings</a>
											</div>
									  	</li>
									</ul>
								</div>
							  	<div class="d-flex align-items-center">
									<img class="me-10 avatar avatar-lg " src="https://medical-admin-template.multipurposethemes.com/images/svg-icon/medical/icon-heart.svg" alt="...">
									<div class="text-start">
								  		<h3 class="text-lightgreen mb-0">Heart Disease</h3>
								  		<p class="text-light">Dilate Cardiomyopathy</p>
									</div>
							  	</div>
							  	<div class=" mt-10">
									<a href="reports.html"  class="waves-effect waves-light w-p100 btn text-start btn-warning-light">Illness History <i class="ti-arrow-right pull-right fs-20"></i></a>
								</div>
							</div>
						</div>

						<div class="col-xxxl-7 col-xl-7 col-lg-6 col-12">
							<div class="box">
								<div class="box-header no-border pb-0">
									<h4 class="box-title">Calories Stats</h4>
								</div>
								<div class="box-body">
									<div id="charts_widget_1_chart" class="h-250 w-p100"></div>
								</div>
							</div>
						</div>
						<div class="col-xxxl-5 col-xl-5 col-lg-6 col-12">
							<div class="box box-body progress-box">
								<h4 class="box-title mb-0">Monthly Progress</h4>
								<div id="chart-1"></div>
								<p class="text-center text-light m-0">The patient has reached <span class="text-info fw-600">85%</span> of the theropeutic target</p>
							</div>
						</div>
					</div>					
				</div>
				<div class="col-xxxl-3 col-xl-12 col-12">
					<div class="row">
						<div class="col-xxxl-12 col-xl-8 col-lg-6">
							<div class="box mb-20 calendar-box">
								<div class="box-body">
									<div id="calendar" class="fc fc-unthemed fc-ltr"></div>	
								</div>
							</div>
						</div>
						<div class="col-xxxl-12 col-xl-4 col-lg-6">
							<div class="box box-solid  bg-lightgreen mb-15 pull-up">
							  	<div class="box-header with-border bg-temple-dark">
							  		<div>
										<h3 class="box-title">Physiotherapy</h3>
										<p class="m-0 ">07 Dec 2022</p>
										<p class="m-0 ">Dr. Anastasia Lindsey</p>
									</div>
									<div class="box-controls pull-right mt-10">
										<a href="doctors.html" class="avatar avatar-lg bg-lightorange rounded-circle p-15">
											<i class="ti-arrow-right pull-right fs-20 text-white"></i>
										</a>
									</div>
							  	</div>

							  	<div class="box-body">
									<h4 class="mt-0 text-dark mb-10">Electrical transcutaneous nerve stimulation</h4>
									<p class="mb-5">08:00-09:00</p>
									<p class="fw-500 text-light hover-primary "><i class="mdi mdi-attachment text-lightgreen rotate-90 fs-18"></i> Physiotherapy report.pdf</p>
							  	</div>
							</div>

							<div class="box box-body box-header mb-15 pull-up">
								<h4 class="mt-0 text-dark mb-5">Medical Checkup</h4>
								<p class="text-fade mb-5">08 Dec 2022</p>
								<p class="m-0">Dr. Minerva Tingey</p>
								<div class="box-controls pull-right">
									<div class="avatar avatar-xxl">
										<img src="../images/check-1.png">
									</div>
								</div>
							</div>

							<div class="box box-body box-header mb-15 pull-up">
								<h4 class="box-title mb-5">Heart Checkup</h4>
								<p class="text-fade mb-5">09 Dec 2022</p>
								<p class="m-0">Dr. Minerva Tingey</p>
								<div class="box-controls pull-right">
									<div class="avatar avatar-xxl">
										<img src="../images/check-2.png">
									</div>
								</div>
							</div>
						</div>
					</div>
					

					
				</div>
			</div>				
		</section>
		<!-- /.content -->
	  </div>
  </div>

</form> 
    	<script src="js/vendors.min.js"></script>
	<script src="js/pages/chat-popup.js"></script>
    <script src="/css/assets/icons/feather-icons/feather.min.js"></script>
	<script src="/css/assets/vendor_components/apexcharts-bundle/dist/apexcharts.js"></script>
	<script src="/css/rawgit.com/nnnick/Chart.js/v1.0.2/Chart.min.js"></script>
	<script src="/css/assets/vendor_components/raphael/raphael.min.js"></script>
	<script src="/css/assets/vendor_components/morris.js/morris.min.js"></script>
	<script src="/css/assets/vendor_components/fullcalendar/lib/moment.min.js"></script>
	<script src="/css/assets/vendor_components/fullcalendar/fullcalendar.min.js"></script>

	
	
	<!-- Doclinic App -->
		<!-- Doclinic App -->
	<script src="/js/template.js"></script>
	<script src="/js/pages/dashboard4.js"></script>
	<script src="/js/pages/calendar.js"></script>
	
</body>
</html>