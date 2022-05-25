CREATE PROCEDURE dbo.UpdateDimPhysiciansInfo

@DoctorNo int,
@DoctorID nvarchar(50),
@RoomNo int,
@FirstName nvarchar(50),
@SecondName nvarchar(50),
@GovtHospital nvarchar(max),
@BasicPayment float,
@ExperianceYears int

AS
BEGIN
if not exists (select DoctorNumber_sk from dbo.DimPhysiciansInfo where RoomNo = @RoomNo)

BEGIN
insert into dbo.DimPhysiciansInfo(DoctorNo, DoctorID, RoomNo, 
FirstName, SecondName,GovtHospital, BasicPayment, ExperianceYears)
values(@DoctorNo, @DoctorID,@RoomNo,
@FirstName, @SecondName, @GovtHospital, @BasicPayment, @ExperianceYears )
END;

if exists (select DoctorNumber_sk from dbo.DimPhysiciansInfo where RoomNo = @RoomNo)

BEGIN
update dbo.DimPhysiciansInfo
set DoctorNo = @DoctorID, DoctorID = @DoctorID, FirstName = @FirstName,
SecondName = @SecondName, GovtHospital = @GovtHospital, 
BasicPayment = @BasicPayment, ExperianceYears = @ExperianceYears
where RoomNo = @RoomNo
END; 
END;