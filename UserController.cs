using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShoppingCartMVCProject.Models;
using System.Text;
namespace ShoppingCartMVCProject.Controllers
{
    public class UserController : Controller
    {
        MVCDBEntities db = new MVCDBEntities();
        
        /*public   List<ShoppingCartList> ItemList
        {
            get;
            set;
        }*/
        
        // public readonly UserController uc = new UserController();
        // GET: User
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult CreateOrder()
        {
            var data = db.ProductInfoes.ToList();
            return View(data);
        }
        [HttpGet]
        public ActionResult OrderProduct(int pid)
        {
            Session["order"] = db.ProductInfoes.Where(x => x.pid == pid)
.SingleOrDefault();
             return View();
        }
        [HttpPost]
        public ActionResult OrderProduct(string command)
        {
            if(command=="Add More")
            {
                ShoppingCartList sc = new ShoppingCartList();
                sc.PID = Convert.ToInt32(Request.Form["txtid"]);
                sc.Qty = Convert.ToInt32(Request.Form["txtqty"]);
                sc.TotAmt = sc.Qty * Convert.ToDecimal(Request.Form["txtprice"]);

                
               string data=sc.PID + "," + sc.Qty + "," + sc.TotAmt + ":";
                Session["templst"] += data;
                return RedirectToAction("CreateOrder");

                
               
            }
            if(command=="Pay Now")
            {
                return RedirectToAction("CardInfo","Gateway");
            }
            return View();
        }
    }
}