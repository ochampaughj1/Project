CREATE OR ALTER PROCEDURE DoctorsOffice.CreatePatient
   @FirstName NVARCHAR(32),
   @LastName NVARCHAR(32),
   @PhoneNumber NVARCHAR(32),
   @Email NVARCHAR(32),
   @Address NVARCHAR(32),
   @InsuranceId INT,
   @DoctorId INT,
   @PatientId INT OUTPUT
AS

INSERT DoctorsOffice.Patient(FirstName, LastName, PhoneNumber, Email, [Address], InsuranceId, DoctorId)
VALUES(@FirstName, @LastName, @PhoneNumber, @Email, @Address, @InsuranceId, @DoctorId);

SET @PatientId = SCOPE_IDENTITY();
GO