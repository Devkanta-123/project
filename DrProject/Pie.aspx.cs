﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.DataVisualization.Charting;

namespace DrProject
{
    public partial class Pie : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string query = "select distinct dept_name from app_dept";
                DataTable dt = GetData(query);
                ddlCountries.DataSource = dt;
                ddlCountries.DataTextField = "dept_name";
                ddlCountries.DataValueField = "dept_name";
                ddlCountries.DataBind();
                ddlCountries.Items.Insert(0, new ListItem("Select", ""));
            }

        }
        protected void ddlCountries_SelectedIndexChanged(object sender, EventArgs e)
        {
            Chart1.Visible = ddlCountries.SelectedValue != "";
            //select d.fname,p.fullname, count(appointment_id) from appointment a  inner join doctor d on a. appoint_docid = d. id inner join patient p  on a.patientId = p.id where fname = 'Shahuls'   group by fullname,fname  
            string query = string.Format("select d.fname,count(d.id) from app_dept de inner join doctor d  on de.id = d.dept  where de.dept_name = '{0}'   group by fname", ddlCountries.SelectedValue);
            DataTable dt = GetData(query);
            string[] x = new string[dt.Rows.Count];
            int[] y = new int[dt.Rows.Count];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                x[i] = dt.Rows[i][0].ToString();
                y[i] = Convert.ToInt32(dt.Rows[i][1]);
            }
            Chart1.Series[0].Points.DataBindXY(x, y);
            Chart1.Series[0].ChartType = SeriesChartType.Pie;
            Chart1.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;
            Chart1.Legends[0].Enabled = true;
        }

        private static DataTable GetData(string query)
        {
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand(query);
            String constr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            SqlDataAdapter sda = new SqlDataAdapter();
            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;
            sda.SelectCommand = cmd;
            sda.Fill(dt);
            return dt;
        }
    }
}