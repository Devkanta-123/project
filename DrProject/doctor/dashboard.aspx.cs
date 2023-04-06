using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace DrProject.doctor
{
    public partial class dashboard : System.Web.UI.Page
    {
        
            SqlConnection con = new SqlConnection();
            SqlDataAdapter da = new SqlDataAdapter();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand();
            protected void Page_Load(object sender, EventArgs e)
            {


                if (Session["user"] == null)
                {
                    Response.Redirect("DoctorLogin.aspx");
                }
                else
                {
                    con.ConnectionString = "Data Source=192.168.10.18;database=TrainingDB; user id = TrainingDB_User; password = 'X1;xbhpUN#a5eGHt4ohF' ";
                    con.Close();
                    callData();

                if (ds.Tables[0].Rows[0]["profile"].ToString().Length > 1)
                {
                    profile.ImageUrl = ds.Tables[0].Rows[0]["profile"].ToString();
                }
                else
                {
                    profile.ImageUrl = "/images/default.jpg";
                }
            }
            }
            public void callData()
            {
                cmd.CommandText = "select * from doctor  where emailid = '" + Session["user"] + "' ";
                cmd.Connection = con;
                da.SelectCommand = cmd;
                da.Fill(ds);
                Label2.Text = ds.Tables[0].Rows[0]["emailid"].ToString();
                Label3.Text = ds.Tables[0].Rows[0]["fname"].ToString();
            }
        protected void logout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Doctorlogin.aspx");

        }
    }

       
    
}