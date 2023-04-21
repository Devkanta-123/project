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
    public partial class patient : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection();
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        string cnstr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            
                getDept();
            


            if (Session["user"] == null)
            {
                Response.Redirect("PatientLogin.aspx");
                
            }
            else
            {
               
                con.Close();
                callData();
                //getDept();

                if (ds.Tables[0].Rows[0]["profile"].ToString().Length > 1)
                {
                    profile.ImageUrl = ds.Tables[0].Rows[0]["profile"].ToString();
                }
                else {
                    profile.ImageUrl = "/images/default.jpg"; 
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

        }

        public void getDept()
        {
            con = new SqlConnection(cnstr);
            con.Open();
            SqlCommand de = new SqlCommand("select * from app_dept", con);
            de.CommandType = CommandType.Text;
            deptlist.DataSource = de.ExecuteReader();
            deptlist.DataTextField = "dept_name";
            deptlist.DataValueField = "id";
            deptlist.DataBind();
            deptlist.Items.Insert(0, new ListItem("Select Department", "0"));

        }
   
        protected void logout_Click(object sender, EventArgs e)
        {
                Session.Abandon();
                Response.Redirect("PatientLogin.aspx"); 
        }

       
    }
    
}