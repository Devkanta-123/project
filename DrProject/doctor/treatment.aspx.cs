using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;


namespace DrProject.doctor
{
    public partial class treatment : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection();
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {
            BindGrid();
        }

        public void BindGrid()
        {
            try
            {
                //Fetch data from mysql database
                string cnstr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
                con = new SqlConnection(cnstr);
                con.Open();
                string cmd = "select  * from appointment";
                da = new SqlDataAdapter(cmd, con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                dt = ds.Tables[0];
                //Bind the fetched data to gridview
                GridView1.DataSource = dt;
                GridView1.DataBind();

            }
            catch (Exception ex)
            {
                System.Console.Error.Write(ex.Message);

            }

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName.Equals("detail"))
            {
                string appointment_id = GridView1.DataKeys[index].Value.ToString();
                IEnumerable<DataRow> query = from i in dt.AsEnumerable()
                                             where i.Field<Int32>("appointment_id").ToString().Equals(appointment_id)
                                             select i;
                DataTable detailTable = query.CopyToDataTable<DataRow>();
                DetailsView1.DataSource = detailTable;
                DetailsView1.DataBind();
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#detailModal').modal('show');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "DetailModalScript", sb.ToString(), false);
            }
            else if (e.CommandName.Equals("editRecord"))
            {
                GridViewRow gvrow = GridView1.Rows[index];
                lblappointment_id.Text = HttpUtility.HtmlDecode(gvrow.Cells[3].Text).ToString();
                //txtPopulation.Text = HttpUtility.HtmlDecode(gvrow.Cells[7].Text);
                //txtName.Text = HttpUtility.HtmlDecode(gvrow.Cells[4].Text);
                issues.Text = HttpUtility.HtmlDecode(gvrow.Cells[4].Text);
                lblResult.Visible = false;
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#editModal').modal('show');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "EditModalScript", sb.ToString(), false);

            }
            else if (e.CommandName.Equals("deleteRecord"))
            {
                string code = GridView1.DataKeys[index].Value.ToString();
                hfCode.Value = code;
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#deleteModal').modal('show');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "DeleteModalScript", sb.ToString(), false);
            }

        }


        protected void btnSave_Click(object sender, EventArgs e)
        {
            //string code = lblCountryCode.Text;
            //int population = Convert.ToInt32(txtPopulation.Text);
            //string countryname = txtName.Text;
            string appointment_id = lblappointment_id.Text;
            string status = issues.Text;
            
            executeUpdate(status, appointment_id);
            BindGrid();
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("alert('Records Updated Successfully');");
            sb.Append("$('#editModal').modal('hide');");
            sb.Append(@"</script>");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "EditHideModalScript", sb.ToString(), false);

        }

        private void executeUpdate( string sstatus,string appointment_id)
        {
            string cnstr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;

            try
            {



                string query = "update appointment set status=@status where appointment_id = @aID";
                cmd = new SqlCommand(query, con);
                //cmd.Parameters.AddWithValue("@population", population);
                //cmd.Parameters.AddWithValue("@countryname", countryname);
                cmd.Parameters.AddWithValue("@status", sstatus);
                cmd.Parameters.AddWithValue("@aID", appointment_id);
                cmd.ExecuteNonQuery();
                con.Close();

            }
            catch (Exception me)
            {
                System.Console.Error.Write(me.InnerException.Data);
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("$('#addModal').modal('show');");
            sb.Append(@"</script>");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AddShowModalScript", sb.ToString(), false);

        }

        protected void btnAddRecord_Click(object sender, EventArgs e)
        {
            string code = txtCode.Text;
            string name = txtCountryName.Text;
            string region = txtRegion.Text;
            string continent = txtContinent.Text;
            int population = Convert.ToInt32(txtTotalPopulation.Text);
            int indyear = Convert.ToInt32(txtIndYear.Text);
            executeAdd(code, name, continent, region, population, indyear);
            BindGrid();
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("alert('Record Added Successfully');");
            sb.Append("$('#addModal').modal('hide');");
            sb.Append(@"</script>");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AddHideModalScript", sb.ToString(), false);


        }

        private void executeAdd(string code, string name, string continent, string region, int population, int indyear)
        {
            string cnstr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            try
            {


                string updatecmd = "insert into tblCountry (Code,Name,Continent,Region,Population,IndepYear) values (@code,@name,@continent,@region,@population,@indyear)";
                SqlCommand addCmd = new SqlCommand(updatecmd, con);
                addCmd.Parameters.AddWithValue("@code", code);
                addCmd.Parameters.AddWithValue("@name", name);
                addCmd.Parameters.AddWithValue("@continent", continent);
                addCmd.Parameters.AddWithValue("@region", region);
                addCmd.Parameters.AddWithValue("@population", population);
                addCmd.Parameters.AddWithValue("@indyear", indyear);
                addCmd.ExecuteNonQuery();
                con.Close();

            }
            catch (SqlException me)
            {
                System.Console.Write(me.Message);
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            string code = hfCode.Value;
            executeDelete(code);
            BindGrid();
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("alert('Record deleted Successfully');");
            sb.Append("$('#deleteModal').modal('hide');");
            sb.Append(@"</script>");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "delHideModalScript", sb.ToString(), false);


        }

        private void executeDelete(string code)
        {
            string cnstr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            try
            {


                string updatecmd = "delete from tblCountry where Code=@code";
                SqlCommand addCmd = new SqlCommand(updatecmd, con);
                addCmd.Parameters.AddWithValue("@code", code);
                addCmd.ExecuteNonQuery();
                con.Close();

            }
            catch (SqlException me)
            {
                System.Console.Write(me.Message);
            }

        }
    }
}