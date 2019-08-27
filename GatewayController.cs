using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShoppingCartMVCProject.Models;
namespace ShoppingCartMVCProject.Controllers
{
    public class GatewayController : Controller
    {
        MVCDBEntities db = new MVCDBEntities();
        // GET: Gateway
        public ActionResult CardInfo()
        {
            List<ShoppingCartList> lst = new List<ShoppingCartList>();
            decimal finalamt=0.0M;
            if (Session["templst"] == null)
            {

            }
            else
            {
                string data = Session["templst"].ToString();
                string[] rows = data.Split(':');
                foreach (var r in rows)
                {
                    if(!string.IsNullOrEmpty(r))
                    { 
                        string[] cols = r.Split(',');
                        ShoppingCartList sc = new ShoppingCartList();
                        sc.PID = Convert.ToInt32(cols[0]);
                        sc.Qty = Convert.ToInt32(cols[1]);
                        sc.TotAmt = Convert.ToDecimal(cols[2]);
                        lst.Add(sc);
                        finalamt += sc.TotAmt;
                    }
                    
                }
           
                        }
           Session["finalamt"] = finalamt;
           return View(lst);
        }
    }
}