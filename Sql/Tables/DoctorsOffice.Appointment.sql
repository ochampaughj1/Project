IF OBJECT_ID(N'DoctorsOffice.Appointment') IS NULL
BEGIN
   CREATE TABLE DoctorsOffice.Appointment
   (
      AppointmentId INT NOT NULL IDENTITY(1, 1),
      DoctorId INT NOT NULL,
      PatientId TINYINT NOT NULL,
      [Status] NVARCHAR(32) NOT NULL,
      ApptDateTime DATETIME2(0) NULL,
      ExamRoom INT NOT NULL,
      CreatedOn DATETIMEOFFSET NOT NULL
         CONSTRAINT DF_Person_PersonAddress_CreatedOn DEFAULT(SYSDATETIMEOFFSET()),
      UpdatedOn DATETIMEOFFSET NOT NULL
         CONSTRAINT DF_Person_PersonAddress_UpdatedOn DEFAULT(SYSDATETIMEOFFSET()),

      CONSTRAINT PK_AppointmentId PRIMARY KEY CLUSTERED
      (
         AppointmentId ASC
      ),

      CONSTRAINT FK_DoctorId FOREIGN KEY(DoctorId)
      REFERENCES DoctorsOffice.Doctor(DoctorId),

      CONSTRAINT FK_PatientId FOREIGN KEY(PatientId)
      REFERENCES DoctorsOffice.Patient(PatientId)
   );
END

/****************************
 * Unique Constraints
 ****************************/
 -- POTENTIAL UNIQUE KEY CONSTRAINT MAY NEED TO BE DELETED!!
IF NOT EXISTS
   (
      SELECT *
      FROM sys.key_constraints kc
      WHERE kc.parent_object_id = OBJECT_ID(N'DoctorsOffice.Appointment')
         AND kc.[name] = N'UK_DoctorId_PatientId'
   )
BEGIN
   ALTER TABLE DoctorsOffice.Appointment
   ADD CONSTRAINT [UK_DoctorId_PatientId] UNIQUE NONCLUSTERED
   (
      DoctorId,
      PatientId
   )
END;

--ApptDateTime/ExamRoom Unique composite key
IF NOT EXISTS
   (
      SELECT *
      FROM sys.key_constraints kc
      WHERE kc.parent_object_id = OBJECT_ID(N'DoctorsOffice.Appointment')
         AND kc.[name] = N'UK_ApptDateTime_ExamRoom'
   )
BEGIN
   ALTER TABLE DoctorsOffice.Appointment
   ADD CONSTRAINT [UK_ApptDateTime_ExamRoom] UNIQUE NONCLUSTERED
   (
      ApptDateTime,
      ExamRoom
   )
END;

/****************************
 * Foreign Keys Constraints
 ****************************/
 --DoctorId Foreign Key
IF NOT EXISTS
   (
      SELECT *
      FROM sys.foreign_keys fk
      WHERE fk.parent_object_id = OBJECT_ID(N'DoctorsOffice.Appointment')
         AND fk.referenced_object_id = OBJECT_ID(N'DoctorsOffice.Doctor')
         AND fk.[name] = N'FK_DoctorId'
   )
BEGIN
   ALTER TABLE DoctorsOffice.Appointment
   ADD CONSTRAINT [FK_DoctorId] FOREIGN KEY
   (
      DoctorId
   )
   REFERENCES DoctorsOffice.Doctor
   (
      DoctorId
   );
END;

--PatientId Foreign Key
IF NOT EXISTS
   (
      SELECT *
      FROM sys.foreign_keys fk
      WHERE fk.parent_object_id = OBJECT_ID(N'DoctorsOffice.Appointment')
         AND fk.referenced_object_id = OBJECT_ID(N'DoctorsOffice.Patient')
         AND fk.[name] = N'FK_Patient'
   )
BEGIN
   ALTER TABLE DoctorsOffice.Appointment
   ADD CONSTRAINT [FK_Patient] FOREIGN KEY
   (
      PatientId
   )
   REFERENCES DoctorsOffice.Patient
   (
      PatientId
   );
END;