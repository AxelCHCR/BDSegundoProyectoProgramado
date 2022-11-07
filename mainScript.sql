USE [master]
GO
/****** Object:  Database [Municipalidad]    Script Date: 7/11/2022 14:57:32 ******/
CREATE DATABASE [Municipalidad]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Municipalidad', FILENAME = N'D:\MSSQLMS\MSSQL15.MSSQLSERVER\MSSQL\DATA\Municipalidad.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Municipalidad_log', FILENAME = N'D:\MSSQLMS\MSSQL15.MSSQLSERVER\MSSQL\DATA\Municipalidad_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Municipalidad] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Municipalidad].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Municipalidad] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Municipalidad] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Municipalidad] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Municipalidad] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Municipalidad] SET ARITHABORT OFF 
GO
ALTER DATABASE [Municipalidad] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Municipalidad] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Municipalidad] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Municipalidad] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Municipalidad] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Municipalidad] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Municipalidad] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Municipalidad] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Municipalidad] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Municipalidad] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Municipalidad] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Municipalidad] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Municipalidad] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Municipalidad] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Municipalidad] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Municipalidad] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Municipalidad] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Municipalidad] SET RECOVERY FULL 
GO
ALTER DATABASE [Municipalidad] SET  MULTI_USER 
GO
ALTER DATABASE [Municipalidad] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Municipalidad] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Municipalidad] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Municipalidad] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Municipalidad] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Municipalidad] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Municipalidad', N'ON'
GO
ALTER DATABASE [Municipalidad] SET QUERY_STORE = OFF
GO
USE [Municipalidad]
GO
/****** Object:  Table [dbo].[CambiosEntidades]    Script Date: 7/11/2022 14:57:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CambiosEntidades](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdEntityType] [int] NOT NULL,
	[EntityId] [int] NULL,
	[jsonAntes] [varchar](500) NULL,
	[jsonDespues] [varchar](500) NULL,
	[insertedAt] [datetime] NOT NULL,
	[insertedBy] [varchar](20) NOT NULL,
	[insertedIn] [varchar](20) NOT NULL,
 CONSTRAINT [PK_CambiosEntidades] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConceptoCobro]    Script Date: 7/11/2022 14:57:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConceptoCobro](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](128) NOT NULL,
	[IdTipoMontoCC] [int] NOT NULL,
	[IdPeriodoMontoCC] [int] NOT NULL,
	[ValorMinimo] [money] NULL,
	[ValorMinimoM3] [money] NULL,
	[Valorm3] [money] NULL,
	[ValorPorcentual] [money] NULL,
	[ValorFijo] [money] NULL,
	[ValorM2Minimo] [money] NULL,
	[ValorTractosM2] [money] NULL,
	[ValorFijoM3Adicional] [money] NULL,
 CONSTRAINT [PK_ConceptoCobro] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DBErrors]    Script Date: 7/11/2022 14:57:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DBErrors](
	[errorID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](100) NULL,
	[ErrorNumber] [int] NULL,
	[ErrorState] [int] NULL,
	[ErrorSeverity] [int] NULL,
	[ErrorLine] [int] NULL,
	[ErrorProcedure] [varchar](max) NULL,
	[ErrorMessage] [varchar](max) NULL,
	[ErrorDateTime] [datetime] NULL,
 CONSTRAINT [PK_dbo.DBErrors] PRIMARY KEY CLUSTERED 
(
	[errorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleCC]    Script Date: 7/11/2022 14:57:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleCC](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Monto] [money] NOT NULL,
	[IdConceptoCobro] [int] NOT NULL,
	[IdFactura] [int] NOT NULL,
 CONSTRAINT [PK_DetalleCC] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleCCAgua]    Script Date: 7/11/2022 14:57:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleCCAgua](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Monto] [money] NOT NULL,
	[IdMovimientoConsumo] [int] NOT NULL,
	[IdDetalleCC] [int] NOT NULL,
 CONSTRAINT [PK_DetalleCCAgua] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EntityType]    Script Date: 7/11/2022 14:57:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EntityType](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](32) NOT NULL,
 CONSTRAINT [PK_EntityType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 7/11/2022 14:57:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [date] NOT NULL,
	[FechaVencimiento] [date] NOT NULL,
	[TotalOriginal] [float] NOT NULL,
	[TotalPagar] [float] NOT NULL,
	[Estado] [int] NOT NULL,
	[IdPropiedad] [int] NOT NULL,
 CONSTRAINT [PK_Factura] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovimientoConsumo]    Script Date: 7/11/2022 14:57:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovimientoConsumo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [date] NOT NULL,
	[Monto] [money] NOT NULL,
	[IdTipoMovimiento] [int] NULL,
	[IdPropiedadCCAgua] [int] NULL,
 CONSTRAINT [PK_MovimientoConsumo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PeriodoMontoCC]    Script Date: 7/11/2022 14:57:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PeriodoMontoCC](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](128) NOT NULL,
	[QMeses] [int] NOT NULL,
 CONSTRAINT [PK_PeriodoMontoCC] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 7/11/2022 14:57:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](128) NOT NULL,
	[ValorDocId] [bigint] NOT NULL,
	[IdTipoDoc] [int] NOT NULL,
	[email] [varchar](128) NOT NULL,
	[telefono1] [bigint] NOT NULL,
	[telefono2] [bigint] NOT NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_Persona] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Propiedad]    Script Date: 7/11/2022 14:57:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Propiedad](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Area] [float] NOT NULL,
	[ValorFiscal] [varchar](128) NOT NULL,
	[FechaRegistro] [date] NOT NULL,
	[IdTipoTerreno] [int] NOT NULL,
	[IdTipoZona] [int] NOT NULL,
	[NumeroFinca] [int] NULL,
 CONSTRAINT [PK_Propiedad] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PropiedadCCAgua]    Script Date: 7/11/2022 14:57:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropiedadCCAgua](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NumeroMedidor] [varchar](128) NOT NULL,
	[SaldoAcumulado] [money] NOT NULL,
 CONSTRAINT [PK_PropiedadCCAgua] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PropiedadXCC]    Script Date: 7/11/2022 14:57:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropiedadXCC](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdPropiedad] [int] NULL,
	[IdConceptoCobro] [int] NULL,
	[FechaInicio] [date] NOT NULL,
	[FechaFin] [date] NULL,
 CONSTRAINT [PK_PropiedadXCC] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PXP]    Script Date: 7/11/2022 14:57:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PXP](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdPersona] [int] NOT NULL,
	[IdPropiedad] [int] NOT NULL,
	[FechaInicio] [date] NULL,
	[FechaFin] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PXU]    Script Date: 7/11/2022 14:57:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PXU](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[IdPropiedad] [int] NOT NULL,
	[FechaInicio] [date] NOT NULL,
	[FechaFin] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoDocIdent]    Script Date: 7/11/2022 14:57:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoDocIdent](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](128) NOT NULL,
	[Mascara] [varchar](128) NOT NULL,
 CONSTRAINT [PK_TipoDocIdent] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoMontoCC]    Script Date: 7/11/2022 14:57:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoMontoCC](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](128) NOT NULL,
 CONSTRAINT [PK_TipoMontoCC] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoMovimientoConsumo]    Script Date: 7/11/2022 14:57:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoMovimientoConsumo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](128) NOT NULL,
 CONSTRAINT [PK_TipoMovimientoConsumo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoTerreno]    Script Date: 7/11/2022 14:57:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoTerreno](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](128) NOT NULL,
 CONSTRAINT [PK_TipoTerreno] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoZona]    Script Date: 7/11/2022 14:57:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoZona](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](128) NOT NULL,
 CONSTRAINT [PK_TipoZona] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 7/11/2022 14:57:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](128) NOT NULL,
	[Password] [varchar](128) NOT NULL,
	[TipoUsuario] [varchar](128) NOT NULL,
	[IdPersona] [int] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CambiosEntidades] ON 

INSERT [dbo].[CambiosEntidades] ([Id], [IdEntityType], [EntityId], [jsonAntes], [jsonDespues], [insertedAt], [insertedBy], [insertedIn]) VALUES (1, 2, 2, N'[{"Nombre":"Axel","IdTipoDoc":1,"ValorDocId":118920438,"email":"hola@gmail.com","telefono1":27676605,"telefono2":83607311}]', N'[{"Nombre":"Javi","IdTipoDoc":1,"ValorDocId":118920438,"email":"adios@hotmail.com","telefono1":27676605,"telefono2":83607311}]', CAST(N'2022-11-02T23:39:00.347' AS DateTime), N'Axel', N'192.168.1.1')
INSERT [dbo].[CambiosEntidades] ([Id], [IdEntityType], [EntityId], [jsonAntes], [jsonDespues], [insertedAt], [insertedBy], [insertedIn]) VALUES (2, 3, 2, N'[{"UserName":"axel","Password":"aaaa","TipoUsuario":"Propietario"}]', N'[{"UserName":"javi","Password":"hermano","TipoUsuario":"Administrador"}]', CAST(N'2022-11-03T00:35:41.747' AS DateTime), N'Pablo', N'192.198.0.1')
INSERT [dbo].[CambiosEntidades] ([Id], [IdEntityType], [EntityId], [jsonAntes], [jsonDespues], [insertedAt], [insertedBy], [insertedIn]) VALUES (3, 3, 2, N'[{"Username":"javi","Password":"hermano","TipoUsuario":"Administrador","IdPersona":2}]', N'', CAST(N'2022-11-03T11:04:57.047' AS DateTime), N'Axel', N'191.26.123.1')
INSERT [dbo].[CambiosEntidades] ([Id], [IdEntityType], [EntityId], [jsonAntes], [jsonDespues], [insertedAt], [insertedBy], [insertedIn]) VALUES (4, 2, 2, N'[{"ID":2,"Nombre":"Javi","ValorDocId":118920438,"IdTipoDoc":1,"email":"adios@hotmail.com","telefono1":27676605,"telefono2":83607311,"activo":true}]', N'[{"ID":2,"Nombre":"Javi","ValorDocId":118920438,"IdTipoDoc":1,"email":"adios@hotmail.com","telefono1":27676605,"telefono2":83607311,"activo":false}]', CAST(N'2022-11-03T13:53:19.223' AS DateTime), N'Axel', N'192.168.12.22')
INSERT [dbo].[CambiosEntidades] ([Id], [IdEntityType], [EntityId], [jsonAntes], [jsonDespues], [insertedAt], [insertedBy], [insertedIn]) VALUES (5, 4, 18, NULL, N'[{"ID":18,"IdPersona":2,"IdPropiedad":5,"FechaInicio":"2022-05-11"}]', CAST(N'2022-05-11T00:00:00.000' AS DateTime), N'Axel', N'1.1.1.1')
INSERT [dbo].[CambiosEntidades] ([Id], [IdEntityType], [EntityId], [jsonAntes], [jsonDespues], [insertedAt], [insertedBy], [insertedIn]) VALUES (6, 4, 1, NULL, N'[{"ID":1,"IdUsuario":3,"IdPropiedad":5,"FechaInicio":"2022-05-11"}]', CAST(N'2022-11-05T15:53:40.887' AS DateTime), N'Javier', N'10.10.10.0')
INSERT [dbo].[CambiosEntidades] ([Id], [IdEntityType], [EntityId], [jsonAntes], [jsonDespues], [insertedAt], [insertedBy], [insertedIn]) VALUES (16, 4, 24, NULL, N'[{"ID":24,"IdPersona":3,"IdPropiedad":6,"FechaInicio":"2022-05-11"}]', CAST(N'2022-05-11T00:00:00.000' AS DateTime), N'Axel', N'1.1.1.1')
INSERT [dbo].[CambiosEntidades] ([Id], [IdEntityType], [EntityId], [jsonAntes], [jsonDespues], [insertedAt], [insertedBy], [insertedIn]) VALUES (20, 4, 27, NULL, N'[{"ID":27,"IdPersona":3,"IdPropiedad":6,"FechaInicio":"2022-05-11"}]', CAST(N'2022-05-11T00:00:00.000' AS DateTime), N'Axel', N'1.1.1.1')
INSERT [dbo].[CambiosEntidades] ([Id], [IdEntityType], [EntityId], [jsonAntes], [jsonDespues], [insertedAt], [insertedBy], [insertedIn]) VALUES (21, 4, 29, NULL, N'[{"ID":29,"IdPersona":3,"IdPropiedad":6,"FechaInicio":"2022-05-11"}]', CAST(N'2022-05-11T00:00:00.000' AS DateTime), N'Axel', N'1.1.1.1')
INSERT [dbo].[CambiosEntidades] ([Id], [IdEntityType], [EntityId], [jsonAntes], [jsonDespues], [insertedAt], [insertedBy], [insertedIn]) VALUES (22, 4, NULL, NULL, NULL, CAST(N'2022-11-05T18:50:05.163' AS DateTime), N'AxelChaves', N'01.01.02.02')
INSERT [dbo].[CambiosEntidades] ([Id], [IdEntityType], [EntityId], [jsonAntes], [jsonDespues], [insertedAt], [insertedBy], [insertedIn]) VALUES (23, 4, 30, NULL, N'[{"ID":30,"IdPersona":3,"IdPropiedad":6,"FechaInicio":"2022-05-11"}]', CAST(N'2022-05-11T00:00:00.000' AS DateTime), N'Axel', N'1.1.1.1')
INSERT [dbo].[CambiosEntidades] ([Id], [IdEntityType], [EntityId], [jsonAntes], [jsonDespues], [insertedAt], [insertedBy], [insertedIn]) VALUES (24, 4, 30, N'[{"ID":30,"IdPersona":3,"IdPropiedad":6,"FechaInicio":"2022-05-11"}]', N'[{"ID":30,"IdPersona":3,"IdPropiedad":6,"FechaInicio":"2022-05-11","FechaFin":"2022-05-11"}]', CAST(N'2022-11-05T19:00:36.020' AS DateTime), N'AxelChaves', N'01.01.02.02')
INSERT [dbo].[CambiosEntidades] ([Id], [IdEntityType], [EntityId], [jsonAntes], [jsonDespues], [insertedAt], [insertedBy], [insertedIn]) VALUES (25, 4, NULL, NULL, NULL, CAST(N'2022-11-05T19:22:51.710' AS DateTime), N'JavierVasquez', N'01.01.02.03')
INSERT [dbo].[CambiosEntidades] ([Id], [IdEntityType], [EntityId], [jsonAntes], [jsonDespues], [insertedAt], [insertedBy], [insertedIn]) VALUES (26, 4, 1, N'[{"ID":1,"IdUsuario":3,"IdPropiedad":5,"FechaInicio":"2022-05-11"}]', N'[{"ID":1,"IdUsuario":3,"IdPropiedad":5,"FechaInicio":"2022-05-11","FechaFin":"2022-05-11"}]', CAST(N'2022-11-05T19:24:05.957' AS DateTime), N'JavierVasquez', N'01.01.02.03')
INSERT [dbo].[CambiosEntidades] ([Id], [IdEntityType], [EntityId], [jsonAntes], [jsonDespues], [insertedAt], [insertedBy], [insertedIn]) VALUES (27, 1, 12, NULL, N'[{"ID":12,"Area":9.000000000000000e+001,"ValorFiscal":"18700","FechaRegistro":"2022-06-11","IdTipoTerreno":2,"IdTipoZona":5}]', CAST(N'2022-11-06T00:09:16.100' AS DateTime), N'Admin', N'192.168.1.1')
INSERT [dbo].[CambiosEntidades] ([Id], [IdEntityType], [EntityId], [jsonAntes], [jsonDespues], [insertedAt], [insertedBy], [insertedIn]) VALUES (28, 1, 12, N'[{"ID":12,"Area":9.000000000000000e+001,"ValorFiscal":"18700","FechaRegistro":"2022-06-11","IdTipoTerreno":2,"IdTipoZona":5,"NumeroFinca":5555}]', N'[{"ID":12,"Area":1.200000000000000e+003,"ValorFiscal":"18700","FechaRegistro":"2022-06-11","IdTipoTerreno":2,"IdTipoZona":5,"NumeroFinca":5555}]', CAST(N'2022-11-06T00:55:12.790' AS DateTime), N'Admin', N'192.168.1.1')
INSERT [dbo].[CambiosEntidades] ([Id], [IdEntityType], [EntityId], [jsonAntes], [jsonDespues], [insertedAt], [insertedBy], [insertedIn]) VALUES (29, 1, 12, N'[{"ID":12,"Area":1.200000000000000e+003,"ValorFiscal":"18700","FechaRegistro":"2022-06-11","IdTipoTerreno":2,"IdTipoZona":5,"NumeroFinca":5555}]', NULL, CAST(N'2022-11-06T01:06:10.690' AS DateTime), N'Admin', N'192.168.1.1')
SET IDENTITY_INSERT [dbo].[CambiosEntidades] OFF
GO
SET IDENTITY_INSERT [dbo].[ConceptoCobro] ON 

INSERT [dbo].[ConceptoCobro] ([ID], [Nombre], [IdTipoMontoCC], [IdPeriodoMontoCC], [ValorMinimo], [ValorMinimoM3], [Valorm3], [ValorPorcentual], [ValorFijo], [ValorM2Minimo], [ValorTractosM2], [ValorFijoM3Adicional]) VALUES (1, N'Patente Comercial', 1, 3, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000)
INSERT [dbo].[ConceptoCobro] ([ID], [Nombre], [IdTipoMontoCC], [IdPeriodoMontoCC], [ValorMinimo], [ValorMinimoM3], [Valorm3], [ValorPorcentual], [ValorFijo], [ValorM2Minimo], [ValorTractosM2], [ValorFijoM3Adicional]) VALUES (3, N'ConsumoAgua', 2, 1, 300.0000, 30.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 100.0000)
INSERT [dbo].[ConceptoCobro] ([ID], [Nombre], [IdTipoMontoCC], [IdPeriodoMontoCC], [ValorMinimo], [ValorMinimoM3], [Valorm3], [ValorPorcentual], [ValorFijo], [ValorM2Minimo], [ValorTractosM2], [ValorFijoM3Adicional]) VALUES (4, N'Impuesto a propiedad', 3, 4, 0.0000, 0.0000, 0.0000, 0.0100, 0.0000, 0.0000, 0.0000, 0.0000)
INSERT [dbo].[ConceptoCobro] ([ID], [Nombre], [IdTipoMontoCC], [IdPeriodoMontoCC], [ValorMinimo], [ValorMinimoM3], [Valorm3], [ValorPorcentual], [ValorFijo], [ValorM2Minimo], [ValorTractosM2], [ValorFijoM3Adicional]) VALUES (5, N'Recoleccion Basura', 2, 1, 150.0000, 0.0000, 0.0000, 0.0000, 300.0000, 400.0000, 200.0000, 0.0000)
INSERT [dbo].[ConceptoCobro] ([ID], [Nombre], [IdTipoMontoCC], [IdPeriodoMontoCC], [ValorMinimo], [ValorMinimoM3], [Valorm3], [ValorPorcentual], [ValorFijo], [ValorM2Minimo], [ValorTractosM2], [ValorFijoM3Adicional]) VALUES (6, N'Patente Comercial', 1, 3, 0.0000, 0.0000, 0.0000, 0.0000, 150000.0000, 0.0000, 0.0000, 0.0000)
INSERT [dbo].[ConceptoCobro] ([ID], [Nombre], [IdTipoMontoCC], [IdPeriodoMontoCC], [ValorMinimo], [ValorMinimoM3], [Valorm3], [ValorPorcentual], [ValorFijo], [ValorM2Minimo], [ValorTractosM2], [ValorFijoM3Adicional]) VALUES (7, N'Reconexion', 1, 1, 0.0000, 0.0000, 0.0000, 0.0000, 30000.0000, 0.0000, 0.0000, 0.0000)
INSERT [dbo].[ConceptoCobro] ([ID], [Nombre], [IdTipoMontoCC], [IdPeriodoMontoCC], [ValorMinimo], [ValorMinimoM3], [Valorm3], [ValorPorcentual], [ValorFijo], [ValorM2Minimo], [ValorTractosM2], [ValorFijoM3Adicional]) VALUES (8, N'Intereses Moratorios', 3, 1, 0.0000, 0.0000, 0.0000, 0.0200, 30000.0000, 0.0000, 0.0000, 0.0000)
INSERT [dbo].[ConceptoCobro] ([ID], [Nombre], [IdTipoMontoCC], [IdPeriodoMontoCC], [ValorMinimo], [ValorMinimoM3], [Valorm3], [ValorPorcentual], [ValorFijo], [ValorM2Minimo], [ValorTractosM2], [ValorFijoM3Adicional]) VALUES (9, N'MantenimientoParques', 1, 4, 0.0000, 0.0000, 0.0000, 0.0200, 2000.0000, 0.0000, 0.0000, 0.0000)
SET IDENTITY_INSERT [dbo].[ConceptoCobro] OFF
GO
SET IDENTITY_INSERT [dbo].[DBErrors] ON 

INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (1, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 17, N'dbo.insertUser', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Usuario_Persona". The conflict occurred in database "Municipalidad", table "dbo.Persona", column ''ID''.', CAST(N'2022-10-12T01:53:05.937' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (2, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 17, N'dbo.insertUser', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Usuario_Persona". The conflict occurred in database "Municipalidad", table "dbo.Persona", column ''ID''.', CAST(N'2022-10-12T01:53:37.190' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (3, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 17, N'dbo.insertUser', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Usuario_Persona". The conflict occurred in database "Municipalidad", table "dbo.Persona", column ''ID''.', CAST(N'2022-10-12T01:53:38.310' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (4, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 17, N'dbo.insertUser', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Usuario_Persona". The conflict occurred in database "Municipalidad", table "dbo.Persona", column ''ID''.', CAST(N'2022-10-12T01:56:46.367' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (5, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 17, N'dbo.insertUser', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Usuario_Persona". The conflict occurred in database "Municipalidad", table "dbo.Persona", column ''ID''.', CAST(N'2022-10-12T01:57:21.463' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (6, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 17, N'dbo.insertUser', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Usuario_Persona". The conflict occurred in database "Municipalidad", table "dbo.Persona", column ''ID''.', CAST(N'2022-10-12T01:57:22.043' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (7, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 17, N'dbo.insertUser', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Usuario_Persona". The conflict occurred in database "Municipalidad", table "dbo.Persona", column ''ID''.', CAST(N'2022-10-12T01:57:24.560' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (8, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 17, N'dbo.insertUser', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Usuario_Persona". The conflict occurred in database "Municipalidad", table "dbo.Persona", column ''ID''.', CAST(N'2022-10-12T01:57:25.277' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (9, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 17, N'dbo.insertUser', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Usuario_Persona". The conflict occurred in database "Municipalidad", table "dbo.Persona", column ''ID''.', CAST(N'2022-10-12T01:58:58.753' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (10, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T21:43:32.870' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (11, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T21:43:35.903' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (12, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T21:43:53.957' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (13, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T21:43:55.020' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (14, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T21:43:59.430' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (15, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T21:44:21.777' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (16, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T21:44:22.627' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (17, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T21:44:23.070' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (18, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T21:44:23.303' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (19, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T21:44:23.530' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (20, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T21:44:23.700' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (21, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T21:44:23.927' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (22, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T21:44:24.123' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (23, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T21:44:24.340' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (24, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T21:44:49.890' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (25, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T21:45:06.617' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (26, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T21:45:49.720' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (27, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T21:53:37.820' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (28, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T21:53:38.590' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (29, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T21:57:01.673' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (30, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T22:01:14.010' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (31, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T22:02:10.787' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (32, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T22:02:42.367' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (33, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 19, N'dbo.insertProperty', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Propiedad_Usuario". The conflict occurred in database "Municipalidad", table "dbo.Usuario", column ''ID''.', CAST(N'2022-10-15T22:02:43.110' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (34, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:06:57.600' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (35, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:13:44.573' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (36, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:20:08.120' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (37, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:21:55.143' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (38, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:22:13.863' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (39, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:07.393' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (40, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.927' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (41, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.933' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (42, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.933' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (43, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.933' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (44, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.933' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (45, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.933' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (46, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.937' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (47, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.937' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (48, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.937' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (49, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.937' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (50, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.937' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (51, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.937' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (52, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.937' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (53, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.937' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (54, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.937' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (55, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.940' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (56, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.940' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (57, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.940' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (58, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.940' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (59, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.940' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (60, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.940' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (61, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.940' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (62, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.940' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (63, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.943' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (64, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.943' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (65, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.943' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (66, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.947' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (67, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.947' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (68, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.947' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (69, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.947' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (70, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.947' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (71, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:23:59.947' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (72, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.480' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (73, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.483' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (74, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.487' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (75, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.487' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (76, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.487' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (77, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.487' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (78, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.487' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (79, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.487' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (80, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.490' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (81, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.490' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (82, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.490' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (83, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.490' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (84, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.490' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (85, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.490' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (86, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.490' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (87, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.493' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (88, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.493' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (89, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.493' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (90, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.493' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (91, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.493' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (92, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.493' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (93, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.497' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (94, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.497' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (95, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.497' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (96, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.497' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (97, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.497' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (98, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.497' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (99, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.500' AS DateTime))
GO
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (100, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.500' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (101, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.500' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (102, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.500' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (103, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:31.500' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (104, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.670' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (105, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.677' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (106, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.677' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (107, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.677' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (108, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.677' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (109, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.680' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (110, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.680' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (111, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.680' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (112, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.680' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (113, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.680' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (114, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.680' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (115, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.680' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (116, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.683' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (117, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.683' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (118, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.683' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (119, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.683' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (120, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.683' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (121, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.687' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (122, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.687' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (123, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.687' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (124, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.687' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (125, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.687' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (126, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.690' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (127, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.690' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (128, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.690' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (129, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.690' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (130, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.690' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (131, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.690' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (132, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.690' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (133, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.690' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (134, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.690' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (135, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:52.690' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (136, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.203' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (137, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.210' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (138, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.210' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (139, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.210' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (140, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.210' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (141, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.210' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (142, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.210' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (143, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.210' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (144, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.210' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (145, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.210' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (146, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.210' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (147, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.213' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (148, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.213' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (149, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.213' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (150, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.213' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (151, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.213' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (152, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.213' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (153, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.217' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (154, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.217' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (155, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.217' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (156, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.217' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (157, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.217' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (158, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.217' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (159, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.217' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (160, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.220' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (161, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.220' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (162, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.220' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (163, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.220' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (164, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.220' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (165, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.220' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (166, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.220' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (167, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-16T22:24:55.223' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (168, N'LAPTOP-9BCLTGCP\javie', 515, 2, 16, 18, N'dbo.insertUser', N'Cannot insert the value NULL into column ''IdPersona'', table ''Municipalidad.dbo.Usuario''; column does not allow nulls. INSERT fails.', CAST(N'2022-10-16T23:47:29.157' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (169, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 10, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-25T21:50:01.320' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (170, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 10, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-25T21:50:04.467' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (171, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 10, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-25T22:18:43.460' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (172, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.usuariosPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-25T22:19:48.667' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (173, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.usuariosPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-25T22:29:26.593' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (174, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 10, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-25T22:29:35.303' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (175, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.usuariosPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-25T22:29:37.173' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (176, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 10, N'dbo.propietarioPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-25T22:31:36.123' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (177, N'LAPTOP-9BCLTGCP\javie', 512, 1, 16, 11, N'dbo.usuariosPropiedad', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-10-25T22:31:37.527' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (178, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:22.177' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (179, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:38.667' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (180, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:38.793' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (181, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:38.917' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (182, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:39.040' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (183, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:39.163' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (184, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:39.303' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (185, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:39.450' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (186, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:39.583' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (187, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:39.713' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (188, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:39.860' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (189, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:40.000' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (190, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:40.143' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (191, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:40.270' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (192, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:40.393' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (193, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:40.533' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (194, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:40.663' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (195, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:40.793' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (196, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:40.920' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (197, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:41.043' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (198, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:41.163' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (199, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:41.290' AS DateTime))
GO
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (200, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:41.417' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (201, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:41.533' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (202, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:41.673' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (203, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:41.810' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (204, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:41.940' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (205, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:42.073' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (206, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:42.220' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (207, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:42.367' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (208, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:42.503' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (209, N'LAPTOP-9BCLTGCP\javie', 547, 0, 16, 22, N'dbo.InsertXMLIterative', N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovimientoConsumo_PropiedadCCAgua". The conflict occurred in database "Municipalidad", table "dbo.MovimientoConsumo", column ''IdPropiedadCCAgua''.', CAST(N'2022-11-01T19:47:42.633' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (211, N'LAPTOP-VQ0P2BE3\axelc', 515, 2, 16, 18, N'dbo.asociarPXP', N'Cannot insert the value NULL into column ''IdPersona'', table ''Municipalidad.dbo.PXP''; column does not allow nulls. INSERT fails.', CAST(N'2022-11-05T15:22:26.617' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (213, N'LAPTOP-VQ0P2BE3\axelc', 515, 2, 16, 17, N'dbo.asociarPXP', N'Cannot insert the value NULL into column ''IdPersona'', table ''Municipalidad.dbo.PXP''; column does not allow nulls. INSERT fails.', CAST(N'2022-11-05T15:24:19.290' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (215, N'LAPTOP-VQ0P2BE3\axelc', 515, 2, 16, 17, N'dbo.asociarPXP', N'Cannot insert the value NULL into column ''IdPersona'', table ''Municipalidad.dbo.PXP''; column does not allow nulls. INSERT fails.', CAST(N'2022-11-05T15:24:53.467' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (217, N'LAPTOP-VQ0P2BE3\axelc', 515, 2, 16, 17, N'dbo.asociarPXP', N'Cannot insert the value NULL into column ''IdPersona'', table ''Municipalidad.dbo.PXP''; column does not allow nulls. INSERT fails.', CAST(N'2022-11-05T15:24:57.163' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (219, N'LAPTOP-VQ0P2BE3\axelc', 515, 2, 16, 17, N'dbo.asociarPXP', N'Cannot insert the value NULL into column ''IdPersona'', table ''Municipalidad.dbo.PXP''; column does not allow nulls. INSERT fails.', CAST(N'2022-11-05T15:24:58.050' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (221, N'LAPTOP-VQ0P2BE3\axelc', 515, 2, 16, 18, N'dbo.asociarPXP', N'Cannot insert the value NULL into column ''IdPersona'', table ''Municipalidad.dbo.PXP''; column does not allow nulls. INSERT fails.', CAST(N'2022-11-05T15:26:57.507' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (223, N'LAPTOP-VQ0P2BE3\axelc', 515, 2, 16, 18, N'dbo.asociarPXP', N'Cannot insert the value NULL into column ''IdPersona'', table ''Municipalidad.dbo.PXP''; column does not allow nulls. INSERT fails.', CAST(N'2022-11-05T15:27:14.770' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (224, N'LAPTOP-VQ0P2BE3\axelc', 515, 2, 16, 18, N'dbo.asociarPXP', N'Cannot insert the value NULL into column ''IdPersona'', table ''Municipalidad.dbo.PXP''; column does not allow nulls. INSERT fails.', CAST(N'2022-11-05T15:27:37.430' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (225, N'LAPTOP-VQ0P2BE3\axelc', 515, 2, 16, 18, N'dbo.asociarPXP', N'Cannot insert the value NULL into column ''IdPersona'', table ''Municipalidad.dbo.PXP''; column does not allow nulls. INSERT fails.', CAST(N'2022-11-05T15:27:50.177' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (226, N'LAPTOP-VQ0P2BE3\axelc', 515, 2, 16, 18, N'dbo.asociarPXP', N'Cannot insert the value NULL into column ''IdPersona'', table ''Municipalidad.dbo.PXP''; column does not allow nulls. INSERT fails.', CAST(N'2022-11-05T15:29:02.247' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (227, N'LAPTOP-VQ0P2BE3\axelc', 512, 1, 16, 32, N'dbo.asociarPXU', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-11-05T15:55:16.190' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (229, N'LAPTOP-VQ0P2BE3\axelc', 515, 2, 16, 23, N'dbo.desasociarPXP', N'Cannot insert the value NULL into column ''insertedIn'', table ''Municipalidad.dbo.CambiosEntidades''; column does not allow nulls. INSERT fails.', CAST(N'2022-11-05T16:08:54.430' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (230, N'LAPTOP-VQ0P2BE3\axelc', 515, 2, 16, 23, N'dbo.desasociarPXP', N'Cannot insert the value NULL into column ''insertedIn'', table ''Municipalidad.dbo.CambiosEntidades''; column does not allow nulls. INSERT fails.', CAST(N'2022-11-05T16:09:19.667' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (231, N'LAPTOP-VQ0P2BE3\axelc', 512, 1, 16, 31, N'dbo.asociarPXP', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-11-05T16:10:45.823' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (233, N'LAPTOP-VQ0P2BE3\axelc', 515, 2, 16, 23, N'dbo.desasociarPXP', N'Cannot insert the value NULL into column ''IdEntityType'', table ''Municipalidad.dbo.CambiosEntidades''; column does not allow nulls. INSERT fails.', CAST(N'2022-11-05T16:17:24.717' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (235, N'LAPTOP-VQ0P2BE3\axelc', 515, 2, 16, 23, N'dbo.desasociarPXP', N'Cannot insert the value NULL into column ''IdEntityType'', table ''Municipalidad.dbo.CambiosEntidades''; column does not allow nulls. INSERT fails.', CAST(N'2022-11-05T16:20:37.463' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (237, N'LAPTOP-VQ0P2BE3\axelc', 515, 2, 16, 23, N'dbo.desasociarPXP', N'Cannot insert the value NULL into column ''IdEntityType'', table ''Municipalidad.dbo.CambiosEntidades''; column does not allow nulls. INSERT fails.', CAST(N'2022-11-05T16:22:19.973' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (239, N'LAPTOP-VQ0P2BE3\axelc', 515, 2, 16, 17, N'dbo.asociarPXP', N'Cannot insert the value NULL into column ''IdPersona'', table ''Municipalidad.dbo.PXP''; column does not allow nulls. INSERT fails.', CAST(N'2022-11-05T16:40:22.080' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (241, N'LAPTOP-VQ0P2BE3\axelc', 515, 2, 16, 17, N'dbo.asociarPXP', N'Cannot insert the value NULL into column ''IdPersona'', table ''Municipalidad.dbo.PXP''; column does not allow nulls. INSERT fails.', CAST(N'2022-11-05T16:43:32.780' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (242, N'LAPTOP-VQ0P2BE3\axelc', 512, 1, 16, 34, N'dbo.asociarPXP', N'Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.', CAST(N'2022-11-05T18:47:33.603' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (244, N'LAPTOP-VQ0P2BE3\axelc', 515, 2, 16, 24, N'dbo.desasociarPXP', N'Cannot insert the value NULL into column ''EntityId'', table ''Municipalidad.dbo.CambiosEntidades''; column does not allow nulls. INSERT fails.', CAST(N'2022-11-05T18:47:57.290' AS DateTime))
INSERT [dbo].[DBErrors] ([errorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (246, N'LAPTOP-VQ0P2BE3\axelc', 515, 2, 16, 25, N'dbo.desasociarPXP', N'Cannot insert the value NULL into column ''EntityId'', table ''Municipalidad.dbo.CambiosEntidades''; column does not allow nulls. INSERT fails.', CAST(N'2022-11-05T18:48:56.360' AS DateTime))
SET IDENTITY_INSERT [dbo].[DBErrors] OFF
GO
INSERT [dbo].[EntityType] ([Id], [Nombre]) VALUES (1, N'Propiedad')
INSERT [dbo].[EntityType] ([Id], [Nombre]) VALUES (2, N'Propietario')
INSERT [dbo].[EntityType] ([Id], [Nombre]) VALUES (3, N'User')
INSERT [dbo].[EntityType] ([Id], [Nombre]) VALUES (4, N'Propiedad vs Propietario')
INSERT [dbo].[EntityType] ([Id], [Nombre]) VALUES (5, N'Propiedad vs Usuario')
INSERT [dbo].[EntityType] ([Id], [Nombre]) VALUES (6, N'PropietarioJuridico')
INSERT [dbo].[EntityType] ([Id], [Nombre]) VALUES (7, N'Concepto de Cobro')
GO
SET IDENTITY_INSERT [dbo].[Factura] ON 

INSERT [dbo].[Factura] ([ID], [Fecha], [FechaVencimiento], [TotalOriginal], [TotalPagar], [Estado], [IdPropiedad]) VALUES (2, CAST(N'2022-07-11' AS Date), CAST(N'2022-11-11' AS Date), 1000, 5000, 2, 9)
SET IDENTITY_INSERT [dbo].[Factura] OFF
GO
SET IDENTITY_INSERT [dbo].[PeriodoMontoCC] ON 

INSERT [dbo].[PeriodoMontoCC] ([ID], [Nombre], [QMeses]) VALUES (1, N'Mensual', 1)
INSERT [dbo].[PeriodoMontoCC] ([ID], [Nombre], [QMeses]) VALUES (2, N'Trimestral', 3)
INSERT [dbo].[PeriodoMontoCC] ([ID], [Nombre], [QMeses]) VALUES (3, N'Semestral', 6)
INSERT [dbo].[PeriodoMontoCC] ([ID], [Nombre], [QMeses]) VALUES (4, N'Anual', 12)
INSERT [dbo].[PeriodoMontoCC] ([ID], [Nombre], [QMeses]) VALUES (5, N'Cobro único', 1)
SET IDENTITY_INSERT [dbo].[PeriodoMontoCC] OFF
GO
SET IDENTITY_INSERT [dbo].[Persona] ON 

INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2], [activo]) VALUES (2, N'Javi', 118920438, 1, N'adios@hotmail.com', 27676605, 83607311, 0)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2], [activo]) VALUES (3, N'Alexander', 22, 1, N'alex@gmail.com', 27676601, 12345678, 1)
SET IDENTITY_INSERT [dbo].[Persona] OFF
GO
SET IDENTITY_INSERT [dbo].[Propiedad] ON 

INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (5, 10, N'10000', CAST(N'2022-02-11' AS Date), 2, 5, 5432)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (6, 15.2, N'9000', CAST(N'2022-05-11' AS Date), 2, 5, 1234)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (7, 1000, N'56000', CAST(N'2022-06-11' AS Date), 2, 5, 9090)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (9, 24, N'54000', CAST(N'2022-06-11' AS Date), 2, 5, 8080)
SET IDENTITY_INSERT [dbo].[Propiedad] OFF
GO
SET IDENTITY_INSERT [dbo].[PropiedadXCC] ON 

INSERT [dbo].[PropiedadXCC] ([ID], [IdPropiedad], [IdConceptoCobro], [FechaInicio], [FechaFin]) VALUES (1, 5, 1, CAST(N'2022-02-11' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[PropiedadXCC] OFF
GO
SET IDENTITY_INSERT [dbo].[PXP] ON 

INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (30, 3, 6, CAST(N'2022-05-11' AS Date), CAST(N'2022-05-11' AS Date))
SET IDENTITY_INSERT [dbo].[PXP] OFF
GO
SET IDENTITY_INSERT [dbo].[PXU] ON 

INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (1, 3, 5, CAST(N'2022-05-11' AS Date), CAST(N'2022-05-11' AS Date))
SET IDENTITY_INSERT [dbo].[PXU] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoDocIdent] ON 

INSERT [dbo].[TipoDocIdent] ([ID], [Nombre], [Mascara]) VALUES (1, N'Cedula CR', N'X-XXXX-XXXX')
INSERT [dbo].[TipoDocIdent] ([ID], [Nombre], [Mascara]) VALUES (2, N'Persona Jurídica CR', N'X-XXX-XXXXXX')
INSERT [dbo].[TipoDocIdent] ([ID], [Nombre], [Mascara]) VALUES (3, N' Pasaporte CR', N'X-XXXX-XXXX')
SET IDENTITY_INSERT [dbo].[TipoDocIdent] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoMontoCC] ON 

INSERT [dbo].[TipoMontoCC] ([ID], [Nombre]) VALUES (1, N'Monto Fijo')
INSERT [dbo].[TipoMontoCC] ([ID], [Nombre]) VALUES (2, N'Monto Variable')
INSERT [dbo].[TipoMontoCC] ([ID], [Nombre]) VALUES (3, N'MontoXPorcentaje')
SET IDENTITY_INSERT [dbo].[TipoMontoCC] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoMovimientoConsumo] ON 

INSERT [dbo].[TipoMovimientoConsumo] ([ID], [Nombre]) VALUES (1, N'Lectura')
INSERT [dbo].[TipoMovimientoConsumo] ([ID], [Nombre]) VALUES (2, N'Ajuste Credito')
INSERT [dbo].[TipoMovimientoConsumo] ([ID], [Nombre]) VALUES (3, N'Ajuste Debito')
SET IDENTITY_INSERT [dbo].[TipoMovimientoConsumo] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoTerreno] ON 

INSERT [dbo].[TipoTerreno] ([ID], [Nombre]) VALUES (1, N'Habitacion')
INSERT [dbo].[TipoTerreno] ([ID], [Nombre]) VALUES (2, N'Comercial')
INSERT [dbo].[TipoTerreno] ([ID], [Nombre]) VALUES (3, N'Industrial')
INSERT [dbo].[TipoTerreno] ([ID], [Nombre]) VALUES (4, N'Lote baldio')
INSERT [dbo].[TipoTerreno] ([ID], [Nombre]) VALUES (5, N'Agricola')
SET IDENTITY_INSERT [dbo].[TipoTerreno] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoZona] ON 

INSERT [dbo].[TipoZona] ([ID], [Nombre]) VALUES (1, N'Residencial')
INSERT [dbo].[TipoZona] ([ID], [Nombre]) VALUES (2, N'Agricola')
INSERT [dbo].[TipoZona] ([ID], [Nombre]) VALUES (3, N'Bosque')
INSERT [dbo].[TipoZona] ([ID], [Nombre]) VALUES (4, N'Zona industrial')
INSERT [dbo].[TipoZona] ([ID], [Nombre]) VALUES (5, N'Zona comercial')
SET IDENTITY_INSERT [dbo].[TipoZona] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (3, N'axel', N'aaa', N'Propietario', 2)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
ALTER TABLE [dbo].[CambiosEntidades]  WITH CHECK ADD  CONSTRAINT [FK_CambiosEntidades_EntityType] FOREIGN KEY([IdEntityType])
REFERENCES [dbo].[EntityType] ([Id])
GO
ALTER TABLE [dbo].[CambiosEntidades] CHECK CONSTRAINT [FK_CambiosEntidades_EntityType]
GO
ALTER TABLE [dbo].[ConceptoCobro]  WITH CHECK ADD  CONSTRAINT [FK_ConceptoCobro_PeriodoMontoCC1] FOREIGN KEY([IdPeriodoMontoCC])
REFERENCES [dbo].[PeriodoMontoCC] ([ID])
GO
ALTER TABLE [dbo].[ConceptoCobro] CHECK CONSTRAINT [FK_ConceptoCobro_PeriodoMontoCC1]
GO
ALTER TABLE [dbo].[ConceptoCobro]  WITH CHECK ADD  CONSTRAINT [FK_ConceptoCobro_TipoMontoCC1] FOREIGN KEY([IdTipoMontoCC])
REFERENCES [dbo].[TipoMontoCC] ([ID])
GO
ALTER TABLE [dbo].[ConceptoCobro] CHECK CONSTRAINT [FK_ConceptoCobro_TipoMontoCC1]
GO
ALTER TABLE [dbo].[DetalleCC]  WITH CHECK ADD  CONSTRAINT [FK_DetalleCC_ConceptoCobro] FOREIGN KEY([IdConceptoCobro])
REFERENCES [dbo].[ConceptoCobro] ([ID])
GO
ALTER TABLE [dbo].[DetalleCC] CHECK CONSTRAINT [FK_DetalleCC_ConceptoCobro]
GO
ALTER TABLE [dbo].[DetalleCC]  WITH CHECK ADD  CONSTRAINT [FK_DetalleCC_Factura] FOREIGN KEY([IdFactura])
REFERENCES [dbo].[Factura] ([ID])
GO
ALTER TABLE [dbo].[DetalleCC] CHECK CONSTRAINT [FK_DetalleCC_Factura]
GO
ALTER TABLE [dbo].[DetalleCCAgua]  WITH CHECK ADD  CONSTRAINT [FK_DetalleCCAgua_DetalleCC] FOREIGN KEY([IdDetalleCC])
REFERENCES [dbo].[DetalleCC] ([ID])
GO
ALTER TABLE [dbo].[DetalleCCAgua] CHECK CONSTRAINT [FK_DetalleCCAgua_DetalleCC]
GO
ALTER TABLE [dbo].[DetalleCCAgua]  WITH CHECK ADD  CONSTRAINT [FK_DetalleCCAgua_MovimientoConsumo] FOREIGN KEY([IdMovimientoConsumo])
REFERENCES [dbo].[MovimientoConsumo] ([ID])
GO
ALTER TABLE [dbo].[DetalleCCAgua] CHECK CONSTRAINT [FK_DetalleCCAgua_MovimientoConsumo]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Propiedad] FOREIGN KEY([IdPropiedad])
REFERENCES [dbo].[Propiedad] ([ID])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_Propiedad]
GO
ALTER TABLE [dbo].[MovimientoConsumo]  WITH CHECK ADD  CONSTRAINT [FK_MovimientoConsumo_PropiedadCCAgua] FOREIGN KEY([IdPropiedadCCAgua])
REFERENCES [dbo].[PropiedadCCAgua] ([ID])
GO
ALTER TABLE [dbo].[MovimientoConsumo] CHECK CONSTRAINT [FK_MovimientoConsumo_PropiedadCCAgua]
GO
ALTER TABLE [dbo].[MovimientoConsumo]  WITH CHECK ADD  CONSTRAINT [FK_MovimientoConsumo_TipoMovimientoConsumo] FOREIGN KEY([IdTipoMovimiento])
REFERENCES [dbo].[TipoMovimientoConsumo] ([ID])
GO
ALTER TABLE [dbo].[MovimientoConsumo] CHECK CONSTRAINT [FK_MovimientoConsumo_TipoMovimientoConsumo]
GO
ALTER TABLE [dbo].[Persona]  WITH CHECK ADD  CONSTRAINT [FK_Persona_TipoDocIdent] FOREIGN KEY([IdTipoDoc])
REFERENCES [dbo].[TipoDocIdent] ([ID])
GO
ALTER TABLE [dbo].[Persona] CHECK CONSTRAINT [FK_Persona_TipoDocIdent]
GO
ALTER TABLE [dbo].[Propiedad]  WITH CHECK ADD  CONSTRAINT [FK_Propiedad_TipoTerreno] FOREIGN KEY([IdTipoTerreno])
REFERENCES [dbo].[TipoTerreno] ([ID])
GO
ALTER TABLE [dbo].[Propiedad] CHECK CONSTRAINT [FK_Propiedad_TipoTerreno]
GO
ALTER TABLE [dbo].[Propiedad]  WITH CHECK ADD  CONSTRAINT [FK_Propiedad_TipoZona] FOREIGN KEY([IdTipoZona])
REFERENCES [dbo].[TipoZona] ([ID])
GO
ALTER TABLE [dbo].[Propiedad] CHECK CONSTRAINT [FK_Propiedad_TipoZona]
GO
ALTER TABLE [dbo].[PropiedadCCAgua]  WITH CHECK ADD  CONSTRAINT [FK_PropiedadCCAgua_PropiedadXCC] FOREIGN KEY([ID])
REFERENCES [dbo].[PropiedadXCC] ([ID])
GO
ALTER TABLE [dbo].[PropiedadCCAgua] CHECK CONSTRAINT [FK_PropiedadCCAgua_PropiedadXCC]
GO
ALTER TABLE [dbo].[PropiedadXCC]  WITH CHECK ADD  CONSTRAINT [FK_PropiedadXCC_ConceptoCobro] FOREIGN KEY([IdConceptoCobro])
REFERENCES [dbo].[ConceptoCobro] ([ID])
GO
ALTER TABLE [dbo].[PropiedadXCC] CHECK CONSTRAINT [FK_PropiedadXCC_ConceptoCobro]
GO
ALTER TABLE [dbo].[PropiedadXCC]  WITH CHECK ADD  CONSTRAINT [FK_PropiedadXCC_Propiedad] FOREIGN KEY([IdPropiedad])
REFERENCES [dbo].[Propiedad] ([ID])
GO
ALTER TABLE [dbo].[PropiedadXCC] CHECK CONSTRAINT [FK_PropiedadXCC_Propiedad]
GO
ALTER TABLE [dbo].[PXP]  WITH CHECK ADD  CONSTRAINT [FK_PXP_Persona] FOREIGN KEY([IdPersona])
REFERENCES [dbo].[Persona] ([ID])
GO
ALTER TABLE [dbo].[PXP] CHECK CONSTRAINT [FK_PXP_Persona]
GO
ALTER TABLE [dbo].[PXP]  WITH CHECK ADD  CONSTRAINT [FK_PXP_Propiedad] FOREIGN KEY([IdPropiedad])
REFERENCES [dbo].[Propiedad] ([ID])
GO
ALTER TABLE [dbo].[PXP] CHECK CONSTRAINT [FK_PXP_Propiedad]
GO
ALTER TABLE [dbo].[PXU]  WITH CHECK ADD  CONSTRAINT [FK_PXU_Propiedad] FOREIGN KEY([IdPropiedad])
REFERENCES [dbo].[Propiedad] ([ID])
GO
ALTER TABLE [dbo].[PXU] CHECK CONSTRAINT [FK_PXU_Propiedad]
GO
ALTER TABLE [dbo].[PXU]  WITH CHECK ADD  CONSTRAINT [FK_PXU_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([ID])
GO
ALTER TABLE [dbo].[PXU] CHECK CONSTRAINT [FK_PXU_Usuario]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Persona] FOREIGN KEY([IdPersona])
REFERENCES [dbo].[Persona] ([ID])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Persona]
GO
/****** Object:  StoredProcedure [dbo].[asociarPXP]    Script Date: 7/11/2022 14:57:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[asociarPXP]
	@inNumDocId BIGINT,
	@inNumeroFinca INT, 
	@outResultCode INT OUTPUT
	--Los anteriores son los parámetros de entrada de la función.
AS
BEGIN
	SET @outResultCode = 0;
	SET NOCOUNT ON;
		BEGIN TRY
		--Las dos siguientes variables se utilizan para validación y también para la agregación de datos.
		DECLARE @inIdPersona INT = (SELECT P.ID FROM dbo.Persona P WHERE P.ValorDocId = @inNumDocId);
		DECLARE @inIdPropiedad INT = (SELECT P.ID FROM dbo.Propiedad P WHERE P.NumeroFinca = @inNumeroFinca);
		IF NOT EXISTS(SELECT P.IdPersona, P.IdPropiedad FROM dbo.PXP P WHERE 
					P.IdPersona = @inIdPersona and P.IdPropiedad = @inIdPropiedad) --Verifica que no exista la relación.
			BEGIN TRANSACTION tAsociarPXP;
			INSERT INTO dbo.PXP --Insertar en la relación de Persona con propiedad. 
				(
				IdPersona,
				IdPropiedad,
				FechaInicio,
				FechaFin
				)
			VALUES
				(
				@inIdPersona,
				@inIdPropiedad,
				FORMAT (getdate(), 'dd-MM-yy'),
				null
				)

			DECLARE @afterAdd VARCHAR(500) = (SELECT R.[ID], R.[IdPersona], R.[IdPropiedad], R.[FechaInicio], R.[FechaFin] FROM dbo.PXP R
												WHERE R.[IdPersona] = @inIdPersona and R.[IdPropiedad] = @inIdPropiedad FOR JSON AUTO);
			DECLARE @idRelacion INT = (SELECT R.ID FROM dbo.PXP R WHERE R.IdPersona = @inIdPersona and R.IdPropiedad = @inIdPropiedad);
			INSERT INTO dbo.CambiosEntidades
				(
					IdEntityType,
					EntityId,
					jsonAntes,
					jsonDespues,
					insertedAt,
					insertedBy,
					insertedIn
				)
			VALUES
				(
				4,
				@idRelacion,
				null,
				@afterAdd,
				FORMAT (getdate(), 'dd-MM-yy'),
				'Axel',
				'1.1.1.1'
				)
				COMMIT TRANSACTION;  
		END TRY
		BEGIN CATCH --Recoge los errores
			IF @@TRANCOUNT > 1
			BEGIN
			ROLLBACK TRANSACTION tAsociarPXP;
			END
			INSERT INTO dbo.DBErrors(
			 [UserName]
			, [ErrorNumber]
			, [ErrorState]
			, [ErrorSeverity]
			, [ErrorLine]
			, [ErrorProcedure]
			, [ErrorMessage]
			, [ErrorDateTime])
			VALUES (
				SUSER_SNAME(),
				ERROR_NUMBER(),
				ERROR_STATE(),
				ERROR_SEVERITY(),
				ERROR_LINE(),
				ERROR_PROCEDURE(),
				ERROR_MESSAGE(),
				GETDATE()
			);
			Set @outResultCode=50010; --Establece el código de error 

		END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[asociarPXU]    Script Date: 7/11/2022 14:57:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[asociarPXU]
	@inUsername VARCHAR(128),
	@inNumeroFinca INT,
	@outResultCode INT OUTPUT
	--Los anteriores son los parámetros de entrada de la función.
AS
BEGIN
	SET	@outResultCode = 0;
	SET NOCOUNT ON;
	BEGIN TRY
	--Las siguientes variables sirven para la validaciones de las relaciones y para agregar en la tabla.
			DECLARE @inIdUsuario INT = (SELECT U.ID FROM dbo.Usuario U WHERE U.UserName = @inUsername);
			DECLARE @inIdPropiedad INT = (SELECT P.ID FROM dbo.Propiedad P WHERE P.NumeroFinca = @inNumeroFinca);

			IF NOT EXISTS(SELECT P.IdUsuario, P.IdPropiedad, P.FechaInicio, P.FechaFin FROM dbo.PXU P WHERE 
				P.IdUsuario = @inIdUsuario and P.IdPropiedad = @inIdPropiedad) --Verifica que no exista la relación.
				BEGIN TRANSACTION tAsociarPXU
						INSERT INTO dbo.PXU -- Se agrega en la tabla la relación. 
						(
						IdUsuario,
						IdPropiedad,
						FechaInicio,
						FechaFin
						)
						VALUES
						(
						@inIdUsuario,
						@inIdPropiedad,
						FORMAT (getdate(), 'dd-MM-yy'),
						null
						)
						DECLARE @inEntityId INT = (SELECT R.ID FROM dbo.PXU R 
												WHERE R.IdPropiedad = @inIdPropiedad and R.IdUsuario = @inIdUsuario);
						DECLARE @afterAdd VARCHAR(500) = (SELECT R.[ID], R.[IdUsuario], R.[IdPropiedad], R.[FechaInicio], R.[FechaFin] FROM dbo.PXU R
								WHERE R.ID = @inEntityId FOR JSON AUTO);
						INSERT INTO dbo.CambiosEntidades
						(
						IdEntityType,
						EntityId,
						jsonAntes,
						jsonDespues,
						insertedAt,
						insertedBy,
						insertedIn
						)
						VALUES
						(
						5,
						@inEntityId,
						null,
						@afterAdd,
						GETDATE(),
						'Javier',
						'10.10.10.0'
						)
				COMMIT TRANSACTION
	END TRY
	BEGIN CATCH --Recoge los errores de la transacción
		IF @@TRANCOUNT > 1
			BEGIN
			ROLLBACK TRANSACTION tAsociarPXU;
			END
			INSERT INTO dbo.DBErrors(
			 [UserName]
			, [ErrorNumber]
			, [ErrorState]
			, [ErrorSeverity]
			, [ErrorLine]
			, [ErrorProcedure]
			, [ErrorMessage]
			, [ErrorDateTime])
			VALUES (
				SUSER_SNAME(),
				ERROR_NUMBER(),
				ERROR_STATE(),
				ERROR_SEVERITY(),
				ERROR_LINE(),
				ERROR_PROCEDURE(),
				ERROR_MESSAGE(),
				GETDATE()
			);
		SET @outResultCode = 50017;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[deletePerson]    Script Date: 7/11/2022 14:57:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[deletePerson]
	@inValorDocId BIGINT,
	@outResultCode INT OUTPUT
	--Las personas se borran con su valor de documento de identidad.
AS
BEGIN
	SET @outResultCode = 0;
	SET NOCOUNT ON;
		BEGIN TRY
			IF EXISTS(SELECT P.ValorDocId FROM dbo.Persona P WHERE P.ValorDocId = @inValorDocId) --Si existe la persona, la borra.
				BEGIN
					BEGIN TRANSACTION tDeletePerson
					DECLARE @beforeDelete VARCHAR(500) = (SELECT P.[ID], P.[Nombre], P.[ValorDocId], P.[IdTipoDoc], P.[email], P.[telefono1], P.[telefono2], 
													P.[activo] FROM dbo.Persona P WHERE P.ValorDocId = @inValorDocId FOR JSON AUTO);
					DECLARE @idPerson INT = (SELECT P.ID FROM dbo.Persona P WHERE P.ValorDocId = @inValorDocId);  
					UPDATE dbo.Persona 
						SET activo = 0
						WHERE ValorDocId = @inValorDocId;
					DECLARE @afterDelete VARCHAR(500) = (SELECT P.[ID], P.[Nombre], P.[ValorDocId], P.[IdTipoDoc], P.[email], P.[telefono1], P.[telefono2], 
													P.[activo] FROM dbo.Persona P WHERE P.ValorDocId = @inValorDocId FOR JSON AUTO);
					INSERT INTO dbo.CambiosEntidades(
						IdEntityType,
						EntityId,
						jsonAntes,
						jsonDespues,
						insertedAt,
						insertedBy,
						insertedIn
					)
					VALUES(
						2,
						@idPerson,
						@beforeDelete,
						@afterDelete,
						GETDATE(),
						'Axel',
						'192.168.12.22'
					)
					COMMIT TRANSACTION
				END
		END TRY
	BEGIN CATCH --Recoge errores durante el SP
	IF @@TRANCOUNT > 0 
		ROLLBACK TRANSACTION tDeletePerson
		INSERT INTO dbo.DBErrors( 
		--[errorID]
		 [UserName]
		, [ErrorNumber]
		, [ErrorState]
		, [ErrorSeverity]
		, [ErrorLine]
		, [ErrorProcedure]
		, [ErrorMessage]
		, [ErrorDateTime])
		VALUES (
			--ERROR_STATE(),
			SUSER_SNAME(),
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_LINE(),
			ERROR_PROCEDURE(),
			ERROR_MESSAGE(),
			GETDATE()
		);
		SET @outResultCode = 50004;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[deleteProperty]    Script Date: 7/11/2022 14:57:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[deleteProperty]
	@inNumeroFinca INT,
	@outResultCode INT
	--Las propiedades se borrarán con su número de finca, por lo tanto se pide como parámetro.
AS
BEGIN
	SET @outResultCode = 0;
	SET NOCOUNT ON; 
	BEGIN TRY
		DELETE FROM dbo.Propiedad WHERE NumeroFinca = @inNumeroFinca; --Si la propiedad existe, la borra. 
	END TRY
	BEGIN CATCH --Recoge errores durante el SP.
			INSERT INTO dbo.DBErrors(
			--[errorID]
			 [UserName]
			, [ErrorNumber]
			, [ErrorState]
			, [ErrorSeverity]
			, [ErrorLine]
			, [ErrorProcedure]
			, [ErrorMessage]
			, [ErrorDateTime])
			VALUES (
				--ERROR_STATE(),
				SUSER_SNAME(),
				ERROR_NUMBER(),
				ERROR_STATE(),
				ERROR_SEVERITY(),
				ERROR_LINE(),
				ERROR_PROCEDURE(),
				ERROR_MESSAGE(),
				GETDATE()
			);
		Set @outResultCode=50008;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[deleteUser]    Script Date: 7/11/2022 14:57:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[deleteUser]
	@inUsername VARCHAR(128),
	@inPassword VARCHAR(128),
	@inTipoUsuario VARCHAR(128),
	@outResultCode INT OUTPUT
	--Los parámetros anteriores permiten buscar al usuario para eliminarlo.
AS
BEGIN
	SET @outResultCode = 0;
	SET NOCOUNT ON;
	BEGIN TRY
		IF EXISTS(SELECT U.UserName, U.Password, U.TipoUsuario, U.IdPersona FROM Municipalidad.dbo.Usuario U WHERE
					U.UserName = @inUsername and U.Password = @inPassword and U.TipoUsuario = @inTipoUsuario)
			BEGIN --Se verifica que el usuario exista y seguidamente lo elimina utilizando los parámetros del SP.
			BEGIN TRANSACTION tDeleteUser
				DECLARE @beforeDelete VARCHAR(500)= (SELECT U.Username, U.Password, U.TipoUsuario, U.IdPersona FROM dbo.Usuario U WHERE
													U.Username = @inUsername and U.Password = @inPassword and U.TipoUsuario = @inTipoUsuario
													FOR JSON AUTO);
				DECLARE @userId INT = (SELECT U.ID FROM dbo.Usuario U WHERE
													U.Username = @inUsername and U.Password = @inPassword and U.TipoUsuario = @inTipoUsuario);
				DELETE FROM dbo.Usuario WHERE Username = @inUsername and Password = @inPassword and TipoUsuario = @inTipoUsuario;
				INSERT INTO dbo.CambiosEntidades
				(
					IdEntityType,
					EntityId,
					jsonAntes,
					jsonDespues,
					insertedAt,
					insertedBy,
					insertedIn
				)
				VALUES
				(
					3,
					@userId,
					@beforeDelete,
					'',
					GETDATE(),
					'Axel',
					'191.26.123.1'
				)
			COMMIT TRANSACTION
			END
	END TRY
	BEGIN CATCH --Toma errores en el SP
		IF @@TRANCOUNT > 1
			ROLLBACK TRANSACTION tDeleteUser
		INSERT INTO dbo.DBErrors(
			 [UserName]
			, [ErrorNumber]
			, [ErrorState]
			, [ErrorSeverity]
			, [ErrorLine]
			, [ErrorProcedure]
			, [ErrorMessage]
			, [ErrorDateTime])
			VALUES (
				SUSER_SNAME(),
				ERROR_NUMBER(),
				ERROR_STATE(),
				ERROR_SEVERITY(),
				ERROR_LINE(),
				ERROR_PROCEDURE(),
				ERROR_MESSAGE(),
				GETDATE()
			);
			Set @outResultCode=50014; --Establece el código de error 

	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[desasociarPXP]    Script Date: 7/11/2022 14:57:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[desasociarPXP]
	@inNumDocId BIGINT,
	@inNumeroFinca INT, 
	@outResultCode INT
	--Los parámetros que permiten borrar la relación son el documento identidad y el número de finca.  

AS
BEGIN
	SET @outResultCode = 0;
	SET NOCOUNT ON; 
	BEGIN TRY
	--Los parámetros que siguen permiten encontrar la relación a borrar, para luego borrarla en caso de existir.
		DECLARE @inIdPersona INT = (SELECT P.ID FROM dbo.Persona P WHERE P.ValorDocId = @inNumDocId);
		DECLARE @inIdPropiedad INT = (SELECT P.ID FROM dbo.Propiedad P WHERE P.NumeroFinca = @inNumeroFinca);
		BEGIN TRANSACTION tDesasociarPXP
		DECLARE @beforeAssociate VARCHAR(500) = (SELECT R.[ID], R.[IdPersona], R.[IdPropiedad], R.[FechaInicio], R.[FechaFin]
									FROM dbo.PXP R WHERE R.IdPersona = @inIdPersona and R.IdPropiedad = @inIdPropiedad FOR JSON AUTO)
		UPDATE dbo.PXP
		SET FechaFin = (FORMAT (getdate(), 'dd-MM-yy'))
		WHERE IdPersona = @inIdPersona and IdPropiedad = @inIdPropiedad; --Termina la relación en caso de existir.
		DECLARE @afterAssociate VARCHAR(500) = (SELECT R.[ID], R.[IdPersona], R.[IdPropiedad], R.[FechaInicio], R.[FechaFin]
									FROM dbo.PXP R WHERE R.IdPersona = @inIdPersona and R.IdPropiedad = @inIdPropiedad FOR JSON AUTO);
		DECLARE @idRelacion INT = (SELECT R.ID FROM dbo.PXP R WHERE R.IdPersona = @inIdPersona and R.IdPropiedad = @inIdPropiedad);
		PRINT @idRelacion
		INSERT INTO dbo.CambiosEntidades
		(
		IdEntityType,
		EntityId,
		jsonAntes,
		jsonDespues,
		insertedAt,
		insertedBy,
		insertedIn
		)
		VALUES
		(
		4,
		@idRelacion,
		@beforeAssociate,
		@afterAssociate,
		GETDATE(),
		'AxelChaves',
		'01.01.02.02'
		)
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH --Atrapa errores en el SP
		IF @@TRANCOUNT > 1
			ROLLBACK TRANSACTION tDesasociarPXP
		INSERT INTO dbo.DBErrors(
			 [UserName]
			, [ErrorNumber]
			, [ErrorState]
			, [ErrorSeverity]
			, [ErrorLine]
			, [ErrorProcedure]
			, [ErrorMessage]
			, [ErrorDateTime])
			VALUES (
				SUSER_SNAME(),
				ERROR_NUMBER(),
				ERROR_STATE(),
				ERROR_SEVERITY(),
				ERROR_LINE(),
				ERROR_PROCEDURE(),
				ERROR_MESSAGE(),
				GETDATE()
			);
			PRINT ERROR_MESSAGE()
			Set @outResultCode=50011;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[desasociarPXU]    Script Date: 7/11/2022 14:57:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[desasociarPXU]
	@inUserName VARCHAR(128),
	@inNumeroFinca INT,
	@outResultCode INT OUTPUT
	--La relación entre propiedad y usuario se borra con el nombre de usuario y el número de finca

AS
BEGIN
	SET @outResultCode = 0;
	SET NOCOUNT ON;
	BEGIN TRY
	--Las siguientes variables permiten encontrar la relación a borrar mediante los ID, siempre y cuando esta exista.
		BEGIN TRANSACTION tDesasociarPXU
		DECLARE @inIdUsuario INT = (SELECT U.ID FROM dbo.Usuario U WHERE U.UserName = @inUsername);
		DECLARE @inIdPropiedad INT = (SELECT P.ID FROM dbo.Propiedad P WHERE P.NumeroFinca = @inNumeroFinca);
		DECLARE @beforeAssociate VARCHAR(500) = (SELECT R.[ID], R.[IdUsuario], R.[IdPropiedad], R.[FechaInicio], R.[FechaFin]
												FROM dbo.PXU R WHERE R.IdUsuario = @inIdUsuario and R.IdPropiedad = @inIdPropiedad
												FOR JSON AUTO);
		UPDATE dbo.PXU
		SET FechaFin = (FORMAT (getdate(), 'dd-MM-yy'))
		WHERE IdUsuario = @inIdUsuario and IdPropiedad = @inIdPropiedad;
		DECLARE @afterAssociate VARCHAR(500) = (SELECT R.[ID], R.[IdUsuario], R.[IdPropiedad], R.[FechaInicio], R.[FechaFin]
												FROM dbo.PXU R WHERE R.IdUsuario = @inIdUsuario and R.IdPropiedad = @inIdPropiedad
												FOR JSON AUTO);
		DECLARE @idRelacion INT = (SELECT R.ID FROM dbo.PXU R WHERE R.IdUsuario = @inIdUsuario and R.IdPropiedad = @inIdPropiedad);
		INSERT INTO dbo.CambiosEntidades
		(
		IdEntityType,
		EntityId,
		jsonAntes,
		jsonDespues,
		insertedAt,
		insertedBy,
		insertedIn
		)
		VALUES
		(
		4,
		@idRelacion,
		@beforeAssociate,
		@afterAssociate,
		GETDATE(),
		'JavierVasquez',
		'01.01.02.03'
		)
		COMMIT TRANSACTION
	END TRY 
	BEGIN CATCH --Atrapa errores durante la ejecución del SP.
		IF @@TRANCOUNT > 1
			ROLLBACK TRANSACTION tDesasociarPXU
			INSERT INTO dbo.DBErrors(
			 [UserName]
			, [ErrorNumber]
			, [ErrorState]
			, [ErrorSeverity]
			, [ErrorLine]
			, [ErrorProcedure]
			, [ErrorMessage]
			, [ErrorDateTime])
			VALUES (
				SUSER_SNAME(),
				ERROR_NUMBER(),
				ERROR_STATE(),
				ERROR_SEVERITY(),
				ERROR_LINE(),
				ERROR_PROCEDURE(),
				ERROR_MESSAGE(),
				GETDATE()
			);
		SET @outResultCode = 50018;
		
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[insertPerson]    Script Date: 7/11/2022 14:57:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertPerson]
	@inNombre VARCHAR(128),
	@inValorDocId BIGINT,
	@inIdTipoDoc INT,
	@inEmail VARCHAR(128),
	@inTelefono1 BIGINT,
	@inTelefono2 BIGINT,
	@outResultCode INT OUTPUT
	--Los anteriores son los parámetros para agregar a una persona. 
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRY
	SET @outResultCode = 0;
	--Se verifica que la persona no exista y se agrega a la tabla Persona. 
	IF NOT EXISTS(SELECT P.Nombre, P.ValorDocId, P.IdTipoDoc, P.email, P.telefono1, P.telefono2 FROM Municipalidad.dbo.Persona P 
				WHERE P.Nombre = @inNombre and P.ValorDocId = @inValorDocId and P.IdTipoDoc = @inIdTipoDoc and P.email = @inEmail and 
						P.telefono1 = @inTelefono1 and P.telefono2 = @inTelefono2) --Si la persona no existe, la agrega 
		INSERT INTO dbo.Persona (
			Nombre
			, ValorDocId
			, IdTipoDoc
			, email
			, telefono1
			, telefono2
			)
			VALUES (
			@inNombre
			, @inValorDocId
			, @inIdTipoDoc
			, @inEmail
			, @inTelefono1
			, @inTelefono2
			)
	END TRY

	BEGIN CATCH		--Atrapa errores en la ejecución del SP
		INSERT INTO dbo.DBErrors(
		 [UserName]
		, [ErrorNumber]
		, [ErrorState]
		, [ErrorSeverity]
		, [ErrorLine]
		, [ErrorProcedure]
		, [ErrorMessage]
		, [ErrorDateTime])
		VALUES (
			SUSER_SNAME(),
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_LINE(),
			ERROR_PROCEDURE(),
			ERROR_MESSAGE(),
			GETDATE()
		);
		Set @outResultCode=50003;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[insertProperty]    Script Date: 7/11/2022 14:57:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertProperty]
	@inNumeroFinca INT,
	@inArea FLOAT,
	@inValorFiscal VARCHAR(128),
	@inFechaRegistro DATE,
	@inIdTipoTerreno INT,
	@inIdTipoZona INT,
	@outResultCode INT OUTPUT
--Los anteriores son los parámetros que permiten la creación de una propiedad.

AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		SET @outResultCode = 0;
		--Si la propiedad no existe, procede a crearla en la tabla Propiedad.
		IF NOT EXISTS(SELECT P.NumeroFinca, P.Area, P.ValorFiscal, P.FechaRegistro, P.IdTipoTerreno, P.IdTipoZona
			FROM dbo.Propiedad P WHERE P.NumeroFinca = @inNumeroFinca) --Si no existe la propiedad, la crea
			BEGIN
			INSERT INTO dbo.Propiedad(
				NumeroFinca,
				Area,
				ValorFiscal,
				FechaRegistro,
				IdTipoTerreno,
				IdTipoZona
			)
			VALUES(
				@inNumeroFinca,
				@inArea,
				@inValorFiscal,
				@inFechaRegistro,
				@inIdTipoTerreno,
				@inIdTipoZona
			)
			END
	END TRY
	BEGIN CATCH --Si se encuentran errores, se agregan en la tabla DBErrors 

		INSERT INTO dbo.DBErrors(
		 [UserName]
		, [ErrorNumber]
		, [ErrorState]
		, [ErrorSeverity]
		, [ErrorLine]
		, [ErrorProcedure]
		, [ErrorMessage]
		, [ErrorDateTime])
		VALUES (
			SUSER_SNAME(),
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_LINE(),
			ERROR_PROCEDURE(),
			ERROR_MESSAGE(),
			GETDATE()
		);
		Set @outResultCode=50005;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[insertUser]    Script Date: 7/11/2022 14:57:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertUser]
	@inDocID BIGINT,
	@inUsername VARCHAR(128),
	@inPassword VARCHAR(128),
	@inTipoUsuario VARCHAR(128),
	@outResultCode INT OUTPUT
	--Los parámetros anteriores permiten la creación de un usuario.

AS
BEGIN
	SET @outResultCode = 0;
	SET NOCOUNT ON;
	BEGIN TRY
		--Si el usuario no existe, se procede a crearlo e insertarlo en la tabla Usuario. 
		IF NOT EXISTS(SELECT U.UserName, U.Password, U.TipoUsuario FROM Municipalidad.dbo.Usuario U WHERE
					U.UserName = @inUsername and U.Password = @inPassword and U.TipoUsuario = @inTipoUsuario) --Si no existe, se inserta el nuevo usuario.
				BEGIN
				-- La siguiente variable se utiliza para la agregación, buscando el ID mediante el documento de Identidad.
					DECLARE @inIdPersona INT = (SELECT P.ID FROM dbo.Persona P WHERE P.ValorDocId = @inDocID); 
					INSERT INTO Municipalidad.dbo.Usuario
					(
						UserName,
						Password,
						TipoUsuario,
						IdPersona
					)
					VALUES
					(
						@inUsername,
						@inPassword,
						@inTipoUsuario,
						@inIdPersona
					)
				END
	END TRY
	BEGIN CATCH --Inserta el error en la tabla DBErrors, en caso de que exista alguno. 
		INSERT INTO dbo.DBErrors(
			 [UserName]
			, [ErrorNumber]
			, [ErrorState]
			, [ErrorSeverity]
			, [ErrorLine]
			, [ErrorProcedure]
			, [ErrorMessage]
			, [ErrorDateTime])
			VALUES (
				SUSER_SNAME(),
				ERROR_NUMBER(),
				ERROR_STATE(),
				ERROR_SEVERITY(),
				ERROR_LINE(),
				ERROR_PROCEDURE(),
				ERROR_MESSAGE(),
				GETDATE()
			);

		SET @outResultCode = 50012;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[InsertXML]    Script Date: 7/11/2022 14:57:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertXML]
AS 
BEGIN
delete from [dbo].[Usuario]
delete from [dbo].[Persona]
delete from [dbo].[TipoDocIdent] --Remueve los datos de la tabla
delete from [dbo].[TipoTerreno]
delete from [dbo].[TipoZona]
delete from [dbo].[ConceptoCobro]
DBCC CHECKIDENT ('TipoDocIdent', RESEED, 0) -- Se reinicia el id de la tabla(para que comience en 0)
DBCC CHECKIDENT ('TipoTerreno', RESEED, 0)
DBCC CHECKIDENT ('TipoZona', RESEED, 0) 
DECLARE @xmlData XML -- Se declara la variable XML

 SET @xmlData = ( -- Se define la variable XML, se utiliza la dirección del archivo
		SELECT *
		FROM OPENROWSET(BULK 'C:\Users\javie\Desktop\XML\Catalogo.xml', SINGLE_BLOB) 
		AS xmlData
		);

INSERT INTO [dbo].[TipoDocIdent] -- Se insertan los datos en la tabla X
SELECT  
	T.Item.value('@Nombre', 'VARCHAR(128)') AS Nombre, -- Se asigna el valor del atributo de la instanciaXML al atributo de la tabla 
	T.Item.value('@Mascara', 'VARCHAR(128)') AS Mascara
FROM @xmlData.nodes('Catalogo/TipoDocumentoIdentidades/TipoDocumentoIdentidad') -- Se selecciona la raiz/subraiz del arbol XML de interes
AS T(Item)

INSERT INTO [dbo].[TipoTerreno] -- Se insertan los datos en la tabla X
SELECT  
	T.Item.value('@Nombre', 'VARCHAR(128)') AS Nombre 
FROM @xmlData.nodes('Catalogo/TipoZonaPropiedades/TipoZonaPropiedad') -- Se selecciona la raiz/subraiz del arbol XML de interes
AS T(Item)

INSERT INTO [dbo].[TipoZona] 
SELECT  
	T.Item.value('@Nombre', 'VARCHAR(128)') AS Nombre 
FROM @xmlData.nodes('Catalogo/TipoZonaPropiedades/TipoZonaPropiedad') 
AS T(Item)

INSERT INTO [dbo].[TipoMovimientoConsumo]
SELECT  
	T.Item.value('@Nombre', 'VARCHAR(128)') AS Nombre 
FROM @xmlData.nodes('Catalogo/TipoZonaPropiedades/TipoZonaPropiedad') 
AS T(Item)

INSERT INTO [dbo].[ConceptoCobro]
SELECT  
	T.Item.value('@Nombre', 'VARCHAR(128)') AS Nombre,
	T.Item.value('@TipoMontoCC', 'VARCHAR(128)') AS TipoMontoCC ,
	T.Item.value('@PeriodoMontoCC', 'VARCHAR(128)') AS PeriodoMonto, 
	T.Item.value('@ValorMinimo', 'VARCHAR(128)') AS ValorMinimo ,
	T.Item.value('@ValorMinimoM3', 'VARCHAR(128)') AS ValorMinimoM3, 
	T.Item.value('@Valorm3', 'VARCHAR(128)') AS Valorm3 ,
	T.Item.value('@ValorPorcentual', 'VARCHAR(128)') AS ValorPorcentual ,
	T.Item.value('@ValorFijo', 'VARCHAR(128)') AS ValorFijo ,
	T.Item.value('@ValorM2Minimo', 'VARCHAR(128)') AS ValorM2Minimo,
	T.Item.value('@ValorTractosM2', 'VARCHAR(128)') AS ValorTractosM2,
	T.Item.value('@Nombre', 'VARCHAR(128)') AS ValorFijoM3Adicional
	
FROM @xmlData.nodes('Catalogo/CCs/CC') 
AS T(Item)

END
exec [dbo].[InsertXML]
GO
/****** Object:  StoredProcedure [dbo].[propiedadesPropietario]    Script Date: 7/11/2022 14:57:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[propiedadesPropietario]
	@inIdentificacion BIGINT,
	@outResultCode INT OUTPUT
	--Para mostrar las propiedades de un propietario, se utiliza su documento identidad.
AS
BEGIN

	SET @outResultCode = 0;
	SET NOCOUNT ON;
	BEGIN TRY
		DECLARE @inIdPersona INT = (SELECT P.ID FROM dbo.Persona P WHERE P.ValorDocId = @inIdentificacion);
		SELECT PR.NumeroFinca, PR.Area, TZ.Nombre AS 'Tipo Zona', TT.Nombre AS 'Tipo Terreno' FROM dbo.PXP P
		INNER JOIN dbo.Propiedad PR
		ON P.IdPropiedad = PR.ID
		INNER JOIN dbo.TipoZona TZ
		ON PR.IdTipoZona = TZ.ID
		INNER JOIN dbo.TipoTerreno TT
		ON PR.IdTipoTerreno = TT.ID
		WHERE P.IdPersona = @inIdPersona;
		/*Lo anterior hecho combina tablas para mostrar los datos, donde al encontrar el ID de la persona se le agregan las tablas de la propiedad,
		el tipo de zona y el tipo terreno para mostrar los datos de la relación correctamente. 
		*/
	END TRY
	BEGIN CATCH --Atrapa errores en la ejecución del SP y los inserta en la tabla de errores.
		INSERT INTO dbo.DBErrors(
		 [UserName]
		, [ErrorNumber]
		, [ErrorState]
		, [ErrorSeverity]
		, [ErrorLine]
		, [ErrorProcedure]
		, [ErrorMessage]
		, [ErrorDateTime])
		VALUES (
			SUSER_SNAME(),
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_LINE(),
			ERROR_PROCEDURE(),
			ERROR_MESSAGE(),
			GETDATE()
		);
		SET @outResultCode = 50020;
	END CATCH 
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[propiedadesUsuario]    Script Date: 7/11/2022 14:57:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[propiedadesUsuario]
	@inUsername VARCHAR(128),
	@outResultCode INT OUTPUT
	--Para mostrar las propiedades visibles para un usuario, jse utiliza su username.
