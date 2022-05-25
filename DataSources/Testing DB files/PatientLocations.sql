/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [PatientID]
      ,[Country]
      ,[City]
      ,[Zip_Code]
      ,[Region]
  FROM [Appointments_Mng_SourceDB].[dbo].[PatientsLocations]