<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="DrProject.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Doctor Appointment System</title>

<link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png"/>
<link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
<link rel="stylesheet" href="/css/assets/css/bootstrap.min.css"/>


<link rel="stylesheet" href="/css/assets/css/owl.carousel.css"/>
<link rel="stylesheet" href="/css/assets/css/owl.theme.default.min.css"/>

<link rel="stylesheet" href="/css/assets/css/style.css"/>
</head>
<body>
    <form id="form1" runat="server">
       <header class="header">
<div class="header-top">
<div class="container">
<div class="row">
<div class="col-md-2 float-left">
<div class="logo">
<a href="index.html"><img alt="Logo" src="images/logo.png" width="56" height="50"/></a>
</div>
</div>
<div class="col-md-10">
<nav class="navbar navbar-expand-md p-0">
<div class="navbar-collapse collapse" id="navbar">
<ul class="nav navbar-nav main-nav float-right ml-auto">
<li class="active nav-item">
<a href="index.html" class="nav-link">Home</a>
</li>
<li class="nav-item">
<a href="about-us.html" class="nav-link">About Us</a>
</li>
<li class="nav-item">
<a href="departments.html" class="nav-link">Departments</a>
</li>
<li class="nav-item">
<a href="services.html" class="nav-link">Services</a>
</li>
<li class="nav-item">
<a href="doctors.html" class="nav-link">Doctors</a>
</li>
<li class="dropdown nav-item">
<a class="dropdown-toggle nav-link" data-toggle="dropdown">Pages <b class="caret"></b></a>
<div class="dropdown-menu dropdown-menu-right">
<a class="dropdown-item" href="patient/PatientLogin.aspx">Login</a>
<a class="dropdown-item" href="patient/register.aspx">Register</a>

</div>
</li>
<li class="nav-item">
<a href="contact-us.html" class="nav-link">Contact Us</a>
</li>
<li class="nav-item">
<a class="btn btn-primary appoint-btn nav-link" href="appointment.html">Appointment</a>
</li>


</ul>
</div>
</nav>
</div>
</div>
</div>
</div>
</header>
        <header class="mobile-header">
<div class="panel-control-left">
<a class="toggle-menu" href="#side_menu"><i class="fas fa-bars"></i></a>
</div>
<div class="page_title">
<a href="index.html"><img src="assets/img/logo.png" alt="Logo" class="img-fluid" width="60" height="60"></a>
</div>
</header>

<div class="sidebar sidebar-menu" id="side_menu">
<div class="sidebar-inner slimscroll">
<a id="close_menu" href="#"><i class="fas fa-times"></i></a>
<ul class="mobile-menu-wrapper" style="display: block;">
<li class="active">
<div class="mobile-menu-item clearfix">
<a href="index.html">Home</a>
</div>
</li>
<li>
<div class="mobile-menu-item clearfix">
<a href="about-us.html">About Us</a>
</div>
</li>
<li>
<div class="mobile-menu-item clearfix">
<a href="departments.html">Departments</a>
</div>
</li>
<li>
<div class="mobile-menu-item clearfix">
<a href="services.html">Services</a>
</div>
</li>
<li>
<div class="mobile-menu-item clearfix">
<a href="doctors.html">Doctors</a>
</div>
</li>
<li>
<div class="mobile-menu-item clearfix">
<a href="#" class="menu-toggle">Blog <i class="fas fa-sort-down  menu-toggle"></i></a>
</div>
<ul class="mobile-submenu-wrapper" style="display: none;">
<li>
<a href="blog.html">Right Sidebar</a>
</li>
<li>
<a href="blog-left-sidebar.html">Left Sidebar</a>
</li>
<li>
<a href="blog-full-width.html">Full Width</a>
</li>
<li>
<a href="blog-grid.html">Blog Grid</a>
</li>
<li>
<a href="blog-details.html">Blog Details</a>
</li>
</ul>
</li>
<li>
<div class="mobile-menu-item clearfix">
<a href="contact-us.html">Contact Us</a>
</div>
</li>
<li>
<div class="mobile-menu-item clearfix">
<a href="appointment.html">Appointment</a>
</div>
</li>
<li>
<div class="mobile-menu-item clearfix">
<a href="login.html">Login</a>
</div>
</li>
<li>
<div class="mobile-menu-item clearfix">
<a href="register.html">Register</a>
</div>
</li>
<li>
<div class="mobile-menu-item clearfix">
<a href="forgot-password.html">Forgot Password</a>
</div>
</li>
<li>
<div class="mobile-menu-item clearfix">
<a href="404.html">404</a>
</div>
</li>
</ul>
</div>
</div>


<div class="main-content">
<section class="section home-banner row-middle">
<div class="inner-bg"></div>
<div class="container">
<div class="row">
<div class="col-lg-9 col-md-9">
<div class="banner-content">
<h1>Clean Medical Template</h1>
<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.</p>

