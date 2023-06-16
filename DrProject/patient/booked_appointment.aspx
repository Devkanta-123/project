<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="booked_appointment.aspx.cs" Inherits="DrProject.patient.booked_appointment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <style type="text/css">
        .modal {
            position: fixed;
            top: 0;
            left: 0;
            background-color: black;
            z-index: 99;
            filter: alpha(opacity=80);
            -moz-opacity: 0.8;
            min-height: 100%;
            width: 100%;
            border-radius:3px;
        }

        .loading {
            font-family:Garamond (serif);
            font-size: 12pt;
            width: 400px;
            height: 200px;
            display: none;
            position: fixed;
            background-color: white;
            z-index: 999;
            border-radius:7px;
        }

        body {
            font-family: Arial;
            font-size: 10pt;
        }

        table {
            border: 1px solid #ccc;
        }

            table th {
                background-color: #F7F7F7;
                color: #333;
                font-weight: bold;
            }

            table th, table td {
                padding: 5px;
                border-color: #ccc;
            }
    </style>
    <link rel="stylesheet" href="/css/vendors_css.css" />
    <link rel="stylesheet" href="/css/style.css" />
    <link rel="stylesheet" href="/css/skin_color.css"/>
    <link rel="icon" href="https://medical-admin-template.multipurposethemes.com/images/favicon.ico" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
     <script type="text/javascript">
        function ShowProgress() {
            setTimeout(function () {
                var modal = $('<div />');
                modal.addClass("modal");
                $('body').append(modal);
                var loading = $(".loading");
                loading.show();
                var top = Math.max($(window).height() / 2 - loading[0].offsetHeight / 2, 0);
                var left = Math.max($(window).width() / 2 - loading[0].offsetWidth / 2, 0);
                loading.css({ top: top, left: left });
            }, 200);
        }
        $('form').live("submit", function () {
            ShowProgress();
        });
     </script>
</head>
<body class="hold-transition light-skin sidebar-mini theme-primary fixed">
    <form id="form1" runat="server">
         <div class="loading" align="center">
       Transaction is processing Please don't  Refresh this Pages<br />
            <br />
            <img src="2.gif" alt="" />
        </div>
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
			 <div class="col-10 col-lg-10">
				<div class="box">
				  <div class="box-header bg-primary">
						<h4><i class="ti-clipboard "></i>  Your  Appointment Info</h4>
						</div>
							<asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
			<asp:UpdatePanel ID="UpdatePanel1" runat="server">

            <ContentTemplate>

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" OnRowDataBound="OnRowDataBound"
                    DataKeyNames="appointment_id" OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit"
                    PageSize="2" AllowPaging="true"   OnPageIndexChanging="OnPaging" OnRowUpdating="OnRowUpdating" 
                OnRowDeleting="OnRowDeleting" EmptyDataText="No records has been added." CssClass="table table-bordered table-hover display nowrap margin-top-7 w-p80 table-responsive" width="1000px">
                    <Columns>
						<asp:ImageField DataImageUrlField="profile" HeaderText="Dr.Profile" ControlStyle-CssClass="rounded-circle bg-info"></asp:ImageField>    
                        <asp:TemplateField HeaderText="Dr Name" >
                            <ItemTemplate>
                                <asp:Label ID="lblName" runat="server"   Text='<%# Eval("fname") %>'></asp:Label>

                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtName" runat="server" class="form-control"   autocomplete="off"  Text ='<%# Eval("fname") %>' Width="200"></asp:TextBox>
                            </EditItemTemplate>
						
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Apppoint Date">
                            <ItemTemplate>
                                <asp:Label ID="lblCountry" runat="server"  Text='<%# Eval("appoint_date") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtLname" runat="server" class="form-control"   autocomplete="off"  Text='<%# Eval("appoint_date") %>' Width="140"></asp:TextBox>
                            </EditItemTemplate>
						
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Appoint Time" ItemStyle-Width="150">
                            <ItemTemplate>
                                <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("appoint_time") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEmail" runat="server"   autocomplete="off"  class="form-control" Text='<%# Eval("appoint_time") %>' Width="140"></asp:TextBox>
                            </EditItemTemplate>
						
                        </asp:TemplateField>
						  <asp:TemplateField HeaderText="Appointment Status" ItemStyle-Width="150">
                            <ItemTemplate>
                                <asp:Label ID="lblNewstatus" runat="server" Text='<%# Eval("status") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Designation" runat="server"   autocomplete="off"  class="form-control" Text='<%# Eval("status") %>' Width="140"></asp:TextBox>
                            </EditItemTemplate>
					
                        </asp:TemplateField>
						 <asp:TemplateField HeaderText="Payment Status" ItemStyle-Width="150">
                            <ItemTemplate>
                                <asp:Label ID="lblpaymentstatus" runat="server" Text='<%# Eval("payment_status") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="PaymentStatus" runat="server"   autocomplete="off"  class="form-control" Text='<%# Eval("payment_status") %>' Width="140"></asp:TextBox>
                            </EditItemTemplate>
					
                        </asp:TemplateField>
								
                        <asp:CommandField  HeaderText="Actions"  ButtonType="Link" ShowEditButton="true" ShowDeleteButton="true" 
                            ItemStyle-Width="150"  EditText="<i aria-hidden='true' class='ti-marker-alt'></i>" DeleteText="<i aria-hidden='true' class='ti-trash'></i>"
