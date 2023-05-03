<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="invoice.aspx.cs" Inherits="DrProject.invoice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   
    <link rel="icon" href="https://medical-admin-template.multipurposethemes.com/images/favicon.ico"/>

    <title>Doclinic - Dashboard  Invoice </title>
  
	<!-- Vendors Style-->
	<link rel="stylesheet" href="css/vendors_css.css"/>
	  
	<!-- Style-->  
	<link rel="stylesheet" href="css/style.css"/>
	<link rel="stylesheet" href="css/skin_color.css"/>
    
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
		  <div class="logo-mini w-50">
			  <span class="light-logo"><img src="../images/logo-letter.png" alt="logo"></span>
			  <span class="dark-logo"><img src="../images/logo-letter.png" alt="logo"></span>
		  </div>
		  <div class="logo-lg">
			  <span class="light-logo"><img src="../images/logo-dark-text.png" alt="logo"></span>
			  <span class="dark-logo"><img src="../images/logo-light-text.png" alt="logo"></span>
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
						
							<div class="input-group">
							  <input type="search" class="form-control" placeholder="Search">
							  <div class="input-group-append">
								<button class="btn" type="submit" id="button-addon3"><i class="icon-Search"><span class="path1"></span><span class="path2"></span></i></button>
							  </div>
							</div>
						
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
							<p class="pt-5 fs-14 mb-0 fw-700 text-primary">Johen Doe</p>
							<small class="fs-10 mb-0 text-uppercase text-mute">Admin</small>
						</div>
						<img src="../images/avatar/avatar-1.png" class="avatar rounded-10 bg-primary-light h-40 w-40" alt="" />
					</div>
				</a>
				<ul class="dropdown-menu animated flipInX">
				  <li class="user-body">
					 <a class="dropdown-item" href="extra_profile.html"><i class="ti-user text-muted me-2"></i> Profile</a>
					 <a class="dropdown-item" href="auth_login.html"><i class="ti-lock text-muted me-2"></i> Logout</a>
				  </li>
				</ul>
			</li>	
			<li class="btn-group nav-item d-lg-inline-flex d-none">
				<a href="#" data-provide="fullscreen" class="waves-effect waves-light nav-link full-screen btn-warning-light" title="Full Screen">
					<i class="icon-Position"></i>
			    </a>
			</li>
		  <!-- Notifications -->
		  <li class="dropdown notifications-menu">
			<a href="#" class="waves-effect waves-light dropdown-toggle btn-info-light" data-bs-toggle="dropdown" title="Notifications">
			  <i class="icon-Notification"><span class="path1"></span><span class="path2"></span></i>
			</a>
			<ul class="dropdown-menu animated bounceIn">
			  <li class="header">
				<div class="p-20">
					<div class="flexbox">
						<div>
							<h4 class="mb-0 mt-0">Notifications</h4>
						</div>
						<div>
							<a href="#" class="text-danger">Clear All</a>
						</div>
					</div>
				</div>
			  </li>
			  <li>
				<!-- inner menu: contains the actual data -->
				<ul class="menu sm-scrol">
				  <li>
					<a href="#">
					  <i class="fa fa-users text-info"></i> Curabitur id eros quis nunc suscipit blandit.
					</a>
				  </li>
				  <li>
					<a href="#">
					  <i class="fa fa-warning text-warning"></i> Duis malesuada justo eu sapien elementum, in semper diam posuere.
					</a>
				  </li>
				  <li>
					<a href="#">
					  <i class="fa fa-users text-danger"></i> Donec at nisi sit amet tortor commodo porttitor pretium a erat.
					</a>
				  </li>
				  <li>
					<a href="#">
					  <i class="fa fa-shopping-cart text-success"></i> In gravida mauris et nisi
					</a>
				  </li>
				  <li>
					<a href="#">
					  <i class="fa fa-user text-danger"></i> Praesent eu lacus in libero dictum fermentum.
					</a>
				  </li>
				  <li>
					<a href="#">
					  <i class="fa fa-user text-primary"></i> Nunc fringilla lorem 
					</a>
				  </li>
				  <li>
					<a href="#">
					  <i class="fa fa-user text-success"></i> Nullam euismod dolor ut quam interdum, at scelerisque ipsum imperdiet.
					</a>
				  </li>
				</ul>
			  </li>
			  <li class="footer">
				  <a href="#">View all</a>
			  </li>
			</ul>
		  </li>			  
          <!-- Control Sidebar Toggle Button -->
          <li class="btn-group nav-item">
              <a href="#" data-toggle="control-sidebar" title="Setting" class="waves-effect full-screen waves-light btn-danger-light">
			  	<i class="icon-Settings1"><span class="path1"></span><span class="path2"></span></i>
			  </a>
          </li>
			
        </ul>
      </div>
    </nav>
  </header>
		 <aside class="main-sidebar">
    <!-- sidebar-->
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
				   
			  </ul>
				  </div>
				  </div>
				  </section>
				  </aside>
		<div class="content-wrapper">
	  <div class="container-full">

		  <div class="content-header">
			<div class="d-flex align-items-center">
				<div class="me-auto">
			
					<h4 class="page-title">Invoice</h4>
					<div class="d-inline-block align-items-center">
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="#"><i class="mdi mdi-home-outline"></i></a></li>
								<li class="breadcrumb-item" aria-current="page">Invoice</li>
								<li class="breadcrumb-item active" aria-current="page">Invoice Sample</li>
							</ol>
						</nav>
					</div>
				</div>
				
			</div>
		</div> 
		  <asp:Panel id="pnlContents" runat = "server">
		  <section class="invoice printableArea">
		  <div class="row">
			<div class="col-12">
			  <div class="bb-1 clearFix">
				<div class="text-end pb-15">
					<button class="btn btn-success" type="button"> <span><i class="fa fa-print"></i> Save</span> </button>
					 <asp:Button ID="btnPrint" runat="server"  class="btn btn-warning" Text="Print" OnClientClick = "return PrintPanel();" />
