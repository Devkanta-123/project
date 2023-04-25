<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="DrProject.admin.Report" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    	<link rel="stylesheet" href="/css/vendors_css.css" /> 
	<link rel="stylesheet" href="/css/style.css"/>
	<link rel="stylesheet" href="/css/skin_color.css"/>
	
</head>
<body class="hold-transition light-skin sidebar-mini theme-primary fixed">

    <form id="form1" runat="server">
        <div class="wrapper">
	<div id="loader">

		  <header class="main-header">
	<div class="d-flex align-items-center logo-box justify-content-start">	
		<!-- Logo -->
		<a href="admin.aspx" class="logo">
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


		<!--#include file = "panel.html" -->

 <div class="content-wrapper">
	  <div class="container-full">
		<!-- Main content -->
		<section class="content">
			<div class="row">
				<div class="col-xl-2 col-lg-4 col-12">
					<button class="btn btn-danger w-p100 mb-30" type="button" data-bs-toggle="modal" data-bs-target=".bs-example-modal-lg">Compose</button>

				  <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title" id="myLargeModalLabel">Compose New Message</h4>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<div class="form-group">
								   <asp:TextBox ID="txtTo"  class="form-control" runat="server" placeholder="To: "></asp:TextBox>  
								  </div>
								  <div class="form-group">
									 <asp:TextBox ID="txtSubject" runat="server" placeholder="Subject"  class="form-control"></asp:TextBox> 
								  </div>
								  <div class="form-group">
										 <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine"  class="form-control" placeholder="Your message here...." ></asp:TextBox> 
								  </div>
								  <div class="form-group">
									<div class="btn btn-info btn-file">
									  <i class="fa fa-paperclip"></i> Attachment
									   <asp:FileUpload ID="fileUploader" runat="server" />  
									</div>
									<p class="help-block">Max. 32MB</p>
								  </div>
							</div>
							<div class="modal-footer">
								<div class="pull-right">
								
									  <asp:Button ID="bttn_Send" Text="Send Mail" runat="server" OnClick="bttn_Send_Click"  class="btn btn-success"/>  
								
								</div>
								
								<button type="button" class="btn btn-danger text-start" data-bs-dismiss="modal">Close</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
		        <div class="box">
					<div class="box-header with-border">
					  <h4 class="box-title">Folders</h4>
					  <ul class="box-controls pull-right">
						<li><a class="box-btn-slide" href="#"></a></li>	
					  </ul>
					</div>
					<div class="box-body no-padding mailbox-nav">
					  <ul class="nav nav-pills flex-column">
						<li class="nav-item"><a class="nav-link active" href="javascript:void(0)"><i class="ion ion-ios-email-outline"></i> Inbox
						  <span class="label label-success pull-right">1</span></a></li>
						<li class="nav-item"><a class="nav-link" href="javascript:void(0)"><i class="ion ion-paper-airplane"></i> Sent</a></li>
						<li class="nav-item"><a class="nav-link" href="javascript:void(0)"><i class="ion ion-email-unread"></i> Drafts</a></li>
						<li class="nav-item"><a class="nav-link" href="javascript:void(0)"><i class="ion ion-star"></i>  Starred <span class="label label-warning pull-right">14</span></a>
						</li>
						<li class="nav-item"><a class="nav-link" href="javascript:void(0)"><i class="ion ion-trash-a"></i> Trash</a></li>
					  </ul>
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
	<script src="~/js/pages/chat-popup.js"></script>
    <script src="/css/assets/icons/feather-icons/feather.min.js"></script>


</body>
</html>