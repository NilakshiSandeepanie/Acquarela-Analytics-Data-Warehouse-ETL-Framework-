 /*Stored Procedure ensures no duplicates are 
entered into the data warehouse table ‘DimProductCategory’*/

/*If there is an existing 
category record, it will be updated with the latest record coming in from staging table
‘StgProductCategory’ else, if it is a new record, just insert it.*/


CREATE PROCEDURE UpdateDimAllocatedRoomsInfo
@RoomNo int,
@WardNo int,
@WardHead nvarchar(50),
@ExtraService nvarchar(max),
@MaximumSpace int
AS 
BEGIN
if not exists (select RoomNumber_sk
from dbo.DimAllocatedRoomsInfo
where RoomNo = @RoomNo) 
BEGIN
insert into dbo.StgPhysiciansInfo
(RoomNo, WardNo, WardHead, ExtraService, MaximumSpace)
values
(@RoomNo, @WardNo, @WardHead ,@ExtraService , @MaximumSpace) 
END;
if exists (select RoomNumber_sk
from dbo.DimAllocatedRooms
where RoomNo = @RoomNo) 
BEGIN
update dbo.StgPhysiciansInfo
set ExtraService = @ExtraService,
MaximumSpace= @MaximumSpace
where RoomNo = @RoomNo
END;
END;