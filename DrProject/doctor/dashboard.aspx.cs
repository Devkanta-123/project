using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace DrProject.doctor
{
    public partial class dashboard : System.Web.UI.Page
    {
        string cnstr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
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
                con = new SqlConnection(cnstr);
                con.Close();
                callData();
                getrecentpatient();

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
        public void getrecentpatient()
        {

            con = new SqlConnection(cnstr);
            con.Open();
            cmd.CommandText = "select a.name,a.time  from appoint a  INNER JOIN doctor d  on a.d_id = d.id    where d.emailid = '" + Session["user"] + "' ";
            cmd.Connection = con;
            da.SelectCommand = cmd;
            da.Fill(dt);
            fetchpatient.DataSource = dt;
            fetchpatient.DataBind();
        }
        public void callData()
        {
            cmd.CommandText = "select * from doctor  where emailid = '" + Session["user"] + "' ";
            cmd.Connection = con;
            da.SelectCommand = cmd;
            da.Fill(ds);
            Label2.Text = ds.Tables[0].Rows[0]["emailid"].ToString();
            Label3.Text = ds.Tables[0].Rows[0]["fname"].ToString();
            Label1.Text = ds.Tables[0].Rows[0]["phno"].ToString();
            Label4.Text = ds.Tables[0].Rows[0]["address"].ToString();
            expe.Text = ds.Tables[0].Rows[0]["experience"].ToString();

        }
        protected void logout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Doctorlogin.aspx");

        }
    }
}