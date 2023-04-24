<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="book_appoint.aspx.cs" Inherits="DrProject.patient.book_appoint" %>



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
 <asp:LinkButton ID="logout" runat="server" class="pt-5 fs-10 mb-0 fw-800 text-danger" OnClick="logout_Click">Logout</asp:LinkButton>
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
				<div class="col-lg-6 col-12">
					  <div class="box">
						<div class="box-header with-border">
						<h4><i class="ti-clipboard "></i> Appointment Info</h4>
						</div>
						<!-- /.box-header -->
					
							<div class="box-body">
							
								
								<div class="row">
								  <div class="col-md-6">
									<div class="form-group">
									  <label class="form-label">Choose Department</label>
										   
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True"   
                   CssClass="form-control"  DataTextField="dept_name" DataValueField="id" AppendDataBoundItems="true"   
                    onselectedindexchanged="DropDownList1_SelectedIndexChanged">  
                    <asp:ListItem>--Select Departments--</asp:ListItem>  
                </asp:DropDownList>  
									 
									</div>
								  </div>
								  <div class="col-md-6">
									<div class="form-group">
										
									  <label class="form-label">Doctors</label>
									 
                <asp:DropDownList ID="DropDownList2" runat="server" AppendDataBoundItems="true" DataTextField="fname"   
                    DataValueField="id" AutoPostBack="True"   
                    onselectedindexchanged="DropDownList2_SelectedIndexChanged" CssClass="form-control">  
                    <asp:ListItem>-- Select Doctors --</asp:ListItem>  
                </asp:DropDownList>  
									</div>
								  </div>
								</div>
								
								<div class="row">
								  <div class="col-md-6">
										<div class="form-group">
									  <label class="form-label">Timing</label>
									
										           
                <asp:DropDownList ID="DropDownList3" runat="server" AppendDataBoundItems="true" DataTextField="time"   
                    DataValueField="time" CssClass="form-control">  
                    <asp:ListItem >-- Select Timing--</asp:ListItem>  
                </asp:DropDownList>  
         
									</div>
								  </div>
								  <div class="col-md-6">
								<div class="form-group">
									  <label class="form-label">Choose Date</label>
                                        
									   <asp:TextBox ID="date" runat="server" type="date" class="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="date" Display="Dynamic" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
										<asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage=" Date  should be Greater than current dates.." ForeColor="Red"
    ControlToValidate="date" Operator="GreaterThanEqual" Type="Date" Display="Dynamic" />
										
								  </div>
								  </div>
								</div>
								<div class="row">
								  <div class="col-md-6">
							<div class="form-group">
								  <label class="form-label">Issues</label>
								  <asp:TextBox ID="issues" runat="server"  class="form-control"></asp:TextBox>
								</div>
								  </div>
								  </div>
								  <div class="col-md-6">
									
								</div>
								
							
								<%--<div class="form-group">
								  <label class="form-label">Select File</label>
								  <label class="file">
									<input type="file" id="file">
								  </label>
								</div>--%>
								
							</div>
							<!-- /.box-body -->
							<div class="box-footer">
								<button type="button" class="btn btn-warning me-1">
								  <i class="ti-trash"></i> Cancel
								</button>
                                <asp:Button ID="bookAppoint" runat="server" Text="BOOK" OnClick="bookAppoint_Click"  class="btn btn-primary" /> 
								
							</div>  
					
					  </div>
					  <!-- /.box -->			
				</div>  
				</div>  
				
 
    <div>  
   </div>  
</form> 
    
</body>
</html>