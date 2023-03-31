using System;
using System.Data;
using System.Data.SqlClient;

namespace DisconnectedArchitecture
{
    class Program
    {
        public static SqlConnection con;
        public static SqlDataAdapter da;
        public static DataSet ds;
        public static DataTable dt;
        static void Main(string[] args)
        {
            // InsertData();
             SelectData();
          //  addTable_To_Dataset();
          //  procedureCall();
            Console.Read();                
        }
        #region
        public static SqlConnection getConnection()
        {
            con = new SqlConnection("data source = LAPTOP-TJJ7D977; Initial Catalog = Northwind; " +
                "Trusted_Connection=true;");
            con.Open();
            return con;
        }
        #endregion

        #region
        public static void SelectData()
        {
            try
            {
                con = getConnection();
                da = new SqlDataAdapter("select * from Shippers", con);
                ds = new DataSet();
                da.Fill(ds, "NorthwindShippers");

                dt = ds.Tables["NorthwindShippers"];

                //to access the data table
                foreach (DataRow drow in dt.Rows)
                {
                    foreach (DataColumn dcol in dt.Columns)
                    {
                        Console.Write(drow[dcol]);
                        Console.Write(" ");
                    }
                    Console.WriteLine();
                }

                Console.WriteLine("Adding a Table to the Dataset....");
               // con = getConnection();
                da = new SqlDataAdapter("select * from region", con);
              //  ds = new DataSet();
                da.Fill(ds, "NorthwindRegion");
                dt = ds.Tables["NorthwindRegion"];
                foreach (DataRow row1 in dt.Rows)
                {
                    foreach (DataColumn col1 in dt.Columns)
                    {
                        Console.Write(row1[col1]);
                        Console.Write(" ");
                    }
                    Console.WriteLine();
                }


            }
            catch (SqlException se)
            {
                Console.WriteLine(se.Message);
            }         
        }
        #endregion

        #region
        public static void InsertData()
        {
            con = getConnection();

            //get the data into the dataset
            da = new SqlDataAdapter("select * from Shippers", con);
            ds = new DataSet();
            da.Fill(ds, "NorthwindShippers");

            dt = ds.Tables["NorthwindShippers"];

            //let us add one new row for the datatable in the dataset
            DataRow row = ds.Tables["NorthwindShippers"].NewRow();
            string cname, phone;
            Console.WriteLine("Enter CompanyName:");
            cname = Console.ReadLine();
            Console.WriteLine("Enter Phone :");
            phone = Console.ReadLine();
            //give values to the new row                
            row["CompanyName"] = cname;
            row["Phone"] = phone;

            //add the new row to the datatable
            ds.Tables["NorthwindShippers"].Rows.Add(row);
            SqlCommandBuilder scb = new SqlCommandBuilder(da);
            da.InsertCommand = scb.GetInsertCommand();

            da.Update(ds, "NorthwindShippers");

            Console.WriteLine("--------After Insertion---------");

            da.Fill(ds); // to refresh the changes and reflect it 

            SelectData();
            //da = new SqlDataAdapter("select * from shippers", con);
            //da.Fill(ds, "NorthwindShippers");
            //dt = ds.Tables["NorthwindShippers"]; // to point ot the beginning of the datatable
            //                                     //to access the data table in iterations
            //foreach (DataRow drow1 in dt.Rows)
            //{
            //    foreach (DataColumn dcol1 in dt.Columns)
            //    {
            //        Console.Write(drow1[dcol1]);
            //        Console.Write(" ");
            //    }
            //    Console.WriteLine();
            }
        #endregion

        #region
        public static void addTable_To_Dataset()
        {
            Console.WriteLine("Adding a Table to the Dataset....");
            con = getConnection();
            da = new SqlDataAdapter("select * from region", con);
            ds = new DataSet();
            da.Fill(ds, "NorthwindRegion");
            dt = ds.Tables["NorthwindRegion"];
            foreach(DataRow row1 in dt.Rows)
            {
                foreach(DataColumn col1 in dt.Columns)
                {
                    Console.Write(row1[col1]);
                    Console.Write(" ");
                }
                Console.WriteLine();
            }
        }

        #endregion

        #region
        public static void procedureCall()
        {
            con = getConnection();
            da = new SqlDataAdapter("[Ten Most Expensive Products]", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;

            dt = new DataTable();
            da.Fill(dt);
            foreach(DataRow r in dt.Rows)
            {
                foreach(DataColumn c in dt.Columns)
                {
                    Console.Write(r[c]);
                    Console.Write(" ");
                }
                Console.WriteLine();
            }
        }
        #endregion
    }
}

