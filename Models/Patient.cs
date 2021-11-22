using System;

namespace PersonData.Models
{
   public class Patient
   {
      public int PatientID { get; }
      public string FirstName { get; }
      public string LastName { get; }
      public string PhoneNumber { get; }
      public string Email { get; }
      public string Address { get; }
      public string InsuranceID { get; }
      public string DoctorID { get; }


      public Patient(int pid, string fn, string ln, string pn,
          string e, string a, string iid, string did)
      {
            PatientID = pid;
            FirstName = fn;
            LastName = ln;
            PhoneNumber = pn;
            Email = e;
            Address = a;
            InsuranceID = iid;
            DoctorID = did;
      }
   }
}
