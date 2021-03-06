USE [master]
GO
/****** Object:  Database [pokedex]    Script Date: 9/20/2020 5:37:18 PM ******/
CREATE DATABASE [pokedex]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'pokedex', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\pokedex.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'pokedex_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\pokedex_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [pokedex] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [pokedex].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [pokedex] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [pokedex] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [pokedex] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [pokedex] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [pokedex] SET ARITHABORT OFF 
GO
ALTER DATABASE [pokedex] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [pokedex] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [pokedex] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [pokedex] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [pokedex] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [pokedex] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [pokedex] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [pokedex] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [pokedex] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [pokedex] SET  ENABLE_BROKER 
GO
ALTER DATABASE [pokedex] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [pokedex] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [pokedex] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [pokedex] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [pokedex] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [pokedex] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [pokedex] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [pokedex] SET RECOVERY FULL 
GO
ALTER DATABASE [pokedex] SET  MULTI_USER 
GO
ALTER DATABASE [pokedex] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [pokedex] SET DB_CHAINING OFF 
GO
ALTER DATABASE [pokedex] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [pokedex] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [pokedex] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'pokedex', N'ON'
GO
ALTER DATABASE [pokedex] SET QUERY_STORE = OFF
GO
USE [pokedex]
GO
/****** Object:  Table [dbo].[pokemones]    Script Date: 9/20/2020 5:37:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pokemones](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[foto] [varchar](max) NULL,
	[tipo1] [int] NULL,
	[tipo2] [int] NULL,
	[region] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[regiones]    Script Date: 9/20/2020 5:37:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[regiones](
	[id_region] [int] IDENTITY(1,1) NOT NULL,
	[region] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_region] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_pokemon]    Script Date: 9/20/2020 5:37:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_pokemon](
	[id_tipo] [int] IDENTITY(1,1) NOT NULL,
	[tipo] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_tipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[pokemones] ON 

INSERT [dbo].[pokemones] ([id], [nombre], [foto], [tipo1], [tipo2], [region]) VALUES (3, N'hermanarata', N'imagenes\pokemon\3\pokemon-pikachu-wall-decal.jpg', 2, 1, 1)
INSERT [dbo].[pokemones] ([id], [nombre], [foto], [tipo1], [tipo2], [region]) VALUES (4, N'perico', N'imagenes\pokemon\4\2020-04-05.png', 1, 1, 1)
SET IDENTITY_INSERT [dbo].[pokemones] OFF
SET IDENTITY_INSERT [dbo].[regiones] ON 

INSERT [dbo].[regiones] ([id_region], [region]) VALUES (1, N'kanto')
INSERT [dbo].[regiones] ([id_region], [region]) VALUES (2, N'Jotoh')
SET IDENTITY_INSERT [dbo].[regiones] OFF
SET IDENTITY_INSERT [dbo].[tipo_pokemon] ON 

INSERT [dbo].[tipo_pokemon] ([id_tipo], [tipo]) VALUES (1, N'N/A')
INSERT [dbo].[tipo_pokemon] ([id_tipo], [tipo]) VALUES (2, N'Electrico')
SET IDENTITY_INSERT [dbo].[tipo_pokemon] OFF
ALTER TABLE [dbo].[pokemones]  WITH CHECK ADD  CONSTRAINT [FK_REGIONES] FOREIGN KEY([region])
REFERENCES [dbo].[regiones] ([id_region])
GO
ALTER TABLE [dbo].[pokemones] CHECK CONSTRAINT [FK_REGIONES]
GO
ALTER TABLE [dbo].[pokemones]  WITH CHECK ADD  CONSTRAINT [FK_TIPO1] FOREIGN KEY([tipo1])
REFERENCES [dbo].[tipo_pokemon] ([id_tipo])
GO
ALTER TABLE [dbo].[pokemones] CHECK CONSTRAINT [FK_TIPO1]
GO
ALTER TABLE [dbo].[pokemones]  WITH CHECK ADD  CONSTRAINT [FK_TIPO2] FOREIGN KEY([tipo2])
REFERENCES [dbo].[tipo_pokemon] ([id_tipo])
GO
ALTER TABLE [dbo].[pokemones] CHECK CONSTRAINT [FK_TIPO2]
GO
/****** Object:  StoredProcedure [dbo].[ST_getpokemones]    Script Date: 9/20/2020 5:37:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ST_getpokemones]

AS
BEGIN 
select p.nombre, tp.tipo,tp2.tipo,r.region from pokemones p inner join tipo_pokemon tp ON p.tipo1 = tp.id_tipo INNER JOIN 
regiones r ON p.region = r.id_region INNER JOIN tipo_pokemon tp2 ON p.tipo2 = tp2.id_tipo

END
GO
USE [master]
GO
ALTER DATABASE [pokedex] SET  READ_WRITE 
GO
