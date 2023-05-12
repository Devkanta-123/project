using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DrProject.Models;
namespace DrProject
{
    public class TreatmentController : Controller
    {
        CustomerModelDal cmBusiness = new CustomerModelDal();
        // GET: Treatment
        public ActionResult Index()
        {
            ModelState.Clear();
            CustomerModel model = new CustomerModel();
            model.Customers = cmBusiness.GetCustomers();
            return View(model);
        }

        [HttpPost]
        public ActionResult InsertCustomer(CustomerModel objModel)
        {
            try
            {
                int result = cmBusiness.InsertCustomer(objModel);
                if (result == 1)
                {
                    ViewBag.Message = "Customer Added Successfully";
                    ModelState.Clear();
                }
                else
                {
                    ViewBag.Message = "Unsucessfull";
                    ModelState.Clear();
                }

                return RedirectToAction("Index");
            }
            catch
            {
                throw;
            }
        }

        public JsonResult EditCustomer(int? id)
        {
            var customer = cmBusiness.GetCustomers().Find(x => x.CustomerId.Equals(id));
            return Json(customer, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult UpdateCustomer(CustomerModel objModel)
        {
            try
            {
                int result = cmBusiness.UpdateCustomer(objModel);
                if (result == 1)
                {
                    ViewBag.Message = "Customer Updated Successfully";
                    ModelState.Clear();
                }
                else
                {
                    ViewBag.Message = "Unsucessfull";
                    ModelState.Clear();
                }

                return RedirectToAction("Index");
            }
            catch
            {
                throw;
            }
        }

        public ActionResult DeleteCustomer(int id)
        {
            try
            {
                int result = cmBusiness.DeleteCustomer(id);
                if (result == 1)
                {
                    ViewBag.Message = "Customer Deleted Successfully";
                    ModelState.Clear();
                }
                else
                {
                    ViewBag.Message = "Unsucessfull";
                    ModelState.Clear();
                }

                return RedirectToAction("Index");
            }
            catch
            {
                throw;
            }
        }
    }
}