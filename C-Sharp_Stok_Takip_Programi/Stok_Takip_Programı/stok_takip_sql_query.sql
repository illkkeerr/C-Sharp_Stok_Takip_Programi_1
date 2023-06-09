USE [master]
GO
/****** Object:  Database [Stok_Takip]    Script Date: 27.04.2023 13:54:04 ******/
CREATE DATABASE [Stok_Takip]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Stok_Takip', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.WINCC\MSSQL\DATA\Stok_Takip.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Stok_Takip_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.WINCC\MSSQL\DATA\Stok_Takip_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Stok_Takip] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Stok_Takip].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Stok_Takip] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Stok_Takip] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Stok_Takip] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Stok_Takip] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Stok_Takip] SET ARITHABORT OFF 
GO
ALTER DATABASE [Stok_Takip] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Stok_Takip] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Stok_Takip] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Stok_Takip] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Stok_Takip] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Stok_Takip] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Stok_Takip] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Stok_Takip] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Stok_Takip] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Stok_Takip] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Stok_Takip] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Stok_Takip] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Stok_Takip] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Stok_Takip] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Stok_Takip] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Stok_Takip] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Stok_Takip] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Stok_Takip] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Stok_Takip] SET  MULTI_USER 
GO
ALTER DATABASE [Stok_Takip] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Stok_Takip] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Stok_Takip] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Stok_Takip] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Stok_Takip] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Stok_Takip]
GO
/****** Object:  User [SIMATIC HMI VIEWER User]    Script Date: 27.04.2023 13:54:04 ******/
CREATE USER [SIMATIC HMI VIEWER User] FOR LOGIN [DESKTOP-NIJEM97\SIMATIC HMI VIEWER]
GO
/****** Object:  User [SIMATIC HMI User]    Script Date: 27.04.2023 13:54:04 ******/
CREATE USER [SIMATIC HMI User] FOR LOGIN [DESKTOP-NIJEM97\SIMATIC HMI]
GO
/****** Object:  DatabaseRole [SIMATIC HMI VIEWER role]    Script Date: 27.04.2023 13:54:04 ******/
CREATE ROLE [SIMATIC HMI VIEWER role]
GO
/****** Object:  DatabaseRole [SIMATIC HMI role]    Script Date: 27.04.2023 13:54:04 ******/
CREATE ROLE [SIMATIC HMI role]
GO
ALTER ROLE [SIMATIC HMI VIEWER role] ADD MEMBER [SIMATIC HMI VIEWER User]
GO
ALTER ROLE [db_datareader] ADD MEMBER [SIMATIC HMI VIEWER User]
GO
ALTER ROLE [SIMATIC HMI role] ADD MEMBER [SIMATIC HMI User]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [SIMATIC HMI User]
GO
ALTER ROLE [db_datareader] ADD MEMBER [SIMATIC HMI User]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [SIMATIC HMI User]
GO
ALTER ROLE [db_datareader] ADD MEMBER [SIMATIC HMI VIEWER role]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [SIMATIC HMI role]
GO
ALTER ROLE [db_datareader] ADD MEMBER [SIMATIC HMI role]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [SIMATIC HMI role]
GO
/****** Object:  Table [dbo].[KategoriBilgileri]    Script Date: 27.04.2023 13:54:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KategoriBilgileri](
	[Kategori] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MarkaBilgileri]    Script Date: 27.04.2023 13:54:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MarkaBilgileri](
	[Kategori] [nvarchar](50) NOT NULL,
	[Marka] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Musteri]    Script Date: 27.04.2023 13:54:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Musteri](
	[Tc] [nvarchar](50) NOT NULL,
	[AdSoyad] [nvarchar](50) NOT NULL,
	[Telefon] [nvarchar](50) NOT NULL,
	[Adres] [nvarchar](250) NOT NULL,
	[Email] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Satis]    Script Date: 27.04.2023 13:54:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Satis](
	[Tc] [nvarchar](50) NULL,
	[AdSoyad] [nvarchar](50) NULL,
	[Telefon] [nvarchar](50) NULL,
	[BarkodNo] [nvarchar](50) NULL,
	[UrunAdi] [nvarchar](50) NULL,
	[Miktari] [nvarchar](50) NULL,
	[SatisFiyati] [decimal](18, 2) NULL,
	[ToplamFiyat] [decimal](18, 2) NULL,
	[Tarih] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sepet]    Script Date: 27.04.2023 13:54:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sepet](
	[Tc] [nvarchar](50) NULL,
	[AdSoyad] [nvarchar](50) NULL,
	[Telefon] [nvarchar](50) NULL,
	[BarkodNo] [nvarchar](50) NULL,
	[UrunAdi] [nvarchar](50) NULL,
	[Miktari] [int] NULL,
	[SatisFiyati] [decimal](18, 2) NULL,
	[ToplamFiyat] [decimal](18, 2) NULL,
	[Tarih] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Urun]    Script Date: 27.04.2023 13:54:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Urun](
	[BarkodNo] [nvarchar](50) NOT NULL,
	[Kategori] [nvarchar](50) NOT NULL,
	[Marka] [nvarchar](50) NOT NULL,
	[UrunAdi] [nvarchar](50) NOT NULL,
	[Miktari] [int] NOT NULL,
	[AlisFiyati] [decimal](18, 2) NOT NULL,
	[SatisFiyati] [decimal](18, 2) NOT NULL,
	[Tarih] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[KategoriBilgileri] ([Kategori]) VALUES (N'Gıda')
INSERT [dbo].[KategoriBilgileri] ([Kategori]) VALUES (N'İçecekler')
INSERT [dbo].[KategoriBilgileri] ([Kategori]) VALUES (N'Kuruyemiş')
INSERT [dbo].[KategoriBilgileri] ([Kategori]) VALUES (N'Teknoloji')
GO
INSERT [dbo].[MarkaBilgileri] ([Kategori], [Marka]) VALUES (N'Gıda', N'Eti')
INSERT [dbo].[MarkaBilgileri] ([Kategori], [Marka]) VALUES (N'Gıda', N'Ülker')
INSERT [dbo].[MarkaBilgileri] ([Kategori], [Marka]) VALUES (N'İçecekler', N'Erikli')
INSERT [dbo].[MarkaBilgileri] ([Kategori], [Marka]) VALUES (N'İçecekler', N'Coca-Cola')
INSERT [dbo].[MarkaBilgileri] ([Kategori], [Marka]) VALUES (N'Gıda', N'Pınar')
INSERT [dbo].[MarkaBilgileri] ([Kategori], [Marka]) VALUES (N'Kuruyemiş', N'Simbat')
INSERT [dbo].[MarkaBilgileri] ([Kategori], [Marka]) VALUES (N'Kuruyemiş', N'Tadım')
INSERT [dbo].[MarkaBilgileri] ([Kategori], [Marka]) VALUES (N'Teknoloji', N'Samsung')
GO
INSERT [dbo].[Musteri] ([Tc], [AdSoyad], [Telefon], [Adres], [Email]) VALUES (N'25463892787', N'Ahmet ', N'5316176842', N'deneme deneme', N'deneme@gmail.com')
INSERT [dbo].[Musteri] ([Tc], [AdSoyad], [Telefon], [Adres], [Email]) VALUES (N'54789632415', N'Kerim Kaya', N'5486121547', N'adres', N'kerim@gmail.com')
GO
INSERT [dbo].[Satis] ([Tc], [AdSoyad], [Telefon], [BarkodNo], [UrunAdi], [Miktari], [SatisFiyati], [ToplamFiyat], [Tarih]) VALUES (N'', N'', N'', N'100', N'Çikolatalı Gofret', N'8', CAST(7.00 AS Decimal(18, 2)), CAST(56.00 AS Decimal(18, 2)), N'20.04.2023 19:40:25')
INSERT [dbo].[Satis] ([Tc], [AdSoyad], [Telefon], [BarkodNo], [UrunAdi], [Miktari], [SatisFiyati], [ToplamFiyat], [Tarih]) VALUES (N'', N'', N'', N'101', N'Çekirdek', N'10', CAST(20.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), N'20.04.2023 19:40:25')
INSERT [dbo].[Satis] ([Tc], [AdSoyad], [Telefon], [BarkodNo], [UrunAdi], [Miktari], [SatisFiyati], [ToplamFiyat], [Tarih]) VALUES (N'', N'', N'', N'100', N'Çikolatalı Gofret', N'4', CAST(7.00 AS Decimal(18, 2)), CAST(28.00 AS Decimal(18, 2)), N'20.04.2023 19:49:39')
INSERT [dbo].[Satis] ([Tc], [AdSoyad], [Telefon], [BarkodNo], [UrunAdi], [Miktari], [SatisFiyati], [ToplamFiyat], [Tarih]) VALUES (N'', N'', N'', N'101', N'Çekirdek', N'115', CAST(20.00 AS Decimal(18, 2)), CAST(2300.00 AS Decimal(18, 2)), N'20.04.2023 19:49:39')
INSERT [dbo].[Satis] ([Tc], [AdSoyad], [Telefon], [BarkodNo], [UrunAdi], [Miktari], [SatisFiyati], [ToplamFiyat], [Tarih]) VALUES (N'26366463792', N'İlker Şenel', N'', N'100', N'Çikolatalı Gofret', N'20', CAST(7.00 AS Decimal(18, 2)), CAST(140.00 AS Decimal(18, 2)), N'21.04.2023 08:35:04')
INSERT [dbo].[Satis] ([Tc], [AdSoyad], [Telefon], [BarkodNo], [UrunAdi], [Miktari], [SatisFiyati], [ToplamFiyat], [Tarih]) VALUES (N'25463892787', N'Ahmet ', N'5316176842', N'102', N'Karam', N'1', CAST(6.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), N'21.04.2023 08:37:34')
INSERT [dbo].[Satis] ([Tc], [AdSoyad], [Telefon], [BarkodNo], [UrunAdi], [Miktari], [SatisFiyati], [ToplamFiyat], [Tarih]) VALUES (N'25463892787', N'Ahmet ', N'5316176842', N'101', N'Çekirdek', N'1', CAST(20.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), N'21.04.2023 08:37:34')
INSERT [dbo].[Satis] ([Tc], [AdSoyad], [Telefon], [BarkodNo], [UrunAdi], [Miktari], [SatisFiyati], [ToplamFiyat], [Tarih]) VALUES (N'25463892787', N'Ahmet ', N'5316176842', N'103', N'Süt', N'1', CAST(15.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), N'21.04.2023 08:37:34')
INSERT [dbo].[Satis] ([Tc], [AdSoyad], [Telefon], [BarkodNo], [UrunAdi], [Miktari], [SatisFiyati], [ToplamFiyat], [Tarih]) VALUES (N'25463892787', N'Ahmet ', N'5316176842', N'102', N'Karam', N'50', CAST(6.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), N'27.04.2023 13:15:33')
INSERT [dbo].[Satis] ([Tc], [AdSoyad], [Telefon], [BarkodNo], [UrunAdi], [Miktari], [SatisFiyati], [ToplamFiyat], [Tarih]) VALUES (N'25463892787', N'Ahmet ', N'5316176842', N'102', N'Karam', N'100', CAST(6.00 AS Decimal(18, 2)), CAST(600.00 AS Decimal(18, 2)), N'27.04.2023 13:16:34')
INSERT [dbo].[Satis] ([Tc], [AdSoyad], [Telefon], [BarkodNo], [UrunAdi], [Miktari], [SatisFiyati], [ToplamFiyat], [Tarih]) VALUES (N'25463892787', N'Ahmet ', N'5316176842', N'102', N'Karam', N'50', CAST(6.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), N'27.04.2023 13:17:02')
INSERT [dbo].[Satis] ([Tc], [AdSoyad], [Telefon], [BarkodNo], [UrunAdi], [Miktari], [SatisFiyati], [ToplamFiyat], [Tarih]) VALUES (N'', N'', N'', N'100', N'Çikolatalı Gofret', N'5', CAST(7.00 AS Decimal(18, 2)), CAST(35.00 AS Decimal(18, 2)), N'27.04.2023 13:19:02')
INSERT [dbo].[Satis] ([Tc], [AdSoyad], [Telefon], [BarkodNo], [UrunAdi], [Miktari], [SatisFiyati], [ToplamFiyat], [Tarih]) VALUES (N'', N'', N'', N'100', N'Çikolatalı Gofret', N'8', CAST(7.00 AS Decimal(18, 2)), CAST(56.00 AS Decimal(18, 2)), N'27.04.2023 13:19:52')
GO
INSERT [dbo].[Urun] ([BarkodNo], [Kategori], [Marka], [UrunAdi], [Miktari], [AlisFiyati], [SatisFiyati], [Tarih]) VALUES (N'100', N'Gıda', N'Ülker', N'Çikolatalı Gofret', 205, CAST(4.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), N'11.04.2023 07:51:26')
INSERT [dbo].[Urun] ([BarkodNo], [Kategori], [Marka], [UrunAdi], [Miktari], [AlisFiyati], [SatisFiyati], [Tarih]) VALUES (N'101', N'Kuruyemiş', N'Tadım', N'Çekirdek', 74, CAST(10.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), N'11.04.2023 07:56:31')
INSERT [dbo].[Urun] ([BarkodNo], [Kategori], [Marka], [UrunAdi], [Miktari], [AlisFiyati], [SatisFiyati], [Tarih]) VALUES (N'103', N'Gıda', N'Pınar', N'Süt', 44, CAST(10.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), N'8.04.2023 12:15:19')
INSERT [dbo].[Urun] ([BarkodNo], [Kategori], [Marka], [UrunAdi], [Miktari], [AlisFiyati], [SatisFiyati], [Tarih]) VALUES (N'102', N'Gıda', N'Eti', N'Karam', 500, CAST(5.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), N'13.04.2023 08:00:51')
INSERT [dbo].[Urun] ([BarkodNo], [Kategori], [Marka], [UrunAdi], [Miktari], [AlisFiyati], [SatisFiyati], [Tarih]) VALUES (N'104', N'Gıda', N'Çoşkun', N'Kangal Sucuk', 10, CAST(100.00 AS Decimal(18, 2)), CAST(150.00 AS Decimal(18, 2)), N'20.04.2023 19:36:59')
GO
/****** Object:  DdlTrigger [OnTriggerDboSchema]    Script Date: 27.04.2023 13:54:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE trigger [OnTriggerDboSchema] ON database FOR create_table, create_view AS BEGIN   DECLARE @xmlEventData xml   SELECT    @xmlEventData = eventdata()   DECLARE @schemaName nvarchar(max)   DECLARE @objectName nvarchar(max)   DECLARE @DynSql nvarchar(max)      SET @schemaName    = convert(nvarchar(max), @xmlEventData.query('/EVENT_INSTANCE/SchemaName/text()'))   SET @objectName    = convert(nvarchar(max), @xmlEventData.query('/EVENT_INSTANCE/ObjectName/text()'))   IF(@schemaName='')   BEGIN     SET @DynSql = N'alter schema [dbo] transfer [' + @schemaName + N'].[' + @objectName + N']'     EXEC sp_executesql @statement=@DynSql   END END SET QUOTED_IDENTIFIER ON SET ANSI_NULLS ON 
GO
ENABLE TRIGGER [OnTriggerDboSchema] ON DATABASE
GO
USE [master]
GO
ALTER DATABASE [Stok_Takip] SET  READ_WRITE 
GO
