using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


namespace DrProject.patient
{
    public partial class register : System.Web.UI.Page
    {
        public static SqlConnection con;
        public static SqlCommand cmd;
        public static SqlDataReader dr;
       
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection("Data Source=192.168.10.18;database=TrainingDB; user id = TrainingDB_User; password = 'X1;xbhpUN#a5eGHt4ohF' ");
           
           
        }
    
        
        protected void registerbtn_Click(object sender, EventArgs e)
        {

            con.Open();
            SqlCommand checkmail = new SqlCommand("select * from patient where emailid='" + emailid.Text + "'",con);
            SqlDataAdapter da = new SqlDataAdapter(checkmail);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Response.Write("<script> alert('Email Already Exits')</script>");
            }
            else 
                {
                cmd = new SqlCommand("insert into patient " + " (fullname,emailid,password,address,age,phone) values(@fullname,@emailid,@password,@address,@age,@phone)", con);
                cmd.Parameters.AddWithValue("@fullname", fullname.Text);
                cmd.Parameters.AddWithValue("@emailid", emailid.Text);
                cmd.Parameters.AddWithValue("@password", password.Text);
                cmd.Parameters.AddWithValue("@address", address.Text);
                cmd.Parameters.AddWithValue("@age", age.Text);
                cmd.Parameters.AddWithValue("@phone", phone.Text);
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
}