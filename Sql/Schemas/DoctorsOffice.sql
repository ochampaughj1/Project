IF NOT EXISTS
   (
      SELECT *
      FROM sys.schemas s
      WHERE s.[name] = N'DoctorsOffice'
   )
BEGIN
   EXEC(N'CREATE SCHEMA [DoctorsOffice] AUTHORIZATION [dbo]');
END;
