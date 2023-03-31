using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace ConnectedArchitecture
{
    class Program
    {
        public static SqlConnection con,con1;
        public static SqlCommand cmd;
        public static SqlDataReader dr;
        static void Main(string[] args)
        {
            //InsertData();
            //  DeleteData();
            //  SelectData();
            //scalarEg();
            procedure_Call();
            Console.Read();
        }

        public static SqlConnection getConnection()
        {
            con = new SqlConnection("data source=LAPTOP-TJJ7D977;Initial Catalog=MedusindDB;" +
                "Integrated Security=true;");
            con.Open();
            return con;
        }

        public static void SelectData()
        {
            try
            {
                con = getConnection(); // gets the connection details after executing the getConnection method
                cmd = new SqlCommand("select * from Employee", con);
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                   // Console.WriteLine(dr[0] + " |" + dr[1] + "| " + dr[2]);
                    Console.WriteLine("--------------------");
                    Console.WriteLine("Employee Id : {0}", dr[0]);
                    Console.WriteLine("Employee Name : {0}", dr[1]);
                    Console.WriteLine("Employee Gender : {0}", dr[2]);
                    Console.WriteLine("Employee Salary : {0}", dr[3]);
                    Console.WriteLine("Employee Department : {0}", dr[4]);
                }
            }
            catch (SqlException  se)
            {
                Console.WriteLine("Some Error Occured.. Try after sometime");
                Console.WriteLine(se.Message);
            }
        }

        public static void InsertData()
        {
            con = getConnection();
            // cmd = new SqlCommand("insert into shippers values('Fedex','00007')");
            // cmd.Connection = con;

            //int rows= cmd.ExecuteNonQuery();
            // if(rows>0)
            // {
            //     Console.WriteLine("Record Inserted Successfully.");
            // }
            // else
            //     Console.WriteLine("Not Inserted..");
            Console.WriteLine("Enter Employee Id, Name,Gender,Salary and DeptId");
            int eid = Convert.ToInt32(Console.ReadLine());
            string ename = Console.ReadLine();
            string egen = Console.ReadLine();
            float esal = Convert.ToSingle(Console.ReadLine());
            int edid = Convert.ToInt32(Console.ReadLine());
            cmd = new SqlCommand("insert into Employee values(@ecode,@empname,@empgen,@empsal,@empdid)", con);
            cmd.Parameters.AddWithValue("@ecode", eid);
            cmd.Parameters.AddWithValue("@empname", ename);
            cmd.Parameters.AddWithValue("@empgen", egen);
            cmd.Parameters.AddWithValue("@empsal", esal);
            cmd.Parameters.AddWithValue("@empdid", edid);

            int res=cmd.ExecuteNonQuery();
            if(res>0)
                Console.WriteLine("inserted..");
            else
                Console.WriteLine("not inserted");
        }

        public static void DeleteData()
        {
            con = getConnection();
            Console.WriteLine("Enter Employee id :");
            int eid = Convert.ToInt32(Console.ReadLine());
            SqlCommand cmd1 = new SqlCommand("Select * from Employee where empid=@ecode");
            cmd1.Parameters.AddWithValue("@ecode", eid);
            cmd1.Connection = con;

            SqlDataReader dr1 = cmd1.ExecuteReader();
            while (dr1.Read())
            {
                for (int i = 0; i < dr1.FieldCount; i++)
                {
                    Console.WriteLine(dr1[i]);
                }
            }
            con.Close();
            Console.WriteLine("Are you sure to delete this employee ? Y/N");
            string answer = Console.ReadLine();
            if(answer=="y" || answer=="Y")
            {
                cmd = new SqlCommand("delete from employee where empid=@ecode", con);               
                cmd.Parameters.AddWithValue("@ecode", eid);
                con.Open();

                int rw=cmd.ExecuteNonQuery();
                if(rw>0)
                    Console.WriteLine("Record Deleted..");
                else
                    Console.WriteLine("Not deleted");
            }

        }

        public static void scalarEg()
        {
            con = getConnection();
           // cmd = new SqlCommand("select count(empid) from employee", con);
            
           // int ctr = Convert.ToInt32(cmd.ExecuteScalar());
          //  Console.WriteLine($"There are {ctr} employees");

            cmd = new SqlCommand("select avg(salary) from employee", con);
            float avgsal = Convert.ToSingle(cmd.ExecuteScalar());
            Console.WriteLine($"The Average Salary of Employees  :{avgsal}");
        }

        public static void procedure_Call()
        {
            con = getConnection();
            Console.WriteLine("Enter Department Id :");
            int dept_id = Convert.ToInt32(Console.ReadLine());

            cmd = new SqlCommand("getEmployee", con);
            cmd.CommandType = CommandType.StoredProcedure;

            // cmd.Parameters.AddWithValue("@deptid", dept_id);   // or
            SqlParameter param = new SqlParameter("@deptid", dept_id);
            param.SqlDbType = SqlDbType.Int;
            param.Direction = ParameterDirection.Input;
            cmd.Parameters.Add(param);
            dr = cmd.ExecuteReader();

            while(dr.Read())
            {
                Console.WriteLine($"Id :{dr["empid"]} Name : {dr["empname"]} Salary: {dr["salary"]} Department : {dr["deptname"]}");
            }

        }
    }
}
