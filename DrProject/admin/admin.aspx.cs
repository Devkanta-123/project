using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;

namespace DrProject
{
    public partial class Admin : System.Web.UI.Page
    {
        string cnstr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        SqlConnection con = new SqlConnection();
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();

        protected void Page_Load(object sender, EventArgs e)
        {
            CompareValidator1.ValueToCompare = DateTime.Today.ToShortDateString();

            if (!IsPostBack)
            {
                getDept();
            }

            if (Session["user"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
            }
            else
            {

                con.Close();
                callData();
                countdoctor();
                countdept();
                countpatient();
                RecentPatient();

            }
        }
      
       
        public void countpatient()
         {

            con = new SqlConnection(cnstr);
            con.Open();
            SqlCommand c = new SqlCommand("select COUNT(*) from patient", con);
            int? RowCount = (int?)c.ExecuteScalar();
            Label3.Text = RowCount.ToString();
        }
        public void getDept()
        {
            con = new SqlConnection(cnstr);
            con.Open();
            SqlCommand de = new SqlCommand("select * from app_dept", con);
            de.CommandType = CommandType.Text;
            department.DataSource = de.ExecuteReader();
            department.DataTextField = "dept_name";
            department.DataValueField = "id";
            department.DataBind();
            department.Items.Insert(0, new ListItem("Select Department", "0"));
        }
        private void RecentPatient()
        {
            using (SqlConnection con = new SqlConnection(@"Data Source=192.168.10.18;database=TrainingDB; user id = TrainingDB_User; password = 'X1;xbhpUN#a5eGHt4ohF' "))
            {
                using (SqlCommand cmd = new SqlCommand("select top 3 fullname as FullName,emailid as Email , address as Address ,phone as Phone, age as Age   from patient order by id desc"))
                {
                    SqlDataAdapter dt = new SqlDataAdapter();
                    try
                    {
                        cmd.Connection = con;
                        con.Open();
                        dt.SelectCommand = cmd;
                        DataTable dTable = new DataTable();
                        dt.Fill(dTable);
                        fetchpatient.DataSource = dTable;
                        fetchpatient.DataBind();
                    }
                    catch (Exception)
                    {
                        
                    }
                }
            }
        }

        public void callData()
        {
            con = new SqlConnection(cnstr);
            con.Open();
            cmd.CommandText = "select * from admin  where emailid = '" + Session["user"] + "' ";
            cmd.Connection = con;
            da.SelectCommand = cmd;
            da.Fill(ds);
            Label2.Text = ds.Tables[0].Rows[0]["emailid"].ToString();

        }
        #region
        public void countdoctor()
        {

            con = new SqlConnection(cnstr);
            con.Open();
            SqlCommand c = new SqlCommand("select COUNT(*) from doctor",con);
            int? RowCount = (int?)c.ExecuteScalar();
            Label4.Text = RowCount.ToString();


        }
        #endregion
        public void countdept()
        {
            con = new SqlConnection(cnstr);
            con.Open();
            SqlCommand c = new SqlCommand("select COUNT(*) from app_dept", con);
            int? RowCount = (int?)c.ExecuteScalar();
            Label1.Text = RowCount.ToString();
        }
        protected void logout_Click(object sender, EventArgs e)
        {
            if (Session == null)
            {
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
            else if (profile.HasFile)
            {
                {
                    string strpass = encryptpass(password.Text);
                    string filename = profile.PostedFile.FileName;
                    string filepath = "~/doctor/profiles/" + profile.FileName;
                    profile.PostedFile.SaveAs(Server.MapPath("~/doctor/profiles/") + filename);
                    cmd = new SqlCommand("insert into doctor " + " (fname,lname,emailid,password,designation,dept,phno,dob,address,experience,profile,status) " +
                     "values('" + fname.Text + "','" + lname.Text + "','" + emailid.Text + "','" + strpass + "','" + designation.Text + "','" + department.Text + "','" + phno.Text + "','" + dob.Text + "','" + address.Text + "','" + experience.Text + "','" + filepath + "','" + status.Text + "')", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    string message = "Your details have been saved successfully.";
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
        public string encryptpass(string password)
        {
            string msg = string.Empty;
            byte[] encode = new byte[password.Length];
            encode = Encoding.UTF8.GetBytes(password);
            msg = Convert.ToBase64String(encode);
            return msg;
        }
    }
}