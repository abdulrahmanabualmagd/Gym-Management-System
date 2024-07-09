create or alter proc DeleteTrainee
@TraineeId int
as begin
delete from dbo.TraineesClassesEnrollment where TraineesID = @TraineeId
delete from dbo.Trainees where ID = @TraineeId
end