AS
BEGIN
	SET NOCOUNT ON;
	SET @outResultCode = 0;
BEGIN TRY
	DECLARE @inIdUsuario INT = (SELECT U.ID FROM dbo.Usuario U WHERE U.UserName = @inUsername);
	SELECT dbo.Propiedad.Area, dbo.Propiedad.FechaRegistro, dbo.Propiedad.NumeroFinca, dbo.TipoZona.Nombre AS 'Tipo Zona', dbo.TipoTerreno.Nombre AS 'Tipo Terreno'
	FROM dbo.PXU 
	INNER JOIN dbo.Propiedad ON Municipalidad.dbo.PXU.IdPropiedad = dbo.Propiedad.ID
	INNER JOIN dbo.TipoZona ON dbo.Propiedad.IdTipoZona = dbo.TipoZona.ID
	INNER JOIN dbo.TipoTerreno ON dbo.Propiedad.IdTipoTerreno = dbo.TipoTerreno.ID WHERE PXU.IdUsuario = @inIdUsuario;
	/*Lo anterior hecho se refiere a encontrar el Id del usuario usando su username, para luego unir varias tablas y encontrar la relación
	del usuario con las propiedades, para entonces usar inner join para mostrar los datos de las propiedades que corresponden a este usuario.
	*/
