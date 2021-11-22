
IF OBJECT_ID(N'DoctorsOffice.StateLicenseNumber') IS NULL
BEGIN
   CREATE TABLE DoctorsOffice.StateLicenseNumber
   (
      StateLicenseId INT NOT NULL IDENTITY(1, 1),
      [State] NVARCHAR(32) NOT NULL,
      StateLicenseNumber NVARCHAR(32) NOT NULL,
      StateLicenseNumberExpiration DATE NOT NULL,
      DoctorId INT NOT NULL,
      CreatedOn DATETIMEOFFSET NOT NULL DEFAULT(SYSDATETIMEOFFSET()),
      UpdatedOn DATETIMEOFFSET NOT NULL DEFAULT(SYSDATETIMEOFFSET()),

      CONSTRAINT PK_StateLicenseId PRIMARY KEY CLUSTERED
      (
         StateLicenseId ASC
      ),

      CONSTRAINT FK_DoctorId FOREIGN KEY(DoctorId)
      REFERENCES DoctorsOffice.Doctor(DoctorId),
   );
END;

/****************************
 * Unique Constraints
 ****************************/
 
 --StateLicenseNumber/State composite unique key
 IF NOT EXISTS
   (
      SELECT *
      FROM sys.key_constraints kc
      WHERE kc.parent_object_id = OBJECT_ID(N'DoctorsOffice.StateLicense')
         AND kc.[name] = N'UK_DoctorsOffice_StateLicenseNumber_State'
   )
BEGIN
   ALTER TABLE DoctorsOffice.StateLicense
   ADD CONSTRAINT UK_DoctorsOffice_StateLicenseNumber_State UNIQUE NONCLUSTERED
   ( 
      StateLicenseNumber,
      [State]
   )
END;
 
 --DEA Number UK
 IF NOT EXISTS
   (
      SELECT *
      FROM sys.key_constraints kc
      WHERE kc.parent_object_id = OBJECT_ID(N'DoctorsOffice.StateLicense')
         AND kc.[name] = N'UK_State_DoctorId'
   )
BEGIN
   ALTER TABLE DoctorsOffice.StateLicense
   ADD CONSTRAINT UK_State_DoctorId UNIQUE NONCLUSTERED
   (
      [State],
      DoctorId
   )
END;

 /****************************
 * Foreign Keys Constraints
 ****************************/
 
 --DoctorId FK
IF NOT EXISTS
   (
      SELECT *
      FROM sys.foreign_keys fk
      WHERE fk.parent_object_id = OBJECT_ID(N'DoctorsOffice.StateLicense')
         AND fk.referenced_object_id = OBJECT_ID(N'DoctorsOffice.Doctor')
         AND fk.[name] = N'FK_DoctorId'
   )
BEGIN
   ALTER TABLE DoctorsOffice.StateLicense
   ADD CONSTRAINT [FK_DoctorId] FOREIGN KEY
   (
      DoctorId
   )
   REFERENCES DoctorsOffice.Doctor
   (
      DoctorId
   );
END;
