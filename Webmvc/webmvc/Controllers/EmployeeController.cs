using Buoi6.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore.Metadata.Internal;

namespace Buoi6.Controllers
{
    public class EmployeeController : Controller
    {
        public IActionResult ViewCreate()
        {
            using (var context = new PE_Fall21B5Context())
            {
                List<Department> list = context.Departments.ToList();
                var postision= context.Employees.ToList().GroupBy(x=>x.Position);

                ViewBag.list = list;
                ViewBag.pos = postision.ToList();
            }
                return View();
        }
        [HttpPost]
        public IActionResult CreateEmp()
        {
            using (var context = new PE_Fall21B5Context())
            {
                try
                {
                    Employee e1 = new Employee();
                    e1.Name = HttpContext.Request.Form["name"];
                    e1.Dob = DateTime.Parse(HttpContext.Request.Form["dob"]);
                    e1.Sex = HttpContext.Request.Form["sex"];
                    e1.Position = HttpContext.Request.Form["pos"];
                    e1.Department = int.Parse(HttpContext.Request.Form["de"]);
                    context.Employees.Add(e1);
                    context.SaveChanges();
                } catch (Exception ex) { }
            }
                return Redirect("/Home/Index");
        }
        public IActionResult ViewEdit(int id)
        {
            using (var context = new PE_Fall21B5Context())
            {
                Employee e1 = context.Employees.FirstOrDefault(x => x.Id == id);
                List<Department> list = context.Departments.ToList();
                var postision = context.Employees.ToList().GroupBy(x => x.Position);
                ViewBag.e1 = e1;
                ViewBag.list = list;
                ViewBag.pos = postision.ToList();
            }
            return View();
        }

        [HttpPost]
        public IActionResult EditEmp()
        {
            using (var context = new PE_Fall21B5Context())
            {
                int id = int.Parse(HttpContext.Request.Form["id"]);
                Employee e1 = context.Employees.FirstOrDefault(x => x.Id == id);

                e1.Name = HttpContext.Request.Form["name"];
                e1.Dob = DateTime.Parse(HttpContext.Request.Form["dob"]);
                e1.Sex = HttpContext.Request.Form["sex"];
                e1.Position = HttpContext.Request.Form["pos"];
                e1.Department = int.Parse(HttpContext.Request.Form["de"]);
                context.Employees.Update(e1);
                context.SaveChanges();
            }
            return Redirect("/Home/Index");
        }
        public IActionResult DeleteEmp(int id)
        {
            using (var context = new PE_Fall21B5Context())
            {
               
                Employee e1 = context.Employees.FirstOrDefault(x => x.Id == id);
                context.Employees.Remove(e1);
                context.SaveChanges();
            }
            return Redirect("/Home/Index");
        }
    }
}
