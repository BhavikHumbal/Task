using taskcrude.Models;
using taskcrude.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace taskcrude.Controllers
{
    public class DefaultController : Controller
    {
        companyservices hb = new companyservices();
        TaskEntities e = new TaskEntities();
        // GET: Default
        public ActionResult Index()
        {
            return View(hb.GetEmployees());
        }

        void Fillstate()
        {
            var stateslist = from s in e.states
                             select new SelectListItem
                             {
                                 Value = s.state_id.ToString(),
                                 Text = s.state_name
                             };
            ViewBag.states = stateslist.ToList();
        }

        public JsonResult GetcitiesByStateId(int id)
        {
            e.Configuration.ProxyCreationEnabled = false;
            var city = e.cities.Where(c => c.state_id == id).ToList();
            return Json(city, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Add_Employee()
        {
            Fillstate();
            return View();
        }
        [HttpPost]
        public ActionResult Add_Employee(Employee obj)
        {
            hb.addemployee(obj);
            return RedirectToAction("Index");
        }

        public ActionResult Edit(int id)
        {
            Fillstate();
            return View(hb.Getemployeebyid(id));
        }
        [HttpPost]
        public ActionResult Edit(Employee obj)
        {
            hb.updateemployee(obj);
            return RedirectToAction("Index");
        }

        public string Delete(int id)
        {
            hb.DeleteEmployee(id);
            return "Deleted..";
        }
    }
}