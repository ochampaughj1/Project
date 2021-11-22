using System;

namespace PersonData.Models
{
   public class Appointment
   {
      public int AppointmentID { get; }
      public int DoctorID { get; }
      public int PatientID { get; }
      public string Status { get; }
      public DateTime ApptDateTime { get; }
      public int ExamRoom { get; }

      public Appointment(int aid, int did, int pid, string s,
          DateTime adt, int er)
      {
            AppointmentID = aid;
            DoctorID = did;
            PatientID = pid;
            Status = s;
            ApptDateTime = adt;
            ExamRoom = er;
      }
   }
}
