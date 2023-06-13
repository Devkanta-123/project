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
    public partial class appointment : System.Web.UI.Page
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
                Response.Redirect("PatientLogin.aspx");

            }
            if (!this.IsPostBack)
            {
                BindGrid();
            }

            else
            {

                con.ConnectionString = "Data Source = 192.168.10.18; database = TrainingDB; user id = TrainingDB_User; password = 'X1;xbhpUN#a5eGHt4ohF'";
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
        private void BindGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            string query = "select a.appointment_id,a.status,a.appoint_date,a.appoint_time,a.fees,d.fname from appointment a inner join patient p on p.id=a.patientId inner join doctor d on a.appoint_docId = d.id where p.emailid=  '" + Session["user"] + "' ";
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        yourappointment.DataSource = dt;
                        yourappointment.DataBind();
                    }
                }
            }
        }
        public void callData()
        {
            cmd.CommandText = "select * from patient  where emailid = '" + Session["user"] + "' ";
            cmd.Connection = con;
            da.SelectCommand = cmd;
            da.Fill(ds);
            Label2.Text = ds.Tables[0].Rows[0]["emailid"].ToString();
            Label3.Text = ds.Tables[0].Rows[0]["fullname"].ToString();
            patient_id.Text = ds.Tables[0].Rows[0]["id"].ToString();

        }

      
  

       }

       
 
}