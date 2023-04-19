using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DrProject.admin
{
    public partial class dataTables : System.Web.UI.Page
    {
        string cnstr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillEmployee();
            }

        }
        private void FillEmployee()
        {
            using (SqlConnection con = new SqlConnection(@"Data Source=192.168.10.18;database=TrainingDB; user id = TrainingDB_User; password = 'X1;xbhpUN#a5eGHt4ohF' "))
            {
                using (SqlCommand cmd = new SqlCommand("select fullname,emailid from patient"))
                {
                    SqlDataAdapter dt = new SqlDataAdapter();
                    try
                    {
                        cmd.Connection = con;
                        con.Open();
                        dt.SelectCommand = cmd;

                        DataTable dTable = new DataTable();
                        dt.Fill(dTable);

                        GridEmlpoyee.DataSource = dTable;
                        GridEmlpoyee.DataBind();
                    }
                    catch (Exception)
                    {
                        //     
                    }
                }
            }
        }
    }
}