CREATE OR ALTER PROCEDURE DoctorsOffice.CreateOffice
   @OfficeName NVARCHAR(32),
   @ZipCode INT, 
   @Address NVARCHAR(32), 
   @City NVARCHAR(64),
   @State NVARCHAR(32),
   @OfficeId INT OUTPUT
AS

INSERT DoctorsOffice.Office(OfficeName, ZipCode, [Address], City, [State])
VALUES(@OfficeName, @ZipCode, @Address, @City, @State);

SET @OfficeId = SCOPE_IDENTITY();
GO