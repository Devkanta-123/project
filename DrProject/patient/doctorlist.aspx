<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="doctorlist.aspx.cs" Inherits="DrProject.patient.doctorlist" %>

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
                  <asp:Image ID="profile" runat="server" class="me-10 avatar rounded-circle"  />  
										
							</div>
					</div>
				</a>
				
			</li> 
 <%--<asp:LinkButton ID="logout" runat="server" class="pt-5 fs-10 mb-0 fw-800 text-danger" OnClick="logout_Click">Logout</asp:LinkButton>--%>
        </ul>
      </div>
    </nav>
  </header>
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
				  <a href="doctorlist.aspx">
					<i class="icon-Compiling"><span class="path1"></span><span class="path2"></span></i>
					<span>Doctor</span>
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
				


</ul>
		  </div>
		</div>


    </section>
  </aside>

		  <div class="content-wrapper">
	  <div class="container-full">
			
		  	<section class="content">

			    <div class="row">
				  <div class="col-12 col-lg-4">
				<div>
				
				  <div class="box-header no-border p-0">				
					<asp:DataList ID="DataList1"  runat="server" RepeatDirection="Horizontal" RepeatColumns="6">
				<ItemTemplate>
					<div style="width:200px; text-align:center">
						
						<asp:Image ID="Image1" runat="server" ImageUrl='<%# Bind("profile", "{0}" ) %>' class="img-fluid" />	
						<br/>
						 
						First Name: <asp:Label ID="docname"  class="pt-5 fs-14 mb-0 fw-800 text-success" runat="server" Text='<%# Eval("fname") %>'></asp:Label>,
						<asp:Label ID="degn" class="pt-5 fs-14 mb-0 fw-800 text-warning"  runat="server" Text='<%# Eval("designation")%>'></asp:Label>
						<br/>
						DEPT: <asp:Label ID="deptname" class="pt-5 fs-14 mb-0 fw-800 text-info"  runat="server" Text='<%# Eval("dept_name")%>'></asp:Label>
						<br/>
						Phn no: <asp:Label ID="docphone"  class="pt-5 fs-14 mb-0 fw-800 text-danger" runat="server" Text='<%# Eval("phno")%>'></asp:Label>
						<br/>
						
					</div>
					
					
				</ItemTemplate>

			</asp:DataList>
				  </div>
				  
				</div>
				</div>
				</div>
				</section>

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
	

	<script src="js/template.js"></script>
	<script src="js/pages/dashboard3.js"></script>
    	
</body>
</html>