</div>
</div>
</div>
</section>
<section class="section features">
<div class="container">
<div class="row">
<div class="col-12">
<div class="section-header text-center">
<h3 class="header-title">About Medusind</h3>
<div class="line"></div>
<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vitae risus
nec dui venenatis dignissim. Aenean vitae metus in augue pretium ultrices.
Duis dictum eget dolor vel blandit.</p>
</div>
</div>
</div>
<div class="row feature-row">
<div class="col-md-4">
<div class="feature-box">
<div class="feature-img">
<img width="60" height="60" alt="Book an Appointment" src="assets/img/icon-01.png">
</div>
<h4>Book an Appointment</h4>
<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor.
</p>
</div>
</div>
<div class="col-md-4">
<div class="feature-box">
<div class="feature-img">
<img width="60" height="60" alt="Consult with a Doctor" src="assets/img/icon-02.png">
</div>
<h4>Consult with a Doctor</h4>
<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor.
</p>
</div>
</div>

</div>
</div>
</section>
<section class="section meet-doctors">
<div class="container">
<div class="row">
<div class="col-12">
<div class="section-header text-center">
<h3 class="header-title">Meet our Doctors</h3>
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
</div>
<div id="our_doctor" class="owl-carousel text-center">
<div class="item">

</div>



</div>
</section>
<section class="section departments">
<div class="container">
<div class="row">
<div class="row">
<div class="col-12">
	<asp:DataList ID="DataList2"  runat="server" RepeatDirection="Horizontal" RepeatColumns="6">
				<ItemTemplate>
					<div style="width:200px; text-align:center">
						
						<asp:Image ID="Image1" runat="server" ImageUrl='<%# Bind("dept_pic", "{0}" ) %>' class="img-fluid" />	
						<br/>
						 
					Name: <asp:Label ID="docname"  class="pt-5 fs-14 mb-0 fw-800 text-success" runat="server" Text='<%# Eval("dept_name") %>'></asp:Label>,
						<asp:Label ID="degn" class="pt-5 fs-14 mb-0 fw-800 text-warning"  runat="server" Text='<%# Eval("dept_name")%>'></asp:Label>
						<br/>
						Status: <asp:Label ID="deptname" class="pt-5 fs-14 mb-0 fw-800 text-info"  runat="server" Text='<%# Eval("status")%>'></asp:Label>
						<br/>
					
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


 <footer class="footer">
<div class="footer-top">
<div class="container">
<div class="row">
<div class="col-lg-3 col-md-3">
<div class="footer-widget">
<h4 class="footer-title">Location</h4>
<div class="about-clinic">
<p><strong>Address:</strong>
<br>1603 Old York Rd,
<br>Houma, LA, 75429</p>
<p class="m-b-0"><strong>Phone</strong>:
<a href="tel:+8503867896">(850) 386-7896</a>
<br> <strong>Fax</strong>:
<a href="tel:+8503867896">(850) 386-7896</a>
</p>
</div>
</div>
</div>
<div class="col-lg-3 col-md-3">
<div class="footer-widget">
<h4 class="footer-title">Sitemap</h4>
<ul class="footer-menu">
<li>
<a href="about-us.html">About Us</a>
</li>
<li>
<a href="departments.html">Departments</a>
</li>
<li>
<a href="services.html">Services</a>
</li>
<li>
<a href="doctors.html">Doctors</a>
</li>
<li>
<a href="contact-us.html">Contact Us</a>
</li>
</ul>
</div>
</div>
<div class="col-lg-3 col-md-3">
<div class="footer-widget">
<h4 class="footer-title">Blog</h4>
<ul class="footer-menu">
<li>
<a href="blog.html">Right Sidebar</a>
</li>
<li>
<a href="blog-left-sidebar.html">Left Sidebar</a>
</li>
<li>
<a href="blog-full-width.html">Full Width</a>
</li>
<li>
<a href="blog-grid.html">Blog Grid</a>
</li>
<li>
<a href="blog-details.html">Blog Details</a>
</li>
</ul>
</div>
</div>
<div class="col-lg-3 col-md-3">
<div class="footer-widget">
<h4 class="footer-title">Appointment</h4>
<div class="appointment-btn">
<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit</p>
<ul class="social-icons clearfix">
<li>
<a href="#" target="_blank" title="Facebook"><i class="fab fa-facebook-f"></i></a>
</li>
<li>
<a href="#" target="_blank" title="Twitter"><i class="fab fa-twitter"></i></a>
</li>
<li>
<a href="#" target="_blank" title="Linkedin"><i class="fab fa-linkedin-in"></i></a>
</li>
<li>
<a href="#" target="_blank" title="Google Plus"><i class="fab fa-google-plus-g"></i></a>
</li>
<li>
<a href="#" target="_blank" title="Youtube"><i class="fab fa-youtube"></i></a>
</li>
</ul>
</div>
</div>
</div>
</div>
</div>
</div>
<div class="footer-bottom">
<div class="container">
<div class="copyright">
<div class="row">
<div class="col-12">
<div class="copy-text text-center">
<p>&#xA9; 2019 <a href="#">Medifab</a>. All rights reserved.</p>
</div>
</div>
</div>
</div>
</div>
</div>
</footer>


<div class="sidebar-overlay" data-reff="#side_menu"></div>

<script src="css/assets/js/jquery-3.5.1.min.js"></script>

<script src="css/assets/js/popper.min.js"></script>
<script src="css/assets/js/bootstrap.min.js"></script>

<script src="css/assets/js/owl.carousel.min.js"></script>

<script src="css/assets/js/theme.js"></script>
    </form>
</body>
</html>
