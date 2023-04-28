<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="DrProject.doctor.dashboard" %>

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
				 <button type="button" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#modal-available">Add</button>
			   
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
					 <asp:Image ID="profile" runat="server"    Width="120"      CssClass="rounded-circle bg-warning-light"/> 
					
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
						  <asp:Label ID ="id" runat="server"  visible="false"  class="pt-5 fs-14 mb-0 fw-800 text-warning" ></asp:Label>
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
					<span>


					</span>
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
		  </div>
		</div>
    </section>
  </aside>
<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
	  <div class="container-full">
		<!-- Main content -->
		<section class="content">
			<div class="row">
				<div class="col-xl-8 col-12">
					<div class="box">
						<div class="box-body">
							<div class="row">
								<div class="col-xl-3 col-md-6 col-12">
									<div class="d-flex align-items-center mb-15 mb-lg-0">
										<div class="me-15 bg-danger w-60 h-60 rounded-circle text-center l-h-70">
											<i class="ti-user"></i>
										</div>
										<div>
											<p class="text-fade fs-16 mb-0">Patients</p>
											<h3 class="fw-500 my-0">0</h3>
										</div>
									</div>
								</div>
								<div class="col-xl-3 col-md-6 col-12">
									<div class="d-flex align-items-center mb-15 mb-lg-0">
										<div class="me-15 bg-warning w-60 h-60 rounded-circle text-center l-h-70">
											<i class="fs-24 fa fa-user-md"></i>
										</div>
										<div>
											<p class="text-fade fs-16 mb-0">Staffs</p>
											<h3 class="fw-500 my-0">1,521</h3>
										</div>
									</div>
								</div>
								<div class="col-xl-3 col-md-6 col-12">
									<div class="d-flex align-items-center mb-15 mb-md-0">
										<div class="me-15 bg-success w-60 h-60 rounded-circle text-center l-h-70">
											<i class="fs-24 fa fa-hospital-o"></i>
										</div>
										<div>
											<p class="text-fade fs-16 mb-0">Rooms</p>
											
											<h3 class="fw-500 my-0">2,415</h3>
										</div>
									</div>
								</div>
								<div class="col-xl-3 col-md-6 col-12">
									<div class="d-flex align-items-center mb-15 mb-md-0">
										<div class="me-15 bg-info w-60 h-60 rounded-circle text-center l-h-70">
											<i class="fs-24 fa fa-ambulance"></i>
										</div>
										<div>
											<p class="text-fade fs-16 mb-0">Ambulance</p>
											<h3 class="fw-500 my-0">15</h3>
										</div>

									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="modal center-modal fade" id="modal-available" tabindex="-1">
	  <div class="modal-dialog">
		<div class="modal-content">
		  <div class="modal-body">
			
			          	      <div class="row">
								 
									  <div class="col-md-6">
									<div class="form-group">
									  <label class="form-label">Timing</label>
						<asp:DropDownList ID="timing" runat="server"  class="form-control" >
                        <asp:ListItem>08 to 09 AM</asp:ListItem>
                        <asp:ListItem>09 to 10 AM</asp:ListItem>
                        <asp:ListItem>10 to 10:30 AM</asp:ListItem>
                        <asp:ListItem>11 to 11:30 AM</asp:ListItem>
                        <asp:ListItem>12 to 01 PM</asp:ListItem>
                        <asp:ListItem>01 to 02 PM</asp:ListItem>
                        <asp:ListItem>02 to 03 PM</asp:ListItem>
                        <asp:ListItem>03 to 4:30 PM</asp:ListItem>
                        <asp:ListItem>05 to 06 PM</asp:ListItem>
                        <asp:ListItem>06 to 07 PM</asp:ListItem>
                        <asp:ListItem>07 to 08 PM</asp:ListItem>
               
                     
                    </asp:DropDownList>
									</div>
									</div>
										  
									  <div class="col-md-6">
									<div class="form-group">
								  <label class="form-label">Fees</label>
								 <asp:Textbox ID="fees" runat="server"  class="form-control"/>
								</div>
								</div>
								 
								
			                  
		               </div>
			  <div class="modal-footer modal-footer-uniform">
			<button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
			
		<asp:Button  ID="regdept" runat="server" Text="Save"   OnClick="regtDept_Click" class="btn btn-primary float-end"/>
		  </div>
			    
				 
		               </div>

		 
		</div>
	
	</div>
					</div>
					<div class="row">
						<div class="col-xl-12 col-12">						
							<div class="box">
								<div class="box-header">
									<h4 class="box-title">Your Appointments</h4>
								</div>
												<div class="box-body">
					<div class="">
					
	<asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
			<asp:UpdatePanel ID="UpdatePanel1" runat="server">

            <ContentTemplate>

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" OnRowDataBound="OnRowDataBound"
                    DataKeyNames="appointment_id" OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit"
                    PageSize="2" AllowPaging="true" OnPageIndexChanging="OnPaging" OnRowUpdating="OnRowUpdating" 
                OnRowDeleting="OnRowDeleting" EmptyDataText="No records has been added." CssClass="table table-bordered table-hover display nowrap margin-top-4 w-p100 table-responsive" Width="40px">
                    <Columns>

                        <asp:TemplateField HeaderText="PATIENT NAME"   ItemStyle-Width="150" >
                            <ItemTemplate>
                                <asp:Label ID="lblName" runat="server"   Text='<%# Eval("fullname") %>'></asp:Label>

                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtName" runat="server" class="form-control"  readonly autocomplete="off"  Text ='<%# Eval("fullname") %>' Width="140"></asp:TextBox>
                            </EditItemTemplate>
							 <HeaderStyle CssClass="bg-primary" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="APPOINT_DATE" ItemStyle-Width="150">
                            <ItemTemplate>
                                <asp:Label ID="lblCountry" runat="server"  Text='<%# Eval("appoint_date") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtLname" runat="server" class="form-control"  readonly autocomplete="off"  Text='<%# Eval("appoint_date") %>' Width="140"></asp:TextBox>
                            </EditItemTemplate>
							 <HeaderStyle CssClass="bg-primary" />
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="TIME" ItemStyle-Width="150">
                            <ItemTemplate>
                                <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("appoint_TIME") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEmail" runat="server"   autocomplete="off"   readonly   class="form-control" Text='<%# Eval("appoint_TIME") %>' Width="140"></asp:TextBox>
                            </EditItemTemplate>
							  <HeaderStyle CssClass="bg-primary" />
                        </asp:TemplateField>
						  <asp:TemplateField HeaderText="PATIENT PROBLEM" ItemStyle-Width="150">
                            <ItemTemplate>
                                <asp:Label ID="lblDesignation" runat="server"      Text='<%# Eval("issues") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Designation" runat="server"  readonly   autocomplete="off"  class="form-control" Text='<%# Eval("issues") %>' Width="140"></asp:TextBox>
                            </EditItemTemplate>
							  <HeaderStyle CssClass="bg-primary" />
                        </asp:TemplateField>
						<asp:TemplateField HeaderText="STATUS" ItemStyle-Width="150">
					<ItemTemplate>
			 <asp:Label ID="lblDesignation" runat="server"  readonly Text='<%# Eval("status") %>'></asp:Label>
			</ItemTemplate>
							<EditItemTemplate>