END TRY
BEGIN CATCH --Inserta errores en la tabla de errores, en caso de que existan.
			INSERT INTO dbo.DBErrors(
			 [UserName]
			, [ErrorNumber]
			, [ErrorState]
			, [ErrorSeverity]
			, [ErrorLine]
			, [ErrorProcedure]
			, [ErrorMessage]
			, [ErrorDateTime])
			VALUES (
				SUSER_SNAME(),
				ERROR_NUMBER(),
				ERROR_STATE(),
				ERROR_SEVERITY(),
				ERROR_LINE(),
				ERROR_PROCEDURE(),
				ERROR_MESSAGE(),
				GETDATE()
			);
			SET @outResultCode = 50023;
END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[propietarioPropiedad]    Script Date: 7/11/2022 14:57:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[propietarioPropiedad]
	@inNumeroFinca INT,
	@outResultCode INT OUTPUT
	--Para mostrar el propietario de una propiedad, se utiliza el número de finca. 
AS
BEGIN
	SET NOCOUNT ON;
	SET @outResultCode = 0;
	BEGIN TRY
		DECLARE @inIdPropiedad INT = (SELECT P.ID FROM dbo.Propiedad P WHERE P.NumeroFinca = @inNumeroFinca);
		SELECT dbo.Persona.Nombre, dbo.Persona.email, dbo.Persona.ValorDocId, dbo.Persona.telefono1, dbo.Persona.telefono2 FROM dbo.PXP P 
		INNER JOIN Persona ON P.IdPersona = dbo.Persona.ID
		WHERE P.IdPropiedad = @inIdPropiedad;
		/*Lo hecho anteriormente básicamente busca el id de la propiedad usando el número de finca y luego selecciona los datos de la persona
		o las personas que son dueñas de esa propiedad, todo esto guiándose por el id de la propiedad.
		*/
	END TRY 
	BEGIN CATCH --Inserta errores en la tabla de errores, en caso de que existan. 
		INSERT INTO dbo.DBErrors(
		 [UserName]
		, [ErrorNumber]
		, [ErrorState]
		, [ErrorSeverity]
		, [ErrorLine]
		, [ErrorProcedure]
		, [ErrorMessage]
		, [ErrorDateTime])
		VALUES (
			SUSER_SNAME(),
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_LINE(),
			ERROR_PROCEDURE(),
			ERROR_MESSAGE(),
			GETDATE()
		);
		SET @outResultCode = 50022;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[readPerson]    Script Date: 7/11/2022 14:57:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[readPerson]
	@inValorDocId BIGINT,
	@outResultCode INT
	--Las personas se consultan por su número de documento de identidad.
