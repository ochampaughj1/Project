using System;

namespace PersonData.Models
{
   public class Office
   {
      public int OfficeID { get; }
      public string OfficeName { get; }
      public int ZipCode { get; }
      public string Address { get; }
      public string City { get; }
      public string State { get; }

      public Office(int oid, string on, int zc, string a, string c, string s)
      {
         OfficeID = oid;
         OfficeName = on;
         ZipCode = zc;
         Address = a;
         City = c;
         State = s;
      }
   }
}
