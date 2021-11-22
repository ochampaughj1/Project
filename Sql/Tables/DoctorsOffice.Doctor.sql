IF OBJECT_ID(N'DoctorsOffice.Doctor') IS NULL
BEGIN
   CREATE TABLE DoctorsOffice.Doctor
   (
      DoctorId INT NOT NULL IDENTITY(1, 1),
      FirstName NVARCHAR(32) NOT NULL,
      LastName NVARCHAR(32) NOT NULL,
      PhoneNumber NVARCHAR(32) NOT NULL,
      OfficeId INT NOT NULL,
      StateLicenseNumber NVARCHAR(32) NOT NULL, 
      DEANumber NVARCHAR(32) NOT NULL, 
      DEAExpiration DATETIME2(0) NOT NULL,
      CreatedOn DATETIMEOFFSET NOT NULL DEFAULT(SYSDATETIMEOFFSET()),
      UpdatedOn DATETIMEOFFSET NOT NULL DEFAULT(SYSDATETIMEOFFSET()),

      CONSTRAINT PK_DoctorId PRIMARY KEY CLUSTERED
      (
         DoctorId ASC
      ),

      CONSTRAINT FK_OfficeId FOREIGN KEY(OfficeId)
      REFERENCES DoctorsOffice.Office(OfficeId),

      CONSTRAINT FK_StateLicenseNumber FOREIGN KEY(StateLicenseNumber)
      REFERENCES DoctorsOffice.StateLicense(StateLicenseNumber),
   );
END;

/****************************
 * Unique Constraints
 ****************************/
 
 --OfficeId/StateLicenseNumber UK -> Surrogate Key??
 IF NOT EXISTS
   (
      SELECT *
      FROM sys.key_constraints kc
      WHERE kc.parent_object_id = OBJECT_ID(N'DoctorsOffice.Doctor')
         AND kc.[name] = N'UK_OfficeId_StateLicenseNumber'
   )
BEGIN
   ALTER TABLE DoctorsOffice.Doctor
   ADD CONSTRAINT UK_OfficeId_StateLicenseNumber UNIQUE NONCLUSTERED
   (
      OfficeId, 
      StateLicenseNumber
   )
END;
 
 --DEA Number UK
 IF NOT EXISTS
   (
      SELECT *
      FROM sys.key_constraints kc
      WHERE kc.parent_object_id = OBJECT_ID(N'DoctorsOffice.Doctor')
         AND kc.[name] = N'UK_DEANumber'
   )
BEGIN
   ALTER TABLE DoctorsOffice.Doctor
   ADD CONSTRAINT [UK_DEANumber] UNIQUE NONCLUSTERED
   (
      DEANumber
   )
END;

 /****************************
 * Foreign Keys Constraints
 ****************************/
 
 --OfficeId FK
IF NOT EXISTS
   (
      SELECT *
      FROM sys.foreign_keys fk
      WHERE fk.parent_object_id = OBJECT_ID(N'DoctorsOffice.Doctor')
         AND fk.referenced_object_id = OBJECT_ID(N'DoctorsOffice.Office')
         AND fk.[name] = N'FK_OfficeId'
   )
BEGIN
   ALTER TABLE DoctorsOffice.Doctor
   ADD CONSTRAINT [FK_OfficeId] FOREIGN KEY
   (
      OfficeId
   )
   REFERENCES DoctorsOffice.Office
   (
      OfficeId
   );
END;

--State License Number FK
IF NOT EXISTS
   (
      SELECT *
      FROM sys.foreign_keys fk
      WHERE fk.parent_object_id = OBJECT_ID(N'DoctorsOffice.Doctor')
         AND fk.referenced_object_id = OBJECT_ID(N'DoctorsOffice.StateLicense')
         AND fk.[name] = N'FK_StateLicenseNumber'
   )
BEGIN
   ALTER TABLE DoctorsOffice.Doctor
   ADD CONSTRAINT FK_StateLicenseNumber FOREIGN KEY
   (
      StateLicenseNumber
   )
   REFERENCES DoctorsOffice.StateLicenseNumber
   (
      StateLicenseNumber
   );
END;


/****************************
 * Check Constraints
 ****************************/

IF NOT EXISTS
   (
      SELECT *
      FROM sys.check_constraints cc
      WHERE cc.parent_object_id = OBJECT_ID(N'DoctorsOffice.Doctor')
         AND cc.[name] = N'CK_FirstName_LastName'
   )
BEGIN
   ALTER TABLE DoctorsOffice.Patient
   ADD CONSTRAINT [CK_FirstName_LastName] CHECK
   (
      FirstName > N'' OR LastName > N''
   )
END;
