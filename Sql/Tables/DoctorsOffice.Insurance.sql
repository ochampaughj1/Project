IF OBJECT_ID(N'DoctorsOffice.Insurance') IS NULL
BEGIN
   CREATE TABLE DoctorsOffice.Insurance
   (
      InsuranceId INT NOT NULL IDENTITY(1, 1),
      InsuranceName NVARCHAR(32) NOT NULL,
      CreatedOn DATETIMEOFFSET NOT NULL DEFAULT(SYSDATETIMEOFFSET()),
      UpdatedOn DATETIMEOFFSET NOT NULL DEFAULT(SYSDATETIMEOFFSET()),

      CONSTRAINT PK_InsuranceId PRIMARY KEY CLUSTERED
      (
         InsuranceId ASC
      ),
   );
END;

/****************************
 * Unique Constraints
 ****************************/
 
 --InsuranceName
 IF NOT EXISTS
   (
      SELECT *
      FROM sys.key_constraints kc
      WHERE kc.parent_object_id = OBJECT_ID(N'DoctorsOffice.Insurance')
         AND kc.[name] = N'UK_InsuranceName'
   )
BEGIN
   ALTER TABLE DoctorsOffice.Insurance
   ADD CONSTRAINT UK_InsuranceName UNIQUE NONCLUSTERED
   ( 
      InsuranceName
   )
END;
 
/****************************
 * Check Constraints
 ****************************/

IF NOT EXISTS
   (
      SELECT *
      FROM sys.check_constraints cc
      WHERE cc.parent_object_id = OBJECT_ID(N'DoctorsOffice.Insurance')
         AND cc.[name] = N'CK_InsuranceName'
   )
BEGIN
   ALTER TABLE DoctorsOffice.Insurance
   ADD CONSTRAINT [CK_InsuranceName] CHECK
   (
      InsuranceName > N''
   )
END;
