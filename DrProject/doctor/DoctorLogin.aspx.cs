using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DrProject.doctor
{
    public partial class DoctorLogin : System.Web.UI.Page
    {
        static string decryptedpwd;
        SqlConnection con = new SqlConnection();
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                Response.Redirect("dashboard.aspx");

            }
            else
            {
                con.ConnectionString = "Data Source=192.168.10.18;database=TrainingDB; user id = TrainingDB_User; password = 'X1;xbhpUN#a5eGHt4ohF' ";
                con.Close();
            }
        }
        protected void password_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btn_login_Click(object sender, EventArgs e)
        {
           
            cmd.CommandText = "select * from doctor  where emailid = '" + username.Text + "' ";
            cmd.Connection = con;
            da.SelectCommand = cmd;
            da.Fill(ds, "doctor");

            string uname;
            string pass;
            if (ds.Tables[0].Rows.Count > 0)
            {

                uname = ds.Tables[0].Rows[0]["emailid"].ToString();
                pass = ds.Tables[0].Rows[0]["password"].ToString();
                decryptpwd(pass);
                if (uname == username.Text && decryptedpwd == password.Text)
                {
                    Session["user"] = uname;
                    Response.Redirect("dashboard.aspx");
                }
                else
                {
                    errormessage();

                }
            }
            else
            {
                errormessage();

            }


        }
        public  void  decryptpwd(string encryptpwd)
        {
            string decryptpwd = string.Empty;
            UTF8Encoding encodepwd = new UTF8Encoding();
            Decoder Decode = encodepwd.GetDecoder();
            byte[] todecode_byte = Convert.FromBase64String(encryptpwd);
            int charCount = Decode.GetCharCount(todecode_byte, 0, todecode_byte.Length);
            char[] decoded_char = new char[charCount];
            Decode.GetChars(todecode_byte, 0, todecode_byte.Length, decoded_char, 0);
            decryptpwd = new string(decoded_char);
            decryptedpwd =  decryptpwd;
        }
        public void errormessage()
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
              "Swal.fire('Invalid Credentials', 'Try again..!', 'error')", true);

        }
    }
}