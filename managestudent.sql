USE [master]
GO
/****** Object:  Database [PE_Fall21B5]    Script Date: 19-Jul-23 12:13:15 PM ******/
CREATE DATABASE [PE_Fall21B5]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PE_Fall21B5', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PE_Fall21B5.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PE_Fall21B5_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PE_Fall21B5_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PE_Fall21B5] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PE_Fall21B5].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PE_Fall21B5] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PE_Fall21B5] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PE_Fall21B5] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PE_Fall21B5] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PE_Fall21B5] SET ARITHABORT OFF 
GO
ALTER DATABASE [PE_Fall21B5] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PE_Fall21B5] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PE_Fall21B5] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PE_Fall21B5] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PE_Fall21B5] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PE_Fall21B5] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PE_Fall21B5] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PE_Fall21B5] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PE_Fall21B5] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PE_Fall21B5] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PE_Fall21B5] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PE_Fall21B5] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PE_Fall21B5] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PE_Fall21B5] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PE_Fall21B5] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PE_Fall21B5] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PE_Fall21B5] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PE_Fall21B5] SET RECOVERY FULL 
GO
ALTER DATABASE [PE_Fall21B5] SET  MULTI_USER 
GO
ALTER DATABASE [PE_Fall21B5] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PE_Fall21B5] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PE_Fall21B5] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PE_Fall21B5] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PE_Fall21B5] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PE_Fall21B5] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PE_Fall21B5', N'ON'
GO
ALTER DATABASE [PE_Fall21B5] SET QUERY_STORE = OFF
GO
USE [PE_Fall21B5]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 19-Jul-23 12:13:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 19-Jul-23 12:13:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Dob] [date] NOT NULL,
	[Sex] [nvarchar](50) NULL,
	[Position] [nvarchar](50) NULL,
	[Department] [int] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Project]    Script Date: 19-Jul-23 12:13:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [ntext] NULL,
	[StartDate] [date] NULL,
	[Type] [nvarchar](50) NULL,
	[Department] [int] NULL,
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Department] ON 
GO
INSERT [dbo].[Department] ([Id], [Name]) VALUES (1, N'Integrated System')
GO
INSERT [dbo].[Department] ([Id], [Name]) VALUES (2, N'Software')
GO
INSERT [dbo].[Department] ([Id], [Name]) VALUES (3, N'Information Assurance')
GO
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 
GO
INSERT [dbo].[Employee] ([Id], [Name], [Dob], [Sex], [Position], [Department]) VALUES (3, N'Chu Thanh Quang', CAST(N'1980-12-09' AS Date), N'Male', N'Developer', 1)
GO
INSERT [dbo].[Employee] ([Id], [Name], [Dob], [Sex], [Position], [Department]) VALUES (11, N'baopro', CAST(N'2023-06-12' AS Date), N'Male', N'Leader', 1)
GO
INSERT [dbo].[Employee] ([Id], [Name], [Dob], [Sex], [Position], [Department]) VALUES (14, N'baopro', CAST(N'2023-06-12' AS Date), N'Male', N'Leader', 1)
GO
INSERT [dbo].[Employee] ([Id], [Name], [Dob], [Sex], [Position], [Department]) VALUES (16, N'baobb', CAST(N'2023-06-12' AS Date), N'Female', N'Leader', 1)
GO
INSERT [dbo].[Employee] ([Id], [Name], [Dob], [Sex], [Position], [Department]) VALUES (17, N'baone', CAST(N'2023-07-04' AS Date), N'Male', N'Developer', 1)
GO
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Project] ON 
GO
INSERT [dbo].[Project] ([Id], [Name], [Description], [StartDate], [Type], [Department]) VALUES (1, N'Contact Database for Estates Help Desk', N'The Helpdesk team currently have a Microsoft Access database which has been organically developed from scratch, by a former employee.  The Key Contacts Database has grown to become a critical operational asset, which is now shared with our key front line service provider, Estates Security. 

The Microsoft Access database technology is not supported by ISG. This project is to develop and alternative in a supported technology which will provide increased service resilience.', CAST(N'2020-10-12' AS Date), N'Software Product', 2)
GO
INSERT [dbo].[Project] ([Id], [Name], [Description], [StartDate], [Type], [Department]) VALUES (2, N'Annual Maria DB Upgrade', N'We require our MariaDB infrastructure to remain current and supportable, We will look to upgrade to latest stable and supported versions of Mariadb. 

Our last project to migrate to Mariadb added automation to the build and deployment of databases, we will build on the back of this to patch in an efficient automated manner. ', CAST(N'2019-12-12' AS Date), N'Consulting Project', 1)
GO
INSERT [dbo].[Project] ([Id], [Name], [Description], [StartDate], [Type], [Department]) VALUES (3, N'Digital Strategy Implementation', NULL, CAST(N'2020-09-03' AS Date), N'Consulting Project', 1)
GO
INSERT [dbo].[Project] ([Id], [Name], [Description], [StartDate], [Type], [Department]) VALUES (4, N'Enterprise Infrastructure Migrations', N'Migrate onto new i/f', CAST(N'2020-06-15' AS Date), N'IS Project', 1)
GO
INSERT [dbo].[Project] ([Id], [Name], [Description], [StartDate], [Type], [Department]) VALUES (5, N'Moodle Annual Upgrade', N'Planned annual upgrade of Moodle VLE platform.  

 We should be upgrading yearly, but jumping 2 versions at a time (upgrading in June/July each year).  The exact version each year will be dependent on our plugins and how quickly they can be tested/redeveloped by non-Moodle HQ developers. At present we expect to deploy in July the version that comes out in the December previous.  

Annual upgrade of Moodle platform to stay on supported version. Takes place in Semester 2 for delivery into production in July to fit with teaching pattern. ', CAST(N'2021-08-09' AS Date), N'Software Product', 2)
GO
INSERT [dbo].[Project] ([Id], [Name], [Description], [StartDate], [Type], [Department]) VALUES (6, N'Speaking Out', N'Catalogue (and promotion of) Lothian Gay and Lesbian Switchboard archives held by Lothian Health Services Archive within the Centre for Research Collections. Also includes selected digitisation and a public engagement/research enrichment component as a separate but related project (LUC036).

This project is funded by the Wellcome Trust Research Resources, with an award of £54,548.

The project was originally planned to run from May 2020 - April 2021 but has been temporarily postponed due to Covid. It is now likely to run from November 2021 to October 2022 (tbc).', CAST(N'2019-11-12' AS Date), N'Consulting Project', 3)
GO
SET IDENTITY_INSERT [dbo].[Project] OFF
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Department] FOREIGN KEY([Department])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Department]
GO
ALTER TABLE [dbo].[Project]  WITH CHECK ADD  CONSTRAINT [FK_Project_Department] FOREIGN KEY([Department])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Project] CHECK CONSTRAINT [FK_Project_Department]
GO
USE [master]
GO
ALTER DATABASE [PE_Fall21B5] SET  READ_WRITE 
GO
