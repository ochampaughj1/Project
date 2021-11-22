using System;

namespace PersonData.Models
{
   public class StateLicense
   {
      public string StateLicenseNumber { get; }
      public string State { get; }
      public int StateLicenseID { get; }
      public string StateLicenseNumberExpiration { get; }
      public int DoctorID { get; }

      public StateLicense(string sln, string s, int slid, string slne,
          int did)
      {
            StateLicenseNumber = sln;
            State = s;
            StateLicenseID = slid;
            StateLicenseNumberExpiration = slne;
            DoctorID = did;
      }
   }
}
