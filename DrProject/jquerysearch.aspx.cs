using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace DrProject
{
    public partial class jquerysearch : System.Web.UI.Page
    {
        string constr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            searchGridView.DataSource = getStudentDetails();
            searchGridView.DataBind();
        }

        public DataTable getStudentDetails()
        {
            SqlCommand cmd = new SqlCommand();
            SqlConnection con = new SqlConnection(constr);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "spdoctorList";
            cmd = new SqlCommand(cmd.CommandText, con);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd.CommandText, con);

            DataTable employees = new DataTable();
            adapter.Fill(employees);
            return employees;
        }
    }
}