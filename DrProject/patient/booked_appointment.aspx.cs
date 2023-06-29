using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace DrProject.patient
{
    public partial class booked_appointment : System.Web.UI.Page
    {
        string constr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        SqlConnection con = new SqlConnection();
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["user"] == null)
            {
                Response.Redirect("PatientLogin.aspx");

            }
            if (!this.IsPostBack)
            {
                this.BindGrid();
            }

            else
            {

                con.ConnectionString = "Data Source = 192.168.10.18; database = TrainingDB; user id = TrainingDB_User; password = 'X1;xbhpUN#a5eGHt4ohF'";
                con.Close();
                callData();

            }

        }
        private void BindGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            string query = "select a.appointment_id,a.status,a.appoint_date,a.appoint_time,a.payment_status,a.payment_status,a.fees,d.fname,d.profile from appointment a inner join patient p on p.id=a.patientId inner join doctor d on a.appoint_docId = d.id where p.emailid= '" + Session["user"] + "'  and a.payment_status = 'pending' ";
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
           
        }

        protected void OnRowCancelingEdit(object sender, EventArgs e)
        {
           
        }

        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
           
        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != GridView1.EditIndex)
            {
                (e.Row.Cells[7].Controls[2] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    Label status = (Label)e.Row.FindControl("lblNewstatus");
                    if (status.Text == "approved")
                    {
                        status.CssClass = "badge badge-pill badge-success";
                    }
                    else if (status.Text == "book")
                    {
                        status.CssClass = "badge badge-pill badge-warning";
                    }
                    else if (status.Text == "cancel")
                    {
                        status.CssClass = "badge badge-pill badge-danger";
                    }

                    Label payment_status = (Label)e.Row.FindControl("lblpaymentstatus");

                    if (payment_status.Text == "pending")
                    {
                        payment_status.CssClass = "badge badge-pill badge-danger";
                    }
                    else if (payment_status.Text == "paid")
                    {
                        payment_status.CssClass = "badge badge-pill badge-success";
                    }

                }
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect(string.Format("paytm.aspx?Amount={0}", fees.Text));
        }
        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }
        public void callData()
        {
            cmd.CommandText = "select * from patient  where emailid = '" + Session["user"] + "' ";
            cmd.Connection = con;
            da.SelectCommand = cmd;
            da.Fill(ds);
            Label2.Text = ds.Tables[0].Rows[0]["emailid"].ToString();
            Label3.Text = ds.Tables[0].Rows[0]["fullname"].ToString();
            patient_id.Text = ds.Tables[0].Rows[0]["id"].ToString();
        }

        protected void payment_Click(object sender, EventArgs e)
        {
            con = new SqlConnection(constr);
            con.Open();
            cmd = new SqlCommand("update appointment set payment_status ='paid' where patientId = '" + patient_id.Text + "' ", con);
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect(string.Format("paytm.aspx?Amount={0}&Description={1}",fees.Text,descriptions.Text));
          
        }
    }
        
    
}