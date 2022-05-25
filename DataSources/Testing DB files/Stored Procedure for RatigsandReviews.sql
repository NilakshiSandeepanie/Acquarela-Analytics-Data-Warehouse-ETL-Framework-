CREATE PROCEDURE dbo.UpdateDimRatingsandReviews
@Review_ID int,
@Review_Score int,
@Review_Comment_Message nvarchar(MAX),
@Review_Creation_Date datetime,
@Review_Answer_Timestamp datetime

AS
BEGIN

if not exists (select ReviewNumber_sk
from dbo.DimRatingsandReviews
where Review_ID = @Review_ID)
BEGIN
insert into dbo.DimRatingsandReviews
(Review_ID,ReviewScore, Review_Comment_Message, Review_creation_Date, Review_Answer_Timestamp)
values
(@Review_ID, @Review_Score, @Review_Comment_Message, @Review_Creation_Date, @Review_Answer_Timestamp)
END;

if exists (select ReviewNumber_sk
from dbo.DimRatingsandReviews
where Review_ID = @Review_ID)

BEGIN
update dbo.DimRatingsandReviews
set ReviewScore = @Review_Score,
Review_Comment_Message = @Review_Comment_Message,
Review_Creation_Date = @Review_Creation_Date,
Review_Answer_Timestamp = @Review_Answer_Timestamp

where Review_ID = @Review_ID
END;
END;