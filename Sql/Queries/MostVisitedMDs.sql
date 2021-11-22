CREATE OR ALTER PROCEDURE DoctorsOffice.MostVisitedMDs
AS
SELECT I.InsuranceId, I.InsuranceName, 
    RANK() OVER(
        ORDER BY COUNT(P.PatientId) DESC) AS InsuranceRank, 
    COUNT(P.PatientId) AS PatientCount --WHERE
FROM DoctorsOffice.Insurance I
    INNER JOIN DoctorsOffice.Patient P ON P.InsuranceId = I.InsuranceId 
    INNER JOIN Appointment A ON A.PatientId = P.PatientId
WHERE I.InsuranceId = P.InsuranceId AND A.ApptDateTime BETWEEN '2021-01-01' AND '2021-12-31'
GROUP BY I.InsuranceId, I.InsuranceName, PatientCount, InsuranceRank
ORDER BY PatientCount DESC;
GO