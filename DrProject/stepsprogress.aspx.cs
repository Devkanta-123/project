using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace DrProject
{
    public partial class stepsprogress : System.Web.UI.Page
    {
        string constr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        SqlConnection con = new SqlConnection();
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {


        }
        private static DataTable AppointmentMaster()
        {
            string constr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            string query = "select * from appointment ";
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        return dt;
                    }
                }
            }
        }

        private static DataTable AppointmentStatus()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("StatusId", typeof(int));
            dt.Columns.Add("Status", typeof(string));
            dt.Rows.Add(1, "Booked");
            dt.Rows.Add(2, "Approved");
            dt.Rows.Add(3, "Cancel");
            return dt;
        }

        [WebMethod]
        public static string GetStatus(string appointID)
        {
            string status = (from om in AppointmentMaster().AsEnumerable()
                             join os in AppointmentStatus().AsEnumerable() on om["app_status_code"] equals os["StatusId"]
                             where om["appointment_id"].ToString() == appointID
                             select os["Status"]).FirstOrDefault().ToString();
            return status;
        }
    }
}