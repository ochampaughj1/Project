using System;

namespace PersonData.Models
{
   public class Insurance
   {
      public int InsuranceID { get; }
      public string InsuranceName { get; }

      internal Insurance(int iid, string inn)
      {
            InsuranceID = iid;
            InsuranceName = inn;
      }
   }
}
