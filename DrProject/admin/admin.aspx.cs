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
using System.Web.UI.DataVisualization.Charting;

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
                string query = "select distinct dept_name from app_dept";
                DataTable dt = GetData(query);
                ddlCountries.DataSource = dt;
                ddlCountries.DataTextField = "dept_name";
                ddlCountries.DataValueField = "dept_name";
                ddlCountries.DataBind();
                ddlCountries.Items.Insert(0, new ListItem("Select Department", ""));
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
           

            }
        }
        protected void ddlCountries_SelectedIndexChanged(object sender, EventArgs e)
        {
            Chart1.Visible = ddlCountries.SelectedValue != "";
            //select d.fname,p.fullname, count(appointment_id) from appointment a  inner join doctor d on a. appoint_docid = d. id inner join patient p  on a.patientId = p.id where fname = 'Shahuls'   group by fullname,fname  
            string query = string.Format("select d.fname,count(d.id) from app_dept de inner join doctor d  on de.id = d.dept  where de.dept_name = '{0}'   group by fname", ddlCountries.SelectedValue);
            DataTable dt = GetData(query);
            string[] x = new string[dt.Rows.Count];
            int[] y = new int[dt.Rows.Count];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                x[i] = dt.Rows[i][0].ToString();
                y[i] = Convert.ToInt32(dt.Rows[i][1]);
            }
            Chart1.Series[0].Points.DataBindXY(x, y);
            Chart1.Series[0].ChartType = SeriesChartType.Pie;
            Chart1.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;
            Chart1.Legends[0].Enabled = true;
        }

        private static DataTable GetData(string query)
        {
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand(query);
            String constr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            SqlDataAdapter sda = new SqlDataAdapter();
            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;
            sda.SelectCommand = cmd;
            sda.Fill(dt);
            return dt;
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
                    string message = "New Doctor has been added...";
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