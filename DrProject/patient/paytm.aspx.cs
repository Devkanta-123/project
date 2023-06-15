using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Razorpay.Api;
namespace DrProject
{
    public partial class paytm : System.Web.UI.Page
    {
        public string orderId;
        public string orderIds;
        public string name;
        public string product;
        public string email;
        public string contact;
        public string addressn;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {

                 
                    product = "Dr Suresh Appointment";
                    contact = "9366535583";
                    Session["product"] = product;
                    Session["totalprice"] = "1500";
                    Dictionary<string, object> input = new Dictionary<string, object>();
                    int am = 1500;
                    //string orderss = Session["OrderId"].ToString();
                    string orderss = System.DateTime.Now.Ticks.ToString();
                    orderIds = orderss;
                    //
                    input.Add("amount", am * 100);
                    //input.Add("amount", 100); // this amount should be same as transaction amount
                    input.Add("currency", "INR");
                    input.Add("receipt", orderss);
                    input.Add("payment_capture", 1);

                    string key = "rzp_test_VObblfrigYqiCf";
                    string secret = "Pa0BdvYFCTgg4yoBT0zfThW3";

                    //Session["totalprice"] = "100";
                    RazorpayClient client = new RazorpayClient(key, secret);
                    System.Net.ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
                    Razorpay.Api.Order order = client.Order.Create(input);
                    orderId = order["id"].ToString();


                }
                catch (Exception ex)
                {

                }
            }
        }
    }
}