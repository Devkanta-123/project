using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using ConnectedArchitecture.DAL;
using ConnectedArchitecture.UI;


namespace ConnectedArchitecture.BAL
{
   
    public class Shippers
    {
        DataAccess da= new DataAccess();
        public int ShipperID { get; set; }
        public string CompanyName { get; set; }
        public string Phone { get; set; }

        public int EditShippers()
        {
            Shippers ship = new Shippers();
            Console.WriteLine("Enter Shipper Id to Edit:");
            ship.ShipperID = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Enter Phone No. to update: ");
            ship.Phone = Console.ReadLine();
          //  da = new DataAccess();
            int noofrows=da.EditShippers(ship);
            return noofrows;
        }

        //public int InsertShippers()
        //{

        //    return
        //}

        //public SqlDataReader readShippers()
        //{           
        //   SqlDataReader sdr =da.readShippers();
        //    return sdr;
        //}

        public List<Shippers> readShippers1()
        {
            List<Shippers> shipperlist = da.readShippers1();
            return shipperlist;
        }
    }
}
