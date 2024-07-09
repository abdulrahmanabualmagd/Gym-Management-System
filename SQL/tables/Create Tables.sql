CREATE DATABASE GymSystem
ON PRIMARY (
		NAME = 'GymSystem',
		FILENAME = N'D:\GymDatabase\GymSystem-Data.mdf',
		SIZE = 8MB, 
		FILEGROWTH = 10%,
		MAXSIZE = 50MB
) LOG ON (
		NAME = 'Net23-Company-Log',
		FILENAME = N'D:\GymDatabase\GymSystem-Log.Ldf',
		SIZE = 8MB,
		FILEGROWTH = 10%,
		MAXSIZE = 50MB
)
go

use GymSystem

go
-------------------- [ Staff Table ] ------------------
Create Table Staff
(
	ID int not null identity(1,1),
	Name nvarchar(50) not null,
	Gender nvarchar(50) not null,
	Age int not null,
	Phone nvarchar(12) not null,
	JobTitle nvarchar(50) not null,
	Salary int not null,
	HireDate date not null, 
	Image binary(1000),
	username nvarchar(50) null,
	password char(4) null,

	constraint StaffPK primary key (ID)
)

go

------------------------ [ Trainees Table ] ------------------------------
Create Table Trainees
(
	ID int not null identity(1,1),
	Name nvarchar(50) not null,
	Gender nvarchar(50) not null,
	Age int not null,
	Phone nvarchar(12) not null,
	Image binary(1000),

	constraint TraineesPK primary key (ID)
)
go
----------------------------- [ Classes Table ] ----------------------------
Create Table Classes
(
	ID int not null identity(1,1),
	Name nvarchar(50) not null,
	Code nvarchar(50),
	Fees int not null,

	constraint ClasesPK primary key(ID)
)
go

------------------------------ [ Equipments Table ] -------------------------
Create Table Equipments
(
	ID int not null identity(1,1),
	Name nvarchar(50) not null,
	Price int not null,
	SerielNum nvarchar(50) not null,
	DeliveryDate Date not null,
	ClassID int not null,

	constraint EquipmentsPK primary key (ID),
	constraint EquipmentsFK foreign key (ClassID) references Classes(ID)
	
)

go

Create Table ClassTrainers
(
	StaffID int not null,
	ClassesID  int not null,

	constraint StaffClassesTraineesPK primary Key (StaffID, ClassesID),

	constraint StaffClassesTraineesStaffFK foreign key (StaffID) references Staff(ID),
	constraint StaffClassesTraineesTraineesFK foreign key (ClassesID) references Trainees(ID)
)
go 

Create Table TraineesClassesEnrollment
(
	TraineesID int not null,
	ClassID int not null,
	StartDate date not null,
	EndDate date not null,
	SubFee int not null,

	constraint TraineesClassesEnrollmentPK primary key (TraineesID, ClassID),
	constraint TraineesClassesEnrollmentTraineesFK foreign Key (TraineesID) references Trainees(ID),
	constraint TraineesClassesEnrollmentClassIDFK foreign key (ClassID) references Classes(ID)
)
