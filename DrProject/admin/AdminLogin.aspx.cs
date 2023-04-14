using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace DrProject
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection();
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds =  new DataSet();
        DataTable dt =  new DataTable();
        SqlCommand cmd = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                Response.Redirect("admin.aspx");
            }
            else {
                con.ConnectionString = "Data Source = 192.168.10.18; database = TrainingDB; user id = TrainingDB_User; password = 'X1;xbhpUN#a5eGHt4ohF' ";
                con.Close();
            }
        }
       
        protected void btn_login_Click(object sender, EventArgs e)
        {
            string user = username.Text.Trim();
            cmd.CommandText = "select * from admin  where emailid = '" + username.Text + "' and password ='" + password.Text + "' ";
            cmd.Connection = con;
            da.SelectCommand = cmd;
            da.Fill(ds,"admin");
            if (ds.Tables[0].Rows.Count > 0)
            {
                Session["user"] = user;
                Response.Redirect("admin.aspx");
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                "Swal.fire('Invalid Credentials', 'Try again..!', 'error')", true);
            }


        }

      
        protected void password_TextChanged(object sender, EventArgs e)
        {

        }
    }
}