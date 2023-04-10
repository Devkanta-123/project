using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace DrProject
{
    public partial class admin : System.Web.UI.Page
    {
        string cnstr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        SqlConnection con = new SqlConnection();
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getDept();
            }

            if  (Session["user"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
            }
            else
            {

                con.Close();
                callData();
                countdoctor();
                getrecentpatient();
            }
        }
        public void getDept()
        {
            con = new SqlConnection(cnstr);
            con.Open();
            SqlCommand de = new SqlCommand("select * from  [dbo].[app_dept]  where status = 'active' ", con);
            de.CommandType = CommandType.Text;
            department.DataSource = de.ExecuteReader();
            department.DataTextField = "dept_name";
            department.DataValueField = "id";
            department.DataBind();
            department.Items.Insert(0, new ListItem("Select Department", "0"));
        
        }
      
       
        public void callData()
        {
            con = new SqlConnection(cnstr);
            con.Open();
            cmd.CommandText = "select * from admin  where emailid = '" + Session["user"] + "' ";
            cmd.Connection = con;
            da.SelectCommand = cmd;
            da.Fill(ds);
            Label2.Text = ds.Tables[0].Rows [0]["emailid"].ToString();

        }
        public void getrecentpatient()
        {

            con = new SqlConnection(cnstr);
            con.Open();
            cmd.CommandText = " select  TOP 3  fullname AS FULL_NAME,emailid AS Email_ID ,address AS ADDRESS,phone AS PHN ,age as AGE  from patient order by id DESC";
            cmd.Connection = con;
            da.SelectCommand = cmd;
            da.Fill(dt);
            fetchpatient.DataSource = dt;
            fetchpatient.DataBind();
        }
        public void countdoctor()
        {
            con = new SqlConnection(cnstr);
            con.Open();
            SqlCommand dr = new SqlCommand("select COUNT(*) from doctor",con);
            int? RowCount = (int?)dr.ExecuteScalar();
            Label4.Text = RowCount.ToString();
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            if (Session == null)
            {
                Session.Abandon();
                Response.Redirect("AdminLogin.aspx");           
            }
        }

    
   
        protected void regtDoc_Click(object sender, EventArgs e)
        {
            con = new SqlConnection(cnstr);
            con.Open();
            SqlCommand checkmail = new SqlCommand("select * from doctor where emailid='" + emailid.Text + "'", con);
            SqlDataAdapter da = new SqlDataAdapter(checkmail);
            DataTable dt = new DataTable();
            da.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                Response.Write(" <script> alert(' Email Alredy Exists')</script>");

                Response.Redirect("admin.aspx");
            }
            else if(profile.HasFile)
            {
                {
                    string filename = profile.PostedFile.FileName;
                    string filepath = "~/doctor/profiles/" + profile.FileName;
                    profile.PostedFile.SaveAs(Server.MapPath("~/doctor/profiles/") + filename);
                    cmd = new SqlCommand("insert into doctor " + " (fname,lname,emailid,password,designation,dept,phno,dob,address,experience,profile) " +
                     "values('" + fname.Text + "','" + lname.Text + "','" + emailid.Text + "','" + password.Text + "','" +designation.Text + "','" + department.Text + "','" + phno.Text + "','" + dob.Text + "','" + address.Text + "','" + experience.Text + "','" + filepath + "')", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    string message = "Doctor added successfully.";
                    string script = "window.onload = function(){ alert('";
                    script += message;
                    script += "');";
                    script += "window.location = '";
                    script += Request.Url.AbsoluteUri;
                    script += "'; }";
                    ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
                }
            }

        }

        protected void fetchpatient_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}