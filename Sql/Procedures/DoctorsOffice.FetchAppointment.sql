CREATE OR ALTER PROCEDURE DoctorsOffice.FetchAppointment
   @AppointmentId INT
AS

SELECT A.DoctorId, A.PatientId, A.[Status], A.ApptDateTime, A.[Address], A.ExamRoom
FROM DoctorsOffice.Appointment A
WHERE A.AppointmentId = @AppointmentId;
GO