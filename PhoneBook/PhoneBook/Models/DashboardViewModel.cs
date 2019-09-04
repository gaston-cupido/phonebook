using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PhoneBook.Models
{
    public class DashboardViewModel
    {
        public ContactsReturn ContactsReturn { get; set; }

        public AddPhoneNumberViewModel AddPhoneNumberViewModel { get; set; }
    }
}