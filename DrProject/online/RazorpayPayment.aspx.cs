using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DrProject.online
{
    public partial class RazorpayPayment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Redirect(string.Format("RazorPayCheckout.aspx?Name={0}&Email={1}Contact={2}&Amount={3}&Product={4}", txtName.Text,txtEmail.Text,txtContact.Text,txtAmount.Text,txtProduct.Text));
        }
    }
}