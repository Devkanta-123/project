using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace DrProject.admin
{
    public partial class add_dept : System.Web.UI.Page
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
                Response.Redirect("AdminLogin.aspx");
            }
            else
              {

                con.Close();
                countdoctor();
                countpatients();
                countdept();
                departmentlists();
            }
           }
        public void regtDept_Click(object sender, EventArgs e)
        {
           

            if (dept_pic.HasFile)
            {
                {
                    con = new SqlConnection(cnstr);
                    con.Open();
                    string filename = dept_pic.PostedFile.FileName;
                    string filepath = "~/dept_pics" + dept_pic.FileName;
                    dept_pic.PostedFile.SaveAs(Server.MapPath("~/dept_pics") + filename);
                    cmd = new SqlCommand("insert into app_dept " + " (dept_name,status,dept_pic) " +
                     "values('" + dname.Text + "','" + dept_status.Text + "','" + filepath + "')", con);

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
        public void countdept()
        {

            con = new SqlConnection(cnstr);
            con.Open();
            SqlCommand c = new SqlCommand("select COUNT(*) from app_dept", con);
            int? RowCount = (int?)c.ExecuteScalar();
            Label1.Text = RowCount.ToString();


        }
        public void countpatients()
        {

            con = new SqlConnection(cnstr);
            con.Open();
            SqlCommand c = new SqlCommand("select COUNT(*) from patient", con);
            int? RowCount = (int?)c.ExecuteScalar();
            Label3.Text = RowCount.ToString();


        }
        public void countdoctor()
        {

            con = new SqlConnection(cnstr);
            con.Open();
            SqlCommand c = new SqlCommand("select COUNT(*) from doctor", con);
            int? RowCount = (int?)c.ExecuteScalar();
            Label4.Text = RowCount.ToString();


        }
        private void departmentlists()
        {
            using (SqlConnection con = new SqlConnection(@"Data Source=192.168.10.18;database=TrainingDB; user id = TrainingDB_User; password = 'X1;xbhpUN#a5eGHt4ohF' "))
            {
                using (SqlCommand cmd = new SqlCommand("select id,dept_name,status from app_dept"))
                {
                    SqlDataAdapter dt = new SqlDataAdapter();
                    try
                    {
                        cmd.Connection = con;
                        con.Open();
                        dt.SelectCommand = cmd;
                        DataTable dTable = new DataTable();
                        dt.Fill(dTable);
                        fetchdept.DataSource = dTable;
                        fetchdept.DataBind();
                    }
                    catch (Exception)
                    {

                    }
                }
            }
        }



    }
}