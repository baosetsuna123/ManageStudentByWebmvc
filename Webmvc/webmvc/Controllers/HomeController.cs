using Buoi6.Models;
using Microsoft.AspNetCore.Mvc;

namespace Buoi6.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            using (var context = new PE_Fall21B5Context())
            {
                List<Employee> list = context.Employees.ToList();
                foreach(Employee item in list)
                {
                    item.DepartmentNavigation = context.Departments.FirstOrDefault(x => x.Id == item.Department);
                }
                //c1 Model
                //C2 viewbag
                //c3 ViewData
                return View(list);
            }
               
        }
    }
}
