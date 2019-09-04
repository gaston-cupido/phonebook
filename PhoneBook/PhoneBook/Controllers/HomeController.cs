using PhoneBook.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace PhoneBook.Controllers
{
    public class HomeController : Controller
    {
        PhoneBookEntities db = new PhoneBookEntities();
        DashboardViewModel Model = new DashboardViewModel();

        public ActionResult Index(string Search)
        {
            Model.ContactsReturn = new ContactsReturn();

            try
            {

                if (Search != "")
                {
                    Model.ContactsReturn.Contacts = db.Contacts.SqlQuery("Select * FROM Contacts WHERE Name LIKE '%" + Search + "%' OR Surname LIKE '%" + Search + "%'").ToList();
                }
                else
                {
                    Model.ContactsReturn.Contacts = db.Contacts.ToList();
                }

                Model.ContactsReturn.Success = true;

                return View(Model);
            }
            catch (Exception e)
            {
                Model.ContactsReturn.ErrorMessage = e.ToString();

                Model.ContactsReturn.Success = false;

                return View(Model);
            }
        }

        public async Task<ActionResult> Delete(int Id)
        {
            try
            {
                using (PhoneBookEntities Context = new PhoneBookEntities())
                {
                    var itemToRemove = Context.Contacts.SingleOrDefault(x => x.Id == Id); //returns a single item.

                    if (itemToRemove != null)
                    {
                        Context.Contacts.Remove(itemToRemove);
                        Context.SaveChanges();
                    }
                }

                return RedirectToAction("Index", new { Message = "Successfully Remove from My Contacts." });
            }
            catch (Exception e)
            {
                return RedirectToAction("Index", new { Error = e.ToString() });
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> AddPhoneNumber(AddPhoneNumberViewModel form)
        {
            if (!ModelState.IsValid)
            {
                return View(form);
            }
            else
            {
                try
                {
                    using (PhoneBookEntities objDataContext = new PhoneBookEntities())
                    {
                        Contact objData = new Contact();
                        // fields to be insert
                        objData.Name = form.Name;
                        objData.Surname = form.Surname;
                        objData.PhoneNumber = form.Number;

                        objDataContext.Contacts.Add(objData);
                        // executes the commands to implement the changes to the database
                        objDataContext.SaveChanges();
                    }

                    return RedirectToAction("Index", new { Message = "Contact Successfully Added." });

                }
                catch (Exception e)
                {
                    return RedirectToAction("Index", new { Error = e.ToString() });
                }     
            }      
        }

        public ActionResult Edit(int Id)
        {
            Model.ContactsReturn = new ContactsReturn();

            try
            {
                Model.ContactsReturn.Contacts = db.Contacts.Where(x => x.Id == Id).ToList();

                Model.ContactsReturn.Success = true;
            
                return View(Model);
            }
            catch (Exception e)
            {        
                Model.ContactsReturn.ErrorMessage = e.ToString();

                Model.ContactsReturn.Success = false;

                return View(Model);
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> UpdateContact(AddPhoneNumberViewModel form)
        {
            if (!ModelState.IsValid)
            {
                return View(form);
            }
            else
            {
                try
                {
                    using (PhoneBookEntities objDataContext = new PhoneBookEntities())
                    {

                        var objdata = objDataContext.Contacts.Single(u => u.Id == form.Id);

                        objdata.Name = form.Name;
                        objdata.Surname = form.Surname;
                        objdata.PhoneNumber = form.Number;

                        objDataContext.Contacts.Attach(objdata);
                        var entry = objDataContext.Entry(objdata);
                        entry.Property(e => e.Name).IsModified = true;
                        entry.Property(e => e.Surname).IsModified = true;
                        entry.Property(e => e.PhoneNumber).IsModified = true;

                        objDataContext.SaveChanges();

                    }

                    return RedirectToAction("Edit", new { Id = form.Id, Message = "Contact Successfully Updated." });

                }
                catch (Exception e)
                {
                    return RedirectToAction("Edit", new { Id = form.Id, Error = e.ToString() });
                }
            }
        }

    }
}