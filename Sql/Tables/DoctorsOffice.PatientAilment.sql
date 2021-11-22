IF OBJECT_ID(N'DoctorsOffice.PatientAilment') IS NULL
BEGIN
   CREATE TABLE DoctorsOffice.PatientAilment
   (
      PatientAilmentId INT NOT NULL IDENTITY(1, 1),
      PatientId INT NOT NULL,
      AilmentType NVARCHAR(32) NOT NULL, 
      DiagnosedDate DATETIME2(0) NOT NULL,
      CreatedOn DATETIMEOFFSET NOT NULL DEFAULT(SYSDATETIMEOFFSET()),
      UpdatedOn DATETIMEOFFSET NOT NULL DEFAULT(SYSDATETIMEOFFSET()),

      CONSTRAINT PK_PatientAilmentId PRIMARY KEY CLUSTERED
      (
         PatientAilmentId ASC
      ),

      CONSTRAINT FK_PatientId FOREIGN KEY(PatientId)
      REFERENCES DoctorsOffice.Patient(PatientId),
   );
END;

/****************************
 * Unique Constraints
 ****************************/
 
 --AilmentType/PatientId unique composite key
 IF NOT EXISTS
   (
      SELECT *
      FROM sys.key_constraints kc
      WHERE kc.parent_object_id = OBJECT_ID(N'DoctorsOffice.PatientAilment')
         AND kc.[name] = N'UK_AilmentType_PatientId'
   )
BEGIN
   ALTER TABLE DoctorsOffice.PatientAilment
   ADD CONSTRAINT UK_AilmentType_PatientId UNIQUE NONCLUSTERED
   (
      AilmentType, 
      PatientId
   )
END;

 /****************************
 * Foreign Keys Constraints
 ****************************/
 
 --Patient FK
IF NOT EXISTS
   (
      SELECT *
      FROM sys.foreign_keys fk
      WHERE fk.parent_object_id = OBJECT_ID(N'DoctorsOffice.PatientAilment')
         AND fk.referenced_object_id = OBJECT_ID(N'DoctorsOffice.Patient')
         AND fk.[name] = N'FK_PatientId'
   )
BEGIN
   ALTER TABLE DoctorsOffice.PatientAilment
   ADD CONSTRAINT [FK_PatientId] FOREIGN KEY
   (
      PatientId
   )
   REFERENCES DoctorsOffice.Office
   (
      PatientId
   );
END;


/****************************
 * Check Constraints
 ****************************/

IF NOT EXISTS
   (
      SELECT *
      FROM sys.check_constraints cc
      WHERE cc.parent_object_id = OBJECT_ID(N'DoctorsOffice.PatientAilment')
         AND cc.[name] = N'CK_AilmentType'
   )
BEGIN
   ALTER TABLE DoctorsOffice.PatientAilment
   ADD CONSTRAINT [CK_PatientAilment] CHECK
   (
      AilmentType > N''
   )
END;

