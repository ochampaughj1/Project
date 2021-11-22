CREATE OR ALTER PROCEDURE DoctorsOffice.CreateAppointment
   @DoctorId INT,
   @PatientId INT,
   @Status NVARCHAR(32),
   @ApptDateTime DATETIME2(0),
   @Address NVARCHAR(32),
   @ExamRoom INT,
   @AppointmentId INT OUTPUT
AS

INSERT DoctorsOffice.Appointment(DoctorId, PatientId, [Status], ApptDateTime, ExamRoom)
VALUES(@DoctorId, @PatientId, @Status, @ApptDateTime, @ExamRoom);

SET @AppointmentId = SCOPE_IDENTITY();
GO