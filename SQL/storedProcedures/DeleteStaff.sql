create or alter proc DeleteStaff
@Id int
as begin 
	delete from dbo.Staff where ID = @Id and JobTitle <> 'Trainer'
end

