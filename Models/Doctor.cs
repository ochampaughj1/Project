using System;

namespace PersonData.Models
{
    public class Doctor
    {
        public int DoctorID { get; }
        public string FirstName { get; }
        public string LastName { get; }
        public string Ailments { get; }
        public string PhoneNumber { get; }
        public int OfficeId { get; }
        public string StateLicenseNumber { get; }
        public string DEANumber { get; }
        public string DEAExpiration { get; }
    

      public Doctor(int did, string fn, string ln, string ail,
          string pn, int oid, string sln, string dean, string deae)
      {
            DoctorID = did;
            FirstName = fn;
            LastName = ln;
            Ailments = ail;
            PhoneNumber = pn;
            OfficeId = oid;
            StateLicenseNumber = sln;
            DEANumber = dean;
            DEAExpiration = deae;
      }
   }
}
