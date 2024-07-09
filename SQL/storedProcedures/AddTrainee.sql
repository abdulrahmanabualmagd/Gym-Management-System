create or alter proc AddTrainee
@name nvarchar(50),
@gender nvarchar(50),
@age int,
@phone nvarchar(20),
@class nvarchar(50),
@duration int
as begin
declare @classId int, @classFee int, @TraineeId int, @StartDate date, @endDate date

	-- section for getting the id of class and Fees
	select top(1) @classId = ID, @classFee = Fees from dbo.Classes where Name = @class 

	
		-- Get the Start and End Date for the Trainee
		set @StartDate = CAST(GETDATE() AS DATE)
		set @EndDate = DATEADD(month, @duration, @StartDate)
		
		-- insert the trainee to the table if it not exist
	if not exists (select * from Trainees where Name = @name or @phone = Phone)
	begin
		insert into dbo.Trainees ([Name],[Gender],[Age],[Phone]) values (@name, @gender, @age, @phone)
	end

	-- get the Trinee id if exists or not 
	select @TraineeId = ID from dbo.Trainees where Name = @name

	declare @currentDate date = CAST(GETDATE() AS DATE)
	if not exists (select * from TraineesClassesEnrollment where TraineesID = @TraineeId and ClassID = @classId and EndDate >= @currentDate )
		begin
			insert into dbo.TraineesClassesEnrollment values(@TraineeId, @classId, @StartDate, @endDate, @classFee)
		end
end

