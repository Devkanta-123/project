using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace _179345_CRUD_Bootstrap_Modal_Popup.Models
{
    public class CustomerModelDal
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ToString());
        public int InsertCustomer(CustomerModel customerModel)
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO Customers VALUES(@Name,@Country)", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@Name", customerModel.Name);
            cmd.Parameters.AddWithValue("@Country", customerModel.Country);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            return i;
        }

        public int UpdateCustomer(CustomerModel customerModel)
        {
            SqlCommand cmd = new SqlCommand("UPDATE Customers SET Name = @Name, Country = @Country WHERE CustomerId = @CustomerId", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@CustomerId", customerModel.CustomerId);
            cmd.Parameters.AddWithValue("@Name", customerModel.Name);
            cmd.Parameters.AddWithValue("@Country", customerModel.Country);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            return i;
        }

        public int DeleteCustomer(int customerId)
        {
            SqlCommand cmd = new SqlCommand("DELETE FROM Customers WHERE CustomerId = @CustomerId", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@CustomerId", customerId);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            return i;
        }

        public List<CustomerModel> GetCustomers()
        {
            List<CustomerModel> customers = new List<CustomerModel>();
            SqlCommand cmd = new SqlCommand("SELECT * FROM Customers", con);
            cmd.CommandType = CommandType.Text;
            SqlDataAdapter sd = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            con.Open();
            sd.Fill(dt);
            con.Close();
            foreach (DataRow dr in dt.Rows)
            {
                customers.Add(
                    new CustomerModel
                    {
                        CustomerId = Convert.ToInt32(dr["CustomerId"]),
                        Name = Convert.ToString(dr["Name"]),
                        Country = Convert.ToString(dr["Country"])
                    });
            }
            return customers;
        }
    }
}