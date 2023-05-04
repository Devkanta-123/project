<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="doctor.aspx.cs" Inherits="DrProject.admin.doctor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    	<link rel="stylesheet" href="/css/vendors_css.css" />
    <%--	<link rel="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css"/>
	<script src="~/js/jquery-3.6.4.min.js"></script>
	<script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>

	
        <script>
            $(document).ready(function () {
                $("#GridView1").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
        </script>--%>
	
	  
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
					      <asp:Label ID ="Label2" runat="server" class="pt-5 fs-14 mb-0 fw-800 text-primary" ></asp:Label>
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
	
			
			<div class="row">
				<div class="col-xxxl-9 col-xl-8 col-12">
					
						<!-- card -->
					<div class="row">
						<div class="col-lg-4 col-12">
							<div class="box">
								<div class="box-body">
									<div class="d-flex align-items-center">
										<div class="me-15">
											<img src="https://medical-admin-template.multipurposethemes.com/images/svg-icon/color-svg/custom-20.svg" alt="" class="w-120" />
										</div>
										<div>
											<h4 class="mb-0">Total Patients</h4>
											<asp:Label ID="Label3" runat="server" Text="1234" class="mb-3" ></asp:Label>
                                          
										</div>
									</div>
								</div>
							</div>
						</div>
							<div class="col-lg-4 col-12">
							<div class="box">
								<div class="box-body">
									<div class="d-flex align-items-center">
										<div class="me-15">
											<img src="https://medical-admin-template.multipurposethemes.com/images/svg-icon/color-svg/custom-18.svg" alt="" class="w-120" />
										</div>
										<div>
											<h5 class="mb-0">Total Doctor </h5>
										<asp:Label ID="Label4" runat="server"  class="mb-3"  Font-Size="Large"></asp:Label>
											<br/>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-12">
							<div class="box">
								<div class="box-body">
									<div class="d-flex align-items-center">
										<div class="me-15">
											<img src="https://medical-admin-template.multipurposethemes.com/images/svg-icon/color-svg/custom-19.svg" alt="" class="w-120" />
										</div>
										<div>
											<h4 class="mb-0">Department</h4>
											<asp:Label ID="Label1" runat="server"  class="mb-3"  Font-Size="Large"></asp:Label>
										</div>
									</div>
								</div>
							</div>
					</div>
					</div>
					</div>
					</div>
		  
			  <div class="box">
				<h4 class="box-title">Doctor Lists</h4>
				<!-- /.box-header -->
				<div class="box-body">
					<div class="">
					
	<asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
			<asp:UpdatePanel ID="UpdatePanel1" runat="server">

            <ContentTemplate>

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" OnRowDataBound="OnRowDataBound"
                    DataKeyNames="id" OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit"
                    PageSize="2" AllowPaging="true" OnPageIndexChanging="OnPaging" OnRowUpdating="OnRowUpdating" 
                OnRowDeleting="OnRowDeleting" EmptyDataText="No records has been added." CssClass="table table-bordered table-hover display nowrap margin-top-7 w-p80 table-responsive" Width="1020px">
                    <Columns>
						<asp:ImageField DataImageUrlField="profile" HeaderText="Profile" ControlStyle-CssClass="rounded-circle bg-primary"></asp:ImageField>    
                        <asp:TemplateField HeaderText="First Name"   ItemStyle-Width="150" >
                            <ItemTemplate>
                                <asp:Label ID="lblName" runat="server"   Text='<%# Eval("fname") %>'></asp:Label>

                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtName" runat="server" class="form-control"   autocomplete="off"  Text ='<%# Eval("fname") %>' Width="140"></asp:TextBox>
                            </EditItemTemplate>
							 <HeaderStyle CssClass="bg-primary" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Last Name" ItemStyle-Width="150">
                            <ItemTemplate>
                                <asp:Label ID="lblCountry" runat="server"  Text='<%# Eval("lname") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtLname" runat="server" class="form-control"   autocomplete="off"  Text='<%# Eval("lname") %>' Width="140"></asp:TextBox>
                            </EditItemTemplate>
							 <HeaderStyle CssClass="bg-primary" />
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Emailid" ItemStyle-Width="150">
                            <ItemTemplate>
                                <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("emailid") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEmail" runat="server"   autocomplete="off"  class="form-control" Text='<%# Eval("emailid") %>' Width="140"></asp:TextBox>
                            </EditItemTemplate>
							  <HeaderStyle CssClass="bg-primary" />
                        </asp:TemplateField>
						  <asp:TemplateField HeaderText="Designation" ItemStyle-Width="150">
                            <ItemTemplate>
                                <asp:Label ID="lblDesignation" runat="server" Text='<%# Eval("designation") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Designation" runat="server"   autocomplete="off"  class="form-control" Text='<%# Eval("designation") %>' Width="140"></asp:TextBox>
                            </EditItemTemplate>
							  <HeaderStyle CssClass="bg-primary" />
                        </asp:TemplateField>
						<asp:TemplateField HeaderText="Status" ItemStyle-Width="150">
					<ItemTemplate>
			 <asp:Label ID="lblNewstatus" runat="server"  Text='<%# Eval("status") %>'></asp:Label>
			</ItemTemplate>
							<EditItemTemplate>
<asp:DropDownList ID="newstatus" runat="server" class="form-control"    SelectedValue='<%# Bind("status")%>'>
<asp:ListItem>Active</asp:ListItem>
<asp:ListItem>On Leave</asp:ListItem>
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
				<!-- /.box-body -->
			  </div>
			  <!-- /.box -->          
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
	



</body>
</html>