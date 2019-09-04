using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PhoneBook.Models
{
    public class ContactsReturn
    {
        public bool Success { get; set; }
        public string ErrorMessage { get; set; }
        public List<Contact> Contacts { get; set; }
    }
}