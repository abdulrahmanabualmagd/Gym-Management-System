create or alter proc TraineesPerClassMonths
as begin
	declare @records table (last int , className nvarchar(50), Traffic int)
	declare @copyTable table (TraineesID int,ClassID int,StartDate date,EndDate date,SubFee int)
		declare @x int = -0

		while @x >= -3
			begin
				declare @start date = DATEADD(month, @x, GetDate())
				declare @end date = DATEADD(month, @x-1, GetDate())
			
				insert into @copyTable select * from dbo.TraineesClassesEnrollment 
				where StartDate <= @start and StartDate > @end

				insert into @records (last, className, Traffic) 
				select (@x * -1) , c.Name ,COUNT(e.classId) from Classes as c
				join @copyTable as e
				on c.ID = e.ClassID 
				join Trainees as t
				on e.TraineesID = t.ID 
				group by c.Name
			
				set @x = @x-1
			end

		select * from @records
end
go
exec TraineesPerClassMonths


