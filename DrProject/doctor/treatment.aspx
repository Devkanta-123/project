<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="treatment.aspx.cs" Inherits="DrProject.doctor.treatment" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Treatment</title>
    <link rel="stylesheet" href="/css/vendors_css.css" />  
	<link rel="stylesheet" href="/css/skin_color.css"/>
    	<link rel="stylesheet" href="/css/style.css"/>
    <link href="/css/bootstrap.css" rel="stylesheet" />
    <script src="/js/jquery-1.8.2.js"></script>
    <script src="/js/bootstrap.js"></script>   
</head>
<body class="hold-transition light-skin sidebar-mini theme-primary fixed">
    <form id="form1" runat="server">
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
        <div style="width: 90%; margin-right: 5%; margin-left: 5%; text-align: center">
            <asp:ScriptManager runat="server" ID="ScriptManager1" />
            <h3 style="text-align: center;">ASP.NET GridVIew: CRUD using Twitter Bootstrap Modal Popup</h3>
            <p style="text-align: center;">Demo by Priya Darshini - Tutorial @ <a href="http://www.programming-free.com/2013/09/gridview-crud-bootstrap-modal-popup.html">Programmingfree</a></p>
            <!-- Placing GridView in UpdatePanel-->
            <asp:UpdatePanel ID="upCrudGrid" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="GridView1" runat="server" Width="940px" HorizontalAlign="Center"
                        OnRowCommand="GridView1_RowCommand" AutoGenerateColumns="false" AllowPaging="true"
                        DataKeyNames="appointment_id" CssClass="table table-hover table-striped" >
                        <Columns>
                         
                            <asp:ButtonField CommandName="detail"  ControlStyle-CssClass="btn btn-info"
                                ButtonType="Button" Text="Detail" HeaderText="Detailed View">
                                <ControlStyle CssClass="btn btn-primary" ></ControlStyle>
                            </asp:ButtonField>
                              <asp:ButtonField CommandName="test" ControlStyle-CssClass="btn btn-info" 
                                ButtonType="Button" Text="Test" HeaderText="Detailed View">
                                <ControlStyle CssClass="btn btn-warning"></ControlStyle>
                            </asp:ButtonField>
                            <asp:ButtonField CommandName="editRecord" ControlStyle-CssClass="btn btn-info"
                                ButtonType="Button" Text="Edit" HeaderText="Edit Record">
                                <ControlStyle CssClass="btn btn-info"></ControlStyle>
                            </asp:ButtonField>
                            <asp:ButtonField CommandName="deleteRecord" ControlStyle-CssClass="btn btn-info"
                                ButtonType="Button" Text="Delete" HeaderText="Delete Record">
                                <ControlStyle CssClass="btn btn-info"></ControlStyle>
                            </asp:ButtonField>
                            <asp:BoundField DataField="appointment_id" HeaderText="Code" />
                            <asp:BoundField DataField="status" HeaderText="Name" />
                            <asp:BoundField DataField="appoint_docId" HeaderText="Continent" />
                            <asp:BoundField DataField="appoint_date" HeaderText="Region" />
             
                        </Columns>
                    </asp:GridView>
                    <asp:Button ID="btnAdd" runat="server" Text="Add New Record" CssClass="btn btn-info" OnClick="btnAdd_Click" />
                </ContentTemplate>
                <Triggers>
                </Triggers>
            </asp:UpdatePanel>

            <!-- Detail Modal Starts here-->
            <div id="detailModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3 id="myModalLabel">Detailed View</h3>
                </div>
                <div class="modal-body">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <asp:DetailsView ID="DetailsView1" runat="server" CssClass="table table-bordered table-hover" BackColor="White" ForeColor="Black" FieldHeaderStyle-Wrap="false" FieldHeaderStyle-Font-Bold="true" FieldHeaderStyle-BackColor="LavenderBlush" FieldHeaderStyle-ForeColor="Black" BorderStyle="Groove" AutoGenerateRows="False">
                                <Fields>
                              <asp:BoundField DataField="appointment_id" HeaderText="Code" />
                            <asp:BoundField DataField="status" HeaderText="Name" />
                            <asp:BoundField DataField="appoint_docId" HeaderText="Continent" />
                            <asp:BoundField DataField="appoint_date" HeaderText="Region" />
                                </Fields>
                            </asp:DetailsView>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="RowCommand" />
                            <asp:AsyncPostBackTrigger ControlID="btnAdd" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                    <div class="modal-footer">
                        <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Close</button>
                    </div>
                </div>
            </div>
            <!-- Detail Modal Ends here -->
            <!-- Edit Modal Starts here -->
            <div id="editModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3 id="editModalLabel">Treatment</h3>
                </div>
                <asp:UpdatePanel ID="upEdit" runat="server">
                    <ContentTemplate>
                        <div class="modal-body">
                            <table class="table">
                                <tr>
                                    <td>
                            <asp:Label ID="lblappointment_id" Visible="false" runat="server"></asp:Label>
                                    </td>
                                </tr>
                              <%--  <tr>
                                    <td>Population : 
                            <asp:TextBox ID="txtPopulation" runat="server"></asp:TextBox>
                                        <asp:Label runat="server" Text="Type Integer Value!" />
                                    </td>
                                </tr>--%>
                             <%--   <tr>
                                    <td>Country Name:
                            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                                    </td>
                                </tr>--%>
                                <tr>
                                    <td>Status:
                            <asp:TextBox ID="issues" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <asp:Label ID="lblResult" Visible="false" runat="server"></asp:Label>
                            <asp:Button ID="btnSave" runat="server" Text="Update" CssClass="btn btn-info" OnClick="btnSave_Click" />
                            <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Close</button>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="RowCommand" />
                        <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
            <!-- Edit Modal Ends here -->
            <!-- Add Record Modal Starts here-->
            <div id="addModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="addModalLabel" aria-hidden="true">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3 id="addModalLabel">Add New Record</h3>
                </div>
                <asp:UpdatePanel ID="upAdd" runat="server">
                    <ContentTemplate>
                        <div class="modal-body">
                            <table class="table table-bordered table-hover">
                                <tr>
                                    <td>Country Code : 
                                <asp:TextBox ID="txtCode" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Country Name : 
                                <asp:TextBox ID="txtCountryName" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Continent Name:
                                <asp:TextBox ID="txtContinent" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Region:
                                <asp:TextBox ID="txtRegion" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Population:
                                    <asp:TextBox ID="txtTotalPopulation" runat="server"></asp:TextBox>
                                    <asp:Label ID="Label1" runat="server" Text="Type Integer Value!" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Year of Independence
                                        <asp:TextBox ID="txtIndYear" runat="server"></asp:TextBox>
                                        <asp:Label ID="Label2" runat="server" Text="Type Integer Value!" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="modal-footer">                          
                            <asp:Button ID="btnAddRecord" runat="server" Text="Add" CssClass="btn btn-info" OnClick="btnAddRecord_Click" />
                            <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Close</button>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnAddRecord" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
            <!--Add Record Modal Ends here-->
            <!-- Delete Record Modal Starts here-->
            <div id="deleteModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="delModalLabel" aria-hidden="true">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3 id="delModalLabel">Delete Record</h3>
                </div>
                <asp:UpdatePanel ID="upDel" runat="server">
                    <ContentTemplate>
                        <div class="modal-body">
                            Are you sure you want to delete the record?
                            <asp:HiddenField ID="hfCode" runat="server" />
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-info" OnClick="btnDelete_Click" />
                            <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Cancel</button>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnDelete" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
            <!--Delete Record Modal Ends here -->
        </div>
    </form>
    	
	<script src="/js/pages/chat-popup.js"></script>
    
</body>
</html>
