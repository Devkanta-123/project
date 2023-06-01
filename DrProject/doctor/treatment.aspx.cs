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
    public partial class treatment1 : System.Web.UI.Page
    {
        string cnstr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        SqlConnection con = new SqlConnection();
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
              
                this.DocList();
                this.BindData();
            }
            if (Session["user"] == null)
            {
                Response.Redirect("DoctorLogin.aspx");
            }
            else
            {
                con = new SqlConnection(cnstr);
                con.Close();
                callData();
                todayappointment();
                countpatients();
                //patientget();

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
        private void BindData()
        {
            string strQuery = "select a.appointment_id,a.appoint_date,a.start_date,a.end_date,a.fees,d.emailid from appointment a inner join doctor d on a.appoint_docid = d.id where d.emailid= '" + Session["user"] + "' and a.status='approved' ";
            SqlCommand cmd = new SqlCommand(strQuery);
            GridView1.DataSource = GetData(cmd);
            GridView1.DataBind();
        }

        private DataTable GetData(SqlCommand cmd)
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(cnstr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    con.Open();
                    sda.SelectCommand = cmd;
                    sda.Fill(dt);
                    return dt;
                }
            }
        }

        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            this.BindData();
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }

        protected void Edit(object sender, EventArgs e)
        {
            using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
            {
                txtappointmentID.ReadOnly = true;
                txtappointmentID.Text = row.Cells[0].Text;
                txtstartdate.Text = row.Cells[1].Text;
                txtend_dates.Text = row.Cells[2].Text;
                treatment_fees.Text = row.Cells[3].Text;
                popup.Show();
            }
        }

        protected void Add(object sender, EventArgs e)
        {
            txtappointmentID.ReadOnly = false;
            txtappointmentID.Text = string.Empty;
            txtstartdate.Text = string.Empty;
            txtend_dates.Text = string.Empty;
            treatment_fees.Text = string.Empty;
            popup.Show();
        }

        protected void Save(object sender, EventArgs e)
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "startTreatments";
                cmd.Parameters.AddWithValue("@appointment_id", txtappointmentID.Text);
                cmd.Parameters.AddWithValue("@start_date", txtstartdate.Text);
                cmd.Parameters.AddWithValue("@end_date", txtend_dates.Text);
                cmd.Parameters.AddWithValue("@fees", treatment_fees.Text);
                GridView1.DataSource = this.GetData(cmd);
                GridView1.DataBind();
            }
        }
        public void countpatients()
        {

            con = new SqlConnection(cnstr);
            con.Open();
            SqlCommand c = new SqlCommand("select COUNT(*) , d.emailid from appointment a inner join doctor d on a.appoint_docId = d.id  where d.emailid ='" + Session["user"] + "' group by d.emailid", con);
            int? RowCount = (int?)c.ExecuteScalar();
            countpatient.Text = RowCount.ToString();
        }
      
        private void DocList()
        {
            string constr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            string query = "SELECT id,fname,profile,emailid FROM doctor  where emailid !='" + Session["user"] + "' ";
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        availabledoc.DataSource = dt;
                        availabledoc.DataBind();
                    }
                }
            }
        }

       



        public void todayappointment()
        {

            con = new SqlConnection(cnstr);
            con.Open();
            cmd.CommandText = "select a.appoint_date,a.appoint_TIME from appointment a  INNER JOIN doctor d  on a.appoint_docId = d.id   where cast(appoint_date as Date) = cast(getdate() as Date) and d.emailid = '" + Session["user"] + "' ";
            cmd.Connection = con;
            da.SelectCommand = cmd;
            da.Fill(dt);
            fetchpatient.DataSource = dt;
            fetchpatient.DataBind();
        }

        public void regtDept_Click(object sender, EventArgs e)
        {


            cmd = new SqlCommand("insert into availability " + " (doc_id,Time,fees) " +
             "values('" + id.Text + "','" + timing.Text + "','" + fees.Text + "')", con);

            cmd.ExecuteNonQuery();
            con.Close();

            string message = "Successfully Saved Data.";
            string script = "window.onload = function(){ alert('";
            script += message;
            script += "');";
            script += "window.location = '";
            script += Request.Url.AbsoluteUri;
            script += "'; }";
            ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);

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
            id.Text = ds.Tables[0].Rows[0]["id"].ToString();

        }
        protected void logout_Click1(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Doctorlogin.aspx");
        }
       
    }
}