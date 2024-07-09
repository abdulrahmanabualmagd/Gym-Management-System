USE [master]
GO
/****** Object:  Database [GymSystem]    Script Date: 10/11/2023 11:54:30 AM ******/
CREATE DATABASE [GymSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GymSystem', FILENAME = N'D:\GymDatabase\GymSystem-Data.mdf' , SIZE = 8192KB , MAXSIZE = 51200KB , FILEGROWTH = 10%)
 LOG ON 
( NAME = N'Net23-Company-Log', FILENAME = N'D:\GymDatabase\GymSystem-Log.Ldf' , SIZE = 8192KB , MAXSIZE = 51200KB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [GymSystem] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GymSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GymSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GymSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GymSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GymSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GymSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [GymSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GymSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GymSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GymSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GymSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GymSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GymSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GymSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GymSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GymSystem] SET  ENABLE_BROKER 
GO
ALTER DATABASE [GymSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GymSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GymSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GymSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GymSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GymSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GymSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GymSystem] SET RECOVERY FULL 
GO
ALTER DATABASE [GymSystem] SET  MULTI_USER 
GO
ALTER DATABASE [GymSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GymSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GymSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GymSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GymSystem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GymSystem] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'GymSystem', N'ON'
GO
ALTER DATABASE [GymSystem] SET QUERY_STORE = ON
GO
ALTER DATABASE [GymSystem] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [GymSystem]
GO
/****** Object:  Table [dbo].[Classes]    Script Date: 10/11/2023 11:54:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Fees] [int] NOT NULL,
 CONSTRAINT [ClasesPK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClassTrainers]    Script Date: 10/11/2023 11:54:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassTrainers](
	[StaffID] [int] NOT NULL,
	[ClassesID] [int] NOT NULL,
 CONSTRAINT [StaffClassesTraineesPK] PRIMARY KEY CLUSTERED 
(
	[StaffID] ASC,
	[ClassesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipments]    Script Date: 10/11/2023 11:54:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Price] [int] NOT NULL,
	[SerielNum] [nvarchar](50) NOT NULL,
	[DeliveryDate] [date] NOT NULL,
	[ClassID] [int] NOT NULL,
 CONSTRAINT [EquipmentsPK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 10/11/2023 11:54:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Gender] [nvarchar](50) NOT NULL,
	[Age] [int] NOT NULL,
	[Phone] [nvarchar](12) NOT NULL,
	[JobTitle] [nvarchar](50) NOT NULL,
	[Salary] [int] NOT NULL,
	[HireDate] [date] NOT NULL,
	[Image] [binary](1000) NULL,
	[username] [nvarchar](50) NULL,
	[password] [char](4) NULL,
 CONSTRAINT [StaffPK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trainees]    Script Date: 10/11/2023 11:54:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trainees](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Gender] [nvarchar](50) NOT NULL,
	[Age] [int] NOT NULL,
	[Phone] [nvarchar](12) NOT NULL,
	[Image] [binary](1000) NULL,
 CONSTRAINT [TraineesPK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TraineesClassesEnrollment]    Script Date: 10/11/2023 11:54:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TraineesClassesEnrollment](
	[TraineesID] [int] NOT NULL,
	[ClassID] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[SubFee] [int] NOT NULL,
 CONSTRAINT [TraineesClassesEnrollmentPK] PRIMARY KEY CLUSTERED 
(
	[TraineesID] ASC,
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Classes] ON 
GO
INSERT [dbo].[Classes] ([ID], [Name], [Code], [Fees]) VALUES (1, N'Fitness', N'A123', 250)
GO
INSERT [dbo].[Classes] ([ID], [Name], [Code], [Fees]) VALUES (2, N'Cardio', N'B456 ', 250)
GO
INSERT [dbo].[Classes] ([ID], [Name], [Code], [Fees]) VALUES (3, N'Pump', N'C789 ', 300)
GO
INSERT [dbo].[Classes] ([ID], [Name], [Code], [Fees]) VALUES (4, N'Yoga ', N'D234 ', 250)
GO
INSERT [dbo].[Classes] ([ID], [Name], [Code], [Fees]) VALUES (5, N'Zumba', N'E567 ', 300)
GO
INSERT [dbo].[Classes] ([ID], [Name], [Code], [Fees]) VALUES (6, N'Pilates Precision', N'F890 ', 250)
GO
INSERT [dbo].[Classes] ([ID], [Name], [Code], [Fees]) VALUES (7, N'Zumba Dance Party', N'G123 ', 250)
GO
INSERT [dbo].[Classes] ([ID], [Name], [Code], [Fees]) VALUES (8, N'Core Crusher', N'H456 ', 200)
GO
INSERT [dbo].[Classes] ([ID], [Name], [Code], [Fees]) VALUES (9, N'Spin & Sweat', N'I789 ', 300)
GO
INSERT [dbo].[Classes] ([ID], [Name], [Code], [Fees]) VALUES (10, N'CrossFit Challenge', N'J234 ', 300)
GO
INSERT [dbo].[Classes] ([ID], [Name], [Code], [Fees]) VALUES (11, N'Flex & Flow Yoga', N'K567 ', 250)
GO
INSERT [dbo].[Classes] ([ID], [Name], [Code], [Fees]) VALUES (12, N'Kickboxing Knockout', N'L890 ', 300)
GO
INSERT [dbo].[Classes] ([ID], [Name], [Code], [Fees]) VALUES (13, N'Aqua Aerobics Splash', N'M123 ', 200)
GO
INSERT [dbo].[Classes] ([ID], [Name], [Code], [Fees]) VALUES (14, N'Circuit Revolution', N'N456 ', 250)
GO
INSERT [dbo].[Classes] ([ID], [Name], [Code], [Fees]) VALUES (15, N'Barre Ballet Sculpt', N'O789 ', 300)
GO
INSERT [dbo].[Classes] ([ID], [Name], [Code], [Fees]) VALUES (16, N'TRX Total Body', N'P234 ', 300)
GO
INSERT [dbo].[Classes] ([ID], [Name], [Code], [Fees]) VALUES (17, N'Strongman Showdown', N'Q567 ', 300)
GO
INSERT [dbo].[Classes] ([ID], [Name], [Code], [Fees]) VALUES (18, N'Mindful Meditation', N'R890 ', 200)
GO
INSERT [dbo].[Classes] ([ID], [Name], [Code], [Fees]) VALUES (19, N'Hula Hoop Fitness', N'S123 ', 250)
GO
INSERT [dbo].[Classes] ([ID], [Name], [Code], [Fees]) VALUES (20, N'Tai Chi Tranquility', N'T456 ', 200)
GO
SET IDENTITY_INSERT [dbo].[Classes] OFF
GO
INSERT [dbo].[ClassTrainers] ([StaffID], [ClassesID]) VALUES (4, 3)
GO
INSERT [dbo].[ClassTrainers] ([StaffID], [ClassesID]) VALUES (6, 2)
GO
INSERT [dbo].[ClassTrainers] ([StaffID], [ClassesID]) VALUES (7, 1)
GO
INSERT [dbo].[ClassTrainers] ([StaffID], [ClassesID]) VALUES (8, 1)
GO
INSERT [dbo].[ClassTrainers] ([StaffID], [ClassesID]) VALUES (8, 5)
GO
INSERT [dbo].[ClassTrainers] ([StaffID], [ClassesID]) VALUES (9, 1)
GO
INSERT [dbo].[ClassTrainers] ([StaffID], [ClassesID]) VALUES (9, 5)
GO
INSERT [dbo].[ClassTrainers] ([StaffID], [ClassesID]) VALUES (13, 1)
GO
INSERT [dbo].[ClassTrainers] ([StaffID], [ClassesID]) VALUES (13, 3)
GO
INSERT [dbo].[ClassTrainers] ([StaffID], [ClassesID]) VALUES (14, 5)
GO
INSERT [dbo].[ClassTrainers] ([StaffID], [ClassesID]) VALUES (15, 4)
GO
INSERT [dbo].[ClassTrainers] ([StaffID], [ClassesID]) VALUES (16, 1)
GO
INSERT [dbo].[ClassTrainers] ([StaffID], [ClassesID]) VALUES (17, 3)
GO
INSERT [dbo].[ClassTrainers] ([StaffID], [ClassesID]) VALUES (17, 4)
GO
SET IDENTITY_INSERT [dbo].[Equipments] ON 
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (1, N'Tai Chi Uniform', 40, N'J9T6P', CAST(N'2023-10-03' AS Date), 20)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (2, N'Meditation Cushion', 55, N'X3Y7H', CAST(N'2023-10-03' AS Date), 20)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (3, N'Dumbbells', 25, N'A3B7F', CAST(N'2023-10-03' AS Date), 1)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (4, N'Resistance Bands', 12, N'K9P2R', CAST(N'2023-10-03' AS Date), 1)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (6, N'Medicine Ball', 36, N'Y8H6G', CAST(N'2023-10-03' AS Date), 1)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (7, N'Agility Ladder', 18, N'D2Z4W', CAST(N'2023-10-03' AS Date), 1)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (8, N'Treadmill', 64, N'S7T9V', CAST(N'2023-10-03' AS Date), 2)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (9, N'Jump Rope', 9, N'F1C6Q', CAST(N'2023-10-03' AS Date), 2)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (10, N'Stationary Bike', 42, N'L3R5M', CAST(N'2023-10-03' AS Date), 2)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (11, N'Boxing Gloves', 29, N'N6X8K', CAST(N'2023-10-03' AS Date), 2)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (12, N'Stair Climber', 55, N'W4U2D', CAST(N'2023-10-03' AS Date), 2)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (13, N'Barbell and Weights', 14, N'E9V1I', CAST(N'2023-10-03' AS Date), 3)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (14, N'Bench Press', 62, N'P5O3A', CAST(N'2023-10-03' AS Date), 3)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (15, N'Weightlifting Belt', 33, N'H7G4Y', CAST(N'2023-10-03' AS Date), 3)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (16, N'Weightlifting Gloves', 48, N'Q2B6L', CAST(N'2023-10-03' AS Date), 3)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (17, N'Weighted Plates', 7, N'R8K9N', CAST(N'2023-10-03' AS Date), 3)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (23, N'Kettlebells', 11, N'O5D2H', CAST(N'2023-10-03' AS Date), 5)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (24, N'Battle Ropes', 45, N'G7M4T', CAST(N'2023-10-03' AS Date), 5)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (25, N'Plyo Box', 31, N'C1S6R', CAST(N'2023-10-03' AS Date), 5)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (26, N'Cones', 53, N'Z8N9E', CAST(N'2023-10-03' AS Date), 5)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (27, N'Stopwatch', 8, N'I2X4J', CAST(N'2023-10-03' AS Date), 5)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (28, N'Pilates Reformer', 23, N'A6B8K', CAST(N'2023-10-03' AS Date), 6)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (29, N'Pilates Magic Circle', 39, N'P3L5Q', CAST(N'2023-10-03' AS Date), 6)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (30, N'Pilates Ball', 56, N'T7V9U', CAST(N'2023-10-03' AS Date), 6)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (31, N'Resistance Bands', 16, N'H1Y3G', CAST(N'2023-10-03' AS Date), 6)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (32, N'Pilates Chair', 61, N'N4R6O', CAST(N'2023-10-03' AS Date), 6)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (33, N'Dance Sneakers', 35, N'S8P2W', CAST(N'2023-10-03' AS Date), 7)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (34, N'Portable Speaker', 50, N'F9J1E', CAST(N'2023-10-03' AS Date), 7)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (35, N'Dance Scarves', 10, N'C7O4M', CAST(N'2023-10-03' AS Date), 7)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (36, N'Maracas', 24, N'W2Z6V', CAST(N'2023-10-03' AS Date), 7)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (37, N'Hula Hoops', 40, N'X8K9D', CAST(N'2023-10-03' AS Date), 7)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (38, N'Stability Ball', 57, N'G3H5N', CAST(N'2023-10-03' AS Date), 8)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (39, N'Ab Roller', 13, N'Y6T8S', CAST(N'2023-10-03' AS Date), 8)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (40, N'Medicine Ball', 63, N'L4U2X', CAST(N'2023-10-03' AS Date), 8)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (41, N'Bosu Ball', 32, N'V7F1I', CAST(N'2023-10-03' AS Date), 8)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (42, N'Resistance Bands', 54, N'B5M3P', CAST(N'2023-10-03' AS Date), 8)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (43, N'Spin Bike', 6, N'Q9R1A', CAST(N'2023-10-03' AS Date), 9)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (44, N'Cycling Shoes', 20, N'U2D4C', CAST(N'2023-10-03' AS Date), 9)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (45, N'Towel', 38, N'J6I8O', CAST(N'2023-10-03' AS Date), 9)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (46, N'Water Bottle', 58, N'Z3N5W', CAST(N'2023-10-03' AS Date), 9)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (47, N'Heart Rate Monitor', 15, N'E7G9Q', CAST(N'2023-10-03' AS Date), 9)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (48, N'Olympic Barbell', 60, N'M1P6T', CAST(N'2023-10-03' AS Date), 10)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (49, N'Pull-Up Bar', 34, N'O8S2K', CAST(N'2023-10-03' AS Date), 10)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (50, N'Plyo Box', 52, N'R4W7Y', CAST(N'2023-10-03' AS Date), 10)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (51, N'Weighted Vest', 9, N'K2X9V', CAST(N'2023-10-03' AS Date), 10)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (52, N'Climbing Rope', 22, N'I5J3B', CAST(N'2023-10-03' AS Date), 10)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (53, N'Yoga Mat', 41, N'D9L1N', CAST(N'2023-10-03' AS Date), 11)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (54, N'Yoga Blocks', 55, N'Q6C8H', CAST(N'2023-10-03' AS Date), 11)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (55, N'Yoga Strap', 12, N'A2K4S', CAST(N'2023-10-03' AS Date), 11)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (56, N'Yoga Wheel', 64, N'N7O3U', CAST(N'2023-10-03' AS Date), 11)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (57, N'Aromatherapy Diffuser', 30, N'X1T5G', CAST(N'2023-10-03' AS Date), 11)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (58, N'Kickboxing Gloves', 49, N'W8V9E', CAST(N'2023-10-03' AS Date), 12)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (59, N'Punching Bag', 7, N'H3R6M', CAST(N'2023-10-03' AS Date), 12)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (60, N'Hand Wraps', 25, N'U5Z7P', CAST(N'2023-10-03' AS Date), 12)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (61, N'Kick Pads', 42, N'F8I1W', CAST(N'2023-10-03' AS Date), 12)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (62, N'Boxing Timer', 56, N'S4Q2D', CAST(N'2023-10-03' AS Date), 12)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (63, N'Water Dumbbells', 11, N'P6N9Y', CAST(N'2023-10-03' AS Date), 13)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (64, N'Pool Noodles', 61, N'B9G3F', CAST(N'2023-10-03' AS Date), 13)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (65, N'Swim Cap', 36, N'Y1C7R', CAST(N'2023-10-03' AS Date), 13)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (66, N'Waterproof Music Player', 50, N'V6X8J', CAST(N'2023-10-03' AS Date), 13)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (67, N'Floating Mats', 8, N'T2H5K', CAST(N'2023-10-03' AS Date), 13)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (68, N'Circuit Training Machines', 23, N'L7M4P', CAST(N'2023-10-03' AS Date), 14)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (69, N'Weight Plates', 39, N'G4E2N', CAST(N'2023-10-03' AS Date), 14)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (70, N'Resistance Bands', 57, N'O9W1T', CAST(N'2023-10-03' AS Date), 14)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (71, N'Stopwatch', 14, N'Z5S3V', CAST(N'2023-10-03' AS Date), 14)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (72, N'Jump Box', 63, N'J8Q6U', CAST(N'2023-10-03' AS Date), 14)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (73, N'Barre', 33, N'C2A9O', CAST(N'2023-10-03' AS Date), 15)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (74, N'Yoga Mat', 53, N'E5D1X', CAST(N'2023-10-03' AS Date), 15)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (75, N'Resistance Bands', 10, N'K7P4B', CAST(N'2023-10-03' AS Date), 15)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (76, N'Pilates Ball', 28, N'I9N3H', CAST(N'2023-10-03' AS Date), 15)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (77, N'Leg Warmers', 44, N'R1T7L', CAST(N'2023-10-03' AS Date), 15)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (78, N'TRX Suspension Trainer', 58, N'M6F8G', CAST(N'2023-10-03' AS Date), 16)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (79, N'Door Anchor', 17, N'P9W1M', CAST(N'2023-10-03' AS Date), 16)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (80, N'TRX Resistance Bands', 62, N'X7J9O', CAST(N'2023-10-03' AS Date), 16)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (81, N'Workout Gloves', 31, N'N2U4Q', CAST(N'2023-10-03' AS Date), 16)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (82, N'Foam Roller', 51, N'H8G1C', CAST(N'2023-10-03' AS Date), 16)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (83, N'Atlas Stones', 6, N'S5V3R', CAST(N'2023-10-03' AS Date), 17)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (84, N'Farmers Walk Handles', 21, N'P9W1M', CAST(N'2023-10-03' AS Date), 17)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (85, N'Tire Flip', 37, N'Q4O7I', CAST(N'2023-10-03' AS Date), 17)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (86, N'Kegs', 59, N'B2K5N', CAST(N'2023-10-03' AS Date), 17)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (87, N'Sledgehammer', 13, N'F7T9E', CAST(N'2023-10-03' AS Date), 17)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (88, N'Meditation Cushion', 64, N'V1D6Z', CAST(N'2023-10-03' AS Date), 18)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (89, N'Singing Bowl', 35, N'U8R3P', CAST(N'2023-10-03' AS Date), 18)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (90, N'Incense', 54, N'T4H6X', CAST(N'2023-10-03' AS Date), 18)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (91, N'Meditation Timer', 12, N'G9S1W', CAST(N'2023-10-03' AS Date), 18)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (92, N'Essential Oils Diffuser', 27, N'A5C7Q', CAST(N'2023-10-03' AS Date), 18)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (93, N'Weighted Hula Hoop', 43, N'Y2N4J', CAST(N'2023-10-03' AS Date), 19)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (94, N'Exercise Mat', 57, N'D7M9O', CAST(N'2023-10-03' AS Date), 19)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (95, N'Music Playlist', 15, N'L1F3K', CAST(N'2023-10-03' AS Date), 19)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (96, N'Water Bottle', 60, N'E8X5I', CAST(N'2023-10-03' AS Date), 19)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (97, N'Wrist Weights', 32, N'Z4W7U', CAST(N'2023-10-03' AS Date), 19)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (98, N'Tai Chi Fan', 52, N'K6V9B', CAST(N'2023-10-03' AS Date), 20)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (99, N'Tai Chi Sword', 9, N'C3R1S', CAST(N'2023-10-03' AS Date), 20)
GO
INSERT [dbo].[Equipments] ([ID], [Name], [Price], [SerielNum], [DeliveryDate], [ClassID]) VALUES (100, N'Tai Chi Shoes', 26, N'O5Q2G', CAST(N'2023-10-03' AS Date), 20)
GO
SET IDENTITY_INSERT [dbo].[Equipments] OFF
GO
SET IDENTITY_INSERT [dbo].[Staff] ON 
GO
INSERT [dbo].[Staff] ([ID], [Name], [Gender], [Age], [Phone], [JobTitle], [Salary], [HireDate], [Image], [username], [password]) VALUES (1, N'Mason', N'Male', 25, N'01200936706', N'Manger', 4000, CAST(N'2023-10-03' AS Date), NULL, N'aaa', N'123 ')
GO
INSERT [dbo].[Staff] ([ID], [Name], [Gender], [Age], [Phone], [JobTitle], [Salary], [HireDate], [Image], [username], [password]) VALUES (2, N'Michael', N'Male', 36, N'01117424353', N'Trainer', 2500, CAST(N'2023-10-04' AS Date), NULL, NULL, NULL)
GO
INSERT [dbo].[Staff] ([ID], [Name], [Gender], [Age], [Phone], [JobTitle], [Salary], [HireDate], [Image], [username], [password]) VALUES (3, N'Ethan', N'Male', 12, N'01048864726', N'Receptionist', 2000, CAST(N'2023-10-05' AS Date), NULL, N'aaa', N'123 ')
GO
INSERT [dbo].[Staff] ([ID], [Name], [Gender], [Age], [Phone], [JobTitle], [Salary], [HireDate], [Image], [username], [password]) VALUES (4, N'Daniel', N'Female', 19, N'01121938185', N'Trainer', 2500, CAST(N'2023-10-06' AS Date), NULL, NULL, NULL)
GO
INSERT [dbo].[Staff] ([ID], [Name], [Gender], [Age], [Phone], [JobTitle], [Salary], [HireDate], [Image], [username], [password]) VALUES (5, N'Jacob', N'Male', 25, N'01514209489', N'Receptionist', 2000, CAST(N'2023-10-07' AS Date), NULL, N'aaa', N'123 ')
GO
INSERT [dbo].[Staff] ([ID], [Name], [Gender], [Age], [Phone], [JobTitle], [Salary], [HireDate], [Image], [username], [password]) VALUES (6, N'Logan', N'Male', 36, N'01019698812', N'Trainer', 2500, CAST(N'2023-10-08' AS Date), NULL, NULL, NULL)
GO
INSERT [dbo].[Staff] ([ID], [Name], [Gender], [Age], [Phone], [JobTitle], [Salary], [HireDate], [Image], [username], [password]) VALUES (7, N'Jackson', N'Male', 12, N'01082353958', N'Trainer', 2500, CAST(N'2023-10-09' AS Date), NULL, NULL, NULL)
GO
INSERT [dbo].[Staff] ([ID], [Name], [Gender], [Age], [Phone], [JobTitle], [Salary], [HireDate], [Image], [username], [password]) VALUES (8, N'Levi', N'Male', 19, N'01035206602', N'Trainer', 2500, CAST(N'2023-10-10' AS Date), NULL, NULL, NULL)
GO
INSERT [dbo].[Staff] ([ID], [Name], [Gender], [Age], [Phone], [JobTitle], [Salary], [HireDate], [Image], [username], [password]) VALUES (9, N'Sebastian', N'Male', 25, N'01179601398', N'Trainer', 2500, CAST(N'2023-10-11' AS Date), NULL, NULL, NULL)
GO
INSERT [dbo].[Staff] ([ID], [Name], [Gender], [Age], [Phone], [JobTitle], [Salary], [HireDate], [Image], [username], [password]) VALUES (10, N'Mateo', N'Male', 36, N'01259439874', N'Receptionist', 2000, CAST(N'2023-10-12' AS Date), NULL, N'aaa', N'123 ')
GO
INSERT [dbo].[Staff] ([ID], [Name], [Gender], [Age], [Phone], [JobTitle], [Salary], [HireDate], [Image], [username], [password]) VALUES (13, N'mohamed', N'male', 25, N'01045120530', N'Trainer', 2500, CAST(N'2023-10-09' AS Date), NULL, NULL, NULL)
GO
INSERT [dbo].[Staff] ([ID], [Name], [Gender], [Age], [Phone], [JobTitle], [Salary], [HireDate], [Image], [username], [password]) VALUES (14, N'Donia', N'Female', 25, N'01054120530', N'Trainer', 2500, CAST(N'2023-10-09' AS Date), NULL, NULL, NULL)
GO
INSERT [dbo].[Staff] ([ID], [Name], [Gender], [Age], [Phone], [JobTitle], [Salary], [HireDate], [Image], [username], [password]) VALUES (15, N'Salma', N'Female', 21, N'01054430530', N'Trainer', 2500, CAST(N'2023-10-09' AS Date), NULL, NULL, NULL)
GO
INSERT [dbo].[Staff] ([ID], [Name], [Gender], [Age], [Phone], [JobTitle], [Salary], [HireDate], [Image], [username], [password]) VALUES (16, N'Salama', N'Female', 27, N'01054454330', N'Trainer', 2500, CAST(N'2023-10-09' AS Date), NULL, NULL, NULL)
GO
INSERT [dbo].[Staff] ([ID], [Name], [Gender], [Age], [Phone], [JobTitle], [Salary], [HireDate], [Image], [username], [password]) VALUES (17, N'Sabrine', N'Female', 27, N'01054455430', N'Trainer', 2500, CAST(N'2023-10-09' AS Date), NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Staff] OFF
GO
SET IDENTITY_INSERT [dbo].[Trainees] ON 
GO
INSERT [dbo].[Trainees] ([ID], [Name], [Gender], [Age], [Phone], [Image]) VALUES (1, N'Matthew', N'Male', 12, N'01117425343', NULL)
GO
INSERT [dbo].[Trainees] ([ID], [Name], [Gender], [Age], [Phone], [Image]) VALUES (2, N'Luke Alvero', N'Male', 35, N'01200930676', NULL)
GO
INSERT [dbo].[Trainees] ([ID], [Name], [Gender], [Age], [Phone], [Image]) VALUES (3, N'Asher', N'Male', 25, N'01048862647', NULL)
GO
INSERT [dbo].[Trainees] ([ID], [Name], [Gender], [Age], [Phone], [Image]) VALUES (4, N'Carter', N'Female', 36, N'01514208994', NULL)
GO
INSERT [dbo].[Trainees] ([ID], [Name], [Gender], [Age], [Phone], [Image]) VALUES (5, N'Julian', N'Male', 25, N'01019691288', NULL)
GO
INSERT [dbo].[Trainees] ([ID], [Name], [Gender], [Age], [Phone], [Image]) VALUES (6, N'Grayson', N'Male', 19, N'01035200266', NULL)
GO
INSERT [dbo].[Trainees] ([ID], [Name], [Gender], [Age], [Phone], [Image]) VALUES (7, N'Leo', N'Male', 12, N'01259437498', NULL)
GO
INSERT [dbo].[Trainees] ([ID], [Name], [Gender], [Age], [Phone], [Image]) VALUES (8, N'Jayden', N'Male', 25, N'01121938581', NULL)
GO
INSERT [dbo].[Trainees] ([ID], [Name], [Gender], [Age], [Phone], [Image]) VALUES (9, N'Gabriel', N'Male', 36, N'01179609813', NULL)
GO
INSERT [dbo].[Trainees] ([ID], [Name], [Gender], [Age], [Phone], [Image]) VALUES (10, N'Isaac', N'Male', 12, N'01082355839', NULL)
GO
INSERT [dbo].[Trainees] ([ID], [Name], [Gender], [Age], [Phone], [Image]) VALUES (11, N'Yousef', N'male', 25, N'01000140504', NULL)
GO
SET IDENTITY_INSERT [dbo].[Trainees] OFF
GO
INSERT [dbo].[TraineesClassesEnrollment] ([TraineesID], [ClassID], [StartDate], [EndDate], [SubFee]) VALUES (1, 2, CAST(N'2023-07-01' AS Date), CAST(N'2023-10-01' AS Date), 250)
GO
INSERT [dbo].[TraineesClassesEnrollment] ([TraineesID], [ClassID], [StartDate], [EndDate], [SubFee]) VALUES (1, 3, CAST(N'2023-08-01' AS Date), CAST(N'2023-11-01' AS Date), 300)
GO
INSERT [dbo].[TraineesClassesEnrollment] ([TraineesID], [ClassID], [StartDate], [EndDate], [SubFee]) VALUES (1, 4, CAST(N'2023-09-01' AS Date), CAST(N'2023-12-01' AS Date), 250)
GO
INSERT [dbo].[TraineesClassesEnrollment] ([TraineesID], [ClassID], [StartDate], [EndDate], [SubFee]) VALUES (1, 5, CAST(N'2023-10-01' AS Date), CAST(N'2024-01-01' AS Date), 300)
GO
INSERT [dbo].[TraineesClassesEnrollment] ([TraineesID], [ClassID], [StartDate], [EndDate], [SubFee]) VALUES (2, 2, CAST(N'2023-07-01' AS Date), CAST(N'2023-10-01' AS Date), 250)
GO
INSERT [dbo].[TraineesClassesEnrollment] ([TraineesID], [ClassID], [StartDate], [EndDate], [SubFee]) VALUES (2, 3, CAST(N'2023-08-01' AS Date), CAST(N'2023-11-01' AS Date), 300)
GO
INSERT [dbo].[TraineesClassesEnrollment] ([TraineesID], [ClassID], [StartDate], [EndDate], [SubFee]) VALUES (2, 4, CAST(N'2023-09-01' AS Date), CAST(N'2023-12-01' AS Date), 250)
GO
INSERT [dbo].[TraineesClassesEnrollment] ([TraineesID], [ClassID], [StartDate], [EndDate], [SubFee]) VALUES (2, 5, CAST(N'2023-10-01' AS Date), CAST(N'2024-01-01' AS Date), 300)
GO
INSERT [dbo].[TraineesClassesEnrollment] ([TraineesID], [ClassID], [StartDate], [EndDate], [SubFee]) VALUES (2, 16, CAST(N'2023-06-01' AS Date), CAST(N'2023-09-01' AS Date), 250)
GO
INSERT [dbo].[TraineesClassesEnrollment] ([TraineesID], [ClassID], [StartDate], [EndDate], [SubFee]) VALUES (2, 18, CAST(N'2023-10-11' AS Date), CAST(N'2023-11-11' AS Date), 200)
GO
INSERT [dbo].[TraineesClassesEnrollment] ([TraineesID], [ClassID], [StartDate], [EndDate], [SubFee]) VALUES (3, 1, CAST(N'2023-06-01' AS Date), CAST(N'2023-09-01' AS Date), 250)
GO
INSERT [dbo].[TraineesClassesEnrollment] ([TraineesID], [ClassID], [StartDate], [EndDate], [SubFee]) VALUES (3, 2, CAST(N'2023-07-01' AS Date), CAST(N'2023-10-01' AS Date), 250)
GO
INSERT [dbo].[TraineesClassesEnrollment] ([TraineesID], [ClassID], [StartDate], [EndDate], [SubFee]) VALUES (3, 3, CAST(N'2023-08-01' AS Date), CAST(N'2023-11-01' AS Date), 300)
GO
INSERT [dbo].[TraineesClassesEnrollment] ([TraineesID], [ClassID], [StartDate], [EndDate], [SubFee]) VALUES (3, 4, CAST(N'2023-09-01' AS Date), CAST(N'2023-12-01' AS Date), 250)
GO
INSERT [dbo].[TraineesClassesEnrollment] ([TraineesID], [ClassID], [StartDate], [EndDate], [SubFee]) VALUES (3, 5, CAST(N'2023-10-01' AS Date), CAST(N'2024-01-01' AS Date), 300)
GO
INSERT [dbo].[TraineesClassesEnrollment] ([TraineesID], [ClassID], [StartDate], [EndDate], [SubFee]) VALUES (4, 1, CAST(N'2023-06-01' AS Date), CAST(N'2023-09-01' AS Date), 250)
GO
INSERT [dbo].[TraineesClassesEnrollment] ([TraineesID], [ClassID], [StartDate], [EndDate], [SubFee]) VALUES (4, 2, CAST(N'2023-07-01' AS Date), CAST(N'2023-10-01' AS Date), 250)
GO
INSERT [dbo].[TraineesClassesEnrollment] ([TraineesID], [ClassID], [StartDate], [EndDate], [SubFee]) VALUES (4, 3, CAST(N'2023-08-01' AS Date), CAST(N'2023-11-01' AS Date), 300)
GO
INSERT [dbo].[TraineesClassesEnrollment] ([TraineesID], [ClassID], [StartDate], [EndDate], [SubFee]) VALUES (4, 4, CAST(N'2023-09-01' AS Date), CAST(N'2023-12-01' AS Date), 250)
GO
INSERT [dbo].[TraineesClassesEnrollment] ([TraineesID], [ClassID], [StartDate], [EndDate], [SubFee]) VALUES (4, 5, CAST(N'2023-10-01' AS Date), CAST(N'2024-01-01' AS Date), 300)
GO
INSERT [dbo].[TraineesClassesEnrollment] ([TraineesID], [ClassID], [StartDate], [EndDate], [SubFee]) VALUES (5, 1, CAST(N'2023-06-01' AS Date), CAST(N'2023-09-01' AS Date), 250)
GO
INSERT [dbo].[TraineesClassesEnrollment] ([TraineesID], [ClassID], [StartDate], [EndDate], [SubFee]) VALUES (5, 3, CAST(N'2023-08-01' AS Date), CAST(N'2023-11-01' AS Date), 300)
GO
INSERT [dbo].[TraineesClassesEnrollment] ([TraineesID], [ClassID], [StartDate], [EndDate], [SubFee]) VALUES (5, 5, CAST(N'2023-10-01' AS Date), CAST(N'2024-01-01' AS Date), 300)
GO
INSERT [dbo].[TraineesClassesEnrollment] ([TraineesID], [ClassID], [StartDate], [EndDate], [SubFee]) VALUES (6, 1, CAST(N'2023-06-01' AS Date), CAST(N'2023-09-01' AS Date), 250)
GO
INSERT [dbo].[TraineesClassesEnrollment] ([TraineesID], [ClassID], [StartDate], [EndDate], [SubFee]) VALUES (6, 2, CAST(N'2023-07-01' AS Date), CAST(N'2023-10-01' AS Date), 250)
GO
INSERT [dbo].[TraineesClassesEnrollment] ([TraineesID], [ClassID], [StartDate], [EndDate], [SubFee]) VALUES (6, 3, CAST(N'2023-08-01' AS Date), CAST(N'2023-11-01' AS Date), 300)
GO
INSERT [dbo].[TraineesClassesEnrollment] ([TraineesID], [ClassID], [StartDate], [EndDate], [SubFee]) VALUES (7, 1, CAST(N'2023-06-01' AS Date), CAST(N'2023-09-01' AS Date), 250)
GO
INSERT [dbo].[TraineesClassesEnrollment] ([TraineesID], [ClassID], [StartDate], [EndDate], [SubFee]) VALUES (7, 2, CAST(N'2023-07-01' AS Date), CAST(N'2023-10-01' AS Date), 250)
GO
INSERT [dbo].[TraineesClassesEnrollment] ([TraineesID], [ClassID], [StartDate], [EndDate], [SubFee]) VALUES (7, 3, CAST(N'2023-08-01' AS Date), CAST(N'2023-11-01' AS Date), 300)
GO
INSERT [dbo].[TraineesClassesEnrollment] ([TraineesID], [ClassID], [StartDate], [EndDate], [SubFee]) VALUES (7, 4, CAST(N'2023-09-01' AS Date), CAST(N'2023-12-01' AS Date), 250)
GO
INSERT [dbo].[TraineesClassesEnrollment] ([TraineesID], [ClassID], [StartDate], [EndDate], [SubFee]) VALUES (7, 5, CAST(N'2023-10-01' AS Date), CAST(N'2024-01-01' AS Date), 300)
GO
INSERT [dbo].[TraineesClassesEnrollment] ([TraineesID], [ClassID], [StartDate], [EndDate], [SubFee]) VALUES (8, 1, CAST(N'2023-06-01' AS Date), CAST(N'2023-09-01' AS Date), 250)
GO
INSERT [dbo].[TraineesClassesEnrollment] ([TraineesID], [ClassID], [StartDate], [EndDate], [SubFee]) VALUES (8, 3, CAST(N'2023-08-01' AS Date), CAST(N'2023-11-01' AS Date), 300)
GO
INSERT [dbo].[TraineesClassesEnrollment] ([TraineesID], [ClassID], [StartDate], [EndDate], [SubFee]) VALUES (8, 4, CAST(N'2023-09-01' AS Date), CAST(N'2023-12-01' AS Date), 250)
GO
INSERT [dbo].[TraineesClassesEnrollment] ([TraineesID], [ClassID], [StartDate], [EndDate], [SubFee]) VALUES (8, 5, CAST(N'2023-10-01' AS Date), CAST(N'2024-01-01' AS Date), 300)
GO
INSERT [dbo].[TraineesClassesEnrollment] ([TraineesID], [ClassID], [StartDate], [EndDate], [SubFee]) VALUES (9, 5, CAST(N'2023-10-01' AS Date), CAST(N'2024-01-01' AS Date), 300)
GO
INSERT [dbo].[TraineesClassesEnrollment] ([TraineesID], [ClassID], [StartDate], [EndDate], [SubFee]) VALUES (10, 1, CAST(N'2023-06-01' AS Date), CAST(N'2023-09-01' AS Date), 250)
GO
INSERT [dbo].[TraineesClassesEnrollment] ([TraineesID], [ClassID], [StartDate], [EndDate], [SubFee]) VALUES (10, 2, CAST(N'2023-07-01' AS Date), CAST(N'2023-10-01' AS Date), 250)
GO
INSERT [dbo].[TraineesClassesEnrollment] ([TraineesID], [ClassID], [StartDate], [EndDate], [SubFee]) VALUES (10, 3, CAST(N'2023-08-01' AS Date), CAST(N'2023-11-01' AS Date), 300)
GO
INSERT [dbo].[TraineesClassesEnrollment] ([TraineesID], [ClassID], [StartDate], [EndDate], [SubFee]) VALUES (10, 4, CAST(N'2023-09-01' AS Date), CAST(N'2023-12-01' AS Date), 250)
GO
INSERT [dbo].[TraineesClassesEnrollment] ([TraineesID], [ClassID], [StartDate], [EndDate], [SubFee]) VALUES (10, 5, CAST(N'2023-10-01' AS Date), CAST(N'2024-01-01' AS Date), 300)
GO
INSERT [dbo].[TraineesClassesEnrollment] ([TraineesID], [ClassID], [StartDate], [EndDate], [SubFee]) VALUES (11, 2, CAST(N'2023-10-08' AS Date), CAST(N'2024-10-08' AS Date), 300)
GO
ALTER TABLE [dbo].[ClassTrainers]  WITH CHECK ADD  CONSTRAINT [ClassTrainersClassesFK] FOREIGN KEY([ClassesID])
REFERENCES [dbo].[Classes] ([ID])
GO
ALTER TABLE [dbo].[ClassTrainers] CHECK CONSTRAINT [ClassTrainersClassesFK]
GO
ALTER TABLE [dbo].[ClassTrainers]  WITH CHECK ADD  CONSTRAINT [StaffClassesTraineesStaffFK] FOREIGN KEY([StaffID])
REFERENCES [dbo].[Staff] ([ID])
GO
ALTER TABLE [dbo].[ClassTrainers] CHECK CONSTRAINT [StaffClassesTraineesStaffFK]
GO
ALTER TABLE [dbo].[Equipments]  WITH CHECK ADD  CONSTRAINT [EquipmentsFK] FOREIGN KEY([ClassID])
REFERENCES [dbo].[Classes] ([ID])
GO
ALTER TABLE [dbo].[Equipments] CHECK CONSTRAINT [EquipmentsFK]
GO
ALTER TABLE [dbo].[TraineesClassesEnrollment]  WITH CHECK ADD  CONSTRAINT [TraineesClassesEnrollmentClassIDFK] FOREIGN KEY([ClassID])
REFERENCES [dbo].[Classes] ([ID])
GO
ALTER TABLE [dbo].[TraineesClassesEnrollment] CHECK CONSTRAINT [TraineesClassesEnrollmentClassIDFK]
GO
ALTER TABLE [dbo].[TraineesClassesEnrollment]  WITH CHECK ADD  CONSTRAINT [TraineesClassesEnrollmentTraineesFK] FOREIGN KEY([TraineesID])
REFERENCES [dbo].[Trainees] ([ID])
GO
ALTER TABLE [dbo].[TraineesClassesEnrollment] CHECK CONSTRAINT [TraineesClassesEnrollmentTraineesFK]
GO
/****** Object:  StoredProcedure [dbo].[AddStaff]    Script Date: 10/11/2023 11:54:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[AddStaff]
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
GO
/****** Object:  StoredProcedure [dbo].[AddTrainee]    Script Date: 10/11/2023 11:54:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[AddTrainee]
@name nvarchar(50),
@gender nvarchar(50),
@age int,
@phone nvarchar(20),
@class nvarchar(50),
@duration int
as begin
declare @classId int, @classFee int, @TraineeId int, @StartDate date, @endDate date

	-- section for getting the id of class and Fees
	select top(1) @classId = ID, @classFee = Fees from dbo.Classes where Name = @class 

	
		-- Get the Start and End Date for the Trainee
		set @StartDate = CAST(GETDATE() AS DATE)
		set @EndDate = DATEADD(month, @duration, @StartDate)
		
		-- insert the trainee to the table if it not exist
	if not exists (select * from Trainees where Name = @name or @phone = Phone)
	begin
		insert into dbo.Trainees ([Name],[Gender],[Age],[Phone]) values (@name, @gender, @age, @phone)
	end

	-- get the Trinee id if exists or not 
	select @TraineeId = ID from dbo.Trainees where Name = @name

	declare @currentDate date = CAST(GETDATE() AS DATE)
	if not exists (select * from TraineesClassesEnrollment where TraineesID = @TraineeId and ClassID = @classId and EndDate >= @currentDate )
		begin
			insert into dbo.TraineesClassesEnrollment values(@TraineeId, @classId, @StartDate, @endDate, @classFee)
		end
end

GO
/****** Object:  StoredProcedure [dbo].[AddTrainer]    Script Date: 10/11/2023 11:54:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[AddTrainer]
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
GO
/****** Object:  StoredProcedure [dbo].[DeleteClass]    Script Date: 10/11/2023 11:54:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[DeleteClass]
@ClassId int
as begin

delete from Equipments where ClassID = @ClassId

delete from TraineesClassesEnrollment where ClassID = @ClassId

delete from ClassTrainers where ClassesID = @ClassId

delete from Classes where ID = @ClassId

end
GO
/****** Object:  StoredProcedure [dbo].[DeleteStaff]    Script Date: 10/11/2023 11:54:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[DeleteStaff]
@Id int
as begin 
	delete from dbo.Staff where ID = @Id and JobTitle <> 'Trainer'
end

GO
/****** Object:  StoredProcedure [dbo].[DeleteTrainee]    Script Date: 10/11/2023 11:54:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[DeleteTrainee]
@TraineeId int
as begin
delete from dbo.TraineesClassesEnrollment where TraineesID = @TraineeId
delete from dbo.Trainees where ID = @TraineeId
end
GO
/****** Object:  StoredProcedure [dbo].[DeleteTrainer]    Script Date: 10/11/2023 11:54:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[DeleteTrainer]
@Id int
as begin
delete from dbo.ClassTrainers where StaffID = @Id
delete from dbo.Staff where ID = @Id and JobTitle = 'Trainer'
end
GO
/****** Object:  StoredProcedure [dbo].[MoneyGraphList]    Script Date: 10/11/2023 11:54:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[MoneyGraphList] 
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


GO
/****** Object:  StoredProcedure [dbo].[TraineePerEachClass]    Script Date: 10/11/2023 11:54:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   proc [dbo].[TraineePerEachClass]
as begin
--declare @records table (ClassName nvarchar(50), Traffic int)
select c.Name ,COUNT(e.classId)as trainees  from Classes as c
join TraineesClassesEnrollment as e
on c.ID = e.ClassID
join Trainees as t
on e.TraineesID = t.ID
group by c.Name
order by COUNT(e.classId) Desc

end
GO
/****** Object:  StoredProcedure [dbo].[TraineesPerClassMonths]    Script Date: 10/11/2023 11:54:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[TraineesPerClassMonths]
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
GO
USE [master]
GO
ALTER DATABASE [GymSystem] SET  READ_WRITE 
GO
