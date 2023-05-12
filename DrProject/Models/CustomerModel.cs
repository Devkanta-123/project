using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DrProject.Models
{
    public class CustomerModel
    {
        public int CustomerId { get; set; }
        public string Name { get; set; }
        public string Country { get; set; }
        public List<CustomerModel> Customers { get; set; }
    }
}