AS
BEGIN
	SET NOCOUNT ON;
	SET @outResultCode = 0;
	BEGIN TRY
		SELECT P.[Nombre], P.[ValorDocId], DI.Nombre AS 'Tipo Doc. Identidad', P.[email], P.[telefono1], P.[telefono2] FROM dbo.Persona P
		INNER JOIN dbo.TipoDocIdent DI
		ON P.IdTipoDoc = DI.ID
		WHERE P.ValorDocId = @inValorDocId;
		--Se consultó a la persona utilizando su documento identidad y se mostraron sus datos.
	END TRY
	BEGIN CATCH --Se insertan errores en la tabla de errores, en caso de que estos existan. 
		INSERT INTO dbo.DBErrors(
		 [UserName]
		, [ErrorNumber]
		, [ErrorState]
		, [ErrorSeverity]
		, [ErrorLine]
		, [ErrorProcedure]
		, [ErrorMessage]
		, [ErrorDateTime])
		VALUES (
			SUSER_SNAME(),
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_LINE(),
			ERROR_PROCEDURE(),
			ERROR_MESSAGE(),
			GETDATE()
		);
		Set @outResultCode=50006;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[readProperty]    Script Date: 7/11/2022 14:57:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[readProperty]
	@inNumeroFinca FLOAT, 
	@outResultCode INT OUTPUT
	--Las propiedades se consultarán con su área

