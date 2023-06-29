using Razorpay.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DrProject.online
{
    public partial class RazorPayCheckout : System.Web.UI.Page
    {
        public string orderId;
        public string amount;
        public string contact;
        public string name;
        public string product;
        public string email;
		protected void Page_Load(object sender, EventArgs e)
		{
			//amount = (Int32.Parse(Request.QueryString["Amount"]) * 100).ToString();
			contact = Request.QueryString["Contact"].ToString();
			name = Request.QueryString["Name"].ToString();
			product = Request.QueryString["Product"].ToString();
			email = Request.QueryString["Email"].ToString();

			Dictionary<string, object> input = new Dictionary<string, object>();
			input.Add("amount", amount);
			input.Add("currency", "INR");
			input.Add("payment_capture", 1);

			string key = "rzp_test_VObblfrigYqiCf";
			string secret = "Pa0BdvYFCTgg4yoBT0zfThW3";

			RazorpayClient client = new RazorpayClient(key, secret);

			Razorpay.Api.Order order = client.Order.Create(input);
			orderId = order["id"].ToString();

		}
	}
}