<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="appointment.aspx.cs" Inherits="DrProject.patient.appointment" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="/css/vendors_css.css" />

    <!-- Style-->
    <link rel="stylesheet" href="/css/style.css" />
    <link rel="stylesheet" href="/css/skin_color.css" />
    <link rel="icon" href="https://medical-admin-template.multipurposethemes.com/images/favicon.ico" />
    	 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
                  <asp:Image ID="profile" runat="server" class="me-10 avatar rounded-circle"  />  
										
							</div>
					</div>
				</a>
				
			</li> 

				<asp:Label ID ="patient_id" Visible="false" runat="server" class="pt-5 fs-14 mb-0 fw-800 text-success" ></asp:Label>
						
        </ul>
      </div>
    </nav>
  </header>
	  		<!--#include file = "sidepanel.html" -->
	     <div class="content-wrapper">
	  <div class="container-full">
       	<section class="content">
			<div class="row">			  
				<div class="col-lg-12 col-12">
					  <div class="box">
						<div class="box-header with-border">
						<h4><i class="ti-clipboard "></i>Your  Appointment Info</h4>
						</div>
						<asp:GridView ID="yourappointment" runat="server" AutoGenerateColumns="false"   EmptyDataText="No records founds."  CssClass="table table-bordered table-hover display nowrap margin-top-4 w-p100 table-responsive" Width="40px">
    <Columns>
        <asp:BoundField DataField="appointment_id" HeaderText="Appoinmment ID" />
        <asp:BoundField DataField="appoint_date" HeaderText="Appointment Date" />
        <asp:BoundField DataField="appoint_time" HeaderText="Appointment Time" />
        <asp:BoundField DataField="status" HeaderText=" Appointment Status" />
        <asp:BoundField DataField="fname" HeaderText="Doctor Name"/>
        <asp:BoundField DataField="fees" HeaderText="Consultation Fees"/>
    </Columns>
</asp:GridView>			
				</div>  
				</div>  
				</div> 
			   </section>
				</div>  
				
 
    <div>  
   </div>  
</form> 
    
</body>
</html>