USE [master]
GO
/****** Object:  Database [Task]    Script Date: 30-07-2022 17:04:10 ******/
CREATE DATABASE [Task]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Task', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER01\MSSQL\DATA\Task.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Task_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER01\MSSQL\DATA\Task_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Task] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Task].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Task] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Task] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Task] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Task] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Task] SET ARITHABORT OFF 
GO
ALTER DATABASE [Task] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Task] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Task] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Task] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Task] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Task] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Task] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Task] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Task] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Task] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Task] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Task] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Task] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Task] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Task] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Task] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Task] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Task] SET RECOVERY FULL 
GO
ALTER DATABASE [Task] SET  MULTI_USER 
GO
ALTER DATABASE [Task] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Task] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Task] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Task] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Task] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Task', N'ON'
GO
ALTER DATABASE [Task] SET QUERY_STORE = OFF
GO
USE [Task]
GO
/****** Object:  Table [dbo].[city]    Script Date: 30-07-2022 17:04:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[city](
	[city_id] [int] IDENTITY(1,1) NOT NULL,
	[city_name] [varchar](max) NULL,
	[state_id] [int] NULL,
 CONSTRAINT [PK_city] PRIMARY KEY CLUSTERED 
(
	[city_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 30-07-2022 17:04:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Employee_id] [int] IDENTITY(1,1) NOT NULL,
	[f_name] [varchar](max) NOT NULL,
	[email] [varchar](max) NOT NULL,
	[phone_number] [varchar](max) NULL,
	[address] [varchar](max) NULL,
	[state_id] [int] NOT NULL,
	[city_id] [int] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[state]    Script Date: 30-07-2022 17:04:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[state](
	[state_id] [int] IDENTITY(1,1) NOT NULL,
	[state_name] [varchar](max) NULL,
 CONSTRAINT [PK_state] PRIMARY KEY CLUSTERED 
(
	[state_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[city] ON 

INSERT [dbo].[city] ([city_id], [city_name], [state_id]) VALUES (1, N'Surat', 1)
INSERT [dbo].[city] ([city_id], [city_name], [state_id]) VALUES (2, N'Bardoli', 1)
INSERT [dbo].[city] ([city_id], [city_name], [state_id]) VALUES (3, N'Baroda', 1)
INSERT [dbo].[city] ([city_id], [city_name], [state_id]) VALUES (4, N'mumbai', 2)
INSERT [dbo].[city] ([city_id], [city_name], [state_id]) VALUES (5, N'Pune', 2)
SET IDENTITY_INSERT [dbo].[city] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Employee_id], [f_name], [email], [phone_number], [address], [state_id], [city_id]) VALUES (3, N'Nevil', N'nevil@gmail.com', N'9909110465', N'surat', 1, 2)
INSERT [dbo].[Employee] ([Employee_id], [f_name], [email], [phone_number], [address], [state_id], [city_id]) VALUES (8, N'Milan', N'milan@gmail.com', N'9265847156', N'varachha', 1, 1)
INSERT [dbo].[Employee] ([Employee_id], [f_name], [email], [phone_number], [address], [state_id], [city_id]) VALUES (9, N'Bhadresh', N'pradip@gmail.com', N'9868754634', N'surat', 1, 1)
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[state] ON 

INSERT [dbo].[state] ([state_id], [state_name]) VALUES (1, N'Gujrat')
INSERT [dbo].[state] ([state_id], [state_name]) VALUES (2, N'Maharastra')
SET IDENTITY_INSERT [dbo].[state] OFF
GO
ALTER TABLE [dbo].[city]  WITH CHECK ADD  CONSTRAINT [FK_city_state] FOREIGN KEY([state_id])
REFERENCES [dbo].[state] ([state_id])
GO
ALTER TABLE [dbo].[city] CHECK CONSTRAINT [FK_city_state]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_city] FOREIGN KEY([city_id])
REFERENCES [dbo].[city] ([city_id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_city]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_state] FOREIGN KEY([state_id])
REFERENCES [dbo].[state] ([state_id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_state]
GO
USE [master]
GO
ALTER DATABASE [Task] SET  READ_WRITE 
GO
