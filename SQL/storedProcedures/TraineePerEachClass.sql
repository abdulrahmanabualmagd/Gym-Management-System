create or alter proc TraineePerEachClass
as begin
--declare @records table (ClassName nvarchar(50), Traffic int)
select c.Name ,COUNT(e.classId) from Classes as c
join TraineesClassesEnrollment as e
on c.ID = e.ClassID
join Trainees as t
on e.TraineesID = t.ID
group by c.Name
order by COUNT(e.classId) Desc

end



