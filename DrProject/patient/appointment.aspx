<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="appointment.aspx.cs" Inherits="DrProject.patient.appointment" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <style type="text/css">
    .progress
    {
        width: 100%;
        list-style: none;
        list-style-image: none;
        margin: 20px 0 20px 0;
        padding: 0;
    }
            
    .progress li
    {
        float: left;
        text-align: center;
        position: relative;
    }
            
    .progress .name
    {
        display: block;
        vertical-align: bottom;
        text-align: center;
        margin-bottom: 1em;
        color: black;
        opacity: 0.3;
    }
            
    .progress .step
    {
        color: black;
        border: 3px solid silver;
        border-radius: 50%;
        line-height: 1.2;
        width: 1.2em;
        height: 1.2em;
        display: inline-block;
        z-index: 0;
    }
            
    .progress .step span
    {
        opacity: 0.3;
    }
            
    .progress .active .name, .progress .active .step span
    {
        opacity: 1;
    }
            
    .progress .step:before
    {
        content: "";
        display: block;
        background-color: blue;
        height: 0.4em;
        width: 50%;
        position: absolute;
        bottom: 0.6em;
        left: 0;
        z-index: -1;
    }
            
    .progress .step:after
    {
        content: "";
        display: block;
        background-color: blue;
        height: 0.4em;
        width: 50%;
        position: absolute;
        bottom: 0.6em;
        right: 0;
        z-index: -1;
    }
            
    .progress li:first-of-type .step:before
    {
        display: none;
    }
            
    .progress li:last-of-type .step:after
    {
        display: none;
    }
            
    .progress .done .step, .progress .done .step:before, .progress .done .step:after, .progress .active .step, .progress .active .step:before
    {
        background-color: lightgreen;
    }
            
    .progress .done .step, .progress .active .step
    {
        border: 3px solid lightblue;
    }
 
</style>

    <link rel="stylesheet" href="/css/style.css" />
    <link rel="stylesheet" href="/css/skin_color.css" />
    <link rel="icon" href="https://medical-admin-template.multipurposethemes.com/images/favicon.ico" />
    	 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
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
			 <div class="col-12 col-lg-8">
				<div class="box">
				  <div class="box-header bg-primary">
						<h4><i class="ti-clipboard "></i>  Your  Appointment Info</h4>
						</div>
						<asp:GridView ID="yourappointment" runat="server" AutoGenerateColumns="false"   EmptyDataText="No records founds."  CssClass="table table-bordered table-hover display nowrap margin-top-4 w-p100 table-responsive" Width="40px">
    <Columns>
        <asp:BoundField DataField="appointment_id" HeaderText="Appoinmment ID" />
        <asp:BoundField DataField="appoint_date" HeaderText="Appointment Date" />
        <asp:BoundField DataField="appoint_time" HeaderText="Appointment Time" />
        <asp:BoundField DataField="fname" HeaderText="Doctor Name"/>
        <asp:BoundField DataField="fees" HeaderText="Consultation Fees"/>
        <asp:BoundField DataField="payment_status" HeaderText="Payment Status"/>
    </Columns>
</asp:GridView>		

				</div>  
				</div>  
                <div class="col-12 col-lg-4">
				<div class="box">
				  <div class="box-header bg-success">
					<h4 class="box-title">Trace your Appointment</h4>
				  </div>
				  <div class="box-body">

					<form class="form-inline mt-20">
						<div class="input-group w-p100">
						
							     <asp:TextBox runat="server" ID="txtOrderId" class="form-control"  placeholder="Appointment ID.."/>
                     <asp:Button ID="btnStatus" class="btn btn-danger"  Text="Check Status" runat="server" />
						<ol class="progress">
    <li><span class="name">Booked</span> <span class="step"><span>1</span></span> </li>
    <li><span class="name">Approved</span> <span class="step"><span>2</span></span></li>
    <li><span class="name">OngoingTreatment</span> <span class="step"><span>3</span></span></li>
    <li><span class="name">Completed</span> <span class="step"><span>3</span></span></li>
   
</ol>
							<!-- /btn-group -->
						</div>
					</form>

				  </div>
				</div>			 


				

			  </div>
				</div> 
			   				  
		
			   </section>
				</div>  
				
 		 
    <div>  
   </div>  
</form> 
    	
		<script src="/css/assets/vendor_components/apexcharts-bundle/dist/apexcharts.js"></script>
	<script src="/css/assets/vendor_components/OwlCarousel2/dist/owl.carousel.js"></script>
   <script src="/js/vendors.min.js"></script>
	<script src="/js/pages/chat-popup.js"></script>
    <script src="/css/assets/icons/feather-icons/feather.min.js"></script>
	<script src="/js/pages/chart-widgets.js"></script>
    <script src="/js/pages/chartjs-int.js"></script>
		<script src="js/pages/dashboard2.js"></script>
	    <script src="/js/jquery.easing.min.js"></script>
	 <script src="/js/jquery.min.js"></script>
  <script src="/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript">
    $(function () {
        $('[id*=btnStatus]').on('click', function () {
            var id = $('[id*=txtOrderId]').val();
            $.ajax({
                type: "POST",
                url: "appointment.aspx/GetStatus",
                data: '{appointID: "' + id + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    $('ol li').removeClass();
                    var status = response.d;
                    var i;
                    $('ol li').each(function (index, item) {
                        if ($(this).find('.name').html() == status) {
                            i = index;
                        }
                    });
                    $('ol li').each(function (index, item) {
                        if (i == index) {
                            $(this).addClass("active");
                        } else if (i > index) {
                            $(this).addClass("done");
                        } else {
                            $(this).removeClass;
                        }
                    });
                }, failure: function (response) {
                    alert(response.responseText);
                }, error: function (response) {
                    alert(response.responseText);
                }
            });
            return false;
        });
    });
    </script>

</body>
</html>