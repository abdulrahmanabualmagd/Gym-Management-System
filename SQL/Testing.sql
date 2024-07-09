
-- Reset the Id just specify the table and the initialization number again
DBCC CHECKIDENT('[dbo].[Trainees]', RESEED, 10);


exec [dbo].[AddTrainee] 'Yousef', 'male', 25, '01000140504', 'Power Pump', 12
exec DeleteTrainee 12


exec AddTrainer 'Abdulrahman', 'male', 25, '01000140504', 'Cardio Inferno', 2500
exec DeleteTrainer 11


exec AddStaff 'Khaled', 'male', 25, '01000140504', 'reciptionist', 2500
exec DeleteStaff 12