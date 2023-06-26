﻿using System;
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
    public partial class doctorlist : System.Web.UI.Page
    {
        string cnstr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        SqlConnection con = new SqlConnection();
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();



        protected void Page_Load(object sender, EventArgs e)
        {
            doclist();
        }

        protected void doclist()
        {
            string cnstr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cnstr))
            {
                con.Open();               
                SqlCommand cmd = new SqlCommand("select d.fname,d.phno,d.designation,d.profile,de.dept_name from doctor d inner join app_dept de ON de.id = d.dept", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if(dr.HasRows == true)
                {
                    DataList1.DataSource = dr;
                    DataList1.DataBind();
                }
            }
        }

        }


    
}