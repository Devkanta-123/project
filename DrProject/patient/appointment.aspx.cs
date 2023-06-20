using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Services;

namespace DrProject.patient
{
    public partial class appointment : System.Web.UI.Page
    {
        string constr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
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
            string query = "select a.appointment_id,a.payment_status,a.appoint_date,a.appoint_time,a.fees,d.fname from appointment a inner join patient p on p.id=a.patientId inner join doctor d on a.appoint_docId = d.id where p.emailid=  '" + Session["user"] + "' ";
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
        protected void Button1_Click1(object sender, EventArgs e)
        {
            con = new SqlConnection(constr);
            con.Open();
            cmd = new SqlCommand("update appointment set payment_status ='paid' where patiendId = '" + patient_id + "'  ", con);
            cmd.ExecuteNonQuery();
            con.Close();
            string message = "Payment Success";
            string script = "window.onload = function(){ alert('";
            script += message;
            script += "');";
            script += "window.location = '";
            script += Request.Url.AbsoluteUri;
            script += "'; }";
            ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
        }
        private static DataTable AppointmentMaster()
        {
            string constr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            string query = "select * from appointment ";
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        return dt;
                    }
                }
            }
        }

        private static DataTable AppointmentStatus()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("StatusId", typeof(int));
            dt.Columns.Add("Status", typeof(string));
            dt.Rows.Add(1, "Booked");
            dt.Rows.Add(2, "Approved");
            dt.Rows.Add(3, "OngoingTreatment");
            dt.Rows.Add(4, "Completed");
            return dt;
        }

        [WebMethod]
        public static string GetStatus(string appointID)
        {
            string status = (from om in AppointmentMaster().AsEnumerable()
                             join os in AppointmentStatus().AsEnumerable() on om["app_status_code"] equals os["StatusId"]
                             where om["appointment_id"].ToString() == appointID
                             select os["Status"]).FirstOrDefault().ToString();
            return status;
        }


    }

  }
       
   



