create or alter proc AddTrainer
@name nvarchar(50),
@gender nvarchar(50),
@age int,
@phone nvarchar(20),
@class nvarchar(50),
@salary int
as begin
declare @classId int, @trainerId int, @hireDate date

	-- getting the Class Id
	select top(1) @classId = ID from dbo.Classes where Name = @class 

	

	-- getting the hire Date
	set @hireDate = CAST(GETDATE() AS DATE)

	-- check if the trainer existed before
	if not exists (select * from Staff where Name = @name or @phone = Phone)
	begin
		insert into dbo.Staff([Name],[Gender],[Age],[Phone],[JobTitle],[Salary],[HireDate]) 
		values (@name, @gender, @age, @phone, 'Trainer', @salary, @hireDate)
	end

	-- getting the tariner Id
	select top(1) @trainerId = ID from dbo.Staff where Name = @name

	if not exists (select * from [dbo].[ClassTrainers] where StaffID = @trainerId and ClassesID = @classId)
	begin
		insert into dbo.ClassTrainers (StaffID, ClassesID) values (@trainerId, @classId)
	end



end
