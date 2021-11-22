using System;

namespace PersonData.Models
{
   public class Ailments
   {
        public int AilmentID { get; }
        public int PatientID { get; }

      internal Ailments(int aid, int pid)
      {
            //Line2 = line2 ?? string.Empty; - from person.address
            AilmentID = aid;
            PatientID = pid;
      }
   }
}
