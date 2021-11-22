IF OBJECT_ID(N'DoctorsOffice.Office') IS NULL
BEGIN
   CREATE TABLE DoctorsOffice.Office
   (
      OfficeId INT NOT NULL IDENTITY(1, 1),
      OfficeName NVARCHAR(32) NOT NULL,
      ZipCode INT NOT NULL,
      [Address] NVARCHAR(32) NOT NULL,
      City NVARCHAR(64) NOT NULL,
      [State] NVARCHAR(32) NOT NULL,
      CreatedOn DATETIMEOFFSET NOT NULL DEFAULT(SYSDATETIMEOFFSET()),
      UpdatedOn DATETIMEOFFSET NOT NULL DEFAULT(SYSDATETIMEOFFSET()),

      CONSTRAINT PK_OfficeId PRIMARY KEY CLUSTERED
      (
         OfficeId ASC
      ),
    );
END;

/****************************
 * Unique Constraints
 ****************************/
 IF NOT EXISTS
   (
      SELECT *
      FROM sys.key_constraints kc
      WHERE kc.parent_object_id = OBJECT_ID(N'DoctorsOffice.Office')
         AND kc.[name] = N'UK_OfficeName'
   )
BEGIN
   ALTER TABLE DoctorsOffice.Office
   ADD CONSTRAINT [UK_OfficeName] UNIQUE NONCLUSTERED
   (
      OfficeName
   )
END;
