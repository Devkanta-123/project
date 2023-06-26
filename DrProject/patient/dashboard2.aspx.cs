using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace DrProject.patient
{
    public partial class dashboard2 : System.Web.UI.Page
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
                Response.Redirect("PatientLogin.aspx");

            }
            else {
                fetchpatientsdata();
                callData();

            }

   

        }
        public void fetchpatientsdata()
        {
            con = new SqlConnection(cnstr);
            con.Open();
            cmd.CommandText = "select bc.lungs,bc.stomach,bc.liver,bc.heart,bc.brain,p.emailid from   body_composition bc inner join patient p on bc.patients_id = p.id where p.emailid =  '" + Session["user"] + "' ";
            cmd.Connection = con;
            da.SelectCommand = cmd;
            da.Fill(ds);
            bodyinformation.DataSource = cmd.ExecuteReader();
            bodyinformation.DataBind();
            con.Close();
        }
        public void callData()
        {
            con = new SqlConnection(cnstr);
            con.Open();
            cmd.CommandText = "select * from patient  where emailid = '" + Session["user"] + "' ";
            cmd.Connection = con;
            da.SelectCommand = cmd;
            da.Fill(ds);
            email.Text = ds.Tables[0].Rows[0]["emailid"].ToString();
        }
    }
}