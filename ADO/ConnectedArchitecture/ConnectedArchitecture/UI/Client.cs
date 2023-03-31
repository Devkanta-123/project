using System;
using System.Collections.Generic;

using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ConnectedArchitecture.BAL;

namespace ConnectedArchitecture.UI
{
    class Client
    {
        static void Main()
        {         
            Shippers s = new Shippers();               
            Console.WriteLine("--------Edit Shipper---------");
            int rows= s.EditShippers();
            Console.WriteLine("Rows updated are {0}",rows); 
            Console.WriteLine();
           // Console.WriteLine("--------Insert Shipper---------");
            //int row = s.InsertShippers();
            Console.WriteLine();
            //SqlDataReader cdr = s.readShippers();
            //while (cdr.Read())
            //{
            //    Console.WriteLine(cdr[0]);
            //    Console.WriteLine(cdr[1]);
            //    Console.WriteLine(cdr[2]);
            //}
            List<Shippers> lstshipper = s.readShippers1();
            foreach(var item in lstshipper)
            {
                Console.WriteLine(item.ShipperID + " "+item.CompanyName + " "+ item.Phone);
            }
            Console.Read();
        }
    }
}