AS
BEGIN
	SET @outResultCode = 0;
	SET NOCOUNT ON
	BEGIN TRY
		SELECT P.[Area], P.[ValorFiscal], P.[FechaRegistro], P.[NumeroFinca], TZ.Nombre AS 'Tipo Zona', TT.Nombre AS 'Tipo Terreno' FROM dbo.Propiedad P
		INNER JOIN dbo.TipoZona TZ
		ON P.IdTipoZona = TZ.ID
		INNER JOIN dbo.TipoTerreno TT
		ON P.IdTipoTerreno = TT.ID
			WHERE P.NumeroFinca = @inNumeroFinca; --Se selecciona la propiedad correspondiente respecto a su número de finca. 
	END TRY
	BEGIN CATCH --Inserta errores en la tabla de errores en caso de que estos existan. 
		INSERT INTO dbo.DBErrors(
			 [UserName]
			, [ErrorNumber]
			, [ErrorState]
			, [ErrorSeverity]
			, [ErrorLine]
			, [ErrorProcedure]
			, [ErrorMessage]
			, [ErrorDateTime])
			VALUES (
				SUSER_SNAME(),
				ERROR_NUMBER(),
				ERROR_STATE(),
				ERROR_SEVERITY(),
				ERROR_LINE(),
				ERROR_PROCEDURE(),
				ERROR_MESSAGE(),
				GETDATE()
			);
		SET @outResultCode = 50007;
	END CATCH
	
