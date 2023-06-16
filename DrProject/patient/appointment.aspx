<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="appointment.aspx.cs" Inherits="DrProject.patient.appointment" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="/css/vendors_css.css" />
    <link rel="stylesheet" href="/css/style.css" />
    <link rel="stylesheet" href="/css/skin_color.css" />
    <link rel="icon" href="https://medical-admin-template.multipurposethemes.com/images/favicon.ico" />
    	 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
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
        <asp:BoundField DataField="status" HeaderText=" Appointment Status" />
        <asp:BoundField DataField="fname" HeaderText="Doctor Name"/>
        <asp:BoundField DataField="fees" HeaderText="Consultation Fees"/>
        <asp:BoundField DataField="payment_status" HeaderText="Payment Status"/>
		<asp:TemplateField ItemStyle-Width = "30px"  HeaderText = "C">
   <ItemTemplate>
     <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal-center">
				pay
				  </button>
				  
   </ItemTemplate>
</asp:TemplateField>
    </Columns>
</asp:GridView>		
	<div class="modal center-modal fade" id="modal-center" tabindex="-1">
	  <div class="modal-dialog">
		<div class="modal-content">
		  <div class="modal-header">
			<h5 class="modal-title">Payment </h5>
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
                                <input type="text" name="username" placeholder="Card Owner Name" required class="form-control" />
                            </div>
                            <div class="form-group">
                                <label for="cardNumber">
                                    <h6>Card number</h6>
                                </label>
                                <div class="input-group">
                                    <input type="text" name="cardNumber" placeholder="Valid card number" class="form-control" required />
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
                                        <div class="input-group"><input type="number" placeholder="MM" name="" class="form-control" required /> <input type="number" placeholder="YY" name="" class="form-control" required /></div>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group mb-4">
                                        <label data-toggle="tooltip" title="Three digit CV code on the back of your card">
                                            <h6>CVV <i class="fa fa-question-circle d-inline"></i></h6>
                                        </label>
                                        <input type="text" required class="form-control" />
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
                    <!-- End -->
                    <!-- End -->
                </div>
            </div>
        </div>

		  </div>
		  <div class="modal-footer modal-footer-uniform">
			<button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
			<button type="button" class="btn btn-primary float-end">Save changes</button>
		  </div>
		</div>
	  </div>
	</div>
				</div>  
				</div>  
                <div class="col-12 col-lg-4">
				<div class="box">
				  <div class="box-header bg-success">
					<h4 class="box-title">Discount</h4>
				  </div>
				  <div class="box-body">
					<p>If you have any discount vouchers/coupans, apply here. If you don't have any, click <a href="javascript:void(0);" class="text-link">here</a> to get one.</p>
					<form class="form-inline mt-20">
						<div class="input-group w-p100">
							<input type="text" class="form-control">
							<button type="button" class="btn btn-danger">Apply</button>
							<!-- /btn-group -->
						</div>
					</form>

				  </div>
				</div>			 

				<div class="box">
				  <div class="box-header bg-info">
					<h4 class="box-title">Cart Summary</h4>
				  </div>

				  <div class="box-body">
					<div class="table-responsive">
						<table class="table simple mb-0">
							<tbody>
								<tr>
									<td>Total</td>
									<td class="text-end fw-700">$3240</td>
								</tr>
								<tr>
									<td>Coupan Discount</td>
									<td class="text-end fw-700"><span class="text-danger me-15">50%</span>-$1620</td>
								</tr>
								<tr>
									<td>Delivery Charges</td>
									<td class="text-end fw-700">$50</td>
								</tr>
								<tr>
									<td>Tax</td>
									<td class="text-end fw-700">$18</td>
								</tr>
								<tr>
									<th class="bt-1">Payable Amount</th>
									<th class="bt-1 text-end fw-900 fs-18">$1688</th>
								</tr>
							</tbody>
						</table>
					</div>
				  </div>
				  <div class="box-footer">	
					<button class="btn btn-danger">Cancel Order</button>
					<button class="btn btn-primary pull-right">Place Order</button>
				  </div>
				</div> 

				<div class="box">
				  <div class="box-header bg-dark">
					<h4 class="box-title">Support</h4>
				  </div>

				  <div class="box-body">
					<h4 class="fw-500"><i class="ti-mobile"></i> +1800 123 1234 <span class="text-info">(Toll Free)</span></h4>
					<p>Contact us for any queries. We are avalible 24x7x365.</p>
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


</body>
</html>