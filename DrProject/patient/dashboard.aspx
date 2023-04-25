<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="DrProject.patient.patient" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="/css/vendors_css.css" />

    <!-- Style-->
    <link rel="stylesheet" href="/css/style.css" />
    <link rel="stylesheet" href="/css/skin_color.css" />
    <link rel="icon" href="https://medical-admin-template.multipurposethemes.com/images/favicon.ico" />
</head>
<body class="hold-transition light-skin sidebar-mini theme-primary fixed">

    <form id="form1" runat="server">


        <header class="main-header">
            <div class="d-flex align-items-center logo-box justify-content-start">
                <!-- Logo -->
                <a href="index.html" class="logo">
                    <!-- logo-->

                    <div class="logo-lg">
                        <span class="light-logo">
                            <img src="/images/medusind.png" alt="logo" /></span>

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
                                            <asp:Label ID="Label2" runat="server" class="pt-5 fs-14 mb-0 fw-800 text-primary"></asp:Label>
                                        </div>
                                        <div class="text-end me-10">
                                            <asp:Label ID="Label3" runat="server" class="pt-5 fs-14 mb-0 fw-800 text-success"></asp:Label>
                                        </div>

                                    </div>

                                    <div class="d-flex justify-content-between align-items-center">
                                        <asp:Image ID="profile" runat="server" class="me-10 avatar rounded-circle" />

                                    </div>
                                </div>
                            </a>

                        </li>
                        <asp:LinkButton ID="logout" runat="server" class="pt-5 fs-10 mb-0 fw-800 text-danger" OnClick="logout_Click">Logout</asp:LinkButton>
                    </ul>
                </div>
            </nav>
        </header>
        <!--#include file = "sidepanel.html" -->
        <div class="content-wrapper">
            <div class="container-full">

                <div class="row">

                    <!--Cards-->


                    <div class="col-xl-6">
                        <a href="#" class="box bg-danger bg-hover-danger">
                            <div class="box-body">
                                <span class="text-white icon-Cart2 fs-40"><span class="path1"></span><span class="path2"></span></span>
                                <div class="text-white fw-600 fs-18 mb-2 mt-5">Reports</div>
                                <div class="text-white fs-16">0</div>
                            </div>
                        </a>





                    </div>

                    <div class="col-xl-6">
                        <a href="#" class="box bg-info bg-hover-info">
                            <div class="box-body">
                                <span class="text-white icon-Layout-arrange fs-60"><span class="path1"></span><span class="path2"></span></span>
                                <div class="text-white fw-600 fs-18 mb-2 mt-5">Appointment

                                <div class="text-white fs-16"></div>
                            </div>
                        </a>
                    </div>



                </div>
            </div>
        </div>

        <div class="modal center-modal fade" id="modal-center" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body">
                        <h4 class="box-title text-info mb-0"><i class="ti-user me-15"></i>Appointment Details</h4>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">First Name</label>
                                    <asp:TextBox ID="fname" runat="server" class="form-control" placeholder="First Name..." AutoComplete="off"></asp:TextBox>
                                    &nbsp;&nbsp;
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="fname" Display="Dynamic" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">Last Name</label>
                                    <asp:TextBox ID="lname" runat="server" class="form-control" placeholder="last Name..." AutoComplete="off"></asp:TextBox>
                                    &nbsp;&nbsp;
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="lname" Display="Dynamic" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">E-mail</label>
                                    <asp:TextBox ID="emailid" runat="server" class="form-control" placeholder="E-MailId..." AutoComplete="off"></asp:TextBox>
                                    &nbsp;&nbsp;
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="emailid" Display="Dynamic" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>


                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">DOA</label>

                                    <asp:TextBox ID="dob" runat="server" type="date" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="dob" Display="Dynamic" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>

                                </div>
                            </div>

                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">Department</label>

                                    <asp:DropDownList ID="deptlist" runat="server" class="form-control" AutoComplete="off" >
                                    </asp:DropDownList>

                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">Doctor</label>
                                    <asp:DropDownList ID="doctorlist" runat="server" class="form-control"  AutoComplete="off" >
											
								       </asp:DropDownList>
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            

                            <div class="row">
                                <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">Time</label>
                                    <asp:DropDownList ID="DropDownList1" runat="server" class="form-control"  AutoComplete="off" >
											
								       </asp:DropDownList>
                                </div>
                            </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">COMMENTS</label>
                                        <asp:TextBox ID="experience" runat="server" class="form-control" placeholder="Experience..." AutoComplete="off"></asp:TextBox>
                                        &nbsp;&nbsp;
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="experience" Display="Dynamic" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>

                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">Status</label>
                                        <asp:DropDownList ID="status" runat="server" class="form-control">
                                            <asp:ListItem>active</asp:ListItem>
                                            <asp:ListItem>nonactive</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="form-label">Select Profile</label>
                                <asp:FileUpload ID="FileUpload1" runat="server" />
                            </div>
                            <div class="modal-footer modal-footer-uniform">
                                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>

                                <%--	<asp:Button  ID="regdoc" runat="server" Text="Save"   OnClick="regtDoc_Click" class="btn btn-primary float-end"/>--%>
                            </div>
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


    <script src="js/template.js"></script>
    <script src="js/pages/dashboard3.js"></script>

</body>
</html>
