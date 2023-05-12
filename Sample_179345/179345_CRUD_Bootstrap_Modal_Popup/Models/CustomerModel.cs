using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace _179345_CRUD_Bootstrap_Modal_Popup.Models
{
    public class CustomerModel
    {
        public int CustomerId { get; set; }
        public string Name { get; set; }
        public string Country { get; set; }
        public List<CustomerModel> Customers { get; set; }
    }
}