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
    public partial class doctor : System.Web.UI.Page
    {
        string cnstr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        SqlConnection con = new SqlConnection();
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.BindGrid();
            }
            if (Session["user"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
            }
            else
            {
                con.Close();
                callData();
                countdoctor();
                countdept();
                countpatients();
               GridView1.DataSource = SearchDoctors();
                GridView1.DataBind();

            }
        }

        public void callData()
        {
            con = new SqlConnection(cnstr);
            con.Open();
            cmd.CommandText = "select * from admin  where emailid = '" + Session["user"] + "' ";
            cmd.Connection = con;
            da.SelectCommand = cmd;
            da.Fill(ds);
            Label2.Text = ds.Tables[0].Rows[0]["emailid"].ToString();

        }
        #region
        public void countdoctor()
        {

            con = new SqlConnection(cnstr);
            con.Open();
            SqlCommand c = new SqlCommand("select COUNT(*) from doctor", con);
            int? RowCount = (int?)c.ExecuteScalar();
            Label4.Text = RowCount.ToString();


        }
        #endregion
        public void countdept()
        {

            con = new SqlConnection(cnstr);
            con.Open();
            SqlCommand c = new SqlCommand("select COUNT(*) from app_dept", con);
            int? RowCount = (int?)c.ExecuteScalar();
            Label1.Text = RowCount.ToString();


        }
        public void countpatients()
        {

            con = new SqlConnection(cnstr);
            con.Open();
            SqlCommand c = new SqlCommand("select COUNT(*) from patient", con);
            int? RowCount = (int?)c.ExecuteScalar();
            Label3.Text = RowCount.ToString();


        }

        protected void logout_Click(object sender, EventArgs e)
        {
            if (Session == null)
            {
                Response.Redirect("AdminLogin.aspx");
            }
        }

        private void BindGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            string query = "SELECT id,fname,lname,emailid,designation,status,profile FROM doctor";
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                }
            }
        }
        public DataTable SearchDoctors()
        {
            string constr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
             cmd = new SqlCommand();
            SqlConnection con = new SqlConnection(constr);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "spdoctorList";
            cmd = new SqlCommand(cmd.CommandText, con);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd.CommandText, con);

            DataTable employees = new DataTable();
            adapter.Fill(employees);
            return employees;
        }


        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            this.BindGrid();
        }

        protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            int Id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            string name = (row.FindControl("txtName") as TextBox).Text;
            string lname = (row.FindControl("txtLname") as TextBox).Text;
            string email = (row.FindControl("txtEmail") as TextBox).Text;
            string design= (row.FindControl("Designation") as TextBox).Text;
            string status= (row.FindControl("newstatus") as DropDownList).Text;
            string query = "UPDATE doctor SET  fname=@Fname, lname=@Lname,emailid=@EmailID, designation=@Degn,status=@Ustatus WHERE id=@DocID";
            string constr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@DocID", Id);
                    cmd.Parameters.AddWithValue("@Fname", name);
                    cmd.Parameters.AddWithValue("@Lname", lname);
                    cmd.Parameters.AddWithValue("@EmailID", email);
                    cmd.Parameters.AddWithValue("@Degn", design);
                    cmd.Parameters.AddWithValue("@Ustatus",status);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            GridView1.EditIndex = -1;
            this.BindGrid();
        }

        protected void OnRowCancelingEdit(object sender, EventArgs e)
        {
            GridView1.EditIndex = -1;
            this.BindGrid();
        }

        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            string query = "DELETE FROM doctor WHERE id=@DocId";
            string constr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@DocId", id);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

            this.BindGrid();
        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != GridView1.EditIndex)
            {
                (e.Row.Cells[6].Controls[2] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    Label newstatus = (Label)e.Row.FindControl("lblNewstatus");
                    if (newstatus.Text == "Active")
                    {
                        newstatus.CssClass = "badge badge-pill badge-info";
                    }
                    else if (newstatus.Text == "On Leave")
                    {
                        newstatus.CssClass = "badge badge-pill badge-warning";
                    }
                    
                }
            }
        }

        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }

       
      }

}