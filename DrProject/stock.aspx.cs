using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
namespace DrProject
{
    public partial class stock : System.Web.UI.Page
    {
        string cnstr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        SqlConnection con = new SqlConnection();
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            int test = 0;
            con = new SqlConnection(cnstr);
            con.Open();
            cmd = new SqlCommand("insert into  orders1 " + " (product_name,qty) " +
                "values('" + TextBox1.Text + "','" + TextBox2.Text + "')", con);
                cmd.ExecuteNonQuery();
            test = int.Parse(TextBox2.Text);  
            SqlCommand cmd1 = new SqlCommand("update stock set total_stock = total_stock - " + test +" ",con);
            cmd1.ExecuteNonQuery();
            con.Close();
                string message = "Successfully";
                string script = "window.onload = function(){ alert('";
                script += message;
                script += "');";
                script += "window.location = '";
                script += Request.Url.AbsoluteUri;
                script += "'; }";
                ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
        }
    }
}