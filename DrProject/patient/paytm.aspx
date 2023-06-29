<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master"  CodeBehind="paytm.aspx.cs" Inherits="DrProject.paytm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <form action="booked_appointment.aspx" method="post" name="razorpayForm">
            <input id="razorpay_payment_id" type="hidden" name="razorpay_payment_id" />
            <input id="razorpay_order_id" type="hidden" name="razorpay_order_id" />
            <input id="razorpay_signature" type="hidden" name="razorpay_signature" />
        </form>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <br />
    <br />
    <link rel="stylesheet" href="/css/style.css">
	<link rel="stylesheet" href="/css/skin_color.css" />
     <div class="content-wrapper">
	  <div class="container-full">
    	<section class="content">
     <div class="box">
			<div class="box-header with-border">
			
                <button class="btn btn-primary"  id="rzp-button1" >Pay With Razorpay</button>
                <button class="btn btn-warning"><a href="dashboard.aspx">Back</button>
			</div>
			</div>
            </section>
          </div>
			</div>

        <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
        <script>
            var orderId = "<%=orderId%>"
            var options = {
                "name": "<%=description%>",
                "description": "<%=description%>",
                "order_id": orderId,
                "data-prefill": {
                    "name": "<%=name%>",
                    "email": "<%=email%>",
                    "contact": "<%=contact%>",
                },
                "notes": {
                    "address": "<%=addressn%>",
                    "merchant_order_id": "<%=orderIds%>",
                },
                "theme": {
                    "color": "#F37254"
                }
            }
            // Boolean whether to show image inside a white frame. (default: true)
            options.theme.image_padding = false;
            options.handler = function (response) {
                document.getElementById('razorpay_payment_id').value = response.razorpay_payment_id;
                document.getElementById('razorpay_order_id').value = orderId;
                document.getElementById('razorpay_signature').value = response.razorpay_signature;
                document.razorpayForm.submit();
            };
            options.modal = {
                ondismiss: function () {
                    console.log("This code runs when the popup is closed");
                },
                // Boolean indicating whether pressing escape key 
                // should close the checkout form. (default: true)
                escape: true,
                // Boolean indicating whether clicking translucent blank
                // space outside checkout form should close the form. (default: false)
                backdropclose: false
            };
            var rzp = new Razorpay(options);
            document.getElementById('rzp-button1').onclick = function (e) {
                rzp.open();
                e.preventDefault();
            }
        </script>
</asp:Content>
