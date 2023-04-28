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
    public partial class book_appoint : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection();
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();

        protected void Page_Load(object sender, EventArgs e)
        {
            CompareValidator1.ValueToCompare = DateTime.Today.ToShortDateString();
            if (Session["user"] == null)
            {
                Response.Redirect("PatientLogin.aspx");
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
           
            if (!Page.IsPostBack)
            {
                SqlConnection con = new SqlConnection(@"Data Source=192.168.10.18;database=TrainingDB; user id = TrainingDB_User; password = 'X1;xbhpUN#a5eGHt4ohF'");
                SqlCommand cmd = new SqlCommand("select * from app_dept", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                DropDownList1.DataSource = dt;
                DropDownList1.DataBind();
         
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

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList2.Items.Clear();
            DropDownList2.Items.Add("Select Doctors");
            SqlConnection con = new SqlConnection(@"Data Source=192.168.10.18;database=TrainingDB; user id = TrainingDB_User; password = 'X1;xbhpUN#a5eGHt4ohF'");
            SqlCommand cmd = new SqlCommand("select * from doctor where dept=" + DropDownList1.SelectedItem.Value, con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            DropDownList2.DataSource = dt;
            DropDownList2.DataBind();
        }
        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList3.Items.Clear();
            DropDownList3.Items.Add("Select Timing");
            SqlConnection con = new SqlConnection(@"Data Source=192.168.10.18;database=TrainingDB; user id = TrainingDB_User; password = 'X1;xbhpUN#a5eGHt4ohF'");
            SqlCommand cmd = new SqlCommand("select * from availability where doc_id=" + DropDownList2.SelectedItem.Value, con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            DropDownList3.DataSource = dt;
            DropDownList3.DataBind();

        }

        protected void bookAppoint_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=192.168.10.18;database=TrainingDB; user id = TrainingDB_User; password = 'X1;xbhpUN#a5eGHt4ohF'");
            SqlCommand query = new SqlCommand("select* from appointment where appoint_date = @adate AND  appoint_TIME = @atime ",con);
            SqlDataAdapter da = new SqlDataAdapter(query);
            query.Parameters.AddWithValue("@adate",date.Text);
            query.Parameters.AddWithValue("@atime", DropDownList3.Text);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
               "Swal.fire('Choosen Date and Time already book ', 'Try different date and time.. ', 'error')", true);

            }
          

            else 
            {
                SqlConnection con1 = new SqlConnection(@"Data Source=192.168.10.18;database=TrainingDB; user id = TrainingDB_User; password = 'X1;xbhpUN#a5eGHt4ohF'");
                SqlCommand cmd = new SqlCommand("insert into appointment " + " (appoint_dept ,appoint_docId,appoint_date,appoint_TIME,issues,patientId,status) values('" + DropDownList1.Text + "','" + DropDownList2.Text + "','" + date.Text + "','" + DropDownList3.Text + "','" + issues.Text + "','"+patient_id.Text+ "','book')", con1);
                con1.Open();
                cmd.ExecuteNonQuery();
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                "Swal.fire('Booking Succesfull', 'We will let you know soon.....', 'success')", true);
            }

        }
      
        protected void logout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("PatientLogin.aspx");
     
        }
      
    }
}
