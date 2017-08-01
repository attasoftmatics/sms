using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.Mvc;
using System.Web.Security;
using WebApplication1.Models;

namespace WebApplication1.Controllers
{
    [Authorize]
    public class CustomerController : Controller
    {
        smsEntities db = new smsEntities();
        
        public ActionResult Index()
        {
            return View();
        }

        [AllowAnonymous]
        public ActionResult Login()
        {
            return View();
        }

        [AllowAnonymous]
        [HttpPost]
        public ActionResult Login(Customer model,string returnUrl)
        {
            var c = db.Customers.Where(a => a.Email == model.Email && a.Password == model.Password).First();
            if (c != null)
            {
                FormsAuthentication.SetAuthCookie(model.Email, false);
                //if (Url.IsLocalUrl(returnUrl) && returnUrl.Length > 1 && returnUrl.StartsWith("/")
                //    && returnUrl.StartsWith("//") && returnUrl.StartsWith("/\\"))
                //{
                //    return Redirect(returnUrl);
                //}
                return RedirectToAction("Index");
            }
            else
            {
                ModelState.AddModelError("", "Invalid User Name");
                return View();
            }
        }
    }
}