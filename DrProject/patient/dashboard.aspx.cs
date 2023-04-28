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
            TextBox1.Attributes.Add("onkeyup", "sum();");
            TextBox2.Attributes.Add("onkeyup", "sum();");

            


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
            con = new SqlConnection(cnstr);
            con.Open();
            cmd.CommandText = "select * from patient  where emailid = '" + Session["user"] + "' ";
            cmd.Connection = con;
            da.SelectCommand = cmd;
            da.Fill(ds);
            Label2.Text = ds.Tables[0].Rows[0]["emailid"].ToString();
            Label4.Text = ds.Tables[0].Rows[0]["fullname"].ToString();
            Label7.Text = ds.Tables[0].Rows[0]["fullname"].ToString();
            Label8.Text = ds.Tables[0].Rows[0]["id"].ToString();
            Label5.Text = ds.Tables[0].Rows[0]["address"].ToString();
            Label9.Text = ds.Tables[0].Rows[0]["weight"].ToString();
            Label12.Text = ds.Tables[0].Rows[0]["weight"].ToString();
            Label10.Text = ds.Tables[0].Rows[0]["height"].ToString();
            Label11.Text = ds.Tables[0].Rows[0]["bmi"].ToString();

            Label6.Text = ds.Tables[0].Rows[0]["phone"].ToString();
            profile2.ImageUrl = ds.Tables[0].Rows[0]["profile"].ToString();
        }

  
   
        protected void logout_Click(object sender, EventArgs e)
        {
                Session.Abandon();
                Response.Redirect("PatientLogin.aspx"); 
        }

        protected void save_Click(object sender, EventArgs e)
        {
            con = new SqlConnection(cnstr);
            con.Open();
            cmd = new SqlCommand("update patient SET weight='" + TextBox1.Text + "',height='" + TextBox2.Text + "',bmi='" + TextBox3.Text + "' where emailid = '" + Session["user"] + "'", con);
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