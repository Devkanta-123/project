using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DrProject.online
{
    public partial class RazorPay : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }
        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            Response.Redirect(string.Format("RazorPay.aspx?Name={0}", txtName.Text));
        }
    }
}