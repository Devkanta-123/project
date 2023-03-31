using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ConnectedArchitecture.BAL;

namespace ConnectedArchitecture.DAL
{
    class DataAccess
    {
        public static SqlConnection con;
        public static SqlCommand cmd;
        public static SqlDataReader dr;

        public SqlConnection Data_Connect()
        {
            con = new SqlConnection("data source=LAPTOP-TJJ7D977;Initial Catalog=Northwind;" +
                "Integrated Security=true;");
            con.Open();
            return con;
        }

        public SqlDataReader readShippers()
        {
            try
            {
                con = Data_Connect();
                cmd = new SqlCommand("select * from  shippers", con);
                dr = cmd.ExecuteReader();
               
            }
            catch(SqlException s)
            {
                Console.WriteLine(s.Message);
            }
            return dr;
        }

        public List<Shippers> readShippers1()
        {
            List<Shippers> shiplist = new List<Shippers>();
            try
            {
                con = Data_Connect();
                cmd = new SqlCommand("select * from  shippers", con);
                dr = cmd.ExecuteReader();
              
                while(dr.Read())
                {
                    shiplist.Add(new Shippers { ShipperID = (int)dr[0], CompanyName = (string)dr[1], Phone = (string)dr[2] });
                }
              
            }
            catch (SqlException s)
            {
                Console.WriteLine(s.Message);
            }
            return shiplist;
        }

        public int EditShippers(Shippers s)
        {
            con = Data_Connect();
           
            cmd = new SqlCommand("update shippers set Phone=@ph where shipperid=@sid", con);
            cmd.Parameters.AddWithValue("@sid", s.ShipperID);
            cmd.Parameters.AddWithValue("@ph", s.Phone);

            int i=cmd.ExecuteNonQuery();
            
            return i;
        }

        //public int InsertShippers(Shippers s)
        //{

        //    return 
        //}
    }
}