END
GO
/****** Object:  StoredProcedure [dbo].[readUser]    Script Date: 7/11/2022 14:57:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[readUser]
	@inUsername VARCHAR(128),
	@outResultCode INT OUTPUT
	--Para consultar un usuario, se utiliza su username.
AS
BEGIN
	SET @outResultCode = 0;
	SET NOCOUNT ON;
	BEGIN TRY
		SELECT U.UserName, U.Password, U.TipoUsuario FROM dbo.Usuario U WHERE U.UserName = @inUsername;
		--Se seleccionó el usuario usando su username, se muestra su información.
	END TRY
	BEGIN CATCH --Inserta errores en la tabla de errores en caso de que estos existan.
		INSERT INTO dbo.DBErrors(
		 [UserName]
		, [ErrorNumber]
		, [ErrorState]
		, [ErrorSeverity]
		, [ErrorLine]
		, [ErrorProcedure]
		, [ErrorMessage]
		, [ErrorDateTime])
		VALUES (
			SUSER_SNAME(),
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_LINE(),
			ERROR_PROCEDURE(),
			ERROR_MESSAGE(),
			GETDATE()
		);
		SET @outResultCode = 50021;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[recibosPagados]    Script Date: 7/11/2022 14:57:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[recibosPagados]
	@inNumeroFinca INT,
	@outResultCode INT OUTPUT

AS
BEGIN
	SET NOCOUNT ON;
	SET @outResultCode = 0;
	BEGIN TRY
		DECLARE @inId INT = (SELECT P.ID FROM dbo.Propiedad P WHERE P.NumeroFinca = @inNumeroFinca);
		SELECT F.[ID], F.[Fecha], F.[FechaVencimiento], F.[TotalOriginal], F.[TotalPagar], F.[Estado]
				FROM dbo.Factura F WHERE F.IdPropiedad = @inId and F.Estado = 2;
	END TRY
	BEGIN CATCH 
			INSERT INTO dbo.DBErrors(
			 [UserName]
			, [ErrorNumber]
			, [ErrorState]
			, [ErrorSeverity]
			, [ErrorLine]
			, [ErrorProcedure]
			, [ErrorMessage]
			, [ErrorDateTime])
			VALUES (
				SUSER_SNAME(),
				ERROR_NUMBER(),
				ERROR_STATE(),
				ERROR_SEVERITY(),
				ERROR_LINE(),
				ERROR_PROCEDURE(),
				ERROR_MESSAGE(),
				GETDATE()
			);
		SET @outResultCode=50050;
		
	END CATCH 
END 
GO
/****** Object:  StoredProcedure [dbo].[recibosPendientes]    Script Date: 7/11/2022 14:57:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[recibosPendientes] 
	@inNumeroFinca INT, 
	@outResultCode INT OUTPUT
AS 
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		DECLARE @inId INT = (SELECT P.ID FROM Municipalidad.dbo.Propiedad P WHERE P.NumeroFinca  = @inNumeroFinca)
		SELECT F.[ID], F.[Fecha], F.[FechaVencimiento], F.[TotalOriginal], F.[TotalPagar], F.[Estado] 
				FROM Municipalidad.dbo.Factura F
				WHERE F.IdPropiedad = @inId;
	END TRY
	BEGIN CATCH
INSERT INTO Municipalidad.dbo.DBErrors(
		 [UserName]
		, [ErrorNumber]
		, [ErrorState]
		, [ErrorSeverity]
		, [ErrorLine]
		, [ErrorProcedure]
		, [ErrorMessage]
		, [ErrorDateTime])
		VALUES (
			SUSER_SNAME(),
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_LINE(),
			ERROR_PROCEDURE(),
			ERROR_MESSAGE(),
			GETDATE()
		);
		Set @outResultCode=50005;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[updatePerson]    Script Date: 7/11/2022 14:57:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updatePerson]
	@inNombre VARCHAR(128),
	@inValorDocId BIGINT,
	@inIdTipoDocId INT,
	@inEmail VARCHAR(128),
	@inTelefono1 BIGINT,
	@inTelefono2 BIGINT,
	@outResultCode INT OUTPUT
	--Los parámetros anteriores permiten actualizar a la persona en cuestión.
AS
BEGIN
	SET @outResultCode = 0;
	SET NOCOUNT ON;
	BEGIN TRY
		BEGIN TRANSACTION tupdatePersona
		DECLARE @beforeUpdate VARCHAR(500) = (SELECT U.Nombre, U.IdTipoDoc, U.ValorDocId, U.email, U.telefono1, U.telefono2 FROM dbo.Persona U
											WHERE U.ValorDocId = @inValorDocId FOR JSON AUTO) 
		UPDATE Persona 
		SET Nombre = @inNombre, IdTipoDoc = @inIdTipoDocId, email = @inEmail, telefono1 = @inTelefono1, telefono2 = @inTelefono2
		WHERE ValorDocId = @inValorDocId; --Actualiza la persona en caso de existir.
		DECLARE @idPersona INT = (SELECT P.ID FROM dbo.Persona P WHERE P.ValorDocId = @inValorDocId);
		DECLARE @afterUpdate VARCHAR(500) = (SELECT U.Nombre, U.IdTipoDoc, U.ValorDocId, U.email, U.telefono1, U.telefono2 FROM dbo.Persona U
											WHERE U.ValorDocId = @inValorDocId FOR JSON AUTO)
		INSERT INTO dbo.CambiosEntidades(
			IdEntityType,
			EntityId,
			jsonAntes,
			jsonDespues,
			insertedAt,
			insertedBy,
			insertedIn
		)
		VALUES(
			2,
			@idPersona,
			@beforeUpdate,
			@afterUpdate,
			GETDATE(),
			'Axel',
			'192.168.1.1'
		)
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH --Inserta en la tabla de errores en caso de que algún error exista. 
			IF @@TRANCOUNT > 1
			ROLLBACK TRANSACTION tupdatePersona
			INSERT INTO dbo.DBErrors(
			 [UserName]
			, [ErrorNumber]
			, [ErrorState]
			, [ErrorSeverity]
			, [ErrorLine]
			, [ErrorProcedure]
			, [ErrorMessage]
			, [ErrorDateTime])
			VALUES (
				SUSER_SNAME(),
				ERROR_NUMBER(),
				ERROR_STATE(),
				ERROR_SEVERITY(),
				ERROR_LINE(),
				ERROR_PROCEDURE(),
				ERROR_MESSAGE(),
				GETDATE()
			);
			Set @outResultCode=50003;
	END CATCH
	SET NOCOUNT OFF;
END

GO
/****** Object:  StoredProcedure [dbo].[updateProperty]    Script Date: 7/11/2022 14:57:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateProperty]
	@inNumeroFinca INT,
	@inArea FLOAT,
	@inValorFiscal VARCHAR(128),
	@outResultCode INT OUTPUT
	--Para actualizar una propiedad se necesita su finca y los datos que se actualizarán.
	
AS
BEGIN
	SET @outResultCode = 0;
	SET NOCOUNT ON;
		BEGIN TRY
			UPDATE dbo.Propiedad -- Se actualiza la propiedad con respecto al ID, actualizando valores como el área y el valor fiscal
				SET Area = @inArea, ValorFiscal = @inValorFiscal
				WHERE NumeroFinca = @inNumeroFinca; --Siempre y cuando esta propiedad se haya encontrado. 
		END TRY
		BEGIN CATCH --Inserta en la tabla de errores en caso de que algún error exista.
			INSERT INTO dbo.DBErrors(
		 [UserName]
		, [ErrorNumber]
		, [ErrorState]
		, [ErrorSeverity]
		, [ErrorLine]
		, [ErrorProcedure]
		, [ErrorMessage]
		, [ErrorDateTime])
		VALUES (
			SUSER_SNAME(),
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_LINE(),
			ERROR_PROCEDURE(),
			ERROR_MESSAGE(),
			GETDATE()
		);
		Set @outResultCode=50009;
		END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[updateUser]    Script Date: 7/11/2022 14:57:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateUser]
	@inUsername VARCHAR(128),
	@inPassword VARCHAR(128),
	@inNewUsername VARCHAR(128),
	@inNewPassword VARCHAR(128),
	@inNewTipoUsuario VARCHAR(128),
	@outResultCode INT OUTPUT
	--Los parámetros anteriores son propios de los usuarios y permiten localizarlos y modificarlos. 
AS
BEGIN
	SET NOCOUNT ON; 
	SET @outResultCode = 0;
	BEGIN TRY
		IF EXISTS(SELECT U.UserName, U.Password, U.TipoUsuario FROM dbo.Usuario U WHERE
					UserName = @inUsername and Password = @inPassword)
				BEGIN
					BEGIN TRANSACTION tUpdateUser
					DECLARE @beforeUpdate VARCHAR(500) = (SELECT U.UserName, U.Password, U.TipoUsuario FROM dbo.Usuario U
															WHERE U.UserName = @inUsername and U.Password = @inPassword FOR JSON AUTO);
					DECLARE @idUser INT = (SELECT U.ID FROM dbo.Usuario U WHERE U.UserName = @inUsername and U.Password = @inPassword);
					UPDATE dbo.Usuario
					SET UserName = @inNewUsername, Password = @inNewPassword, TipoUsuario = @inNewTipoUsuario
					WHERE UserName = @inUsername and Password = @inPassword
					DECLARE @afterUpdate VARCHAR(500) = (SELECT U.UserName, U.Password, U.TipoUsuario FROM dbo.Usuario U
															WHERE U.UserName = @inNewUsername and U.Password = @inNewPassword FOR JSON AUTO);
					INSERT INTO CambiosEntidades(
						IdEntityType,
						EntityId,
						jsonAntes,
						jsonDespues,
						insertedAt,
						insertedBy,
						insertedIn
					)
					VALUES(
						3,
						@idUser,
						@beforeUpdate,
						@afterUpdate,
						GETDATE(),
						'Pablo',
						'192.198.0.1'
					)
					COMMIT TRANSACTION
				END
		--Las instrucciones anteriores encuentran al usuario en caso de que exista y actualizan sus datos.
	END TRY
	BEGIN CATCH --Se insertan errores en la tabla de errores en caso de que estos existan.
		IF @@TRANCOUNT > 1
			ROLLBACK TRANSACTION tUpdateUser
		INSERT INTO dbo.DBErrors(
			 [UserName]
			, [ErrorNumber]
			, [ErrorState]
			, [ErrorSeverity]
			, [ErrorLine]
			, [ErrorProcedure]
			, [ErrorMessage]
			, [ErrorDateTime])
			VALUES (
				SUSER_SNAME(),
				ERROR_NUMBER(),
				ERROR_STATE(),
				ERROR_SEVERITY(),
				ERROR_LINE(),
				ERROR_PROCEDURE(),
				ERROR_MESSAGE(),
				GETDATE()
			);
			SET @outResultCode=50015;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[usuariosPropiedad]    Script Date: 7/11/2022 14:57:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usuariosPropiedad]
	@inNumeroFinca INT, 
	@outResultCode INT OUTPUT
	--Para consultar los usuarios de una propiedad, se utiliza el número de finca para encontrar la propiedad.

AS
BEGIN
	SET @outResultCode = 0;
	SET NOCOUNT ON;
	BEGIN TRY 
		DECLARE @inIdPropiedad INT = (SELECT P.ID FROM dbo.Propiedad P WHERE P.NumeroFinca = @inNumeroFinca);
		SELECT dbo.Usuario.UserName, dbo.Usuario.Password FROM dbo.Usuario  
		INNER JOIN dbo.PXU ON dbo.Usuario.ID = dbo.PXU.IdUsuario WHERE dbo.PXU.IdPropiedad = @inIdPropiedad;
		/*Lo hecho en las líneas anteriores encuentra el ID de la propiedad usando su número de finca, para luego
		unir la tabla de usuario con la de la relación con tal de mostrar los datos correspondientes, todo esto siempre y cuando
		exista el ID de la finca y se asocie con alguna relación.
		*/

	END TRY
	BEGIN CATCH --Se insertan errores en la tabla de errores en caso de que exista alguno. 
			INSERT INTO dbo.DBErrors(
			 [UserName]
			, [ErrorNumber]
			, [ErrorState]
			, [ErrorSeverity]
			, [ErrorLine]
			, [ErrorProcedure]
			, [ErrorMessage]
			, [ErrorDateTime])
			VALUES (
				SUSER_SNAME(),
				ERROR_NUMBER(),
				ERROR_STATE(),
				ERROR_SEVERITY(),
				ERROR_LINE(),
				ERROR_PROCEDURE(),
				ERROR_MESSAGE(),
				GETDATE()
			);
			SET @outResultCode = 50024;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[validateLogin]    Script Date: 7/11/2022 14:57:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[validateLogin]
	@inUsername VARCHAR(128),
	@inPassword VARCHAR(128),
	@outResultCode INT OUTPUT
	--Los parámetros anteriores se ingresan en el login y así se valida el usuario.
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRY
	DECLARE @inValidate INT; --Variable para la validación de los parámetros.
		SET @outResultCode = 0; --Quiere decir que no hubo errores
		IF EXISTS(SELECT U.UserName, U.Password FROM dbo.Usuario U WHERE U.UserName = @inUsername and U.Password = @inPassword) --Verifica que el usuario exista
			BEGIN
				IF EXISTS(SELECT U.UserName, U.Password FROM dbo.Usuario U WHERE U.UserName = @inUsername and U.Password = @inPassword and U.TipoUsuario = 'Propietario') --Verifica si es un usuario
					BEGIN
						SET @inValidate = 2; --Si es propietario, se retorna 2
						RETURN @inValidate;
					END
				ELSE
					BEGIN
						SET @inValidate = 1; --Si es administrador, se retorna 1
						RETURN @inValidate;				
					END
			END
		ELSE
			BEGIN
				SET @inValidate = 0; --Si no se encontró el usuario, se retorna cero
				RETURN @inValidate;
			END
	END TRY
	BEGIN CATCH --Toma errores en caso de que ocurran
		BEGIN
			INSERT INTO dbo.DBErrors(
			 [UserName]
			, [ErrorNumber]
			, [ErrorState]
			, [ErrorSeverity]
			, [ErrorLine]
			, [ErrorProcedure]
			, [ErrorMessage]
			, [ErrorDateTime])
			VALUES (
				SUSER_SNAME(),
				ERROR_NUMBER(),
				ERROR_STATE(),
				ERROR_SEVERITY(),
				ERROR_LINE(),
				ERROR_PROCEDURE(),
				ERROR_MESSAGE(),
				GETDATE()
			);
			Set @outResultCode=50001; --Establece el código de error 
		END
	END CATCH
	SET NOCOUNT OFF;
