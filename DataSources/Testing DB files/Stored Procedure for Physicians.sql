USE [Appointment_Mng_DW]
GO
/****** Object:  StoredProcedure [dbo].[UpdateDimPhysicians]    Script Date: 5/6/2022 9:47:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[UpdateDimPhysicians]
@DoctorNo int,
@DoctorID nvarchar(50),
@RoomNo int,
@FirstName nvarchar(50),
@SecondName nvarchar(50),
@GovHospital nvarchar(max),
@BasicPayment float,
@ExperienceYears int
AS
BEGIN
if not exists (select DoctorNumber_sk
from dbo.DimPhysicians
where DoctorNo = @DoctorNo )

BEGIN
insert into dbo.DimPhysicians
(DoctorNo, DoctorID, RoomNo, FirstName, SecondName, GovHospital, BasicPayment, ExperienceYears)
values
(@DoctorNo, @DoctorID, @RoomNo, @FirstName, @SecondName, @GovHospital, @BasicPayment, @ExperienceYears)
END;

if exists (select DoctorNumber_sk
from dbo.DimPhysicians
where DoctorNo = @DoctorNo  )

BEGIN
update dbo.DimPhysicians
set RoomNo = @RoomNo,
GovHospital = @GovHospital, 
BasicPayment = @BasicPayment,
ExperienceYears = @ExperienceYears
where DoctorNo = @DoctorNo
END;

END;