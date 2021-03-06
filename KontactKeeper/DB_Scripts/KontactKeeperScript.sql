USE [master]
GO
/****** Object:  Database [KontactKeeper]    Script Date: 2020/10/01 09:11:16 ******/
CREATE DATABASE [KontactKeeper]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KontactKeeper', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\KontactKeeper.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'KontactKeeper_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\KontactKeeper_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [KontactKeeper] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KontactKeeper].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KontactKeeper] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KontactKeeper] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KontactKeeper] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KontactKeeper] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KontactKeeper] SET ARITHABORT OFF 
GO
ALTER DATABASE [KontactKeeper] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [KontactKeeper] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KontactKeeper] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KontactKeeper] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KontactKeeper] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KontactKeeper] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KontactKeeper] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KontactKeeper] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KontactKeeper] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KontactKeeper] SET  DISABLE_BROKER 
GO
ALTER DATABASE [KontactKeeper] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KontactKeeper] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KontactKeeper] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KontactKeeper] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KontactKeeper] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KontactKeeper] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KontactKeeper] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KontactKeeper] SET RECOVERY FULL 
GO
ALTER DATABASE [KontactKeeper] SET  MULTI_USER 
GO
ALTER DATABASE [KontactKeeper] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KontactKeeper] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KontactKeeper] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KontactKeeper] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [KontactKeeper] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'KontactKeeper', N'ON'
GO
ALTER DATABASE [KontactKeeper] SET QUERY_STORE = OFF
GO
USE [KontactKeeper]
GO
/****** Object:  Table [dbo].[tblAdmin]    Script Date: 2020/10/01 09:11:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAdmin](
	[ID] [int] NOT NULL,
	[FName] [nvarchar](50) NOT NULL,
	[LName] [nvarchar](50) NOT NULL,
	[UName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblAdmin] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFBUser]    Script Date: 2020/10/01 09:11:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFBUser](
	[ID] [int] NOT NULL,
	[FBID] [nvarchar](50) NOT NULL,
	[FBName] [nvarchar](50) NOT NULL,
	[LastSeen] [datetime] NOT NULL,
 CONSTRAINT [PK_tblFBUser] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblAdmin] ([ID], [FName], [LName], [UName], [Password]) VALUES (1001, N'Lucy', N'Jones', N'LucyJ01', N'L09cyJ0n3s')
INSERT [dbo].[tblAdmin] ([ID], [FName], [LName], [UName], [Password]) VALUES (1002, N'Rebecca', N'Davies', N'RebeccaLove', N'Davies_Bec')
INSERT [dbo].[tblAdmin] ([ID], [FName], [LName], [UName], [Password]) VALUES (1003, N'Brent', N'Taylor', N'Brent9901', N'TaylorisBrent')
INSERT [dbo].[tblAdmin] ([ID], [FName], [LName], [UName], [Password]) VALUES (1004, N'Jacob', N'Evans', N'JacobEvans', N'JE81')
INSERT [dbo].[tblFBUser] ([ID], [FBID], [FBName], [LastSeen]) VALUES (101, N'User1', N'Jill Fitzgerald', CAST(N'2020-06-28T00:00:00.000' AS DateTime))
INSERT [dbo].[tblFBUser] ([ID], [FBID], [FBName], [LastSeen]) VALUES (102, N'User2', N'Edward Marryfiled', CAST(N'2020-09-08T00:00:00.000' AS DateTime))
INSERT [dbo].[tblFBUser] ([ID], [FBID], [FBName], [LastSeen]) VALUES (103, N'User3', N'Elizabeth Clarke', CAST(N'2020-10-01T00:00:00.000' AS DateTime))
INSERT [dbo].[tblFBUser] ([ID], [FBID], [FBName], [LastSeen]) VALUES (104, N'User4', N'Thomas Kentz', CAST(N'2020-02-01T00:00:00.000' AS DateTime))
USE [master]
GO
ALTER DATABASE [KontactKeeper] SET  READ_WRITE 
GO