END
declare @a INT;
EXEC @a =  [dbo].[validateLogin] finickySmelt5,a0S4fq,0
PRINT @a
GO
/****** Object:  Trigger [dbo].[TrPropiedadDelete]    Script Date: 7/11/2022 14:57:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[TrPropiedadDelete]
   ON  [dbo].[Propiedad]
   AFTER DELETE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @deletedProperty VARCHAR(500) = (SELECT P.[ID], P.[Area], P.[ValorFiscal], P.[FechaRegistro], 
										P.[IdTipoTerreno], P.[IdTipoZona], P.[NumeroFinca] FROM deleted P FOR JSON AUTO);
	DECLARE @inId INT = (SELECT P.ID FROM deleted P);
	INSERT INTO dbo.CambiosEntidades
	(
	IdEntityType,
	EntityId,
	jsonAntes,
	jsonDespues,
	insertedAt,
	insertedBy,
	insertedIn
	)
	VALUES
	(
	1,
	@inId,
	@deletedProperty,
	NULL,
	GETDATE(),
	'Admin',
	'192.168.1.1'
	)


END
GO
ALTER TABLE [dbo].[Propiedad] ENABLE TRIGGER [TrPropiedadDelete]
GO
/****** Object:  Trigger [dbo].[TrPropiedadInsert]    Script Date: 7/11/2022 14:57:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[TrPropiedadInsert]
   ON  [dbo].[Propiedad]
   AFTER INSERT
AS 
BEGIN
	SET NOCOUNT ON;
	DECLARE @afterInsert VARCHAR(500) = (SELECT I.[ID], I.[Area], I.[ValorFiscal], I.[FechaRegistro], 
												I.[IdTipoTerreno], I.[IdTipoZona], I.[NumeroFinca]
												 FROM inserted I FOR JSON AUTO);
	DECLARE @inId INT = (SELECT I.ID FROM inserted I);
	INSERT INTO dbo.CambiosEntidades
	(
	IdEntityType,
	EntityId,
	jsonAntes,
	jsonDespues,
	insertedAt,
	insertedBy,
	insertedIn
	)
	VALUES
	(
	1,
	@inId,
	null,
	@afterInsert,
	GETDATE(),
	'Admin',
	'192.168.1.1'
	)


END
GO
ALTER TABLE [dbo].[Propiedad] ENABLE TRIGGER [TrPropiedadInsert]
GO
/****** Object:  Trigger [dbo].[TrPropiedadUpdate]    Script Date: 7/11/2022 14:57:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[TrPropiedadUpdate]
   ON  [dbo].[Propiedad]
   AFTER UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @beforeUpdate VARCHAR(500) = (SELECT D.[ID], D.[Area], D.[ValorFiscal], D.[FechaRegistro], 
											D.[IdTipoTerreno], D.[IdTipoZona], D.[NumeroFinca] FROM deleted D FOR JSON AUTO);
	DECLARE @afterUpdate VARCHAR(500) = (SELECT I.[ID], I.[Area], I.[ValorFiscal], I.[FechaRegistro], 
											I.[IdTipoTerreno], I.[IdTipoZona], I.[NumeroFinca] FROM inserted I FOR JSON AUTO);
	DECLARE @inId VARCHAR(500) = (SELECT I.ID FROM inserted I);

	INSERT INTO dbo.CambiosEntidades
	(
	IdEntityType,
	EntityId,
	jsonAntes,
	jsonDespues,
	insertedAt,
	insertedBy,
	insertedIn
	)
	VALUES
	(
	1,
	@inId,
	@beforeUpdate,
	@afterUpdate,
	GETDATE(),
	'Admin',
	'192.168.1.1'
	)
END
GO
ALTER TABLE [dbo].[Propiedad] ENABLE TRIGGER [TrPropiedadUpdate]
GO
USE [master]
GO
ALTER DATABASE [Municipalidad] SET  READ_WRITE 
GO
