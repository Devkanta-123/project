﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="DrProject.doctor.dashboard" %>

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
					<div class="search-bx mx-5">
						
					</div>
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
						<div class="text-end me-10">
							
						   <asp:Label ID ="Label2" runat="server" class="pt-5 fs-14 mb-0 fw-700 text-primary" ></asp:Label>
						
						</div>
						
					</div>
				</a>
				<ul class="dropdown-menu animated flipInX">
				  <li class="user-body">
					 <button type="button" class="btn btn-primary  btn-sm" data-bs-toggle="modal" data-bs-target="#modal-center">
				Profile
				  </button>
					 <asp:LinkButton ID="logout" runat="server" class="pt-5 fs-10 mb-0 fw-800 text-danger" OnClick="logout_Click">Logout</asp:LinkButton>
				  </li>
				</ul>
			</li>	
			
	
		  <li class="dropdown notifications-menu">
			<a href="#" class="waves-effect waves-light dropdown-toggle btn-info-light" data-bs-toggle="dropdown" title="Notifications">
			  <i class="ti-bell"><span class="path1"></span><span class="path2"></span></i>
			</a>
			<ul class="dropdown-menu animated bounceIn">
			  <li class="header">
				<div class="p-20">
					<div class="flexbox">
						
						<div>
							<a href="#" class="text-warning">Today's Appointment</a>
						</div>
					</div>
				</div>
			  </li>
			  <li>
			<asp:GridView ID="fetchpatient" runat="server"  class="table mb-0  table-responsive">
                                                </asp:GridView>
				
			  </li>
			  <li class="footer">
				  <a href="#">View all</a>
			  </li>
			</ul>
		  </li>			  
        
			
        </ul>
      </div>
    </nav>
  </header>
		  <!-- Control Sidebar Toggle Button -->
       <div class="modal center-modal fade" id="modal-center" tabindex="-1">
	               <div class="modal-dialog">
	 

			  	  <div class="col-lg-10 col-12">
				  <div class="box box-widget widget-user">
					<div class="widget-user-header bg-img" style="background: url(../images/gallery/creative/img-8.jpg) center center;" data-overlay="5">
					 <asp:Label ID ="Label3" runat="server" class="widget-user-username text-white" ></asp:Label>
				
					</div>
					<div class="widget-user-image">
					 <asp:Image ID="profile" runat="server"  class="rounded-circle bg-warning-light"/> 
					
					</div>
					<div class="box-footer">
					  <div class="row mt-30">
						<div class="col-sm-4">
						  <div class="description-block">
						<span class="description-text">PHNO</span>
					   <asp:Label ID ="Label1" runat="server" class="pt-5 fs-14 mb-0 fw-800 text-warning" ></asp:Label>
						  </div>
						</div>
						<div class="col-sm-4">
						  <div class="description-block">
					      <span class="description-text">ADDRESS</span> </br>
						  <asp:Label ID ="Label4" runat="server" class="pt-5 fs-14 mb-0 fw-800 text-warning" ></asp:Label>
						  </div>
						</div>

						<div class="col-sm-4">
						  <div class="description-block">
							   <span class="description-text">EXPERIENCE</span> </br>
						  <asp:Label ID ="expe" runat="server" class="pt-5 fs-14 mb-0 fw-800 text-warning" ></asp:Label>
						  </div>
						</div>
						    
						
					  </div>
					</div>
				  </div>
			  </div>
	
	</div>
	</div>

		<aside>
 <section class="sidebar position-relative">
	  	<div class="multinav">
		  <div class="multinav-scroll" style="height: 100%;">	
			  <!-- sidebar menu-->
			  <ul class="sidebar-menu" data-widget="tree">			
				<li class="treeview">
				  <a href="#">
					<i class="icon-Layout-4-blocks"><span class="path1"></span><span class="path2"></span></i>
					<span>Dashboard</span>
					<span class="pull-right-container">
					  <i class="fa fa-angle-right pull-right"></i>
					</span>
				  </a>
				  <ul class="treeview-menu">
					<li><a href="index.html"><i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>Patients Dashboard</a></li>
					<li><a href="index4.html"><i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>Patients Dashboard 2</a></li>
					<li><a href="index2.html"><i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>Doctor Dashboard</a></li>
					<li><a href="index6.html"><i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>Doctor Dashboard 2</a></li>
					<li><a href="index7.html"><i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>Doctor Dashboard 3</a></li>
					<li><a href="index3.html"><i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>Hospital Dashboard</a></li>
					<li><a href="index5.html"><i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>Hospital Dashboard 2</a></li>
				  </ul>
				</li>
				<li>
				  <a href="appointments.html">
					<i class="icon-Barcode-read"><span class="path1"></span><span class="path2"></span></i>
					<span>Appointments</span>
				  </a>
				</li>			
				<li class="treeview">
				  <a href="#">
					<i class="icon-Compiling"><span class="path1"></span><span class="path2"></span></i>
					<span>Patients</span>
					<span class="pull-right-container">
					  <i class="fa fa-angle-right pull-right"></i>
					</span>
				  </a>
				  <ul class="treeview-menu">
					<li><a href="patients.html"><i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>Patients</a></li>
					<li><a href="patient_details.html"><i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>Patient Details</a></li>
				  </ul>
				</li>
				<li>
				  <a href="reports.html">
					<i class="icon-Settings-1"><span class="path1"></span><span class="path2"></span></i>
					<span>Reports</span>
				  </a>
				</li>				
				<li class="treeview">
				  <a href="#">
					<i class="icon-Diagnostics"><span class="path1"></span><span class="path2"></span><span class="path3"></span></i>
					<span>Doctors</span>
					<span class="pull-right-container">
					  <i class="fa fa-angle-right pull-right"></i>
					</span>
				  </a>
				  <ul class="treeview-menu">
					<li><a href="doctor_list.html"><i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>Doctors</a></li>
					<li><a href="doctors.html"><i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>Doctor Details</a></li>
				  </ul>
				</li>
				<li class="header">Components</li>
				<li class="treeview">
				  <a href="#">
					<i class="icon-Library"><span class="path1"></span><span class="path2"></span></i>
					<span>Features</span>
					<span class="pull-right-container">
					  <i class="fa fa-angle-right pull-right"></i>
					</span>
				  </a>
				  <ul class="treeview-menu">											
					<li class="treeview">
						<a href="#">
							<i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>Card
							<span class="pull-right-container">
								<i class="fa fa-angle-right pull-right"></i>
							</span>
						</a>
						<ul class="treeview-menu">
							<li><a href="box_cards.html"><i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>User Card</a></li>
							<li><a href="box_advanced.html"><i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>Advanced Card</a></li>
							<li><a href="box_basic.html"><i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>Basic Card</a></li>
							<li><a href="box_color.html"><i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>Card Color</a></li>
							<li><a href="box_group.html"><i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>Card Group</a></li>
						</ul>
					</li>												
					<li class="treeview">
						<a href="#">
							<i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>BS UI
							<span class="pull-right-container">
								<i class="fa fa-angle-right pull-right"></i>
							</span>
						</a>
						<ul class="treeview-menu">
							<li><a href="ui_grid.html"><i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>Grid System</a></li>
							<li><a href="ui_badges.html"><i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>Badges</a></li>
							<li><a href="ui_border_utilities.html"><i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>Border</a></li>
							<li><a href="ui_buttons.html"><i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>Buttons</a></li>	
							<li><a href="ui_color_utilities.html"><i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>Color</a></li>
							<li><a href="ui_dropdown.html"><i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>Dropdown</a></li>
							<li><a href="ui_dropdown_grid.html"><i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>Dropdown Grid</a></li>
							<li><a href="ui_progress_bars.html"><i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>Progress Bars</a></li>
						</ul>
					</li>										
					<li class="treeview">
						<a href="#">
							<i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>Icons
							<span class="pull-right-container">
								<i class="fa fa-angle-right pull-right"></i>
							</span>
						</a>
						<ul class="treeview-menu">
							<li><a href="icons_fontawesome.html"><i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>Font Awesome</a></li>
							<li><a href="icons_glyphicons.html"><i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>Glyphicons</a></li>
							<li><a href="icons_material.html"><i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>Material Icons</a></li>	
							<li><a href="icons_themify.html"><i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>Themify Icons</a></li>
							<li><a href="icons_simpleline.html"><i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>Simple Line Icons</a></li>
							<li><a href="icons_cryptocoins.html"><i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>Cryptocoins Icons</a></li>
							<li><a href="icons_flag.html"><i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>Flag Icons</a></li>
							<li><a href="icons_weather.html"><i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>Weather Icons</a></li>
						</ul>
					</li>									
					<li class="treeview">
						<a href="#">
							<i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>Custom UI
							<span class="pull-right-container">
								<i class="fa fa-angle-right pull-right"></i>
							</span>
						</a>
						<ul class="treeview-menu">
							<li><a href="ui_ribbons.html"><i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>Ribbons</a></li>
							<li><a href="ui_sliders.html"><i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>Sliders</a></li>
							<li><a href="ui_typography.html"><i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>Typography</a></li>
							<li><a href="ui_tab.html"><i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>Tabs</a></li>
							<li><a href="ui_timeline.html"><i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>Timeline</a></li>
							<li><a href="ui_timeline_horizontal.html"><i class="icon-Commit"><span class="path1"></span><span class="path2"></span></i>Horizontal Timeline</a></li>
						</ul>
					</li>	  
			 
		  </div>
		</div>
    </section>
  </aside>
		 <div class="content-wrapper">
	  <div class="container-full">
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="d-flex align-items-center">
		
		<section class="content">

		  <div class="row">
	
			<div class="col-xl-4 col-12">
			  <div class="info-box bg-info">
				<span class="info-box-icon push-bottom rounded"><span class="icon-User"><span class="path1"></span><span class="path2"></span></span></span>

				<div class="info-box-content">
				  <span class="info-box-text">New Clients</span>
				  <span class="info-box-number">450</span>

				  <div class="progress">
					<div class="progress-bar" style="width: 45%"></div>
				  </div>
				  <span class="progress-description">
						45% Increase in 28 Days
					  </span>
				</div>
				<!-- /.info-box-content -->
			  </div>
			  <!-- /.info-box -->
			</div>
			<!-- /.col -->
			<div class="col-xl-4 col-12">
			  <div class="info-box bg-success">
				<span class="info-box-icon push-bottom rounded-circle"><span class="icon-Smile"><span class="path1"></span><span class="path2"></span></span></span>

				<div class="info-box-content">
				  <span class="info-box-text">Total Visits</span>
				  <span class="info-box-number">15,489</span>

				  <div class="progress">
					<div class="progress-bar" style="width: 40%"></div>
				  </div>
				  <span class="progress-description">
						40% Increase in 28 Days
					  </span>
				</div>
				<!-- /.info-box-content -->
			  </div>
			  <!-- /.info-box -->
			</div>
			<!-- /.col -->
			<div class="col-xl-4 col-12">
			  <div class="info-box box-inverse bg-img" style="background-image: url(../images/gallery/creative/img-10.jpg);" data-overlay="5">
				<span class="info-box-icon push-bottom rounded"><span class="icon-Cloud-download"><span class="path1"></span><span class="path2"></span></span></span>

				<div class="info-box-content">
				  <span class="info-box-text">Downloads</span>
				  <span class="info-box-number">55,005</span>

				  <div class="progress">
					<div class="progress-bar" style="width: 85%"></div>
				  </div>
				  <span class="progress-description">
						85% Increase in 28 Days
					  </span>
				</div>
				<!-- /.info-box-content -->
			  </div>
			  <!-- /.info-box -->
			</div>
			<!-- /.col -->
		  </div>
		
			</section>
	</div>
	</div>
	</div>

    </form>
   <script src="/js/vendors.min.js"></script>
	<script src="/js/pages/chat-popup.js"></script>
    <script src="/css/assets/icons/feather-icons/feather.min.js"></script>
	<script src="/js/pages/chart-widgets.js"></script>
    <script src="/js/pages/chartjs-int.js"></script>
    	
</body>
</html>