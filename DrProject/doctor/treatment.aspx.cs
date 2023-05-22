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
                BindGridView();
                this.DocList();
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

        private void BindGridView()
        {
            string constr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            SqlCommand cmd = new SqlCommand("select  a.appointment_id,a.appoint_date,d.emailid from appointment a inner join doctor d on a.appoint_docid = d.id where d.emailid = '" + Session["user"] + "' ", con);
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditButton")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[index];
                Response.Redirect("treatment2.aspx?id=" + row.Cells[0].Text);
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