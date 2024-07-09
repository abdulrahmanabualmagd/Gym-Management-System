create or alter proc DeleteClass
@ClassId int
as begin

delete from Equipments where ClassID = @ClassId

delete from TraineesClassesEnrollment where ClassID = @ClassId

delete from ClassTrainers where ClassesID = @ClassId

delete from Classes where ID = @ClassId

end