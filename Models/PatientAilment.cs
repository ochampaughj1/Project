using System;

namespace PersonData.Models
{
   public class PatientAilment
   {
        public int PatientID { get; }
        public string AilmentType { get; }
        public int PatientAilmentID { get; }
        public DateTime DiagnosedDate { get; }

      public PatientAilment(int pid, string at, int paid, DateTime dd)
      {
            PatientID = pid;
            AilmentType = at;
            PatientAilmentID = paid;
            DiagnosedDate = dd;
      }
   }
}