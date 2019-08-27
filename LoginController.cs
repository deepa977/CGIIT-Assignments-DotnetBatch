using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using ShoppingCartMVCProject.Models;
namespace ShoppingCartMVCProject.Controllers
{
    public class LoginController : Controller
    {
        MVCDBEntities db = new MVCDBEntities();

        // GET: Login
        [HttpGet]
        public ActionResult Authenticate()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Authenticate(string username,string password,string type)
        {
            //if the view is not strongly typed, retreive the values entered in view and initialize the parameters
            username = Request.Form["txtuser"].ToString();
            password = Request.Form["txtpass"].ToString();
            type = Request.Form["ddltype"].ToString();
            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                ModelState.AddModelError("", "Username and password cannot be blank");
            }
            else
            {
                long mobno = long.Parse(username);
                var res = db.PersonInfoes.Where(x => x.mobno == mobno && x.password == password && x.type == type).SingleOrDefault();
                if (res == null)
                    ModelState.AddModelError("", "Invalid Information");
                else
                {
                    if(type=="Admin")
                    {
                        return RedirectToAction("Index", "Admin");
                    }
                    if(type=="Customer")
                    {
                        return RedirectToAction("Index", "User");
                    }
                }
            }
            return View();
        }
        //strongly typed view
        public ActionResult InsertNew()
        {
            return View();
        }
        [HttpPost]
        public ActionResult InsertNew(PersonInfo pi)
        {
            //generate password
           
           string type = Request.Form["ddltype"].ToString();
            if (string.IsNullOrEmpty(type))
                ModelState.AddModelError("", "Select Usertype");
            else
            {
                pi.password = Membership.GeneratePassword(5, 1);
                pi.type = type;
                db.PersonInfoes.Add(pi);
                var res = db.SaveChanges();
                if (res > 0)
                    ModelState.AddModelError("", "User Created Successfully");
            }

            return View();
        }

    }
}