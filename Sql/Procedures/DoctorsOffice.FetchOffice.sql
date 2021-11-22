CREATE OR ALTER PROCEDURE DoctorsOffice.FetchOffice
   @OfficeId INT
AS

SELECT O.OfficeName, O.ZipCode, O.[Address], O.City, O.[State]
FROM DoctorsOffice.Office O
WHERE O.OfficeId = @OfficeId;
GO