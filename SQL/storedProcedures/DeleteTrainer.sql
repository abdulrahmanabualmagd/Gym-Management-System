create or alter proc DeleteTrainer
@Id int
as begin
delete from dbo.ClassTrainers where StaffID = @Id
delete from dbo.Staff where ID = @Id and JobTitle = 'Trainer'
end