<%--					<button id="print2" class="btn btn-warning" type="button"> <span><i class="fa fa-print"></i> Print</span> </button>--%>
				</div>	
			  </div>
			</div>
			<div class="col-12">
			  <div class="page-header">
				<h2 class="d-inline"><span class="fs-30">Invoice Sample</span></h2>
				<div class="pull-right text-end">
					<h3>22 April 2018</h3>
				</div>	
			  </div>
			</div>
			<!-- /.col -->
		  </div>
		  <div class="row invoice-info">
			<div class="col-md-6 invoice-col">
			  <strong>From</strong>	
			  <address>
				<strong class="text-blue fs-24">Doclinic</strong><br>
				<strong class="d-inline">124 Lorem Ipsum, Suite 478,  Dummuy, USA 123456</strong><br>
				<strong>Phone: (00) 123-456-7890 &nbsp;&nbsp;&nbsp;&nbsp; Email: info@example.com</strong>  
			  </address>
			</div>
			<!-- /.col -->
			<div class="col-md-6 invoice-col text-end">
			  <strong>To</strong>
			  <address>
				<strong class="text-blue fs-24">Doe Shina</strong><br>
				124 Lorem Ipsum, Suite 478, Dummuy, USA 123456<br>
				<strong>Phone: (00) 789-456-1230 &nbsp;&nbsp;&nbsp;&nbsp; Email: conatct@example.com</strong>
			  </address>
			</div>
			<!-- /.col -->
			<div class="col-sm-12 invoice-col mb-15">
				<div class="invoice-details row no-margin">
				  <div class="col-md-6 col-lg-3"><b>Invoice </b>#0154879</div>
				  <div class="col-md-6 col-lg-3"><b>Order ID:</b> FC12548</div>
				  <div class="col-md-6 col-lg-3"><b>Payment Due:</b> 14/08/2018</div>
				  <div class="col-md-6 col-lg-3"><b>Account:</b> 00215487541296</div>
				</div>
			</div>
		  <!-- /.col -->
		  </div>
		  <div class="row">
			<div class="col-12 table-responsive">
			  <table class="table table-bordered">
				<tbody>
				<tr>
				  <th>#</th>
				  <th>Description</th>
				  <th>Serial #</th>
				  <th class="text-end">Quantity</th>
				  <th class="text-end">Unit Cost</th>
				  <th class="text-end">Subtotal</th>
				</tr>
				<tr>
				  <td>1</td>
				  <td>Milk Powder</td>
				  <td>12345678912514</td>
				  <td class="text-end">2</td>
				  <td class="text-end">$26.00</td>
				  <td class="text-end">$52.00</td>
				</tr>
				<tr>
				  <td>2</td>
				  <td>Air Conditioner</td>
				  <td>12345678912514</td>
				  <td class="text-end">1</td>
				  <td class="text-end">$1500.00</td>
				  <td class="text-end">$1500.00</td>
				</tr>
				<tr>
				  <td>3</td>
				  <td>TV</td>
				  <td>12345678912514</td>
				  <td class="text-end">2</td>
				  <td class="text-end">$540.00</td>
				  <td class="text-end">$1080.00</td>
				</tr>
				<tr>
				  <td>4</td>
				  <td>Mobile</td>
				  <td>12345678912514</td>
				  <td class="text-end">3</td>
				  <td class="text-end">$320.00</td>
				  <td class="text-end">$960.00</td>
				</tr>
				</tbody>
			  </table>
			</div>
			<!-- /.col -->
		  </div>
		  <div class="row">
			<div class="col-12 text-end">
				<p class="lead"><b>Payment Due</b><span class="text-danger"> 14/08/2018 </span></p>

				<div>
					<p>Sub - Total amount  :  $3,592.00</p>
					<p>Tax (18%)  :  $646.56</p>
					<p>Shipping  :  $110.44</p>
				</div>
				<div class="total-payment">
					<h3><b>Total :</b> $4,349.00</h3>
				</div>

			</div>
			<!-- /.col -->
</asp:Panel>
		  </div>
		  <div class="row no-print">
			<div class="col-12">
			  <button type="button" class="btn btn-success pull-right"><i class="fa fa-credit-card"></i> Submit Payment
			  </button>
			</div>
		  </div>
		</section>
	</div>
	</div>
	</div>

    </form>
	<script src="js/vendors.min.js"></script>
	<script src="js/pages/chat-popup.js"></script>
    <script src="css/assets/icons/feather-icons/feather.min.js"></script>	<script src="../assets/vendor_plugins/JqueryPrintArea/demo/jquery.PrintArea.js"></script>
	

	
	   <script type = "text/javascript">
        function PrintPanel() {
            var panel = document.getElementById("<%=pnlContents.ClientID %>");
            var printWindow = window.open('', '', 'height=400,width=800');
            printWindow.document.write('<html><head><title>DIV Contents</title>');
            printWindow.document.write('</head><body >');
            printWindow.document.write(panel.innerHTML);
            printWindow.document.write('</body></html>');
            printWindow.document.close();
            setTimeout(function () {
                printWindow.print();
            }, 500);
            return false;
        }
       </script>
</body>
</html>
