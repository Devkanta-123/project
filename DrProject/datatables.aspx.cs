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
    public partial class datatables : System.Web.UI.Page
    {
        string cnstr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        SqlConnection con = new SqlConnection();
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
      
     
        SqlConnection scon = new SqlConnection("Data Source = 192.168.10.18;database = TrainingDB;user id = TrainingDB_User;password= 'X1;xbhpUN#a5eGHt4ohF'");
        StringBuilder htmlTable = new StringBuilder();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (SqlCommand scmd = new SqlCommand())
                {
                    scmd.Connection = scon;
                    scmd.CommandType = CommandType.Text;
                    scmd.CommandText = "SELECT * FROM doctor";
                    scon.Open();
                    SqlDataReader articleReader = scmd.ExecuteReader();

                    htmlTable.Append("<table border='1'>");
                    htmlTable.Append("<tr><th>SlNo.</th></tr>");

                    if (articleReader.HasRows)
                    {
                        while (articleReader.Read())
                        {
                            htmlTable.Append("<tr>");
                            htmlTable.Append("<td>" + articleReader["emailid"] + "</td>");
                            //htmlTable.Append("<td>" + articleReader["Name"] + "</td>");
                            //htmlTable.Append("<td>" + articleReader["Mobno"] + "</td>");
                            //htmlTable.Append("<td>" + articleReader["EmailId"] + "</td>");
                            htmlTable.Append("</tr>");
                        }
                        htmlTable.Append("</table>");

                        PlaceHolder1.Controls.Add(new Literal { Text = htmlTable.ToString() });

                        articleReader.Close();
                        articleReader.Dispose();
                    }
                }
            }
        }

    }
}


   