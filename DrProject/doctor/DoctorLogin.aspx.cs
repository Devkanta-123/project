using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DrProject.doctor
{
    public partial class DoctorLogin : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection();
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                Response.Redirect("doctordashboard.aspx");

            }
            else
            {
                con.ConnectionString = "Data Source=192.168.10.18;database=TrainingDB; user id = TrainingDB_User; password = 'X1;xbhpUN#a5eGHt4ohF' ";
                con.Close();
            }
        }
        protected void password_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btn_login_Click(object sender, EventArgs e)
        {
            string user = username.Text.Trim();
            cmd.CommandText = "select * from doctor  where emailid = '" + username.Text + "' and password ='" + password.Text + "' ";
            cmd.Connection = con;
            da.SelectCommand = cmd;
            da.Fill(ds, "doctor");
            if (ds.Tables[0].Rows.Count > 0)
            {
                Session["user"] = user;
                Response.Redirect("doctordashboard.aspx");


            }
            else
            {
                Response.Write(" <script> alert(' Inavlid Credentials')</script>");

            }

        }
    }
}