CREATE OR ALTER PROCEDURE DoctorsOffice.CreateDoctor
    @FirstName NVARCHAR(32),
    @LastName NVARCHAR(32),
    @PhoneNumber NVARCHAR(32),
    @OfficeId INT,
    @StateLicenseNumber NVARCHAR(32), 
    @DEANumber NVARCHAR(32), 
    @DEAExpiration DATETIME2(0),
    @DoctorId INT OUTPUT
AS

INSERT DoctorsOffice.Doctor(FirstName, LastName, PhoneNumber, OfficeId, StateLicenseNumber, DEANumber, DEAExpiration)
VALUES(@FirstName, @LastName, @PhoneNumber, @OfficeId, @StateLicenseNumber, @DEANumber, @DEAExpiration);

SET @DoctorId = SCOPE_IDENTITY();
GO