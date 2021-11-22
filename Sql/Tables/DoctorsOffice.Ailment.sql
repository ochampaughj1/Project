IF OBJECT_ID(N'DoctorsOffice.Ailment') IS NULL
BEGIN
   CREATE TABLE DoctorsOffice.Ailment
   (
      AilmentId INT NOT NULL IDENTITY(1, 1),
      PatientId INT NOT NULL,
      CreatedOn DATETIMEOFFSET NOT NULL DEFAULT(SYSDATETIMEOFFSET()),
      UpdatedOn DATETIMEOFFSET NOT NULL DEFAULT(SYSDATETIMEOFFSET()),

      CONSTRAINT PK_AilmentId PRIMARY KEY CLUSTERED
      (
         AilmentId ASC
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
      WHERE kc.parent_object_id = OBJECT_ID(N'DoctorsOffice.Ailment')
         AND kc.[name] = N'UK_AilmentId_PatientId'
   )
BEGIN
   ALTER TABLE DoctorsOffice.Ailment
   ADD CONSTRAINT UK_AilmentId_PatientId UNIQUE NONCLUSTERED
   (
      AilmentId, 
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
      WHERE fk.parent_object_id = OBJECT_ID(N'DoctorsOffice.Ailment')
         AND fk.referenced_object_id = OBJECT_ID(N'DoctorsOffice.Patient')
         AND fk.[name] = N'FK_PatientId'
   )
BEGIN
   ALTER TABLE DoctorsOffice.Ailment
   ADD CONSTRAINT [FK_PatientId] FOREIGN KEY
   (
      PatientId
   )
   REFERENCES DoctorsOffice.Patient
   (
      PatientId
   );
END;
