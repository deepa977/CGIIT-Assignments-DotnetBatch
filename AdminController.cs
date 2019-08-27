using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShoppingCartMVCProject.Models;
namespace ShoppingCartMVCProject.Controllers
{
    public class AdminController : Controller
    {
        MVCDBEntities db = new MVCDBEntities();
        // GET: Admin
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public ActionResult AddProduct()
        {
            return View();
        }
        [HttpPost]
        public ActionResult AddProduct(ProductInfo pi)
        {
            if (ModelState.IsValid)
            {
                db.ProductInfoes.Add(pi);
                var res = db.SaveChanges();
                if (res > 0)
                    ModelState.AddModelError("", "Product Inserted");
            }
            return View();
        }
        public ActionResult SelectUpdateProduct()
        {
            //bind the data from DB to DropDownList
            Session["prod"] = new SelectList(db.ProductInfoes.ToList(), "pid", "pname");
            return View();
        }
        [HttpPost]
        public ActionResult SelectUpdateProduct(string Command)
        {
            if(Command== "Select By Id")
            {
                int id = Convert.ToInt32(Request.Form["ddlprod"]);
                var data = db.ProductInfoes.Where(x => x.pid == id).SingleOrDefault();
                Session["data"] = data;
                return View(Session["data"]);
            }
            if(Command =="Update")
            {
                int id = Convert.ToInt32(Request.Form["txtpid"]);
                string newpname = Request.Form["txtpname"].ToString();
                decimal newprice = Convert.ToDecimal(Request.Form["txtprice"]);
                var old = db.ProductInfoes.Where(x => x.pid == id).SingleOrDefault();
                old.pname = newpname;
                old.price = newprice;
                old.pid = id;
                var res = db.SaveChanges();
                if (res > 0)
                    ModelState.AddModelError("", "Data Updated");
                return View();

            }
            return View();
        }

        public ActionResult EditProduct()
        {
            var data = db.ProductInfoes;
            return View(data.ToList());
        }
        public ActionResult UpdateProduct(int pid)
        {
            var data = db.ProductInfoes.Where(x => x.pid == pid).SingleOrDefault();
            Session["olddata"] = data;
              return View(Session["olddata"]);
        }
        [HttpPost]
        public ActionResult UpdateProduct()
        {
            int id = Convert.ToInt32(Request.Form["txtpid"]);
             string newpname = Request.Form["txtpname"].ToString();
            decimal  newprice = Convert.ToDecimal(Request.Form["txtprice"]);
            var old = db.ProductInfoes.Where(x => x.pid == id).SingleOrDefault();
            old.pname = newpname;
            old.price = newprice;
            old.pid = id;
            var res = db.SaveChanges();
            if (res > 0)
                ModelState.AddModelError("", "Data Updated");
            return View();
        }
        public ActionResult DeleteProduct()
        {
            Session["delete"] = new SelectList(db.ProductInfoes.ToList(), "pid", "pname");
            return View();
        }
        [HttpPost]
        public ActionResult DeleteProduct(int id=0)
        {
            id = Convert.ToInt32(Request.Form["ddlprod"]);
            var pi = db.ProductInfoes.Where(x => x.pid == id).SingleOrDefault();
            db.ProductInfoes.Remove(pi);
            var res = db.SaveChanges();
            if (res > 0)
                ModelState.AddModelError("", "Deleted Successfully");
            return View();
        }
        [HttpGet]
        public ActionResult ViewCustomer()
        {
            var data = db.PersonInfoes.Where(x => x.type == "Customer").ToList();
            return View(data);
        }
    }
}