CancelText="<i aria-hidden='true' class='glyphicon glyphicon-remove'></i>" UpdateText="<i aria-hidden='true' class='ti-check-box'></i>"/>
						<asp:TemplateField ItemStyle-Width = "70px"  HeaderText = "PAY">
   <ItemTemplate>
	    <button type="button" class="btn btn-info btn-sm" data-bs-toggle="modal" data-bs-target="#modal-center">
				 <i class="fas fa-mobile-alt mr-2"></i>	Pay now
				  </button>
   </ItemTemplate>
</asp:TemplateField>			
                    </Columns>
				
                </asp:GridView>
               
            </ContentTemplate>

        </asp:UpdatePanel>
			
  <div class="modal center-modal fade" id="modal-center" tabindex="-1">
	  <div class="modal-dialog">
		<div class="modal-content">
		  <div class="modal-header">
			<h5 class="modal-title">Payment Modules</h5>
			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		  </div>
		  <div class="modal-body">
			  	        <div class="card">
            <div class="card-header">
                <div class="bg-white shadow-sm pt-4 pl-2 pr-2 pb-2">
                    <!-- Credit card form tabs -->
                    <ul role="tablist" class="nav bg-light nav-pills rounded nav-fill mb-3">
                        <li class="nav-item">
                            <a data-toggle="pill" href="#credit-card" class="nav-link active"> <i class="fas fa-credit-card mr-2"></i> Credit Card </a>
                        </li>
                        <li class="nav-item">
                            <a data-toggle="pill" href="#paypal" class="nav-link"> <i class="fab fa-paypal mr-2"></i> Paypal </a>
                        </li>
                        <li class="nav-item">
                            <a data-toggle="pill" href="#net-banking" class="nav-link"> <i class="fas fa-mobile-alt mr-2"></i> Net Banking </a>
                        </li>
                    </ul>
                </div>
                <!-- End -->
                <!-- Credit card form content -->
                <div class="tab-content">
                    <!-- credit card info-->
                    <div id="credit-card" class="tab-pane fade show active pt-3">
                        <form role="form">
                            <div class="form-group">
                                <label for="username">
                                    <h6>Card Owner</h6>
                                </label>
                                <input type="text" name="username" autocomplete="off"       placeholder="Card Owner Name" required class="form-control" />
                            </div>
                            <div class="form-group">
                                <label for="cardNumber">
                                    <h6>Card number</h6>
                                </label>
                                <div class="input-group">
                                    <input type="text" name="cardNumber" autocomplete="off" placeholder="Valid card number" class="form-control" required />
                                    <div class="input-group-append">
                                        <span class="input-group-text text-muted"> <i class="fab fa-cc-visa mx-1"></i> <i class="fab fa-cc-mastercard mx-1"></i> <i class="fab fa-cc-amex mx-1"></i> </span>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-8">
                                    <div class="form-group">
                                        <label>
                                            <span class="hidden-xs">
                                                <h6>Expiration Date</h6>
                                            </span>
                                        </label>
                                        <div class="input-group"><input type="number" autocomplete="off"  placeholder="MM" name="" class="form-control" required /> <input type="number" placeholder="YY" name="" class="form-control" required /></div>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group mb-4">
                                        <label data-toggle="tooltip" title="Three digit CV code on the back of your card">
                                            <h6>CVV <i class="fa fa-question-circle d-inline"></i></h6>
                                        </label>
                                        <input type="password" required autocomplete="off"  class="form-control" />
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <!-- End -->
                    <!-- Paypal info -->
                    <div id="paypal" class="tab-pane fade pt-3">
                        <h6 class="pb-2">Select your paypal account type</h6>
                        <div class="form-group">
                            <label class="radio-inline"> <input type="radio" name="optradio" checked /> Domestic </label> <label class="radio-inline"> <input type="radio" name="optradio" class="ml-5" />International </label>
                        </div>
                        <p>
                            <button type="button" class="btn btn-primary"><i class="fab fa-paypal mr-2"></i> Log into my Paypal</button>
                        </p>
                        <p class="text-muted">
                            Note: After clicking on the button, you will be directed to a secure gateway for payment. After completing the payment process, you will be redirected back to the website to view details of your order.
                        </p>
                    </div>
                    <!-- End -->
                    <!-- bank transfer info -->
                    <div id="net-banking" class="tab-pane fade pt-3">
                        <div class="form-group">
                            <label for="Select Your Bank">
                                <h6>Select your Bank</h6>
                            </label>
                            <select class="form-control" id="ccmonth">
                                <option value="" selected disabled>--Please select your Bank--</option>
                                <option>Bank 1</option>
                                <option>Bank 2</option>
                                <option>Bank 3</option>
                                <option>Bank 4</option>
                                <option>Bank 5</option>
                                <option>Bank 6</option>
                                <option>Bank 7</option>
                                <option>Bank 8</option>
                                <option>Bank 9</option>
                                <option>Bank 10</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <p>
                                <button type="button" class="btn btn-primary"><i class="fas fa-mobile-alt mr-2"></i> Proceed Payment</button>
                            </p>
                        </div>
                        <p class="text-muted">
                            Note: After clicking on the button, you will be directed to a secure gateway for payment. After completing the payment process, you will be redirected back to the website to view details of your order.
                        </p>
                    </div>
                </div>
            </div>
        </div>

		  </div>
		  <div class="modal-footer modal-footer-uniform">
			<button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
			  <asp:Button ID="payment" runat="server" Text="Pay" OnClick="payment_Click"  CssClass="btn btn-success"/>
		  </div>
		</div>
	  </div>
	</div>
				</div>  
				</div>  
				</div>  
			   </section>
				</div>  
				</div> 	 
    <div>  
   </div>  	
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
         <script src="~/css/assets/vendor_components/sweetalert/jquery.sweet-alert.custom.js"></script>

              
</form> 
    	
		</body>
</html>
