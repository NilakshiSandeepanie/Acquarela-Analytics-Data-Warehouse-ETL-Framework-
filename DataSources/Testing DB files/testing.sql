use Appointments_Mng_SourceDB;
select * from dbo.Appointments;


SELECT 
count(*)
FROM [Appointments_Mng_Staging].[dbo].StgPatients

SELECT 
count(*)
FROM [Appointments_Mng_Staging].[dbo].StgPhysicians




SELECT *
FROM [Appointment_Mng_DW].[dbo].[DimAllocatedRooms]

SELECT * 
FROM [Appointments_Mng_Staging].[dbo].[StgAllocatedRooms]

/*insert test data to check whether DW table gets updated*/

INSERT INTO Appointments_Mng_Staging.dbo.StgAllocatedRooms
(RoomNo,WardNo,WardHead,ExtraService,MaximumSpace) VALUES(9000,9000,'TESTWARDHEAD','TESTEXTRASERVICE',9000)

/*then again run ETL process and check*/

/*update a column and check whther it gets updated*/
UPDATE Appointments_Mng_Staging.dbo.StgAllocatedRooms set WardHead = 'UPDATEDTESTWARDHEAD' where RoomNo = 9000



SELECT * from [Appointment_Mng_DW].[dbo].[DimAllocatedRooms]

SELECT * from [Appointment_Mng_DW].[dbo].[DimPhysicians]

SELECT * from [Appointment_Mng_DW].[dbo].[FactAppointmentsInfo]



SELECT * from [Appointment_Mng_DW].[dbo].[DimAllocatedRooms]

SELECT * from [Appointment_Mng_DW].[dbo].[DimPatients]





SELECT *
FROM [Appointment_Mng_DW].[dbo].[DimPhysicians]



SELECT *
FROM [Appointment_Mng_DW].[dbo].[DimPatients]


SELECT COUNT(DoctorNo) 
FROM [Appointment_Mng_DW].[dbo].[DimPhysicians];

SELECT COUNT(Review_ID) 
FROM [Appointments_Mng_Staging].[dbo].[StgRatingsandreviews];






SELECT * from [Appointment_Mng_DW].[dbo].[FactAppointments]


SELECT count(RoomNo)
FROM [Appointments_Mng_Staging].[dbo].[StgAllocatedRooms];


SELECT count(RoomNo)
FROM [Appointment_Mng_DW].[dbo].[DimAllocatedRooms]









