CREATE OR ALTER PROCEDURE DoctorsOffice.FetchPatient
   @PatientId INT
AS

SELECT P.FirstName, P.LastName, P.PhoneNumber, P.Email, P.[Address], P.InsuranceId, P.DoctorId
FROM DoctorsOffice.Patient P
WHERE P.PatientId = @PatientId;
GO