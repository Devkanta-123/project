using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace DrProject.doctor
{
    public partial class dashboard : System.Web.UI.Page
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
                Response.Redirect("DoctorLogin.aspx");
            }
            else
            {
                con = new SqlConnection(cnstr);
                con.Close();
                callData();
                getrecentpatient();
                //patientget();

                if (ds.Tables[0].Rows[0]["profile"].ToString().Length > 1)
                {
                    profile.ImageUrl = ds.Tables[0].Rows[0]["profile"].ToString();
                }
                else
                {
                    profile.ImageUrl = "/images/default.jpg";
                }
            }
        }
        private void BindGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            string query = "SELECT id,fname,lname,emailid,designation,status FROM doctor";
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
            string design = (row.FindControl("Designation") as TextBox).Text;
            string status = (row.FindControl("newstatus") as DropDownList).Text;
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
                    cmd.Parameters.AddWithValue("@Ustatus", status);
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
                (e.Row.Cells[5].Controls[2] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";
            }
        }

        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }

        public void getrecentpatient()
        {

            con = new SqlConnection(cnstr);
            con.Open();
            cmd.CommandText = "select a.appoint_date,a.appoint_TIME  from appointment a  INNER JOIN doctor d  on a.appoint_docId = d.id    where d.emailid = '" + Session["user"] + "' ";
            cmd.Connection = con;
            da.SelectCommand = cmd;
            da.Fill(dt);
            fetchpatient.DataSource = dt;
            fetchpatient.DataBind();
        }
        //public void patientget()
        //{

        //    con = new SqlConnection(cnstr);
        //    con.Open();
        //    cmd.CommandText = "select fullname from patient ";
        //    cmd.Connection = con;
        //    da.SelectCommand = cmd;
        //    da.Fill(dt);
        //    patient.DataSource = dt;
        //    patient.DataBind();
        //}
        public void regtDept_Click(object sender, EventArgs e)
        {


                    cmd = new SqlCommand("insert into availability " + " (doc_id,Time,fees) " +
                     "values('" + id.Text + "','" + timing.Text + "','" + fees.Text + "')", con);

                    cmd.ExecuteNonQuery();
                    con.Close();

                    string message = "Successfully Saved Data.";
                    string script = "window.onload = function(){ alert('";
                    script += message;
                    script += "');";
                    script += "window.location = '";
                    script += Request.Url.AbsoluteUri;
                    script += "'; }";
                    ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
                
         }
        public void callData()
        {
            cmd.CommandText = "select * from doctor  where emailid = '" + Session["user"] + "' ";
            cmd.Connection = con;
            da.SelectCommand = cmd;
            da.Fill(ds);
            Label2.Text = ds.Tables[0].Rows[0]["emailid"].ToString();
            Label3.Text = ds.Tables[0].Rows[0]["fname"].ToString();
            Label1.Text = ds.Tables[0].Rows[0]["phno"].ToString();
            Label4.Text = ds.Tables[0].Rows[0]["address"].ToString();
            expe.Text = ds.Tables[0].Rows[0]["experience"].ToString();
            id.Text = ds.Tables[0].Rows[0]["id"].ToString();

        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Doctorlogin.aspx");

        }
    }
}