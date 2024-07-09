create or alter proc AddStaff
@name nvarchar(50),
@gender nvarchar(50),
@age int,
@phone nvarchar(20),
@jobTitle nvarchar(50),
@salary int
as begin

declare @hireDate date
	
	-- getting the hire Date
	set @hireDate = CAST(GETDATE() AS DATE)

	-- check if the trainer existed before
	if not exists (select * from Staff where Name = @name or @phone = Phone)
	begin
		insert into dbo.Staff ([Name],[Gender],[Age],[Phone],[JobTitle],[Salary],[HireDate]) 
		values (@name, @gender, @age, @phone, @jobTitle, @salary, @hireDate)
	end

end
