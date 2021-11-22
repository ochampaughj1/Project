CREATE OR ALTER PROCEDURE DoctorsOffice.FetchDoctor
   @DoctorId INT
AS

SELECT D.FirstName, D.LastName, D.PhoneNumber, D.OfficeId, D.StateLicenseNumber, D.DEANumber, D.DEAExpiration
FROM DoctorsOffice.Doctor D
WHERE D.DoctorId = @DoctorId;
GO