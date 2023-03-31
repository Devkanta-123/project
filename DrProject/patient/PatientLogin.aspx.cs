using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace DrProject.patient
{
    public partial class PatientLogin : System.Web.UI.Page
    {
        public static SqlConnection con;
        public static SqlDataAdapter da;
        public static DataSet ds;
        public static DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_login_Click(object sender, EventArgs e)
        {
            con = new SqlConnection("Data Source=192.168.10.18;database=TrainingDB; user id = TrainingDB_User; password = 'X1;xbhpUN#a5eGHt4ohF' ");
            da = new SqlDataAdapter("select * from patient  where emailid = '" + emailid.Text + "' and password ='" + password.Text + "' ", con);
            dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {

                Response.Redirect("dashboard.aspx");


            }
            else
            {
                Response.Write(" <script> alert(' Inavlid Credentials')</script>");

            }


        }
        protected void password_TextChanged(object sender, EventArgs e)
        {

        }
    }
    
}