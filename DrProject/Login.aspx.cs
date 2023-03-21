using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace DrProject
{
    public partial class Login : System.Web.UI.Page
    {
        //public static SqlConnection con;
        public static SqlDataAdapter da;
        public static DataSet ds;
        public static DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
       
        protected void btn_login_Click(object sender, EventArgs e)
        {
             SqlConnection  con = new SqlConnection("Data Source=DESKTOP-RLOTTM7\\SQLEXPRESS;database=appointment; user id = konsam ;password = 12345");
            da = new SqlDataAdapter("select * from  login where username = '" +username.Text+"' and password ='"+password.Text+"' and role = '"+ DropDownList1.SelectedItem.ToString()+"'",con);
            dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Response.Write(" <script> alert('You are loggin as " +dt.Rows[0][3]+ "')</script>");

                if (DropDownList1.SelectedIndex == 0)
                
                    Response.Redirect("admin.aspx");

                else if (DropDownList1.SelectedIndex == 1)


                    Response.Redirect("doctor.aspx");
                
                else if (DropDownList1.SelectedIndex == 2)


                        Response.Redirect("patient.aspx");
            }
            else
            {
                Response.Write(" <script> alert(' Inavlid Credentials')</script>");
                
            }


        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void password_TextChanged(object sender, EventArgs e)
        {

        }
    }
}