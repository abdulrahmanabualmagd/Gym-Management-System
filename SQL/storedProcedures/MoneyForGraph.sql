create or alter proc MoneyGraphList 
as begin

declare @records table (rec int)
declare @x int = 0

	while @x > -6
	begin
		declare @start date = DATEADD(month, @x, GetDate())
		declare @end date = DATEADD(month, @x-1, GetDate())
		insert into @records (rec) select sum(SubFee) from dbo.TraineesClassesEnrollment where StartDate < @start and StartDate > @end
		set @x = @x-1
	end
	select * from @records
end

