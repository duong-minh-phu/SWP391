USE [master]
GO
/****** Object:  Database [swp]    Script Date: 26/05/2023 1:09:46 CH ******/
CREATE DATABASE [swp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'swp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\swp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'swp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\swp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [swp] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [swp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [swp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [swp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [swp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [swp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [swp] SET ARITHABORT OFF 
GO
ALTER DATABASE [swp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [swp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [swp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [swp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [swp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [swp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [swp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [swp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [swp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [swp] SET  ENABLE_BROKER 
GO
ALTER DATABASE [swp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [swp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [swp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [swp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [swp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [swp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [swp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [swp] SET RECOVERY FULL 
GO
ALTER DATABASE [swp] SET  MULTI_USER 
GO
ALTER DATABASE [swp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [swp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [swp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [swp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [swp] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'swp', N'ON'
GO
ALTER DATABASE [swp] SET QUERY_STORE = OFF
GO
USE [swp]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [swp]
GO
/****** Object:  Table [dbo].[category]    Script Date: 26/05/2023 1:10:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[category_id] [int] NOT NULL,
	[category_name] [varchar](255) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[order]    Script Date: 26/05/2023 1:11:54 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[order_id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [bigint] NOT NULL,
	[total] [money] NOT NULL,
	[payment] [varchar](250) NOT NULL,
	[address] [ntext] NOT NULL,
	[date] [date] NOT NULL,
	[phone] [bigint] NOT NULL,
	[id_order_status] [varchar](1) NULL,
	[order_shipping] [varchar](1) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[order_details]    Script Date: 26/05/2023 1:12:58 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_details](
	[id_order_details] [bigint] IDENTITY(1,1) NOT NULL,
	[id_order] [bigint] NOT NULL,
	[id_product] [varchar](100) NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [money] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[product]    Script Date: 26/05/2023 1:14:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[product_id] [varchar](100) NOT NULL,
	[category_id] [int] NOT NULL,
	[product_name] [nvarchar](max) NOT NULL,
	[product_price] [money] NOT NULL,
	[product_describe] [nvarchar](max) NOT NULL,
	[quantity] [int] NOT NULL,
	[img] [nvarchar](50) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Recipe]    Script Date: 26/05/2023 1:15:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recipe](
	[id_recipe] [varchar](100) NOT NULL,
	[type_id] [varchar](100) NOT NULL,
	[Recipe_name] [varchar](255) NOT NULL,
	[food_recipe] [varchar](255) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[users]    Script Date: 26/05/2023 1:16:11 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[user_id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_name] [nvarchar](200) NULL,
	[user_email] [varchar](255) NOT NULL,
	[user_pass] [nvarchar](255) NOT NULL,
	[role] [nvarchar](50) NULL,
	[user_phone] [nvarchar](15) NULL
) ON [PRIMARY]

GO
USE [master]
GO
ALTER DATABASE [swp] SET  READ_WRITE 
GO
