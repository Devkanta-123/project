using paytm;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static DrProject.paytm;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace DrProject.online
{
    public partial class payment : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
               
              
            }
        }

        protected void Submit(object sender, EventArgs e)
        {
            // Add Fake Delay to simulate long running process.
            System.Threading.Thread.Sleep(5000);
            this.LoadCustomers();
        }

        private void LoadCustomers()
        {
            string constr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            string query = "SELECT CustomerId FROM Customers WHERE Country = @Country OR @Country = ''";
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@Country", ddlCountries.SelectedItem.Value);
                    cmd.Connection = con;
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            gvCustomers.DataSource = dt;
                            gvCustomers.DataBind();
                            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
              "Swal.fire('Payment Sucessfull..', 'Thanks for your services..', 'success')", true);

                        }
                    }
                }
            }
        }
    }
}