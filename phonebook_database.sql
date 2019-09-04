/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.1601)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2016
    Target Database Engine Edition : Microsoft SQL Server Express Edition
    Target Database Engine Type : Standalone SQL Server
*/

USE [master]
GO

/****** Object:  Database [PhoneBook]    Script Date: 9/4/2019 8:45:54 PM ******/
CREATE DATABASE [PhoneBook]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PhoneBook', FILENAME = N'C:\Users\Gaston\PhoneBook.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PhoneBook_log', FILENAME = N'C:\Users\Gaston\PhoneBook_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO

ALTER DATABASE [PhoneBook] SET COMPATIBILITY_LEVEL = 130
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PhoneBook].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [PhoneBook] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [PhoneBook] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [PhoneBook] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [PhoneBook] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [PhoneBook] SET ARITHABORT OFF 
GO

ALTER DATABASE [PhoneBook] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [PhoneBook] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [PhoneBook] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [PhoneBook] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [PhoneBook] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [PhoneBook] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [PhoneBook] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [PhoneBook] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [PhoneBook] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [PhoneBook] SET  DISABLE_BROKER 
GO

ALTER DATABASE [PhoneBook] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [PhoneBook] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [PhoneBook] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [PhoneBook] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [PhoneBook] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [PhoneBook] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [PhoneBook] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [PhoneBook] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [PhoneBook] SET  MULTI_USER 
GO

ALTER DATABASE [PhoneBook] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [PhoneBook] SET DB_CHAINING OFF 
GO

ALTER DATABASE [PhoneBook] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [PhoneBook] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [PhoneBook] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [PhoneBook] SET QUERY_STORE = OFF
GO

USE [PhoneBook]
GO

ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO

ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO

ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO

ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO

ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO

ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO

ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO

ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO

ALTER DATABASE [PhoneBook] SET  READ_WRITE 
GO
