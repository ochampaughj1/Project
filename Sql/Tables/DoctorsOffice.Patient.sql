IF OBJECT_ID(N'DoctorsOffice.Patient') IS NULL
BEGIN
   CREATE TABLE DoctorsOffice.Patient
   (
      PatientId INT NOT NULL IDENTITY(1, 1),
      FirstName NVARCHAR(32) NOT NULL,
      LastName NVARCHAR(32) NOT NULL,
      /*Ailments NVARCHAR(128) NOT NULL,*/
      PhoneNumber NVARCHAR(32) NOT NULL,
      Email NVARCHAR(32) NOT NULL,
      [Address] NVARCHAR(32) NOT NULL,
      InsuranceId INT NOT NULL,
      DoctorId INT NOT NULL,    --MAY NOT NEED  DOCTOR ID AT ALL
      CreatedOn DATETIMEOFFSET NOT NULL DEFAULT(SYSDATETIMEOFFSET()),
      UpdatedOn DATETIMEOFFSET NOT NULL DEFAULT(SYSDATETIMEOFFSET()),

      CONSTRAINT PK_PatientId PRIMARY KEY CLUSTERED
      (
         PatientId ASC
      ),

      CONSTRAINT FK_InsuranceId FOREIGN KEY(InsuranceId)
      REFERENCES DoctorsOffice.Insurance(InsuranceId),

      CONSTRAINT FK_DoctorId FOREIGN KEY(DoctorId)
      REFERENCES DoctorsOffice.Doctor(DoctorId),
   );
END;

 /****************************
 * Foreign Keys Constraints
 ****************************/
 
 --Insurance FK
IF NOT EXISTS
   (
      SELECT *
      FROM sys.foreign_keys fk
      WHERE fk.parent_object_id = OBJECT_ID(N'DoctorsOffice.Patient')
         AND fk.referenced_object_id = OBJECT_ID(N'DoctorsOffice.Insurance')
         AND fk.[name] = N'FK_InsuranceId'
   )
BEGIN
   ALTER TABLE DoctorsOffice.Patient
   ADD CONSTRAINT [FK_InsuranceId] FOREIGN KEY
   (
      InsuranceId
   )
   REFERENCES DoctorsOffice.Insurance
   (
      InsuranceId
   );
END;

--Doctor FK
IF NOT EXISTS
   (
      SELECT *
      FROM sys.foreign_keys fk
      WHERE fk.parent_object_id = OBJECT_ID(N'DoctorsOffice.Patient')
         AND fk.referenced_object_id = OBJECT_ID(N'DoctorsOffice.Doctor')
         AND fk.[name] = N'FK_DoctorId'
   )
BEGIN
   ALTER TABLE DoctorsOffice.Patient
   ADD CONSTRAINT FK_DoctorId FOREIGN KEY
   (
      DoctorId
   )
   REFERENCES DoctorsOffice.Doctor
   (
      DoctorId
   );
END;


/****************************
 * Check Constraints
 ****************************/

IF NOT EXISTS
   (
      SELECT *
      FROM sys.check_constraints cc
      WHERE cc.parent_object_id = OBJECT_ID(N'DoctorsOffice.Patient')
         AND cc.[name] = N'CK_FirstName_LastName'
   )
BEGIN
   ALTER TABLE DoctorsOffice.Patient
   ADD CONSTRAINT [CK_FirstName_LastName] CHECK
   (
      FirstName > N'' OR LastName > N''
   )
END;