<asp:DropDownList ID="newstatus" runat="server" class="form-control"    SelectedValue='<%# Bind("status")%>'>
<asp:ListItem>approved</asp:ListItem>
<asp:ListItem>cancel</asp:ListItem>
<asp:ListItem>book</asp:ListItem>
</asp:DropDownList>
</EditItemTemplate>
							  <HeaderStyle CssClass="bg-primary" />
                        </asp:TemplateField>
						
                        <asp:CommandField  HeaderText="Actions"  ButtonType="Link" ShowEditButton="true" ShowDeleteButton="true" 
                            ItemStyle-Width="150"  EditText="<i aria-hidden='true' class='ti-marker-alt'></i>" DeleteText="<i aria-hidden='true' class='ti-trash'></i>"
CancelText="<i aria-hidden='true' class='glyphicon glyphicon-remove'></i>" UpdateText="<i aria-hidden='true' class='ti-check-box'></i>"/>
									
                    </Columns>
					 <HeaderStyle CssClass="bg-danger" />
                </asp:GridView>
               
            </ContentTemplate>
        </asp:UpdatePanel>
						
				
					</div>              
				</div>
							</div>
						</div>
					
						<div class="col-xl-6 col-12">						
							<div class="box">
								
								<div class="box-body">	
									<div class="news-slider owl-carousel owl-sl">	
										<div>
											<div class="d-flex align-items-center mb-10">
												<div class="me-15">
													<img src="../images/avatar/1.jpg" class="w-auto avatar avatar-lg rounded10 bg-primary-light" alt="" />
												</div>
												
												
											</div>
											<div class="d-flex justify-content-between align-items-end mt-40 py-10 bt-dashed border-top">
												<div>
													<p class="mb-0 text-muted"><i class="fa fa-clock-o me-5"></i> 10:00 <span class="mx-20">$ 30</span></p>
												</div>
												<div>
													
												</div>
											</div>
										</div>
										<div>
											
											<div class="d-flex justify-content-between align-items-end mt-40 py-10 bt-dashed border-top">
												<div>
													<p class="mb-0 text-muted"><i class="fa fa-clock-o me-5"></i> 10:30 <span class="mx-20">$ 50</span></p>
												</div>
												<div>
													<div class="dropdown">
														<a data-bs-toggle="dropdown" href="#" class="base-font mx-30"><i class="ti-more-alt text-muted"></i></a>
														<div class="dropdown-menu dropdown-menu-end">
														  <a class="dropdown-item" href="#"><i class="ti-import"></i> Import</a>
														  <a class="dropdown-item" href="#"><i class="ti-export"></i> Export</a>
														  <a class="dropdown-item" href="#"><i class="ti-printer"></i> Print</a>
														  <div class="dropdown-divider"></div>
														  <a class="dropdown-item" href="#"><i class="ti-settings"></i> Settings</a>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div>
											
											<div class="d-flex justify-content-between align-items-end mt-40 py-10 bt-dashed border-top">
												<div>
													<p class="mb-0 text-muted"><i class="fa fa-clock-o me-5"></i> 11:00 <span class="mx-20">$ 70</span></p>
												</div>
												<div>
													<div class="dropdown">
														<a data-bs-toggle="dropdown" href="#" class="base-font mx-30"><i class="ti-more-alt text-muted"></i></a>
														<div class="dropdown-menu dropdown-menu-end">
														  <a class="dropdown-item" href="#"><i class="ti-import"></i> Import</a>
														  <a class="dropdown-item" href="#"><i class="ti-export"></i> Export</a>
														  <a class="dropdown-item" href="#"><i class="ti-printer"></i> Print</a>
														  <div class="dropdown-divider"></div>
														  <a class="dropdown-item" href="#"><i class="ti-settings"></i> Settings</a>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-6 col-12">						
							<div class="box">
								
								<div class="box-body">	
									<div class="news-slider owl-carousel owl-sl">	
										<div>
											<div class="d-flex align-items-center mb-10">
												<div class="d-flex flex-column flex-grow-1 fw-500">
													<p class="hover-primary text-fade mb-1 fs-14"><i class="fa fa-link"></i> Shawn Hampton</p>
													<span class="text-dark fs-16">Beta 2 Microglobulin</span>
													<p class="mb-0 fs-14">Marker Test <span class="badge badge-dot badge-primary"></span></p>
												</div>
												<div>
													<div class="dropdown">
														<a data-bs-toggle="dropdown" href="#" class="base-font mx-30"><i class="ti-more-alt text-muted"></i></a>
														<div class="dropdown-menu dropdown-menu-end">
														  <a class="dropdown-item" href="#"><i class="ti-import"></i> Import</a>
														  <a class="dropdown-item" href="#"><i class="ti-export"></i> Export</a>
														  <a class="dropdown-item" href="#"><i class="ti-printer"></i> Print</a>
														  <div class="dropdown-divider"></div>
														  <a class="dropdown-item" href="#"><i class="ti-settings"></i> Settings</a>
														</div>
													</div>
												</div>
											</div>
											<div class="d-flex justify-content-between align-items-end py-10">
												<div>
													<a href="#" class="waves-effect waves-light btn btn-sm btn-primary-light">Details</a>
													<a href="#" class="waves-effect waves-light btn btn-sm btn-primary-light">Contact Patient</a>
												</div>
												<div>
													<a href="#" class="waves-effect waves-light btn btn-sm btn-primary-light"><i class="fa fa-check"></i> Archive</a>
												</div>
											</div>
										</div>
										<div>
											<div class="d-flex align-items-center mb-10">
												<div class="d-flex flex-column flex-grow-1 fw-500">
													<p class="hover-primary text-fade mb-1 fs-14"><i class="fa fa-link"></i> Johen Doe</p>
													<span class="text-dark fs-16">Keeping pregnant</span>
													<p class="mb-0 fs-14">Prga Test <span class="badge badge-dot badge-primary"></span></p>
												</div>
												<div>
													<div class="dropdown">
														<a data-bs-toggle="dropdown" href="#" class="base-font mx-30"><i class="ti-more-alt text-muted"></i></a>
														<div class="dropdown-menu dropdown-menu-end">
														  <a class="dropdown-item" href="#"><i class="ti-import"></i> Import</a>
														  <a class="dropdown-item" href="#"><i class="ti-export"></i> Export</a>
														  <a class="dropdown-item" href="#"><i class="ti-printer"></i> Print</a>
														  <div class="dropdown-divider"></div>
														  <a class="dropdown-item" href="#"><i class="ti-settings"></i> Settings</a>
														</div>
													</div>
												</div>
											</div>
											<div class="d-flex justify-content-between align-items-end py-10">
												<div>
													<a href="#" class="waves-effect waves-light btn btn-sm btn-primary-light">Details</a>
													<a href="#" class="waves-effect waves-light btn btn-sm btn-primary-light">Contact Patient</a>
												</div>
												<div>
													<a href="#" class="waves-effect waves-light btn btn-sm btn-primary-light"><i class="fa fa-check"></i> Archive</a>
												</div>
											</div>
										</div>
										<div>
											<div class="d-flex align-items-center mb-10">
												<div class="d-flex flex-column flex-grow-1 fw-500">
													<p class="hover-primary text-fade mb-1 fs-14"><i class="fa fa-link"></i> Polly Paul</p>
													<span class="text-dark fs-16">USG + Consultation</span>
													<p class="mb-0 fs-14">Marker Test <span class="badge badge-dot badge-primary"></span></p>
												</div>
												<div>
													<div class="dropdown">
														<a data-bs-toggle="dropdown" href="#" class="base-font mx-30"><i class="ti-more-alt text-muted"></i></a>
														<div class="dropdown-menu dropdown-menu-end">
														  <a class="dropdown-item" href="#"><i class="ti-import"></i> Import</a>
														  <a class="dropdown-item" href="#"><i class="ti-export"></i> Export</a>
														  <a class="dropdown-item" href="#"><i class="ti-printer"></i> Print</a>
														  <div class="dropdown-divider"></div>
														  <a class="dropdown-item" href="#"><i class="ti-settings"></i> Settings</a>
														</div>
													</div>
												</div>
											</div>
											<div class="d-flex justify-content-between align-items-end py-10">
												<div>
													<a href="#" class="waves-effect waves-light btn btn-sm btn-primary-light">Details</a>
													<a href="#" class="waves-effect waves-light btn btn-sm btn-primary-light">Contact Patient</a>
												</div>
												<div>
													<a href="#" class="waves-effect waves-light btn btn-sm btn-primary-light"><i class="fa fa-check"></i> Archive</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						
					</div>					
				</div>
				<div class="col-xl-4 col-12">
					<div class="box">
						<div class="box-header with-border">
							<h4 class="box-title">Available Doctors</h4>
							<p class="mb-0 pull-right">Today</p>
						</div>
						<div class="box-body">
							<div class="inner-user-div3">
								<div class="d-flex align-items-center mb-30">
									<div class="me-15">
										<img src="../images/avatar/avatar-1.png" class="avatar avatar-lg rounded10 bg-primary-light" alt="" />
									</div>
									<div class="d-flex flex-column flex-grow-1 fw-500">
										<a href="#" class="text-dark hover-primary mb-1 fs-16">Dr. Jaylon Stanton</a>
										<span class="text-fade">Dentist</span>
									</div>
									<div class="dropdown">
										<a class="px-10 pt-5" href="#" data-bs-toggle="dropdown"><i class="ti-more-alt"></i></a>
										<div class="dropdown-menu dropdown-menu-end">
										  <a class="dropdown-item flexbox" href="#">
											<span>Inbox</span>
											<span class="badge badge-pill badge-info">5</span>
										  </a>
										  <a class="dropdown-item" href="#">Sent</a>
										  <a class="dropdown-item" href="#">Spam</a>
										  <div class="dropdown-divider"></div>
										  <a class="dropdown-item flexbox" href="#">
											<span>Draft</span>
											<span class="badge badge-pill badge-default">1</span>
										  </a>
										</div>
									</div>
								</div>
								<div class="d-flex align-items-center mb-30">
									<div class="me-15">
										<img src="../images/avatar/avatar-10.png" class="avatar avatar-lg rounded10 bg-primary-light" alt="" />
									</div>
									<div class="d-flex flex-column flex-grow-1 fw-500">
										<a href="#" class="text-dark hover-danger mb-1 fs-16">Dr. Carla Schleifer</a>
										<span class="text-fade">Oculist</span>
									</div>
									<div class="dropdown">
										<a class="px-10 pt-5" href="#" data-bs-toggle="dropdown"><i class="ti-more-alt"></i></a>
										<div class="dropdown-menu dropdown-menu-end">
										  <a class="dropdown-item flexbox" href="#">
											<span>Inbox</span>
											<span class="badge badge-pill badge-info">5</span>
										  </a>
										  <a class="dropdown-item" href="#">Sent</a>
										  <a class="dropdown-item" href="#">Spam</a>
										  <div class="dropdown-divider"></div>
										  <a class="dropdown-item flexbox" href="#">
											<span>Draft</span>
											<span class="badge badge-pill badge-default">1</span>
										  </a>
										</div>
									</div>
								</div>
								<div class="d-flex align-items-center mb-30">
									<div class="me-15">
										<img src="../images/avatar/avatar-11.png" class="avatar avatar-lg rounded10 bg-primary-light" alt="" />
									</div>
									<div class="d-flex flex-column flex-grow-1 fw-500">
										<a href="#" class="text-dark hover-success mb-1 fs-16">Dr. Hanna Geidt</a>
										<span class="text-fade">Surgeon</span>
									</div>
									<div class="dropdown">
										<a class="px-10 pt-5" href="#" data-bs-toggle="dropdown"><i class="ti-more-alt"></i></a>
										<div class="dropdown-menu dropdown-menu-end">
										  <a class="dropdown-item flexbox" href="#">
											<span>Inbox</span>
											<span class="badge badge-pill badge-info">5</span>
										  </a>
										  <a class="dropdown-item" href="#">Sent</a>
										  <a class="dropdown-item" href="#">Spam</a>
										  <div class="dropdown-divider"></div>
										  <a class="dropdown-item flexbox" href="#">
											<span>Draft</span>
											<span class="badge badge-pill badge-default">1</span>
										  </a>
										</div>
									</div>
								</div>
								<div class="d-flex align-items-center mb-30">
									<div class="me-15">
										<img src="/images/avatar/avatar-12.png" class="avatar avatar-lg rounded10 bg-primary-light" alt="" />
									</div>
									<div class="d-flex flex-column flex-grow-1 fw-500">
										<a href="#" class="text-dark hover-info mb-1 fs-16">Dr. Roger George</a>
										<span class="text-fade">General Practitioners</span>
									</div>
									<div class="dropdown">
										<a class="px-10 pt-5" href="#" data-bs-toggle="dropdown"><i class="ti-more-alt"></i></a>
										<div class="dropdown-menu dropdown-menu-end">
										  <a class="dropdown-item flexbox" href="#">
											<span>Inbox</span>
											<span class="badge badge-pill badge-info">5</span>
										  </a>
										  <a class="dropdown-item" href="#">Sent</a>
										  <a class="dropdown-item" href="#">Spam</a>
										  <div class="dropdown-divider"></div>
										  <a class="dropdown-item flexbox" href="#">
											<span>Draft</span>
											<span class="badge badge-pill badge-default">1</span>
										  </a>
										</div>
									</div>
								</div>
								<div class="d-flex align-items-center">
									<div class="me-15">
										<img src="/images/avatar/avatar-15.png" class="avatar avatar-lg rounded10 bg-primary-light" alt="" />
									</div>
									<div class="d-flex flex-column flex-grow-1 fw-500">
										<a href="#" class="text-dark hover-warning mb-1 fs-16">Dr. Natalie doe</a>
										<span class="text-fade">Physician</span>
									</div>
									<div class="dropdown">
										<a class="px-10 pt-5" href="#" data-bs-toggle="dropdown"><i class="ti-more-alt"></i></a>
										<div class="dropdown-menu dropdown-menu-end">
										  <a class="dropdown-item flexbox" href="#">
											<span>Inbox</span>
											<span class="badge badge-pill badge-info">5</span>
										  </a>
										  <a class="dropdown-item" href="#">Sent</a>
										  <a class="dropdown-item" href="#">Spam</a>
										  <div class="dropdown-divider"></div>
										  <a class="dropdown-item flexbox" href="#">
											<span>Draft</span>
											<span class="badge badge-pill badge-default">1</span>
										  </a>
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

	
	<script src="/css/assets/vendor_components/apexcharts-bundle/dist/apexcharts.js"></script>
	<script src="/css/assets/vendor_components/OwlCarousel2/dist/owl.carousel.js"></script>
   <script src="/js/vendors.min.js"></script>
	<script src="/js/pages/chat-popup.js"></script>
    <script src="/css/assets/icons/feather-icons/feather.min.js"></script>
	<script src="/js/pages/chart-widgets.js"></script>
    <script src="/js/pages/chartjs-int.js"></script>
		<script src="js/pages/dashboard2.js"></script>
    	
</body>
</html>