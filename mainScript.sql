USE [master]
GO
/****** Object:  Database [Municipalidad]    Script Date: 30/10/2022 22:19:17 ******/
CREATE DATABASE [Municipalidad]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Municipalidad', FILENAME = N'D:\MSSQLMS\MSSQL15.MSSQLSERVER\MSSQL\DATA\Municipalidad.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Municipalidad_log', FILENAME = N'D:\MSSQLMS\MSSQL15.MSSQLSERVER\MSSQL\DATA\Municipalidad_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
/****** Object:  Table [dbo].[ConceptoCobro]    Script Date: 30/10/2022 22:19:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConceptoCobro](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[idTipoConceptoCobro] [int] NULL,
 CONSTRAINT [PK_ConceptoCobro] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DBErrors]    Script Date: 30/10/2022 22:19:17 ******/
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
/****** Object:  Table [dbo].[DetalleCC]    Script Date: 30/10/2022 22:19:17 ******/
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
/****** Object:  Table [dbo].[DetalleCCAgua]    Script Date: 30/10/2022 22:19:17 ******/
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
/****** Object:  Table [dbo].[EventLog]    Script Date: 30/10/2022 22:19:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventLog](
	[id] [int] NOT NULL,
	[LogDescription] [varchar](512) NULL,
	[PostTime] [datetime] NULL,
	[PostByUserId] [int] NULL,
	[PostInIP] [varchar](64) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 30/10/2022 22:19:17 ******/
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
/****** Object:  Table [dbo].[MovimientoConsumo]    Script Date: 30/10/2022 22:19:17 ******/
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
/****** Object:  Table [dbo].[Persona]    Script Date: 30/10/2022 22:19:17 ******/
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
 CONSTRAINT [PK_Persona] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Propiedad]    Script Date: 30/10/2022 22:19:17 ******/
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
/****** Object:  Table [dbo].[PropiedadCCAgua]    Script Date: 30/10/2022 22:19:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropiedadCCAgua](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NombreMedidor] [varchar](128) NOT NULL,
	[SaldoAcumulado] [money] NOT NULL,
 CONSTRAINT [PK_PropiedadCCAgua] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PropiedadXCC]    Script Date: 30/10/2022 22:19:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropiedadXCC](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdPropiedad] [int] NOT NULL,
	[IdConceptoCobro] [int] NOT NULL,
	[FechaInicio] [date] NOT NULL,
	[FechaFin] [date] NOT NULL,
 CONSTRAINT [PK_PropiedadXCC] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PXP]    Script Date: 30/10/2022 22:19:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PXP](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdPersona] [int] NOT NULL,
	[IdPropiedad] [int] NOT NULL,
	[FechaInicio] [date] NOT NULL,
	[FechaFin] [date] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PXU]    Script Date: 30/10/2022 22:19:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PXU](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[IdPropiedad] [int] NOT NULL,
	[FechaInicio] [date] NOT NULL,
	[FechaFin] [date] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoConceptoCobro]    Script Date: 30/10/2022 22:19:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoConceptoCobro](
	[ID] [int] NOT NULL,
	[Nombre] [varchar](128) NOT NULL,
	[TipoMontoCC] [int] NOT NULL,
	[PeriodoMontoCC] [int] NOT NULL,
	[ValorMinimo] [money] NOT NULL,
	[ValorMinimoM3] [money] NOT NULL,
	[Valorm3] [money] NOT NULL,
	[ValorPorcentual] [money] NOT NULL,
	[ValorFijo] [money] NOT NULL,
	[ValorM2Minimo] [money] NOT NULL,
	[ValorTractosM2] [money] NOT NULL,
	[ValorFijoM3Adicional] [money] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoDocIdent]    Script Date: 30/10/2022 22:19:17 ******/
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
/****** Object:  Table [dbo].[TipoMovimientoConsumo]    Script Date: 30/10/2022 22:19:17 ******/
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
/****** Object:  Table [dbo].[TipoTerreno]    Script Date: 30/10/2022 22:19:17 ******/
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
/****** Object:  Table [dbo].[TipoZona]    Script Date: 30/10/2022 22:19:17 ******/
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
/****** Object:  Table [dbo].[Usuario]    Script Date: 30/10/2022 22:19:17 ******/
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
SET IDENTITY_INSERT [dbo].[ConceptoCobro] ON 

INSERT [dbo].[ConceptoCobro] ([ID], [idTipoConceptoCobro]) VALUES (8, NULL)
INSERT [dbo].[ConceptoCobro] ([ID], [idTipoConceptoCobro]) VALUES (9, NULL)
INSERT [dbo].[ConceptoCobro] ([ID], [idTipoConceptoCobro]) VALUES (10, NULL)
INSERT [dbo].[ConceptoCobro] ([ID], [idTipoConceptoCobro]) VALUES (11, NULL)
INSERT [dbo].[ConceptoCobro] ([ID], [idTipoConceptoCobro]) VALUES (12, NULL)
INSERT [dbo].[ConceptoCobro] ([ID], [idTipoConceptoCobro]) VALUES (13, NULL)
INSERT [dbo].[ConceptoCobro] ([ID], [idTipoConceptoCobro]) VALUES (14, NULL)
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
SET IDENTITY_INSERT [dbo].[DBErrors] OFF
GO
SET IDENTITY_INSERT [dbo].[Persona] ON 

INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (1, N'Juliette James', 80144276, 2, N'955d9ddd38f900a0@gmail.com', 54198629, 22807249)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (2, N'Shannon Ernst', 57115956, 2, N'c875a8136f7a6055@gmail.com', 18109205, 89399539)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (3, N'Thomas Foster', 48022111, 1, N'02156f4f3cf11b83@gmail.com', 69721307, 53883848)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (4, N'Suk Barnes', 14045608, 2, N'a47040b9d7d5c7fd@gmail.com', 55670493, 31681076)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (5, N'Deja Denney', 60849877, 2, N'699a1f00083f02f7@gmail.com', 23348982, 96805853)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (6, N'Charity Mcsherry', 90316969, 1, N'a5352fa4c55579fa@gmail.com', 68989297, 42018419)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (7, N'Jose Ross', 86770312, 2, N'ede8423d711e156a@gmail.com', 60940790, 19959621)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (8, N'Robert Gavia', 23047680, 1, N'f4dd5063d9363671@gmail.com', 79957913, 20632384)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (9, N'Martin Raisley', 48102536, 1, N'71aa1de34b463075@gmail.com', 80164293, 82526571)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (10, N'Elsie Wilmoth', 80052381, 2, N'2a547d26eaf47176@gmail.com', 69435873, 52103245)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (11, N'Kermit Corder', 83593984, 2, N'564211ade1eb8ad6@gmail.com', 53166593, 15319305)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (12, N'Helen John', 92501338, 2, N'050542155007dcba@gmail.com', 16475852, 98951332)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (13, N'Jeff Nunez', 58616591, 1, N'de1a71882f11d6e6@gmail.com', 25617809, 60521845)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (14, N'Bernice Meza', 88831425, 1, N'382408c2a9823187@gmail.com', 11174556, 66542127)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (15, N'Jean Hillin', 40089459, 1, N'01d7ce6eabcadfd2@gmail.com', 86081390, 21197592)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (16, N'Yolande Owen', 72656575, 2, N'3e01196a34110dde@gmail.com', 15607807, 65798130)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (17, N'David White', 90713591, 1, N'f46d7cd1db322252@gmail.com', 40541037, 63363390)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (18, N'Thomas Tran', 46563770, 2, N'4e73161c4f96cce7@gmail.com', 96557359, 36197605)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (19, N'Anna Malone', 90280973, 1, N'a25285e902e1b46f@gmail.com', 93714527, 26449138)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (20, N'Karen Reed', 73429246, 1, N'be2548f31d20f455@gmail.com', 14244732, 93760810)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (21, N'Fern Moy', 47844351, 2, N'5403bf7ec21fbbb8@gmail.com', 88194730, 11448057)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (22, N'Lydia Roe', 51327048, 1, N'772d20905098e337@gmail.com', 75676359, 57834494)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (23, N'Jared Varner', 72919450, 2, N'b26b03e07b4a1d92@gmail.com', 59358358, 97724765)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (24, N'Ralph Jasper', 46055057, 2, N'32042e45daf750e5@gmail.com', 27200805, 88844038)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (25, N'Phyllis Carrillo', 15594025, 1, N'db7bab4db0e6d15b@gmail.com', 58748195, 38873916)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (26, N'George Rufenacht', 26831053, 2, N'aa69ee6915bd9c48@gmail.com', 61922641, 72384659)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (27, N'Carmen Gonzalez', 13253758, 2, N'd66483646ee2bdd9@gmail.com', 41610532, 49542984)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (28, N'William Byrd', 34278822, 1, N'ec3d6db5fe6cc6a3@gmail.com', 25984694, 22192783)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (29, N'Edward Gillespie', 10823227, 1, N'5887a01b48a42382@gmail.com', 21082251, 74319663)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (30, N'Grady Wilson', 14462465, 1, N'd668dc176ba07068@gmail.com', 66674885, 73394401)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (31, N'Gregory Liles', 71040701, 1, N'42f849a51e27b318@gmail.com', 93981378, 33457927)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (32, N'Clifford Mata', 47460799, 1, N'16e29d9d2b1c0ff5@gmail.com', 36824017, 36272811)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (33, N'Rhonda Frazier', 73903581, 1, N'34389ff1b7693984@gmail.com', 10127097, 37215553)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (34, N'Yvonne Medley', 37006353, 2, N'35cf1019cc39f118@gmail.com', 32756931, 60566632)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (35, N'Mary Chafin', 52836141, 2, N'b53f5696b99af8fd@gmail.com', 56370324, 45217045)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (36, N'Charles Jefferies', 67824100, 2, N'341adc7e61f5f333@gmail.com', 93247768, 33429015)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (37, N'Aaron Washington', 10833404, 2, N'61c78decc272df1a@gmail.com', 20302838, 51549338)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (38, N'Jean Black', 46062932, 2, N'37f6f10984649108@gmail.com', 61740398, 53405078)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (39, N'Kimberly White', 32242446, 2, N'6c988d018b334bdf@gmail.com', 17585920, 71717052)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (40, N'Suzanne Lemke', 10348754, 2, N'80da17ace7ca371c@gmail.com', 29943131, 73757622)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (41, N'Madison Griffith', 46179230, 2, N'422bbfd699f6b515@gmail.com', 51578892, 63652960)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (42, N'Thomas Korth', 76457674, 2, N'9c32a084c64ede79@gmail.com', 73209367, 67736803)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (43, N'Calvin Akin', 43022500, 2, N'c9796cf27fa51ad5@gmail.com', 43944173, 27370321)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (44, N'David Shaw', 86246901, 2, N'6dad00afdf4da3e8@gmail.com', 26401296, 65006653)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (45, N'Calvin Atkinson', 58962122, 2, N'b19abf2e4c3f1be3@gmail.com', 31125549, 12248133)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (46, N'Mark Urie', 14155843, 1, N'97d856ee4ac2560c@gmail.com', 13396564, 54791311)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (47, N'Jennie Singer', 58774186, 2, N'fde88eced458f004@gmail.com', 45993259, 33477726)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (48, N'Kenny Lo', 85670588, 2, N'aa8817c4df115732@gmail.com', 98580754, 23988909)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (49, N'Joyce Anaya', 72659767, 2, N'71ac9cd3d0a91a3a@gmail.com', 91298369, 17118700)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (50, N'Samuel Smith', 72042113, 1, N'809ab5bfff3402ee@gmail.com', 75220318, 86322415)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (51, N'Richard Hanson', 16551379, 1, N'3643330a9bf676e1@gmail.com', 50932116, 90832813)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (52, N'Glenn Pena', 45205442, 1, N'65ca341aa5816f8a@gmail.com', 25269411, 58687390)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (53, N'Matthew Suarez', 70602142, 2, N'f03bc108fd8e0240@gmail.com', 98948149, 62639443)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (54, N'Grover Moyers', 30645498, 2, N'21e65200f525a29b@gmail.com', 60944835, 23023311)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (55, N'Lewis Cannon', 71047022, 2, N'67b9589808b573e6@gmail.com', 42682968, 82224346)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (56, N'Laura Glenn', 67720139, 1, N'ab74d4f256884b81@gmail.com', 42991114, 43947478)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (57, N'Andy Pleiman', 94079000, 1, N'3bc4369e6a9e9bfe@gmail.com', 47494202, 42150424)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (58, N'Eloisa Holt', 38471805, 2, N'2d3671b5af38664a@gmail.com', 84866470, 34247604)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (59, N'Tanna Shaw', 17748139, 2, N'7e32b45589d6a2ce@gmail.com', 57866566, 58438141)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (60, N'Teresa Barrett', 91657666, 1, N'58cec5e061917287@gmail.com', 36850205, 36386660)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (61, N'Alfred Kirtley', 68038278, 1, N'da92fd08c3cc619c@gmail.com', 22077900, 12366210)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (62, N'Karen Lin', 86846997, 1, N'ba2ba2c8a4784440@gmail.com', 82616766, 78752114)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (63, N'Haydee Koehn', 31376634, 1, N'50e6a9291952c482@gmail.com', 14826806, 24688759)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (64, N'Rodney Rivera', 61377380, 1, N'9f89d6875f824f99@gmail.com', 55231997, 22236454)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (65, N'Conrad Barbour', 58364626, 2, N'c96d59b717745fde@gmail.com', 36944297, 93083832)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (66, N'Winston Tauscher', 52499716, 1, N'9caeb6c10fdf30cc@gmail.com', 30762099, 14049825)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (67, N'Kent Robinson', 54360413, 1, N'04b56f135d5860cf@gmail.com', 16118422, 24513380)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (68, N'Junior Johnson', 38094337, 2, N'71c47b3140f8bfeb@gmail.com', 75090892, 54207924)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (69, N'Mark Bingman', 29017868, 1, N'a9f141e693a67e1d@gmail.com', 82235281, 96657239)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (70, N'Paige Clements', 12160741, 1, N'5ad263a0d1098871@gmail.com', 71208607, 11366452)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (71, N'Bethany Zevallos', 52569497, 1, N'c99115a6f4717bfe@gmail.com', 59080053, 97564802)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (72, N'Hosea Haley', 33703315, 2, N'cd0f500e8b7c8dee@gmail.com', 24794889, 66430386)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (73, N'Robt Lahip', 55279616, 2, N'771a8bdc2984fe68@gmail.com', 52063439, 51563932)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (74, N'Lawrence Ogle', 79876836, 2, N'8a63597a04213584@gmail.com', 86421427, 18295011)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (75, N'Vickie Berg', 82109911, 1, N'a03c4a52d8af9b13@gmail.com', 65861177, 45562949)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (76, N'Emily Mckenzie', 50182988, 1, N'c19eefe4d63b4145@gmail.com', 83010098, 73634127)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (77, N'Jacqueline Foster', 95519615, 1, N'79bd1d195b3fa8f8@gmail.com', 56443756, 75839262)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (78, N'David Sanchez', 35536605, 2, N'64ce43d776f98c31@gmail.com', 21674930, 34296020)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (79, N'Linda Johnson', 35320418, 1, N'948a264377a68dc1@gmail.com', 47059739, 37473500)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (80, N'Effie Fischer', 91781191, 1, N'92982fc629118736@gmail.com', 84403884, 98447323)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (81, N'Jacob Dow', 79059451, 1, N'c055c9939836f83a@gmail.com', 21766829, 75790885)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (82, N'Kevin Daniels', 62269198, 2, N'b49a1f2e6bdd4d4a@gmail.com', 12543764, 31839049)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (83, N'Alex Heard', 58820525, 1, N'7814bb462057205f@gmail.com', 94782875, 81504628)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (84, N'Richard Zavala', 57106884, 2, N'53de90630ebfefa8@gmail.com', 69935703, 43840762)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (85, N'Jacob Frey', 27005986, 2, N'a288145a740951d9@gmail.com', 85197656, 23104223)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (86, N'Patricia Patterson', 62996335, 2, N'5c96204b282326b5@gmail.com', 99402218, 52166353)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (87, N'Scott Greenwood', 22555678, 1, N'03d8ed9c2ebcecbc@gmail.com', 67210979, 96636665)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (88, N'Emily Lane', 22744135, 2, N'61e3eb97cd923431@gmail.com', 57609464, 27044991)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (89, N'Corine Diaz', 91914838, 2, N'd15204a33b33ef22@gmail.com', 29740587, 50155698)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (90, N'James Robb', 70666396, 1, N'052b3bba0bd4c524@gmail.com', 14167178, 32554982)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (91, N'Michael Crespo', 83715308, 2, N'a05dfee539825867@gmail.com', 85354925, 48263172)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (92, N'Kristen Hunter', 91340548, 1, N'82c393b3060eb943@gmail.com', 20852561, 95020328)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (93, N'Mario Brassil', 66103185, 1, N'cf4a77f649f3f6c1@gmail.com', 30184845, 48825613)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (94, N'Marvin Bowers', 70870717, 2, N'c4e2e34b4b8fa6df@gmail.com', 10762867, 79332509)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (95, N'Stephen Velazquez', 48138911, 1, N'cd2b9e717699accf@gmail.com', 49345682, 78259877)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (96, N'Iris Davenport', 55423326, 2, N'c786be799d472667@gmail.com', 76067530, 99691615)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (97, N'Natasha Ramirez', 69294871, 1, N'c85120cbd6fb6ad5@gmail.com', 54366449, 71743301)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (98, N'Janice Bilyeu', 58854508, 1, N'445f36624c03eae7@gmail.com', 22311671, 81160874)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (99, N'Jessica Garza', 16025283, 2, N'833bfebcc04b8eaa@gmail.com', 58766217, 23285614)
GO
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (100, N'Daniel Sheridan', 66221202, 2, N'54220782e60cfa88@gmail.com', 50954681, 96980661)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (101, N'David Redel', 72501028, 1, N'605e1dc7dbc60487@gmail.com', 17402632, 74588899)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (102, N'Richard Parker', 71703837, 1, N'df6eb4d0eacf9d9b@gmail.com', 83474703, 68106978)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (103, N'Barbara Seal', 46866874, 1, N'ad9fa5a24656a182@gmail.com', 50497817, 95443586)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (104, N'Raymond Riker', 25168309, 2, N'288f78f9f8bbe122@gmail.com', 36369419, 71426258)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (105, N'Vernon Holt', 38100280, 1, N'696b58550081c8fa@gmail.com', 47983761, 71299815)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (106, N'Ronald Laramee', 71762168, 2, N'2eb14b141cbbfb28@gmail.com', 52266321, 11456807)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (107, N'George Merritt', 17015258, 1, N'81988af569a4d582@gmail.com', 58500022, 93799814)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (108, N'Jacob Martinez', 38053000, 2, N'1ce78e631f6a04b4@gmail.com', 79488424, 41217459)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (109, N'Leo Jones', 21446898, 1, N'cead7aeb7574b649@gmail.com', 63772867, 38329623)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (110, N'Jesica Pernell', 95209523, 1, N'a76f0ccdb0b4a1b5@gmail.com', 93766112, 95330443)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (111, N'Garland Rumble', 42132326, 2, N'532bdae5127881de@gmail.com', 11416757, 10425624)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (112, N'Victor Chee', 92731712, 2, N'f4a46505b0bf3499@gmail.com', 79594142, 47099891)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (113, N'Alexandra Wilson', 24667483, 2, N'99cba11471a83780@gmail.com', 61375771, 16906335)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (114, N'Patricia Herrera', 62685972, 1, N'2459b052add9db6d@gmail.com', 23761182, 70532361)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (115, N'Jose Restivo', 25519352, 1, N'8fcaeeb645940cf6@gmail.com', 60009996, 28593531)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (116, N'Charles Miller', 53752387, 2, N'a3fdd753c7877b91@gmail.com', 82936680, 29386235)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (117, N'Walter Elias', 36545999, 2, N'bc45beb932e0da84@gmail.com', 82028337, 93730595)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (118, N'Jessica Belcher', 38922930, 2, N'd6b684559d9b9ac2@gmail.com', 72018392, 22209368)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (119, N'David Jackson', 67718428, 1, N'e59bd6dae0914922@gmail.com', 31990343, 96666592)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (120, N'Harry Alexander', 18573219, 2, N'1ea91442d0072c43@gmail.com', 40556448, 63512050)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (121, N'Antonio Duran', 95929534, 1, N'b5ca08bc24407418@gmail.com', 64759885, 75679073)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (122, N'Joshua Stringfellow', 59634381, 2, N'45ddabf1ab5555c5@gmail.com', 92224387, 73756826)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (123, N'Eleanor Paris', 96467713, 2, N'be03d8ceb876fca2@gmail.com', 87481913, 83008714)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (124, N'Michael Gaskin', 97757913, 2, N'a5a727f35c711ac1@gmail.com', 52238379, 76801874)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (125, N'Mark Nutting', 64159385, 2, N'cab092166179df0a@gmail.com', 79837907, 59823112)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (126, N'Gregory Crumpton', 38939267, 2, N'60d4f636e81128df@gmail.com', 12684803, 36744332)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (127, N'Eliza Davis', 53513324, 1, N'32bc70217bf8752a@gmail.com', 18837578, 57956729)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (128, N'Natasha Lybbert', 73908814, 1, N'ffa4a6f697dbc9fd@gmail.com', 22417841, 58598157)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (129, N'William Shan', 55086884, 1, N'fec12e02e24cc430@gmail.com', 40513800, 81894284)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (130, N'James Williams', 16769528, 1, N'4ce9c6bc7ae2ff7a@gmail.com', 82395342, 96711586)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (131, N'Patricia Gary', 33572808, 2, N'a789c9a03ffafbf6@gmail.com', 73996250, 20382553)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (132, N'George Comer', 81650519, 1, N'6a92302cd9905ee7@gmail.com', 25305552, 46179591)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (133, N'Charles Mcafee', 14246498, 1, N'aa120b432665640b@gmail.com', 12416009, 62217674)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (134, N'Julie Jones', 12299180, 1, N'aa99f8a34a51f173@gmail.com', 42760656, 62803975)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (135, N'Steven Beacom', 99618532, 2, N'ce822ac058987bdc@gmail.com', 73556454, 83504490)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (136, N'Rodney Mueller', 25078368, 2, N'3b5cd63cf8c91498@gmail.com', 25758358, 74510012)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (137, N'Randy Walters', 26830547, 2, N'77a4952b1a48ff63@gmail.com', 87915145, 68796153)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (138, N'Charles Woosley', 55327781, 2, N'8300fc2eceaee339@gmail.com', 58542269, 77380662)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (139, N'Jerry Keene', 41775187, 2, N'3ea949525e6a3e04@gmail.com', 70312665, 76714743)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (140, N'Edward Clark', 91416495, 1, N'3996da5d7a0b7e91@gmail.com', 13732970, 68580224)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (141, N'Kevin Daniels', 99527920, 2, N'8080f15950a215cd@gmail.com', 32888355, 66970220)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (142, N'Olivia Schilling', 48811812, 1, N'50a82400bb255f94@gmail.com', 30394521, 19424680)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (143, N'Ila Simmons', 62594521, 2, N'1d12a8ba29254338@gmail.com', 83646135, 98729726)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (144, N'Sheena Mcdonald', 49581106, 2, N'beeabeae931bf8e0@gmail.com', 39202961, 70144422)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (145, N'Glendora Williams', 10832710, 2, N'4c631db2fd118e88@gmail.com', 26896078, 19107239)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (146, N'Joseph Cooper', 39852238, 1, N'eaefb26ca9cab9f9@gmail.com', 92213756, 29913693)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (147, N'Crystal Warren', 52325031, 1, N'2a699af6bababd52@gmail.com', 25986018, 91704677)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (148, N'Robert Vang', 76394162, 1, N'50561d698f2c4d82@gmail.com', 24390568, 89072569)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (149, N'James Keys', 55332368, 2, N'3dcd684a0bf98330@gmail.com', 87400430, 37072681)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (150, N'Janae Thomas', 38618568, 1, N'a0c70758c31e2407@gmail.com', 68229986, 30929201)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (151, N'Ruth Hutcheson', 28429582, 2, N'c51421ea2c86ca97@gmail.com', 33250791, 11424487)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (152, N'Rita Riddle', 38669837, 1, N'b4fe97bbaff24587@gmail.com', 59772236, 43400611)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (153, N'Lisa Diaz', 75114610, 1, N'9af400a6f4c5eb1b@gmail.com', 71226697, 96004671)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (154, N'Gregory Eley', 56275425, 1, N'94a81d13c2b93766@gmail.com', 32239303, 45445602)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (155, N'Karolyn Hanson', 65007536, 1, N'be1693950865e2ad@gmail.com', 86458567, 75238282)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (156, N'Kenny Moreno', 39057239, 1, N'6bfb195c80c5888c@gmail.com', 65835088, 76012570)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (157, N'Allan Johnson', 93299731, 2, N'54062b4704582605@gmail.com', 30093549, 60987928)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (158, N'Randall Seibert', 56606209, 2, N'2ad2ff319b03aaed@gmail.com', 51856298, 60648512)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (159, N'Bessie Rios', 18014161, 1, N'bfed1b8aadec94fb@gmail.com', 68534108, 35362399)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (160, N'Jack Jenkins', 21417678, 1, N'878cca7bccaae0f9@gmail.com', 69250649, 16500094)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (161, N'Christine Boren', 53765700, 2, N'da93475c3b6adc98@gmail.com', 96198746, 57342848)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (162, N'Laura Greene', 80467894, 1, N'd2d781cdc714438c@gmail.com', 39670032, 40149714)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (163, N'Tammy Pennachio', 60800624, 2, N'204a668bcfa88f27@gmail.com', 73536948, 98431917)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (164, N'Flora Burris', 44477482, 2, N'14bc85bac9d72a65@gmail.com', 70111925, 88121092)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (165, N'Christine Nelson', 75510165, 2, N'e5e33922d41f3aa2@gmail.com', 87567751, 21582954)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (166, N'Paul Sumner', 81253057, 1, N'48ff225ac46181f7@gmail.com', 61750103, 44637592)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (167, N'Randy Boldosser', 88156716, 1, N'40815856658dea5e@gmail.com', 36173097, 10361086)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (168, N'Janet Klinger', 69805060, 2, N'c50f32186d24dbc5@gmail.com', 38396052, 14880336)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (169, N'Joseph Ortiz', 37600491, 1, N'e67c68651aa7d8f2@gmail.com', 63805868, 86521308)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (170, N'Lee Holahan', 74087692, 1, N'ead1061bc5185e3a@gmail.com', 18706435, 45024874)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (171, N'Timothy Siwiec', 50165235, 1, N'6011e37b26626834@gmail.com', 23786818, 24025987)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (172, N'Anisha Dominguez', 79827646, 1, N'823d7c8f013f5680@gmail.com', 31654558, 29859983)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (173, N'Evelyn Farness', 66567898, 1, N'6432f3a5c7c2434b@gmail.com', 77336004, 90552590)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (174, N'John Richardson', 77063052, 2, N'af0dacc84856a37c@gmail.com', 41342132, 97816161)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (175, N'Mark Nedd', 85796132, 2, N'9f78e805fd1e2b92@gmail.com', 75957368, 16518970)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (176, N'Marian Benge', 70080085, 1, N'afd4a51d621aa52c@gmail.com', 57220382, 18063442)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (177, N'John William', 12933254, 1, N'db542cc08ce5df68@gmail.com', 55958959, 75913917)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (178, N'Clarice White', 72110697, 1, N'dc5ecdd6fcf71fd3@gmail.com', 22608309, 45494954)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (179, N'Brian Garcia', 34837748, 2, N'a46fe813f5cd6dee@gmail.com', 29789652, 51391321)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (180, N'Ross Mailloux', 64606496, 1, N'eb0d3aa94afcf8b4@gmail.com', 58651596, 76470033)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (181, N'Susan Pecanty', 43237699, 1, N'7402a770b03d3e09@gmail.com', 91007917, 81274545)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (182, N'Todd Thompson', 67597616, 2, N'c6b01f33b61feb28@gmail.com', 69955263, 75142825)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (183, N'Helen Chipman', 95802592, 2, N'0e476e1d46f56f31@gmail.com', 27917544, 19467254)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (184, N'Olga Kenworthy', 85575659, 1, N'deab74e3348486b5@gmail.com', 24367111, 15118498)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (185, N'Felicia Murphy', 31772724, 2, N'6627a443cf01bce9@gmail.com', 73328265, 34003625)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (186, N'Willy Anderson', 35176896, 1, N'60be81f2ccbe1e19@gmail.com', 29532320, 32742700)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (187, N'Chris Boykin', 40330248, 2, N'2fa44472902b9ce4@gmail.com', 61593410, 27826404)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (188, N'Ann Nemeth', 73078144, 2, N'aac022d1ec55dcab@gmail.com', 13615868, 99529665)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (189, N'Ronald Mitchell', 77766798, 2, N'24e9dfd7ae9a4fc9@gmail.com', 90720084, 19640432)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (190, N'Jennifer Holloway', 11383524, 1, N'ab63f714c1acbb88@gmail.com', 32474971, 55752068)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (191, N'Joann Martinez', 99631343, 1, N'03e1262361c95e0b@gmail.com', 23952216, 61486470)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (192, N'Susan Goff', 37360939, 2, N'21ace37aabb5b7d9@gmail.com', 62241645, 87956116)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (193, N'Lorraine Andrews', 93928001, 1, N'01301f251ab6e167@gmail.com', 95431237, 17453831)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (194, N'Joanna Brunell', 51888804, 2, N'2fd74f525f46c25e@gmail.com', 37158102, 54523345)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (195, N'Leslie Paro', 78337631, 1, N'2d1c6a7bb2496951@gmail.com', 60575421, 11441129)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (196, N'Earl Taylor', 14370700, 2, N'08a8484c38b411eb@gmail.com', 72753265, 97922807)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (197, N'Derrick Mack', 19720046, 1, N'9b5bb405619d5802@gmail.com', 97218145, 67454938)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (198, N'Gary Hinton', 57617088, 2, N'48f3e66ab7345515@gmail.com', 11602298, 74243736)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (199, N'Howard Lamarche', 41789232, 2, N'8aba00c19ca5ac8b@gmail.com', 48697245, 88349089)
GO
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (200, N'Ruthie Eye', 85393493, 2, N'4880047eecba2b58@gmail.com', 96476510, 93085753)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (201, N'Elvia Hirsch', 42414258, 1, N'83d0feb7cf12d212@gmail.com', 50073658, 38261877)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (202, N'Marie Kirchner', 88076904, 2, N'67f05ef74b0d5772@gmail.com', 66800499, 39804664)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (203, N'Eric Pickens', 42151881, 2, N'5dbdbffa27d9f1f2@gmail.com', 32946115, 44446988)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (204, N'Sergio Snell', 34158980, 2, N'8f757a6081df510b@gmail.com', 35573383, 50315621)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (205, N'Georgina Garcia', 31787768, 1, N'8b43cb9cf81f6af4@gmail.com', 53250897, 17718187)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (206, N'Teresa Riddle', 62588350, 1, N'9c21f21b23070104@gmail.com', 53515117, 91995220)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (207, N'George Seifert', 65284843, 1, N'5abed9b724e3e73f@gmail.com', 83858985, 65164886)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (208, N'Connie Camarena', 63707901, 1, N'fe1c9709113b4668@gmail.com', 90625131, 20927099)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (209, N'Claudia Wilder', 15167480, 1, N'7b0ba3e4c08b9ea3@gmail.com', 48464975, 63170215)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (210, N'Samuel Sparks', 64471140, 2, N'4e603c8777e58703@gmail.com', 17570027, 12870717)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (211, N'Mae Billington', 35490835, 2, N'a2474b6ed4b156fc@gmail.com', 26784216, 81730787)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (212, N'Charles Engle', 73399045, 2, N'3eaa856c071dd5d2@gmail.com', 55511299, 14200772)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (213, N'Marilyn Hixon', 55941620, 1, N'2056552aa212a620@gmail.com', 46498166, 22061052)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (214, N'Don Spicer', 66734079, 2, N'b1ecba26d3df5294@gmail.com', 66032450, 75971411)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (215, N'Arthur Howard', 54720755, 1, N'4086a10304bc981a@gmail.com', 34438404, 93825625)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (216, N'Karen Lawson', 87640451, 1, N'1b12e002991aa163@gmail.com', 19723946, 96002459)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (217, N'Joseph Stovall', 18290625, 2, N'7ba1417156351a0f@gmail.com', 62211117, 96169498)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (218, N'Mervin Green', 15201591, 2, N'81fd9c7ad5ff2ab6@gmail.com', 33302271, 91214779)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (219, N'Richard Lamb', 34024485, 1, N'502808fd690a6e1e@gmail.com', 67924352, 74490233)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (220, N'Rafael Smith', 46227151, 2, N'8868982f0da4d5ff@gmail.com', 31576386, 97224346)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (221, N'Cindy Oslund', 50463084, 1, N'1cf68b422e2acc59@gmail.com', 51184249, 83148406)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (222, N'Karen Avenoso', 32496550, 1, N'81264c70cba57cf2@gmail.com', 47029342, 12074907)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (223, N'Janelle Schwartz', 48108738, 2, N'6c5d42d5fc06fbdf@gmail.com', 74107087, 12859635)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (224, N'Joseph Bredesen', 74537601, 2, N'9e3458557e69ee35@gmail.com', 38566571, 42779039)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (225, N'Timothy Miller', 58285889, 2, N'06c4bb64f694f642@gmail.com', 97534243, 29659858)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (226, N'Rodney Keena', 17406287, 2, N'38f02e90d9f3467e@gmail.com', 28546369, 30476672)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (227, N'Henry Mccrudden', 32888744, 1, N'5777a8decd3ae90d@gmail.com', 99996087, 22220068)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (228, N'Deann Romo', 48887569, 2, N'0ebfafbf5c90a80d@gmail.com', 47530009, 67153883)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (229, N'Brandon Mueller', 71471653, 2, N'e282319f34cdca24@gmail.com', 16794635, 88497923)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (230, N'James Voss', 58247117, 2, N'3c96c681a7b63bac@gmail.com', 82574012, 27293225)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (231, N'Charles Cuevas', 95179150, 1, N'aa0744491b4e18d5@gmail.com', 13453520, 37687958)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (232, N'Anna Boren', 40203633, 1, N'ec321639cdf432bc@gmail.com', 61891244, 99742071)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (233, N'James But', 72968899, 2, N'2bcf6ffb3759dcd5@gmail.com', 12630013, 23040023)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (234, N'Kelli Rinderer', 48670896, 1, N'f8996ca6f84b92b3@gmail.com', 43398702, 63192172)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (235, N'Garth Spada', 19595594, 1, N'3e8b0355ec2aaaab@gmail.com', 22296611, 37438490)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (236, N'Nathan Small', 83595593, 1, N'd05936e2bd565252@gmail.com', 77255115, 79406534)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (237, N'Jacqueline Bellanger', 51659978, 1, N'b1535897cea8d650@gmail.com', 35207794, 13282591)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (238, N'Robert Magan', 47824325, 1, N'8f74864e127fb4a7@gmail.com', 42696021, 90977456)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (239, N'Aaron Lew', 37894721, 1, N'd5aadd365262ca72@gmail.com', 69667458, 21959119)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (240, N'Darlene Crittenden', 84592316, 1, N'fb07cacee83f66cb@gmail.com', 27068875, 22176343)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (241, N'Paul Haywood', 88454980, 1, N'f6fa3620fec981a3@gmail.com', 30958895, 64052597)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (242, N'Christopher Karnes', 19459906, 1, N'81de5bd441a576d6@gmail.com', 35657669, 61572559)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (243, N'John Connor', 48674992, 2, N'798260282e20f12c@gmail.com', 50623992, 60538674)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (244, N'Lionel Howard', 54524294, 1, N'a61abb04d56198b2@gmail.com', 61123425, 26631878)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (245, N'Larry Bush', 96712356, 1, N'607260a190926d87@gmail.com', 24187930, 22501634)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (246, N'Olive Metzler', 45403575, 1, N'361df02514e56961@gmail.com', 96356002, 27963836)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (247, N'Gavin Lacy', 38151172, 2, N'16db30081a227e34@gmail.com', 14081130, 38595383)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (248, N'Pauline Rhodes', 67453381, 2, N'd4b12189aebdec6a@gmail.com', 37444661, 85257476)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (249, N'Cody Guffey', 17021426, 1, N'30a1773143f90671@gmail.com', 44239710, 58151387)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (250, N'John Rivera', 25333503, 2, N'0082a01845eeb120@gmail.com', 74268812, 87016593)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (251, N'Victoria Jennings', 48542276, 1, N'28c621fd5cbea58c@gmail.com', 86629565, 95088089)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (252, N'Ida Jackson', 52883660, 1, N'40d8026cf512ea5c@gmail.com', 21290757, 85740772)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (253, N'Robert Alexander', 45993069, 1, N'b76354165414bbba@gmail.com', 29142898, 49712701)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (254, N'Douglas Buttram', 67334293, 1, N'5feccd2740fc8eab@gmail.com', 18720776, 57340767)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (255, N'Alan Brown', 35216234, 1, N'3372a57b86cd3f7b@gmail.com', 27588617, 95979565)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (256, N'Betty Britt', 78849461, 1, N'6cc52aa8aa2ad995@gmail.com', 62916481, 16616151)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (257, N'Michael Bryce', 23816728, 2, N'95a4cc97f276a402@gmail.com', 58973312, 61452622)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (258, N'Andrea Minor', 46160867, 2, N'47a5d09a18aedc2a@gmail.com', 68556882, 59718319)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (259, N'Sharon Cote', 17026688, 2, N'86a9f55d0afc379d@gmail.com', 44177641, 58535178)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (260, N'Rosario Hudson', 82073112, 1, N'76c847d2255c105a@gmail.com', 63957539, 72614109)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (261, N'Lillie Deckard', 49385750, 2, N'db5499f32d793bf1@gmail.com', 63431198, 88713216)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (262, N'Jeff Monterroso', 62009376, 1, N'c2c98b4cca633720@gmail.com', 89420592, 12762325)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (263, N'Melvina Addison', 82521723, 2, N'd695c6c9895a05e2@gmail.com', 84487236, 29421475)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (264, N'Louis Howard', 49018010, 2, N'7c1d570de0289e16@gmail.com', 72460216, 87803512)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (265, N'Lizette Wright', 85478442, 2, N'5a3a34ab28685c14@gmail.com', 68878193, 62297953)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (266, N'John Torain', 95121603, 1, N'6f53f91a548f597c@gmail.com', 56085005, 46930191)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (267, N'George Lewis', 40050834, 2, N'7122908786dfbf0b@gmail.com', 60976509, 94450887)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (268, N'Lawrence Frazier', 87685694, 2, N'5b3f3f0c150d6cda@gmail.com', 73210888, 91337296)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (269, N'Patricia Clark', 79790262, 2, N'8ac6ad59302a780e@gmail.com', 97663403, 47260722)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (270, N'Ted Johnson', 93915086, 1, N'10973f624fa75964@gmail.com', 43582073, 12243054)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (271, N'Alton Reyna', 67244163, 2, N'793db72ed63b0a59@gmail.com', 18577302, 17461217)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (272, N'Marvin Olenius', 27204606, 1, N'9eff099b08b8b9cb@gmail.com', 85676771, 42920512)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (273, N'Mark Sundberg', 80196930, 2, N'7264445de5e84ce8@gmail.com', 77198010, 97891371)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (274, N'Frances Strong', 40187157, 2, N'81a3a04f5138ec9f@gmail.com', 11599916, 42784220)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (275, N'Bruce Measom', 85137875, 1, N'ece2297602a9ad4c@gmail.com', 42246696, 85749981)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (276, N'Guadalupe Montgomery', 60572671, 2, N'e79bf6857223d03d@gmail.com', 51284905, 67762294)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (277, N'Charles Balderas', 94458782, 2, N'ec00f87a786c7e8f@gmail.com', 73577906, 72117480)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (278, N'Frances Flink', 26034617, 1, N'72efb3fcd556b95f@gmail.com', 16682062, 51560226)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (279, N'Irma Semple', 88378342, 2, N'c977548bf59e8374@gmail.com', 78152789, 23927829)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (280, N'Wayne Griess', 60600797, 2, N'd36d238e357c8c11@gmail.com', 57486752, 32324356)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (281, N'Ivonne Messier', 61171759, 2, N'6479e2634714a584@gmail.com', 36713855, 88353112)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (282, N'Dona Ellis', 50035658, 2, N'c9dc96d984f271eb@gmail.com', 53585114, 50495892)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (283, N'Ellen Goatley', 59337235, 1, N'0950133e65711237@gmail.com', 17799182, 11410573)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (284, N'Mark Miranda', 36585473, 2, N'27b9d6fe847ff789@gmail.com', 46307987, 41109209)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (285, N'Bobby Baro', 13927169, 1, N'2e7c44f801324779@gmail.com', 33044574, 45856726)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (286, N'Paul Lee', 68358740, 1, N'5dbc863836546a0b@gmail.com', 69308515, 70536696)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (287, N'Kurtis Lettinga', 79660531, 1, N'0dcc5cffa73ae072@gmail.com', 28039713, 68997527)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (288, N'Paul Rogowski', 46217890, 2, N'c9b1d563c74b2f72@gmail.com', 77222282, 85579798)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (289, N'Paul Bourdier', 92172542, 1, N'9a60156126af7ebb@gmail.com', 46794312, 35498808)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (290, N'Howard Powell', 80125295, 2, N'2a76f0ef4014b3ba@gmail.com', 16069912, 56135505)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (291, N'Lisa Holloway', 88634312, 1, N'd6a6c9191f65714b@gmail.com', 53738267, 25297895)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (292, N'Donna Sam', 27248390, 1, N'adc8e1fccdf947ad@gmail.com', 49885292, 59069293)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (293, N'David Casey', 38902409, 2, N'274c84cf2858e405@gmail.com', 57515708, 58001731)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (294, N'Manuel Mock', 79325988, 1, N'8dad46a8ebae496e@gmail.com', 19918611, 24558201)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (295, N'Michael Sullivan', 95449039, 2, N'a2677eafcb71054b@gmail.com', 90207096, 79144597)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (296, N'Carol Knotts', 83952590, 2, N'22a41b2242ed7f7b@gmail.com', 71088734, 54565546)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (297, N'Bradley Wilson', 37502767, 1, N'1669a9692d3df221@gmail.com', 94150066, 39042870)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (298, N'Mary Adams', 33766281, 2, N'5bc4a55485501378@gmail.com', 49203807, 61045645)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (299, N'Kenneth Stevens', 34531880, 2, N'b3bf7d67e883d818@gmail.com', 25485397, 28901076)
GO
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (300, N'Virginia Ortega', 91301243, 2, N'61538e06aaacde2b@gmail.com', 58764856, 23227735)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (301, N'Jimmie Quisenberry', 33906942, 2, N'c6478c3ba6e5e434@gmail.com', 11696876, 78890153)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (302, N'Dawn Hathaway', 54827332, 2, N'db66b70fd6ff9688@gmail.com', 13839812, 65180033)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (303, N'Amber Fewell', 94711841, 2, N'a189c4f99d4c7094@gmail.com', 46616264, 21680301)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (304, N'Sara Greaves', 45776503, 2, N'630b9c121eabebf8@gmail.com', 89344230, 46193325)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (305, N'Mabel Meador', 94007967, 1, N'4c04d52246922c68@gmail.com', 13988616, 55399640)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (306, N'Leo Mclean', 37788326, 2, N'bbf759e4a5a80827@gmail.com', 51603601, 41654712)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (307, N'Laura Liddy', 40332545, 2, N'e790727014924b79@gmail.com', 52114899, 45099679)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (308, N'Julie Haley', 77410931, 2, N'acc3868cd6b9340d@gmail.com', 78805989, 73047906)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (309, N'Juanita Bartlett', 23996582, 2, N'8b373cc0cfb69492@gmail.com', 53743728, 15531573)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (310, N'Lisa Parker', 29426091, 2, N'3905717cf6b29fce@gmail.com', 85627347, 95903489)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (311, N'Rufus Korsak', 99825854, 2, N'4f04d31e1635f898@gmail.com', 80921908, 30144736)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (312, N'George Bertram', 18685733, 1, N'2a1162d0c50e1da7@gmail.com', 20267182, 84581360)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (313, N'Isabella Boudreaux', 25951054, 2, N'48b6b659a6456a21@gmail.com', 18606316, 32484469)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (314, N'Ronald Tzeremes', 86261597, 1, N'ecc64d571c94d0b7@gmail.com', 90421019, 71391664)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (315, N'Jeffrey Thomas', 26666680, 1, N'234efdd785c064b7@gmail.com', 79647794, 56163708)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (316, N'Orval Soriano', 95250307, 2, N'433fcc5796c057dc@gmail.com', 31415501, 98795821)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (317, N'Lauren Barrett', 49574684, 2, N'6d42de9ded20b0ff@gmail.com', 24699355, 12730828)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (318, N'Darrell Meyer', 39117419, 1, N'0a63698468872144@gmail.com', 21937103, 44493980)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (319, N'James Gibbs', 76864115, 1, N'ce0deb23a957c684@gmail.com', 71961276, 24487825)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (320, N'Joel Body', 46582235, 2, N'ef554a2113d42985@gmail.com', 29504381, 47228980)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (321, N'Erin Housh', 88218520, 2, N'343e2a204a0c3da5@gmail.com', 96696847, 92140571)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (322, N'Thomas Witt', 70118700, 1, N'17e89d45f84c2b67@gmail.com', 25348872, 53166074)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (323, N'Robert Miller', 15195420, 1, N'58591ec7e4669b73@gmail.com', 46273178, 71944978)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (324, N'Joanne Huff', 56098640, 1, N'61c6cb989efdc2a5@gmail.com', 92623101, 20836647)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (325, N'Carol Kyles', 16990224, 1, N'78148b5990bc5710@gmail.com', 59683149, 20296029)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (326, N'Donna Jennings', 81930001, 1, N'7034cf62fd3b3f9e@gmail.com', 99757006, 10787241)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (327, N'William Gutierrez', 38523533, 2, N'bed1e463f67d305f@gmail.com', 31402896, 26321672)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (328, N'Robert Rivera', 96355653, 1, N'f6c0ac24ee9d8743@gmail.com', 90428829, 76794972)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (329, N'Dawn Kain', 48991975, 2, N'9970ff77d9f5c3bd@gmail.com', 35609051, 58646595)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (330, N'Nell Martin', 58695255, 2, N'ce3a266f50669142@gmail.com', 57284013, 82201258)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (331, N'Willie Elwell', 99371079, 1, N'6c464d43baf76b20@gmail.com', 37813579, 91142406)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (332, N'Alfred Franklin', 19775555, 1, N'fe4a50de232b1bce@gmail.com', 80206621, 67260757)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (333, N'Michael Phillips', 49450990, 1, N'a154acfaa8abbb99@gmail.com', 24986684, 25193892)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (334, N'Jose Dunn', 50208469, 1, N'52b05206a06e76ce@gmail.com', 94158297, 95624819)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (335, N'Jewel Fults', 27628954, 2, N'0d65c92ef86a9243@gmail.com', 80400918, 20100020)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (336, N'Dana Willard', 29244830, 1, N'573f1d5d34e09ad0@gmail.com', 25459196, 61133578)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (337, N'Belinda Gallant', 99393657, 1, N'f3043319b8142557@gmail.com', 15876546, 53541633)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (338, N'Anne Rentas', 29766430, 2, N'7146c89ea2f71cf4@gmail.com', 42914277, 12717964)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (339, N'Nelson Linquist', 81610368, 2, N'9076499c78cce33c@gmail.com', 12806401, 22459597)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (340, N'Thomas Hicks', 64776193, 2, N'ae288f74645edc85@gmail.com', 99202676, 50600018)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (341, N'Richard Waldron', 15182431, 1, N'a22bbc9626223d8e@gmail.com', 93592198, 40727268)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (342, N'John Stewart', 36369849, 1, N'5935d71c2a8727be@gmail.com', 47056724, 56243898)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (343, N'Harold Bridges', 77694704, 1, N'630876dc0d7d609e@gmail.com', 18933167, 40244391)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (344, N'Phillip Butler', 62479109, 1, N'b3176c5db75044de@gmail.com', 25854841, 30291934)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (345, N'George Mccullough', 36953625, 2, N'f877f511b3d419b4@gmail.com', 47491383, 28366518)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (346, N'Cathy Smith', 26317292, 1, N'dc129e4686784f6a@gmail.com', 37300946, 19887981)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (347, N'Donnie Price', 80840831, 1, N'fd8f96adf4045c8f@gmail.com', 43799213, 56368105)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (348, N'Irene Rodriguez', 65742830, 1, N'a5b1414b242f31c8@gmail.com', 50016784, 41463835)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (349, N'Timothy Craner', 67107246, 1, N'45722d65700f1f44@gmail.com', 63285368, 49396894)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (350, N'Heather Archer', 11799267, 1, N'097a318b37427715@gmail.com', 47140575, 13556017)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (351, N'Thomas Kent', 80493192, 2, N'744d0fd73e336e95@gmail.com', 45249872, 58166075)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (352, N'Raymond Woods', 99846502, 2, N'c21012cf6dbdd4f1@gmail.com', 19392424, 35472300)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (353, N'Judy Payton', 24917414, 1, N'48f367da177f1d50@gmail.com', 88950136, 16111773)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (354, N'Donna Rios', 21251992, 2, N'c2e12df80b9b24f7@gmail.com', 87174988, 11879709)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (355, N'Mattie Harris', 60378655, 1, N'72e9238e36fe94bd@gmail.com', 51195052, 85178869)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (356, N'Roselle Howard', 30246949, 1, N'a006578bd0e966f8@gmail.com', 26886151, 22753366)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (357, N'Angela Uvalle', 80258475, 1, N'fc286d9e2c71e7c6@gmail.com', 60040860, 25722115)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (358, N'Shirley Ritter', 32471004, 2, N'17ae4b7e5e36b03f@gmail.com', 70712628, 20306141)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (359, N'Nickolas Capriotti', 50774864, 2, N'b2683f65d227bd7e@gmail.com', 33093241, 46589725)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (360, N'Paul Newsome', 21792330, 2, N'441356c80ff5a7ba@gmail.com', 47274718, 40197800)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (361, N'Solange Blackburn', 91616132, 2, N'704d1a2e47dde45b@gmail.com', 50360694, 52016182)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (362, N'Matthew Irish', 89737308, 2, N'7361ab67f3fdda6d@gmail.com', 77043399, 45277888)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (363, N'Elizabeth Mckee', 38066657, 2, N'3a802247fe3b6b6c@gmail.com', 34559901, 28585110)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (364, N'Linda Davis', 77342533, 2, N'c1145053f669ffa5@gmail.com', 33468236, 56816021)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (365, N'Celia Swedenburg', 42819770, 1, N'1893329c814bd09e@gmail.com', 70223576, 11268761)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (366, N'Ora Smith', 49999357, 1, N'c5b0322b239cc3de@gmail.com', 16027093, 57193121)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (367, N'Genevieve Harris', 75640883, 1, N'db244de5ed4b9a40@gmail.com', 11729804, 31779121)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (368, N'Angel Kelly', 60795323, 1, N'21dde38228280e51@gmail.com', 34007262, 83121906)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (369, N'Mary Easterly', 72365833, 1, N'e19a54c9a9f59930@gmail.com', 75875082, 24453802)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (370, N'David Barnes', 70631228, 2, N'81c89a543a4bd7a7@gmail.com', 28197471, 19379163)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (371, N'Joshua Smith', 73643661, 2, N'c23119e4c30641f8@gmail.com', 49984981, 50101127)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (372, N'Vicki Jaculina', 35276590, 1, N'92e12f4de86233e5@gmail.com', 52699536, 25166745)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (373, N'Kenneth Nix', 19116493, 1, N'7e7e47956444bd0e@gmail.com', 28892135, 24900960)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (374, N'Brian Estrada', 63275894, 2, N'bf37ad9986701aaf@gmail.com', 58025312, 55808775)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (375, N'Nancy Bottoni', 76381888, 1, N'6caab07c8d9512a3@gmail.com', 47739892, 24262135)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (376, N'Ronald Mancil', 88806857, 1, N'6080a1fe15e0b791@gmail.com', 91499985, 82592883)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (377, N'Maria Gonzales', 47244748, 2, N'3a9735ddea90cfcc@gmail.com', 10356149, 69520136)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (378, N'Minerva Fuller', 35934926, 2, N'9ca755ccf0f6b379@gmail.com', 79451733, 77887896)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (379, N'Lilly Piercy', 78377031, 2, N'1c46f279d580ce72@gmail.com', 56736200, 89506512)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (380, N'Amy Brantley', 87661560, 1, N'33b1a318ff145919@gmail.com', 91995839, 59084925)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (381, N'Timothy Debonis', 55952080, 1, N'7fe61ccfd4ec4f28@gmail.com', 55046632, 87541244)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (382, N'Harold Watson', 14542592, 1, N'de0247cd49e7b195@gmail.com', 46523946, 61328308)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (383, N'Barbara Davis', 83868570, 2, N'1dc958b5a50bc844@gmail.com', 14670623, 37913316)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (384, N'James Porter', 93866590, 2, N'd5e6a7d3ebe56421@gmail.com', 62058355, 51008779)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (385, N'Christopher Hershberger', 44248974, 2, N'974cdfbcf6230956@gmail.com', 81215565, 62150602)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (386, N'David Sparks', 99706360, 2, N'fcee80876aeef822@gmail.com', 92864103, 34620529)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (387, N'William Vinion', 55208648, 1, N'851d55caf6aa928a@gmail.com', 64786239, 84172461)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (388, N'Natalie Mccue', 91834132, 1, N'572d171368bfa351@gmail.com', 83697097, 55594522)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (389, N'Horacio Espinoza', 68342393, 2, N'e49cd3710ff3f397@gmail.com', 67360141, 82610889)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (390, N'Joyce Downing', 47357380, 2, N'c561c5d3537b853c@gmail.com', 31720781, 78558780)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (391, N'Marty King', 46394652, 2, N'9ef6e3de29251375@gmail.com', 64268437, 25756572)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (392, N'Emily Puertas', 19086342, 1, N'f6c651d93cb99e75@gmail.com', 70136023, 97458491)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (393, N'Steve Wright', 68431617, 2, N'8635d11333695a74@gmail.com', 32012580, 76222676)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (394, N'Mary Knight', 71973825, 1, N'a8c63ab9f43f2053@gmail.com', 84841829, 60335209)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (395, N'Steven Breau', 83154180, 1, N'76d0b8255fe67fe4@gmail.com', 74096330, 41062094)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (396, N'Francis Osterhoudt', 33219721, 2, N'8caf9d1557696941@gmail.com', 22124984, 47575786)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (397, N'Ira Otto', 68134151, 1, N'643173594cb8b596@gmail.com', 89431304, 48319250)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (398, N'Glynda Harris', 81252854, 1, N'2300e45f3395e5a6@gmail.com', 87636644, 43370201)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (399, N'Amie Hill', 92444680, 2, N'd2d23ddc1c2cf23c@gmail.com', 61800287, 27542011)
GO
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (400, N'Sharon Bartolome', 94258007, 2, N'e352f4f56837b577@gmail.com', 49455174, 80977542)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (401, N'Michael Deleon', 65097084, 1, N'cddb25b7df788d97@gmail.com', 34119722, 73551512)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (402, N'William Artman', 87448732, 1, N'a8ada9f039be695f@gmail.com', 90718869, 79042872)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (403, N'Lula Pidgeon', 52990052, 2, N'aaff1fe6633393f6@gmail.com', 62461203, 26067627)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (404, N'Kenneth Bernhart', 99973398, 2, N'e635bbc396d848a5@gmail.com', 44622140, 77130167)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (405, N'Wendie Deal', 67368968, 1, N'a628eb30a3f30da6@gmail.com', 20917451, 24497748)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (406, N'Eric Strickland', 67893652, 1, N'e6fe5cf5ba7082f4@gmail.com', 92871456, 18855281)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (407, N'Enedina Yoder', 59354821, 2, N'861c82824259d34e@gmail.com', 96502522, 24016712)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (408, N'Natasha Funderburk', 85579710, 2, N'279720c1e38e4a9d@gmail.com', 64261363, 92193762)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (409, N'Alice Dupont', 88546541, 2, N'6a92bf957a31e631@gmail.com', 90974405, 40903864)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (410, N'Russell Floyd', 30862518, 2, N'12a492269daa43fb@gmail.com', 98347582, 28015871)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (411, N'Ann Foley', 10391080, 2, N'21ca4fe0e9af65ca@gmail.com', 27024501, 26114257)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (412, N'Edward Larson', 25264461, 1, N'50e0477535b853a3@gmail.com', 46476564, 61253032)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (413, N'Molly Samora', 31485222, 1, N'f647f92213da501d@gmail.com', 36037957, 65811482)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (414, N'Paul Hook', 21823741, 1, N'31526f0d37c87bb2@gmail.com', 15435571, 38650695)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (415, N'Bernice Gonzalez', 56409784, 1, N'a7a5357887ec32e5@gmail.com', 27654115, 57637934)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (416, N'Jean Fernandez', 45830976, 1, N'781b7069d0b13a44@gmail.com', 67577943, 51466647)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (417, N'Gail Tate', 51630972, 2, N'233a119a3f7f1dbb@gmail.com', 16978551, 92891558)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (418, N'Susan Milne', 62131397, 1, N'59efd4a70c25dd64@gmail.com', 11483043, 52004456)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (419, N'Mathew Molnar', 71780086, 1, N'0e04bdd48c78172b@gmail.com', 32598946, 74852917)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (420, N'Mathew Swalley', 54308636, 1, N'6cc17c253e1e1115@gmail.com', 79013048, 34858926)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (421, N'Robert Robinson', 46797759, 1, N'e38e7fe64eab20ae@gmail.com', 19127744, 15982365)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (422, N'Jacqueline Heard', 20020597, 2, N'0c5675acafb37af0@gmail.com', 23901503, 20064839)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (423, N'Kathleen Holland', 70451905, 2, N'901be3a0c869b28e@gmail.com', 40531346, 50902210)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (424, N'Sandra Bowlin', 15616733, 1, N'422922ab396aa2fb@gmail.com', 16112969, 67051793)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (425, N'Glenn Herrera', 83431384, 1, N'ba67886abaf0ff07@gmail.com', 95208976, 80485357)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (426, N'Angela Gonzalez', 33124214, 2, N'7837d8e6ab989e5a@gmail.com', 88085329, 89349193)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (427, N'Mary Taylor', 82475055, 1, N'a4d90c011cb017c8@gmail.com', 80496592, 20200022)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (428, N'Robyn Briggs', 33463680, 2, N'999cccaad45aa265@gmail.com', 96449491, 96118550)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (429, N'Max Sandoval', 63006960, 2, N'730078127312e18c@gmail.com', 77540007, 11176369)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (430, N'Manuel Kanady', 10300541, 1, N'10485e02d54f50ee@gmail.com', 49252016, 19479264)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (431, N'Gloria Bryant', 49541945, 1, N'7a642c1c57ca6e71@gmail.com', 43686642, 79001001)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (432, N'Ethel Scarborough', 26785974, 2, N'09e93b2750d03330@gmail.com', 85655540, 63580802)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (433, N'Margarite Leyva', 38796348, 1, N'f0b2838bb710642d@gmail.com', 69113976, 77653054)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (434, N'Melissa Hinger', 96305917, 2, N'7568b53b23014c0f@gmail.com', 70162667, 78292092)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (435, N'Robyn Vigil', 26474075, 1, N'd21e27e480000d15@gmail.com', 18687866, 42253160)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (436, N'Mildred Tomes', 53665202, 2, N'8c3647d2325cfacd@gmail.com', 36752389, 11734159)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (437, N'Louann King', 88585688, 2, N'4e6d7d84ed4d9a9d@gmail.com', 62520437, 30838738)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (438, N'Ray Shafer', 21050294, 2, N'6c0c14e07ec5df00@gmail.com', 48672164, 15941683)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (439, N'Brian Terry', 78478904, 2, N'7dfb58472906c3d3@gmail.com', 85891953, 63406175)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (440, N'Douglas Federico', 75847005, 2, N'0dc95143afa6437f@gmail.com', 46858981, 58441929)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (441, N'Rachel Reed', 41270092, 2, N'aa4d2b7bd3ca0166@gmail.com', 72152365, 11320753)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (442, N'Robert Mcomber', 55349519, 1, N'cc5492cf56abac7f@gmail.com', 55185883, 42712687)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (443, N'Ernest Williams', 98555005, 2, N'b5c4327b35d8046d@gmail.com', 66650308, 57322864)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (444, N'Teresa Stewart', 77220884, 1, N'8a5c324d771ae80b@gmail.com', 67514560, 45382365)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (445, N'James Piazza', 10834054, 2, N'6319f608426f649c@gmail.com', 92356257, 83996741)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (446, N'Micheal Gottfried', 83401043, 1, N'c802d7494f02a909@gmail.com', 61668889, 69265540)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (447, N'William Rhodes', 97936035, 1, N'a6e05a3cc9d70b04@gmail.com', 20075195, 87263708)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (448, N'Clinton Hoffman', 54988717, 1, N'd49dea400e4e5644@gmail.com', 81012109, 47450762)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (449, N'Katie Pelletier', 68448936, 1, N'fce0302b3b0d7377@gmail.com', 54588506, 68335239)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (450, N'Betty Painter', 67352410, 2, N'ae74875d87487e3a@gmail.com', 75472611, 55723957)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (451, N'Mike Kettl', 14147831, 1, N'9d96c72252d85e6c@gmail.com', 89559640, 40721221)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (452, N'Christopher Standen', 63214791, 2, N'abbee52666f9054d@gmail.com', 97613695, 38207692)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (453, N'Ernestine Lee', 88270728, 2, N'5f8f42ccd2925841@gmail.com', 26016039, 86932608)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (454, N'Linda Bustos', 21989737, 2, N'fdc1045dc45f62b9@gmail.com', 93815833, 88638167)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (455, N'James Downs', 68621498, 1, N'dc8c747256078127@gmail.com', 98075532, 50097193)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (456, N'Henry Roy', 10323165, 1, N'87e9cfa07371645b@gmail.com', 71842259, 33254410)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (457, N'Glenn Pauley', 19435710, 2, N'39eec690c748daf8@gmail.com', 82581214, 85921376)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (458, N'Joe Giron', 53617073, 2, N'729f0bb0c4e5bdd2@gmail.com', 61912555, 26007643)
INSERT [dbo].[Persona] ([ID], [Nombre], [ValorDocId], [IdTipoDoc], [email], [telefono1], [telefono2]) VALUES (459, N'Alexis Hall', 94139367, 1, N'47aa9bcfda120f21@gmail.com', 96735969, 33105118)
SET IDENTITY_INSERT [dbo].[Persona] OFF
GO
SET IDENTITY_INSERT [dbo].[Propiedad] ON 

INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (1, 1796, N'3096482932', CAST(N'2000-10-10' AS Date), 5, 2, 1853)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (2, 888, N'2473166729', CAST(N'2000-10-10' AS Date), 5, 1, 2212)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (3, 793, N'4314758516', CAST(N'2000-10-10' AS Date), 2, 5, 2022)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (4, 1063, N'3207886550', CAST(N'2000-10-10' AS Date), 2, 3, 1304)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (5, 1267, N'6960703485', CAST(N'2000-10-10' AS Date), 2, 3, 1873)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (6, 1197, N'7203086021', CAST(N'2000-10-10' AS Date), 1, 3, 1231)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (7, 1781, N'3775041394', CAST(N'2000-10-10' AS Date), 1, 1, 3781)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (8, 1510, N'6004776606', CAST(N'2000-10-10' AS Date), 1, 5, 1506)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (9, 1163, N'3660868791', CAST(N'2000-10-10' AS Date), 3, 2, 3411)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (10, 1478, N'8874700457', CAST(N'2000-10-10' AS Date), 3, 1, 2458)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (11, 1359, N'3335375828', CAST(N'2000-10-10' AS Date), 3, 3, 1312)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (12, 1307, N'3929708069', CAST(N'2000-10-10' AS Date), 4, 4, 2845)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (13, 1965, N'4659421353', CAST(N'2000-10-10' AS Date), 4, 5, 2557)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (14, 1071, N'9082477699', CAST(N'2000-10-10' AS Date), 4, 2, 3391)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (15, 540, N'7460596186', CAST(N'2000-10-10' AS Date), 5, 3, 3568)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (16, 978, N'6341501483', CAST(N'2000-10-10' AS Date), 5, 3, 2310)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (17, 1780, N'4978009864', CAST(N'2000-10-10' AS Date), 2, 1, 1070)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (18, 702, N'8526966367', CAST(N'2000-10-10' AS Date), 2, 5, 2556)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (19, 1828, N'8485613036', CAST(N'2000-10-10' AS Date), 2, 5, 1123)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (20, 596, N'4357456239', CAST(N'2000-10-10' AS Date), 2, 2, 1320)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (21, 1416, N'6535938294', CAST(N'2000-10-10' AS Date), 2, 1, 1787)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (22, 1534, N'8784574040', CAST(N'2000-10-10' AS Date), 2, 5, 3333)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (23, 1112, N'7937779729', CAST(N'2000-10-10' AS Date), 1, 3, 3027)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (24, 757, N'6230622883', CAST(N'2000-10-10' AS Date), 3, 2, 2509)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (25, 1515, N'9409928861', CAST(N'2000-10-10' AS Date), 3, 5, 2403)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (26, 1269, N'5085081976', CAST(N'2000-10-10' AS Date), 4, 4, 3435)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (27, 1434, N'3366500696', CAST(N'2000-10-10' AS Date), 4, 4, 3999)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (28, 858, N'6877519015', CAST(N'2000-10-10' AS Date), 4, 1, 1665)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (29, 1176, N'4942654680', CAST(N'2000-10-10' AS Date), 5, 3, 3723)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (30, 1739, N'8593777044', CAST(N'2000-10-10' AS Date), 2, 1, 1959)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (31, 1646, N'1664646015', CAST(N'2000-10-10' AS Date), 2, 3, 1453)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (32, 883, N'3075689350', CAST(N'2000-10-10' AS Date), 2, 2, 3621)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (33, 1574, N'5900372835', CAST(N'2000-10-10' AS Date), 2, 1, 2185)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (34, 1423, N'7847310426', CAST(N'2000-10-10' AS Date), 1, 1, 3233)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (35, 602, N'6946606320', CAST(N'2000-10-10' AS Date), 1, 5, 2098)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (36, 1308, N'1621747893', CAST(N'2000-10-10' AS Date), 3, 3, 2514)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (37, 648, N'4156548966', CAST(N'2000-10-10' AS Date), 4, 4, 1356)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (38, 1140, N'3364912606', CAST(N'2000-10-10' AS Date), 4, 3, 2492)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (39, 727, N'3952635315', CAST(N'2000-10-10' AS Date), 4, 5, 2909)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (40, 1050, N'3969948177', CAST(N'2000-10-10' AS Date), 4, 4, 3088)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (41, 834, N'9431263565', CAST(N'2000-10-10' AS Date), 5, 1, 2029)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (42, 1847, N'8515726836', CAST(N'2000-10-10' AS Date), 5, 2, 3777)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (43, 796, N'3336063790', CAST(N'2000-10-10' AS Date), 5, 1, 1224)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (44, 1413, N'7392078456', CAST(N'2000-10-10' AS Date), 5, 2, 2359)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (45, 867, N'7783920351', CAST(N'2000-10-10' AS Date), 2, 3, 3335)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (46, 902, N'4199107945', CAST(N'2000-10-10' AS Date), 2, 1, 2363)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (47, 886, N'4027060308', CAST(N'2000-10-10' AS Date), 2, 2, 1302)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (48, 1120, N'2880364417', CAST(N'2000-10-10' AS Date), 1, 1, 1695)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (49, 991, N'9253447756', CAST(N'2000-10-10' AS Date), 1, 2, 1420)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (50, 866, N'6512952708', CAST(N'2000-10-10' AS Date), 3, 5, 3910)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (51, 1233, N'9659546545', CAST(N'2000-10-10' AS Date), 3, 5, 3959)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (52, 1290, N'3460299279', CAST(N'2000-10-10' AS Date), 4, 4, 1915)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (53, 483, N'3080086044', CAST(N'2000-10-10' AS Date), 4, 1, 2766)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (54, 1445, N'5432830647', CAST(N'2000-10-10' AS Date), 4, 2, 2563)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (55, 1398, N'7190773821', CAST(N'2000-10-10' AS Date), 4, 1, 2069)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (56, 1632, N'2056762822', CAST(N'2000-10-10' AS Date), 5, 2, 1089)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (57, 866, N'6406732306', CAST(N'2000-10-10' AS Date), 5, 4, 2308)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (58, 1117, N'7746958106', CAST(N'2000-10-10' AS Date), 5, 4, 2192)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (59, 1245, N'3348493044', CAST(N'2000-10-10' AS Date), 5, 1, 3539)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (60, 1473, N'8927725120', CAST(N'2000-10-10' AS Date), 2, 3, 2915)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (61, 1491, N'8452204631', CAST(N'2000-10-10' AS Date), 2, 4, 3832)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (62, 1908, N'1190165763', CAST(N'2000-10-10' AS Date), 2, 4, 3247)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (63, 1793, N'3430036274', CAST(N'2000-10-10' AS Date), 2, 2, 1539)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (64, 1427, N'1931259414', CAST(N'2000-10-10' AS Date), 2, 4, 1696)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (65, 578, N'1184819874', CAST(N'2000-10-10' AS Date), 1, 3, 2974)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (66, 2000, N'3923712091', CAST(N'2000-10-10' AS Date), 1, 3, 1587)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (67, 775, N'8511846795', CAST(N'2000-10-10' AS Date), 1, 5, 2514)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (68, 1543, N'8695406070', CAST(N'2000-10-10' AS Date), 3, 1, 3005)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (69, 1765, N'5917289219', CAST(N'2000-10-10' AS Date), 3, 5, 2742)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (70, 1012, N'9931859449', CAST(N'2000-10-10' AS Date), 4, 3, 1865)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (71, 1234, N'9489621779', CAST(N'2000-10-10' AS Date), 5, 4, 2687)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (72, 1313, N'2467740497', CAST(N'2000-10-10' AS Date), 5, 5, 2724)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (73, 762, N'7712335411', CAST(N'2000-10-10' AS Date), 5, 4, 2213)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (74, 1533, N'1270755991', CAST(N'2000-10-10' AS Date), 5, 3, 2371)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (75, 1193, N'6664115727', CAST(N'2000-10-10' AS Date), 5, 4, 2811)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (76, 1163, N'2143800479', CAST(N'2000-10-10' AS Date), 5, 3, 1767)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (77, 686, N'8940183361', CAST(N'2000-10-10' AS Date), 2, 5, 2149)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (78, 1781, N'7289034947', CAST(N'2000-10-10' AS Date), 2, 1, 2434)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (79, 1885, N'3485311146', CAST(N'2000-10-10' AS Date), 2, 2, 2098)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (80, 1481, N'2786769918', CAST(N'2000-10-10' AS Date), 1, 1, 1997)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (81, 624, N'6742905570', CAST(N'2000-10-10' AS Date), 1, 1, 1843)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (82, 1777, N'2412310087', CAST(N'2000-10-10' AS Date), 1, 2, 1745)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (83, 652, N'2281327906', CAST(N'2000-10-10' AS Date), 1, 3, 1091)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (84, 1425, N'9000349610', CAST(N'2000-10-10' AS Date), 3, 2, 2507)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (85, 1826, N'7605619779', CAST(N'2000-10-10' AS Date), 4, 4, 1341)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (86, 984, N'2521250619', CAST(N'2000-10-10' AS Date), 4, 1, 2937)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (87, 1693, N'4343758254', CAST(N'2000-10-10' AS Date), 5, 2, 1147)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (88, 1616, N'1864996400', CAST(N'2000-10-10' AS Date), 5, 3, 1540)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (89, 1922, N'6003934282', CAST(N'2000-10-10' AS Date), 5, 5, 1033)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (90, 1096, N'3088668113', CAST(N'2000-10-10' AS Date), 5, 1, 1759)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (91, 1737, N'1951037248', CAST(N'2000-10-10' AS Date), 5, 2, 1788)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (92, 1186, N'7231050160', CAST(N'2000-10-10' AS Date), 2, 4, 2974)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (93, 1517, N'5222807400', CAST(N'2000-10-10' AS Date), 1, 4, 3095)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (94, 881, N'5766768884', CAST(N'2000-10-10' AS Date), 1, 1, 3208)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (95, 548, N'8688487067', CAST(N'2000-10-10' AS Date), 1, 2, 3256)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (96, 1244, N'7274353306', CAST(N'2000-10-10' AS Date), 1, 4, 1307)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (97, 1228, N'3524623100', CAST(N'2000-10-10' AS Date), 3, 2, 3428)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (98, 1201, N'7973512470', CAST(N'2000-10-10' AS Date), 3, 5, 2923)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (99, 1333, N'5018252216', CAST(N'2000-10-10' AS Date), 3, 1, 1066)
GO
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (100, 1592, N'5010755583', CAST(N'2000-10-10' AS Date), 3, 4, 3755)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (101, 1522, N'5333766264', CAST(N'2000-10-10' AS Date), 3, 1, 3746)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (102, 1010, N'4163065284', CAST(N'2000-10-10' AS Date), 5, 2, 3643)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (103, 1322, N'1248419976', CAST(N'2000-10-10' AS Date), 5, 3, 1646)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (104, 1091, N'3503573322', CAST(N'2000-10-10' AS Date), 2, 5, 1530)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (105, 594, N'8933518603', CAST(N'2000-10-10' AS Date), 2, 1, 1651)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (106, 1619, N'9639088555', CAST(N'2000-10-10' AS Date), 2, 5, 3990)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (107, 1571, N'3307720178', CAST(N'2000-10-10' AS Date), 1, 2, 3404)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (108, 1204, N'1815458516', CAST(N'2000-10-10' AS Date), 1, 1, 3190)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (109, 768, N'1729587001', CAST(N'2000-10-10' AS Date), 1, 5, 1886)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (110, 1614, N'8100046720', CAST(N'2000-10-10' AS Date), 4, 2, 1377)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (111, 723, N'7049027941', CAST(N'2000-10-10' AS Date), 5, 4, 1279)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (112, 1642, N'6973325036', CAST(N'2000-10-10' AS Date), 5, 4, 2990)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (113, 1845, N'5264034232', CAST(N'2000-10-10' AS Date), 5, 4, 1314)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (114, 1190, N'8174810510', CAST(N'2000-10-10' AS Date), 2, 3, 3511)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (115, 561, N'6523183333', CAST(N'2000-10-10' AS Date), 2, 4, 3918)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (116, 496, N'4922953797', CAST(N'2000-10-10' AS Date), 2, 2, 3009)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (117, 1720, N'7353777684', CAST(N'2000-10-10' AS Date), 1, 2, 1110)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (118, 603, N'8821538259', CAST(N'2000-10-10' AS Date), 3, 4, 1712)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (119, 1819, N'2676863852', CAST(N'2000-10-10' AS Date), 3, 2, 1810)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (120, 1914, N'5995662469', CAST(N'2000-10-10' AS Date), 4, 5, 3031)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (121, 1762, N'6645135773', CAST(N'2000-10-10' AS Date), 4, 4, 3931)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (122, 1416, N'7730305608', CAST(N'2000-10-10' AS Date), 4, 2, 3944)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (123, 1212, N'5061261929', CAST(N'2000-10-10' AS Date), 2, 3, 3716)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (124, 1715, N'4284604927', CAST(N'2000-10-10' AS Date), 2, 2, 2005)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (125, 851, N'8464343744', CAST(N'2000-10-10' AS Date), 2, 3, 1534)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (126, 1885, N'6542638065', CAST(N'2000-10-10' AS Date), 2, 2, 2575)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (127, 1459, N'4943561436', CAST(N'2000-10-10' AS Date), 1, 4, 3587)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (128, 1583, N'7327939158', CAST(N'2000-10-10' AS Date), 1, 2, 1632)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (129, 1356, N'7126368948', CAST(N'2000-10-10' AS Date), 1, 3, 2039)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (130, 1027, N'2676150208', CAST(N'2000-10-10' AS Date), 1, 1, 2440)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (131, 1351, N'1636390846', CAST(N'2000-10-10' AS Date), 3, 3, 2099)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (132, 981, N'1429245868', CAST(N'2000-10-10' AS Date), 4, 3, 2341)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (133, 1280, N'4089828122', CAST(N'2000-10-10' AS Date), 4, 1, 2479)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (134, 870, N'4914888387', CAST(N'2000-10-10' AS Date), 4, 3, 1438)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (135, 1035, N'9864553090', CAST(N'2000-10-10' AS Date), 4, 3, 3226)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (136, 901, N'7454215936', CAST(N'2000-10-10' AS Date), 4, 5, 1730)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (137, 1390, N'8688442709', CAST(N'2000-10-10' AS Date), 4, 4, 1435)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (138, 1833, N'1624684230', CAST(N'2000-10-10' AS Date), 4, 1, 2508)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (139, 1380, N'1433712714', CAST(N'2000-10-10' AS Date), 5, 5, 1628)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (140, 1003, N'2070622353', CAST(N'2000-10-10' AS Date), 5, 3, 2123)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (141, 1518, N'8361044157', CAST(N'2000-10-10' AS Date), 2, 4, 3576)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (142, 956, N'6347890714', CAST(N'2000-10-10' AS Date), 2, 3, 2010)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (143, 754, N'8434729160', CAST(N'2000-10-10' AS Date), 1, 4, 1530)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (144, 1272, N'5086850205', CAST(N'2000-10-10' AS Date), 1, 4, 3974)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (145, 724, N'4012274739', CAST(N'2000-10-10' AS Date), 1, 2, 3998)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (146, 1337, N'3446514681', CAST(N'2000-10-10' AS Date), 3, 5, 3796)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (147, 881, N'3348045841', CAST(N'2000-10-10' AS Date), 3, 5, 2860)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (148, 1380, N'2911352006', CAST(N'2000-10-10' AS Date), 3, 3, 1594)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (149, 752, N'5499557875', CAST(N'2000-10-10' AS Date), 4, 3, 2550)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (150, 1624, N'7054823978', CAST(N'2000-10-10' AS Date), 4, 4, 3467)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (151, 1602, N'7405434798', CAST(N'2000-10-10' AS Date), 4, 5, 1487)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (152, 783, N'2870133351', CAST(N'2000-10-10' AS Date), 4, 5, 2230)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (153, 1690, N'3566379017', CAST(N'2000-10-10' AS Date), 2, 4, 1566)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (154, 2000, N'3826783855', CAST(N'2000-10-10' AS Date), 1, 5, 2489)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (155, 811, N'5123555342', CAST(N'2000-10-10' AS Date), 1, 3, 3278)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (156, 1854, N'8711866003', CAST(N'2000-10-10' AS Date), 3, 5, 1143)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (157, 1416, N'6232132174', CAST(N'2000-10-10' AS Date), 3, 1, 3605)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (158, 1626, N'4870522638', CAST(N'2000-10-10' AS Date), 3, 5, 3256)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (159, 1188, N'8245838236', CAST(N'2000-10-10' AS Date), 3, 3, 1539)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (160, 1845, N'7708693799', CAST(N'2000-10-10' AS Date), 3, 4, 2733)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (161, 1156, N'3467087974', CAST(N'2000-10-10' AS Date), 3, 2, 2130)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (162, 1897, N'9963287077', CAST(N'2000-10-10' AS Date), 3, 4, 3215)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (163, 1169, N'3728866054', CAST(N'2000-10-10' AS Date), 4, 3, 1723)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (164, 1026, N'1819762260', CAST(N'2000-10-10' AS Date), 4, 2, 1952)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (165, 801, N'2343383933', CAST(N'2000-10-10' AS Date), 4, 5, 1260)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (166, 1601, N'9120442252', CAST(N'2000-10-10' AS Date), 5, 3, 2998)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (167, 1511, N'9464798523', CAST(N'2000-10-10' AS Date), 5, 3, 2421)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (168, 951, N'6617298827', CAST(N'2000-10-10' AS Date), 2, 4, 1698)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (169, 1673, N'5278619783', CAST(N'2000-10-10' AS Date), 2, 5, 3037)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (170, 1508, N'9119108636', CAST(N'2000-10-10' AS Date), 1, 2, 1440)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (171, 697, N'6299396662', CAST(N'2000-10-10' AS Date), 1, 2, 2485)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (172, 651, N'2694000368', CAST(N'2000-10-10' AS Date), 1, 2, 1876)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (173, 1919, N'7808971348', CAST(N'2000-10-10' AS Date), 3, 4, 1717)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (174, 1131, N'7979727944', CAST(N'2000-10-10' AS Date), 3, 3, 1612)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (175, 1810, N'9125761786', CAST(N'2000-10-10' AS Date), 4, 2, 2211)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (176, 1200, N'3940872351', CAST(N'2000-10-10' AS Date), 5, 2, 2735)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (177, 569, N'7287762180', CAST(N'2000-10-10' AS Date), 5, 1, 3502)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (178, 642, N'5563737186', CAST(N'2000-10-10' AS Date), 5, 3, 1904)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (179, 1456, N'6446102663', CAST(N'2000-10-10' AS Date), 5, 3, 1319)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (180, 561, N'3344652098', CAST(N'2000-10-10' AS Date), 2, 4, 2294)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (181, 1660, N'8144253033', CAST(N'2000-10-10' AS Date), 1, 1, 2656)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (182, 1642, N'1744846141', CAST(N'2000-10-10' AS Date), 1, 4, 3978)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (183, 1639, N'8368739336', CAST(N'2000-10-10' AS Date), 1, 2, 3155)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (184, 1144, N'6495413547', CAST(N'2000-10-10' AS Date), 3, 5, 1558)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (185, 1454, N'8925234815', CAST(N'2000-10-10' AS Date), 3, 2, 2813)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (186, 1278, N'5981939835', CAST(N'2000-10-10' AS Date), 3, 1, 3786)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (187, 1438, N'1870799888', CAST(N'2000-10-10' AS Date), 3, 3, 2274)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (188, 1987, N'7671917971', CAST(N'2000-10-10' AS Date), 5, 2, 3238)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (189, 1469, N'1032052859', CAST(N'2000-10-10' AS Date), 5, 4, 3690)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (190, 1477, N'6116827441', CAST(N'2000-10-10' AS Date), 5, 3, 2194)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (191, 830, N'1725984705', CAST(N'2000-10-10' AS Date), 5, 1, 2704)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (192, 633, N'2244195801', CAST(N'2000-10-10' AS Date), 2, 1, 1935)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (193, 1238, N'2808629124', CAST(N'2000-10-10' AS Date), 2, 5, 2222)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (194, 980, N'3804239746', CAST(N'2000-10-10' AS Date), 2, 1, 2971)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (195, 751, N'9390935753', CAST(N'2000-10-10' AS Date), 1, 5, 1843)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (196, 727, N'1089726490', CAST(N'2000-10-10' AS Date), 1, 2, 2530)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (197, 1414, N'5016846146', CAST(N'2000-10-10' AS Date), 1, 4, 2735)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (198, 1289, N'6448030511', CAST(N'2000-10-10' AS Date), 3, 5, 2379)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (199, 1154, N'9942392861', CAST(N'2000-10-10' AS Date), 3, 3, 2779)
GO
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (200, 1353, N'5345049124', CAST(N'2000-10-10' AS Date), 3, 5, 3185)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (201, 1611, N'5964520778', CAST(N'2000-10-10' AS Date), 4, 4, 2580)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (202, 1656, N'5792119474', CAST(N'2000-10-10' AS Date), 5, 2, 3192)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (203, 1158, N'1221498559', CAST(N'2000-10-10' AS Date), 5, 4, 2437)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (204, 1665, N'7849117125', CAST(N'2000-10-10' AS Date), 2, 5, 3014)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (205, 760, N'3632936782', CAST(N'2000-10-10' AS Date), 2, 5, 2760)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (206, 1310, N'1138461153', CAST(N'2000-10-10' AS Date), 1, 3, 1539)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (207, 1437, N'6120744504', CAST(N'2000-10-10' AS Date), 1, 2, 3387)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (208, 1259, N'9581798169', CAST(N'2000-10-10' AS Date), 1, 2, 3391)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (209, 1680, N'4249199846', CAST(N'2000-10-10' AS Date), 3, 1, 3921)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (210, 611, N'1412884755', CAST(N'2000-10-10' AS Date), 3, 3, 3416)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (211, 1800, N'5800524735', CAST(N'2000-10-10' AS Date), 4, 4, 3156)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (212, 971, N'2736799335', CAST(N'2000-10-10' AS Date), 4, 1, 3187)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (213, 841, N'1262239907', CAST(N'2000-10-10' AS Date), 4, 4, 3288)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (214, 1454, N'6427292786', CAST(N'2000-10-10' AS Date), 4, 1, 1510)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (215, 885, N'4180521158', CAST(N'2000-10-10' AS Date), 5, 3, 1674)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (216, 770, N'2838815313', CAST(N'2000-10-10' AS Date), 5, 4, 2760)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (217, 1908, N'1104222080', CAST(N'2000-10-10' AS Date), 5, 3, 2914)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (218, 1888, N'3487953451', CAST(N'2000-10-10' AS Date), 5, 1, 1347)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (219, 706, N'5742532274', CAST(N'2000-10-10' AS Date), 2, 3, 3417)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (220, 1032, N'4658786977', CAST(N'2000-10-10' AS Date), 1, 1, 1774)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (221, 1831, N'5454127080', CAST(N'2000-10-10' AS Date), 1, 3, 2604)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (222, 1194, N'9103692454', CAST(N'2000-10-10' AS Date), 1, 5, 1508)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (223, 824, N'3024707722', CAST(N'2000-10-10' AS Date), 1, 2, 2869)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (224, 1625, N'1063606366', CAST(N'2000-10-10' AS Date), 4, 2, 2677)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (225, 1422, N'6780570057', CAST(N'2000-10-10' AS Date), 4, 3, 1465)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (226, 564, N'7865849511', CAST(N'2000-10-10' AS Date), 5, 5, 3038)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (227, 830, N'2411313142', CAST(N'2000-10-10' AS Date), 5, 5, 3225)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (228, 1975, N'4054660957', CAST(N'2000-10-10' AS Date), 2, 3, 3283)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (229, 1983, N'6881559958', CAST(N'2000-10-10' AS Date), 2, 5, 3284)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (230, 1201, N'8629263611', CAST(N'2000-10-10' AS Date), 2, 2, 3499)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (231, 822, N'7217678380', CAST(N'2000-10-10' AS Date), 1, 3, 2764)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (232, 987, N'9629655085', CAST(N'2000-10-10' AS Date), 1, 1, 2758)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (233, 790, N'3699790271', CAST(N'2000-10-10' AS Date), 3, 5, 2730)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (234, 1113, N'2161130161', CAST(N'2000-10-10' AS Date), 3, 5, 2330)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (235, 1478, N'4946138443', CAST(N'2000-10-10' AS Date), 3, 5, 2156)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (236, 473, N'2560775517', CAST(N'2000-10-10' AS Date), 4, 4, 2990)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (237, 871, N'1668836736', CAST(N'2000-10-10' AS Date), 5, 4, 1217)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (238, 1730, N'3662169334', CAST(N'2000-10-10' AS Date), 2, 2, 2504)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (239, 1361, N'8398701617', CAST(N'2000-10-10' AS Date), 2, 1, 3725)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (240, 859, N'2874232663', CAST(N'2000-10-10' AS Date), 2, 3, 3731)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (241, 1419, N'6173511768', CAST(N'2000-10-10' AS Date), 3, 2, 2412)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (242, 992, N'8155777805', CAST(N'2000-10-10' AS Date), 3, 5, 3878)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (243, 1441, N'7706781569', CAST(N'2000-10-10' AS Date), 3, 4, 1522)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (244, 670, N'1621639464', CAST(N'2000-10-10' AS Date), 4, 1, 1170)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (245, 902, N'4274798092', CAST(N'2000-10-10' AS Date), 4, 1, 2290)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (246, 1885, N'1931221570', CAST(N'2000-10-10' AS Date), 4, 2, 2989)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (247, 1532, N'8419256474', CAST(N'2000-10-10' AS Date), 2, 5, 2397)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (248, 675, N'7103226885', CAST(N'2000-10-10' AS Date), 2, 4, 2705)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (249, 1378, N'1805228237', CAST(N'2000-10-10' AS Date), 2, 4, 1698)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (250, 1992, N'7940707708', CAST(N'2000-10-10' AS Date), 1, 1, 2544)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (251, 1870, N'4847509330', CAST(N'2000-10-10' AS Date), 1, 5, 3972)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (252, 630, N'6036865041', CAST(N'2000-10-10' AS Date), 1, 3, 3957)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (253, 675, N'8400497629', CAST(N'2000-10-10' AS Date), 3, 1, 2050)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (254, 1041, N'9652737159', CAST(N'2000-10-10' AS Date), 3, 4, 1642)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (255, 1980, N'4529267428', CAST(N'2000-10-10' AS Date), 3, 4, 1986)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (256, 633, N'8443725275', CAST(N'2000-10-10' AS Date), 3, 1, 3416)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (257, 1481, N'4617330353', CAST(N'2000-10-10' AS Date), 3, 1, 2915)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (258, 1993, N'6278623224', CAST(N'2000-10-10' AS Date), 3, 3, 1151)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (259, 1093, N'9478361624', CAST(N'2000-10-10' AS Date), 4, 5, 1439)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (260, 1249, N'9203059522', CAST(N'2000-10-10' AS Date), 4, 5, 2302)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (261, 1669, N'2819562586', CAST(N'2000-10-10' AS Date), 2, 5, 2887)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (262, 1219, N'7581314998', CAST(N'2000-10-10' AS Date), 2, 3, 3607)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (263, 506, N'9406073295', CAST(N'2000-10-10' AS Date), 2, 1, 1651)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (264, 1614, N'2273118499', CAST(N'2000-10-10' AS Date), 2, 4, 2835)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (265, 667, N'8045312476', CAST(N'2000-10-10' AS Date), 1, 5, 2526)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (266, 1684, N'8936740181', CAST(N'2000-10-10' AS Date), 1, 1, 3541)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (267, 1952, N'6171369642', CAST(N'2000-10-10' AS Date), 1, 3, 2988)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (268, 922, N'1230324675', CAST(N'2000-10-10' AS Date), 1, 1, 3050)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (269, 852, N'6504156795', CAST(N'2000-10-10' AS Date), 1, 3, 1022)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (270, 530, N'1405426621', CAST(N'2000-10-10' AS Date), 4, 4, 1761)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (271, 1396, N'1659049288', CAST(N'2000-10-10' AS Date), 4, 5, 2672)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (272, 1720, N'5422450621', CAST(N'2000-10-10' AS Date), 4, 1, 1218)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (273, 1682, N'1782928461', CAST(N'2000-10-10' AS Date), 4, 2, 1500)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (274, 1448, N'1971627225', CAST(N'2000-10-10' AS Date), 2, 2, 1306)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (275, 1199, N'8878454220', CAST(N'2000-10-10' AS Date), 2, 4, 3889)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (276, 777, N'8045740183', CAST(N'2000-10-10' AS Date), 2, 1, 2852)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (277, 1566, N'5439510854', CAST(N'2000-10-10' AS Date), 1, 2, 2477)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (278, 1962, N'4849214885', CAST(N'2000-10-10' AS Date), 1, 5, 1629)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (279, 738, N'3503125955', CAST(N'2000-10-10' AS Date), 1, 5, 2625)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (280, 921, N'3428462805', CAST(N'2000-10-10' AS Date), 3, 3, 2706)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (281, 1863, N'8636719208', CAST(N'2000-10-10' AS Date), 3, 5, 1139)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (282, 1316, N'4046774770', CAST(N'2000-10-10' AS Date), 4, 5, 2944)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (283, 1168, N'1469388981', CAST(N'2000-10-10' AS Date), 5, 4, 1908)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (284, 1227, N'1741946710', CAST(N'2000-10-10' AS Date), 2, 5, 1527)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (285, 1628, N'1767250642', CAST(N'2000-10-10' AS Date), 2, 1, 2547)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (286, 1949, N'1811170586', CAST(N'2000-10-10' AS Date), 2, 4, 2339)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (287, 891, N'6885471188', CAST(N'2000-10-10' AS Date), 2, 5, 3685)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (288, 1855, N'8426007845', CAST(N'2000-10-10' AS Date), 3, 5, 1569)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (289, 918, N'1117743642', CAST(N'2000-10-10' AS Date), 3, 3, 3878)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (290, 1208, N'6024208906', CAST(N'2000-10-10' AS Date), 3, 4, 2804)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (291, 518, N'6107761444', CAST(N'2000-10-10' AS Date), 3, 5, 1564)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (292, 1401, N'4673597138', CAST(N'2000-10-10' AS Date), 4, 2, 1875)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (293, 1564, N'8989715396', CAST(N'2000-10-10' AS Date), 4, 1, 1161)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (294, 475, N'3569804118', CAST(N'2000-10-10' AS Date), 4, 1, 2377)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (295, 1233, N'8428551626', CAST(N'2000-10-10' AS Date), 4, 2, 2897)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (296, 1592, N'3391476398', CAST(N'2000-10-10' AS Date), 4, 1, 3463)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (297, 1036, N'1547285135', CAST(N'2000-10-10' AS Date), 4, 5, 1940)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (298, 522, N'8917968064', CAST(N'2000-10-10' AS Date), 5, 1, 2073)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (299, 523, N'4205090809', CAST(N'2000-10-10' AS Date), 5, 5, 2071)
GO
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (300, 1773, N'3000442251', CAST(N'2000-10-10' AS Date), 1, 3, 2993)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (301, 1989, N'3599013157', CAST(N'2000-10-10' AS Date), 3, 4, 1745)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (302, 1917, N'9228072449', CAST(N'2000-10-10' AS Date), 3, 3, 3669)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (303, 1897, N'3578228687', CAST(N'2000-10-10' AS Date), 4, 5, 1052)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (304, 1248, N'4628877295', CAST(N'2000-10-10' AS Date), 4, 4, 1638)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (305, 840, N'6443458787', CAST(N'2000-10-10' AS Date), 5, 4, 3853)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (306, 1827, N'7211206921', CAST(N'2000-10-10' AS Date), 5, 5, 1909)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (307, 531, N'5364013104', CAST(N'2000-10-10' AS Date), 5, 1, 3085)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (308, 589, N'3304539029', CAST(N'2000-10-10' AS Date), 5, 3, 3882)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (309, 1332, N'6569432449', CAST(N'2000-10-10' AS Date), 1, 4, 3428)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (310, 910, N'2425146657', CAST(N'2000-10-10' AS Date), 1, 1, 2374)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (311, 981, N'1934518286', CAST(N'2000-10-10' AS Date), 3, 3, 3957)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (312, 1572, N'3037910907', CAST(N'2000-10-10' AS Date), 3, 2, 2835)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (313, 1464, N'5279612290', CAST(N'2000-10-10' AS Date), 3, 1, 2255)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (314, 963, N'1862853823', CAST(N'2000-10-10' AS Date), 3, 4, 3195)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (315, 1703, N'6680485698', CAST(N'2000-10-10' AS Date), 3, 3, 1240)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (316, 669, N'5842423632', CAST(N'2000-10-10' AS Date), 5, 5, 1355)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (317, 664, N'8521667185', CAST(N'2000-10-10' AS Date), 2, 1, 2057)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (318, 1080, N'3907000964', CAST(N'2000-10-10' AS Date), 2, 1, 2981)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (319, 779, N'1727748820', CAST(N'2000-10-10' AS Date), 1, 3, 1924)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (320, 645, N'6653483804', CAST(N'2000-10-10' AS Date), 3, 5, 1850)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (321, 1549, N'6283570488', CAST(N'2000-10-10' AS Date), 3, 1, 3421)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (322, 461, N'7993557666', CAST(N'2000-10-10' AS Date), 2, 5, 1736)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (323, 729, N'8120475600', CAST(N'2000-10-10' AS Date), 2, 5, 2875)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (324, 757, N'2986801045', CAST(N'2000-10-10' AS Date), 1, 3, 1429)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (325, 1121, N'4602900417', CAST(N'2000-10-10' AS Date), 3, 5, 3050)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (326, 1582, N'3941323811', CAST(N'2000-10-10' AS Date), 3, 3, 1267)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (327, 807, N'6802052850', CAST(N'2000-10-10' AS Date), 4, 2, 3847)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (328, 1451, N'7834078869', CAST(N'2000-10-10' AS Date), 5, 4, 2031)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (329, 733, N'3855806406', CAST(N'2000-10-10' AS Date), 5, 3, 3062)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (330, 1396, N'1801373543', CAST(N'2000-10-10' AS Date), 5, 4, 1522)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (331, 627, N'8546808124', CAST(N'2000-10-10' AS Date), 5, 3, 1047)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (332, 1471, N'8869377005', CAST(N'2000-10-10' AS Date), 2, 5, 1736)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (333, 1576, N'8120955790', CAST(N'2000-10-10' AS Date), 2, 1, 3512)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (334, 818, N'4481799679', CAST(N'2000-10-10' AS Date), 1, 4, 2730)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (335, 922, N'1053538097', CAST(N'2000-10-10' AS Date), 1, 5, 1149)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (336, 504, N'3173891050', CAST(N'2000-10-10' AS Date), 3, 3, 1583)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (337, 915, N'4990776235', CAST(N'2000-10-10' AS Date), 4, 5, 1036)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (338, 1778, N'8222154383', CAST(N'2000-10-10' AS Date), 4, 1, 3274)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (339, 1708, N'1982136587', CAST(N'2000-10-10' AS Date), 2, 5, 2267)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (340, 1153, N'7097819688', CAST(N'2000-10-10' AS Date), 2, 1, 1482)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (341, 1703, N'3763338604', CAST(N'2000-10-10' AS Date), 1, 5, 2271)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (342, 854, N'2480960222', CAST(N'2000-10-10' AS Date), 3, 1, 3748)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (343, 601, N'9057875967', CAST(N'2000-10-10' AS Date), 3, 5, 1461)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (344, 1084, N'5622728576', CAST(N'2000-10-10' AS Date), 4, 3, 3976)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (345, 1968, N'7909562308', CAST(N'2000-10-10' AS Date), 4, 2, 2155)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (346, 837, N'2296079406', CAST(N'2000-10-10' AS Date), 4, 1, 3386)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (347, 974, N'5798627925', CAST(N'2000-10-10' AS Date), 4, 5, 3183)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (348, 1543, N'6089681405', CAST(N'2000-10-10' AS Date), 5, 4, 3262)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (349, 1364, N'4397601101', CAST(N'2000-10-10' AS Date), 2, 5, 2923)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (350, 1817, N'4486459661', CAST(N'2000-10-10' AS Date), 2, 3, 2633)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (351, 1430, N'1931729092', CAST(N'2000-10-10' AS Date), 1, 4, 3004)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (352, 696, N'8790068356', CAST(N'2000-10-10' AS Date), 3, 2, 3877)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (353, 1563, N'1541841087', CAST(N'2000-10-10' AS Date), 3, 1, 1389)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (354, 1794, N'1378366096', CAST(N'2000-10-10' AS Date), 3, 1, 1870)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (355, 1170, N'7809515759', CAST(N'2000-10-10' AS Date), 3, 1, 2473)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (356, 754, N'8722921436', CAST(N'2000-10-10' AS Date), 3, 1, 3752)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (357, 786, N'7084384227', CAST(N'2000-10-10' AS Date), 4, 5, 2931)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (358, 598, N'1121501743', CAST(N'2000-10-10' AS Date), 5, 3, 1524)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (359, 1882, N'9341307779', CAST(N'2000-10-10' AS Date), 5, 3, 2789)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (360, 1453, N'2487530967', CAST(N'2000-10-10' AS Date), 5, 5, 2820)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (361, 1137, N'3157688473', CAST(N'2000-10-10' AS Date), 5, 1, 1410)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (362, 895, N'5591139529', CAST(N'2000-10-10' AS Date), 2, 3, 1039)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (363, 1945, N'4991933695', CAST(N'2000-10-10' AS Date), 2, 3, 3754)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (364, 1924, N'3992281761', CAST(N'2000-10-10' AS Date), 1, 1, 1333)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (365, 497, N'3417847234', CAST(N'2000-10-10' AS Date), 1, 5, 2271)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (366, 1566, N'4078946779', CAST(N'2000-10-10' AS Date), 3, 2, 2704)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (367, 1916, N'5177884205', CAST(N'2000-10-10' AS Date), 3, 1, 3959)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (368, 1720, N'7736505595', CAST(N'2000-10-10' AS Date), 5, 1, 3205)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (369, 1799, N'5920186718', CAST(N'2000-10-10' AS Date), 5, 2, 2278)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (370, 1189, N'2391798189', CAST(N'2000-10-10' AS Date), 5, 5, 2696)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (371, 1150, N'1834952384', CAST(N'2000-10-10' AS Date), 5, 3, 1772)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (372, 1975, N'9865082544', CAST(N'2000-10-10' AS Date), 5, 2, 3645)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (373, 802, N'3853824555', CAST(N'2000-10-10' AS Date), 2, 4, 3648)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (374, 695, N'6413809259', CAST(N'2000-10-10' AS Date), 2, 4, 1743)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (375, 1630, N'8523664163', CAST(N'2000-10-10' AS Date), 2, 1, 3970)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (376, 1607, N'1406662830', CAST(N'2000-10-10' AS Date), 1, 1, 1796)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (377, 1022, N'3139637595', CAST(N'2000-10-10' AS Date), 1, 4, 3213)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (378, 1191, N'6946397749', CAST(N'2000-10-10' AS Date), 1, 5, 2340)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (379, 1226, N'1161442688', CAST(N'2000-10-10' AS Date), 1, 5, 3780)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (380, 1018, N'9290912785', CAST(N'2000-10-10' AS Date), 3, 3, 2441)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (381, 1370, N'1706674282', CAST(N'2000-10-10' AS Date), 3, 5, 1644)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (382, 1600, N'4454715127', CAST(N'2000-10-10' AS Date), 4, 2, 3731)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (383, 681, N'6614595414', CAST(N'2000-10-10' AS Date), 4, 1, 1536)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (384, 1126, N'5980808641', CAST(N'2000-10-10' AS Date), 5, 4, 1990)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (385, 1490, N'4938094342', CAST(N'2000-10-10' AS Date), 5, 5, 1386)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (386, 1648, N'7457328298', CAST(N'2000-10-10' AS Date), 5, 4, 1589)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (387, 986, N'3525250841', CAST(N'2000-10-10' AS Date), 2, 1, 1845)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (388, 1739, N'6497880165', CAST(N'2000-10-10' AS Date), 2, 2, 1450)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (389, 1515, N'4371024996', CAST(N'2000-10-10' AS Date), 2, 2, 1191)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (390, 1694, N'5428666609', CAST(N'2000-10-10' AS Date), 2, 2, 2353)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (391, 1538, N'2978438054', CAST(N'2000-10-10' AS Date), 1, 3, 3508)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (392, 1653, N'9087239507', CAST(N'2000-10-10' AS Date), 3, 2, 3858)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (393, 1157, N'7929527664', CAST(N'2000-10-10' AS Date), 3, 3, 2159)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (394, 1588, N'5178080772', CAST(N'2000-10-10' AS Date), 3, 3, 3093)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (395, 1412, N'5803758063', CAST(N'2000-10-10' AS Date), 3, 2, 3686)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (396, 831, N'7938408395', CAST(N'2000-10-10' AS Date), 3, 5, 3285)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (397, 1805, N'6868811675', CAST(N'2000-10-10' AS Date), 4, 2, 2371)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (398, 479, N'4138292699', CAST(N'2000-10-10' AS Date), 5, 3, 2774)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (399, 1080, N'9334845308', CAST(N'2000-10-10' AS Date), 2, 1, 3771)
GO
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (400, 1254, N'4383044639', CAST(N'2000-10-10' AS Date), 2, 3, 3635)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (401, 1544, N'6547708568', CAST(N'2000-10-10' AS Date), 2, 2, 2005)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (402, 1732, N'6128935145', CAST(N'2000-10-10' AS Date), 2, 3, 2518)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (403, 1875, N'6454435800', CAST(N'2000-10-10' AS Date), 1, 3, 1544)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (404, 1487, N'1914702015', CAST(N'2000-10-10' AS Date), 3, 2, 3105)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (405, 818, N'1643032295', CAST(N'2000-10-10' AS Date), 3, 1, 2214)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (406, 1050, N'3797817243', CAST(N'2000-10-10' AS Date), 3, 1, 2979)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (407, 774, N'4959216018', CAST(N'2000-10-10' AS Date), 3, 1, 2528)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (408, 1650, N'1874806675', CAST(N'2000-10-10' AS Date), 4, 5, 1892)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (409, 599, N'1514302065', CAST(N'2000-10-10' AS Date), 4, 2, 1240)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (410, 549, N'2746939245', CAST(N'2000-10-10' AS Date), 4, 1, 2789)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (411, 1271, N'8377728286', CAST(N'2000-10-10' AS Date), 4, 2, 1163)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (412, 807, N'6081138762', CAST(N'2000-10-10' AS Date), 5, 5, 1928)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (413, 1103, N'3792386930', CAST(N'2000-10-10' AS Date), 5, 4, 3677)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (414, 1230, N'1473389394', CAST(N'2000-10-10' AS Date), 5, 3, 2182)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (415, 983, N'2246002115', CAST(N'2000-10-10' AS Date), 5, 1, 3502)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (416, 1579, N'4952101693', CAST(N'2000-10-10' AS Date), 2, 1, 2767)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (417, 1350, N'3032414829', CAST(N'2000-10-10' AS Date), 2, 4, 1740)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (418, 1442, N'7677121583', CAST(N'2000-10-10' AS Date), 2, 4, 3898)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (419, 482, N'9211249477', CAST(N'2000-10-10' AS Date), 3, 2, 3555)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (420, 870, N'9118497742', CAST(N'2000-10-10' AS Date), 4, 5, 3686)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (421, 844, N'6844639717', CAST(N'2000-10-10' AS Date), 4, 1, 3523)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (422, 771, N'3330368500', CAST(N'2000-10-10' AS Date), 5, 1, 1178)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (423, 1262, N'8577805154', CAST(N'2000-10-10' AS Date), 5, 1, 2244)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (424, 824, N'9834999801', CAST(N'2000-10-10' AS Date), 5, 5, 2237)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (425, 616, N'8860991612', CAST(N'2000-10-10' AS Date), 5, 5, 3333)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (426, 1653, N'4248106994', CAST(N'2000-10-10' AS Date), 2, 4, 3612)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (427, 591, N'8549010799', CAST(N'2000-10-10' AS Date), 2, 4, 3557)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (428, 1351, N'9185557177', CAST(N'2000-10-10' AS Date), 1, 5, 2280)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (429, 1156, N'3018636057', CAST(N'2000-10-10' AS Date), 1, 4, 2339)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (430, 1756, N'6084647360', CAST(N'2000-10-10' AS Date), 3, 2, 1278)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (431, 1378, N'5660472548', CAST(N'2000-10-10' AS Date), 3, 5, 1375)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (432, 876, N'3673446474', CAST(N'2000-10-10' AS Date), 3, 4, 3125)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (433, 1771, N'9867844433', CAST(N'2000-10-10' AS Date), 3, 2, 3689)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (434, 1801, N'2170169264', CAST(N'2000-10-10' AS Date), 4, 4, 1899)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (435, 1254, N'3554588603', CAST(N'2000-10-10' AS Date), 4, 5, 3930)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (436, 976, N'4253034037', CAST(N'2000-10-10' AS Date), 5, 4, 444)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (437, 1531, N'2710174021', CAST(N'2000-10-10' AS Date), 2, 1, 2672)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (438, 1329, N'9243207260', CAST(N'2000-10-10' AS Date), 2, 2, 1322)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (439, 1458, N'8778835342', CAST(N'2000-10-10' AS Date), 2, 3, 3373)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (440, 1332, N'8379020343', CAST(N'2000-10-10' AS Date), 2, 4, 2956)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (441, 1194, N'8098326271', CAST(N'2000-10-10' AS Date), 1, 2, 1090)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (442, 1202, N'2861751244', CAST(N'2000-10-10' AS Date), 1, 2, 2395)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (443, 1862, N'5243048398', CAST(N'2000-10-10' AS Date), 1, 2, 1012)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (444, 1861, N'4341351487', CAST(N'2000-10-10' AS Date), 1, 1, 3340)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (445, 1317, N'3212056756', CAST(N'2000-10-10' AS Date), 3, 4, 3921)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (446, 1646, N'9079803349', CAST(N'2000-10-10' AS Date), 4, 2, 1411)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (447, 1629, N'6902510988', CAST(N'2000-10-10' AS Date), 4, 2, 2168)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (448, 673, N'8838789823', CAST(N'2000-10-10' AS Date), 1, 4, 1605)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (449, 538, N'4479931770', CAST(N'2000-10-10' AS Date), 1, 3, 2065)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (450, 1121, N'7067015193', CAST(N'2000-10-10' AS Date), 1, 1, 3785)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (451, 1872, N'3909878132', CAST(N'2000-10-10' AS Date), 3, 4, 2432)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (452, 1050, N'6379340705', CAST(N'2000-10-10' AS Date), 3, 3, 2530)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (453, 1131, N'5390564469', CAST(N'2000-10-10' AS Date), 3, 4, 3389)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (454, 563, N'1154329499', CAST(N'2000-10-10' AS Date), 3, 1, 2275)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (455, 1885, N'3000335880', CAST(N'2000-10-10' AS Date), 4, 5, 2880)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (456, 1510, N'4616131179', CAST(N'2000-10-10' AS Date), 4, 3, 3742)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (457, 1837, N'2846824041', CAST(N'2000-10-10' AS Date), 4, 1, 1440)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (458, 1604, N'8507328746', CAST(N'2000-10-10' AS Date), 4, 5, 3613)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (459, 949, N'5203256526', CAST(N'2000-10-10' AS Date), 2, 3, 2444)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (460, 1067, N'2822813651', CAST(N'2000-10-10' AS Date), 2, 4, 3277)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (461, 693, N'9403317866', CAST(N'2000-10-10' AS Date), 2, 1, 3228)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (462, 557, N'3310916379', CAST(N'2000-10-10' AS Date), 1, 2, 2352)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (463, 907, N'8793329562', CAST(N'2000-10-10' AS Date), 3, 2, 3656)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (464, 1779, N'4701142953', CAST(N'2000-10-10' AS Date), 3, 2, 1024)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (465, 786, N'6175198789', CAST(N'2000-10-10' AS Date), 3, 4, 3746)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (466, 1645, N'8924236347', CAST(N'2000-10-10' AS Date), 3, 4, 2109)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (467, 491, N'2034835323', CAST(N'2000-10-10' AS Date), 4, 4, 1114)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (468, 1016, N'6573968290', CAST(N'2000-10-10' AS Date), 5, 4, 3082)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (469, 1190, N'3585459353', CAST(N'2000-10-10' AS Date), 5, 3, 2091)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (470, 1516, N'4460220087', CAST(N'2000-10-10' AS Date), 2, 4, 3805)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (471, 504, N'2726433132', CAST(N'2000-10-10' AS Date), 2, 4, 1156)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (472, 1659, N'2199420464', CAST(N'2000-10-10' AS Date), 1, 4, 3276)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (473, 1868, N'4050754476', CAST(N'2000-10-10' AS Date), 1, 4, 3111)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (474, 1702, N'7493411466', CAST(N'2000-10-10' AS Date), 3, 4, 1481)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (475, 522, N'1177872765', CAST(N'2000-10-10' AS Date), 4, 2, 1439)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (476, 848, N'8769916750', CAST(N'2000-10-10' AS Date), 4, 1, 1428)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (477, 1447, N'8106978689', CAST(N'2000-10-10' AS Date), 4, 2, 1177)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (478, 1387, N'4511015996', CAST(N'2000-10-10' AS Date), 4, 2, 1085)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (479, 975, N'5962959733', CAST(N'2000-10-10' AS Date), 5, 5, 1588)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (480, 1352, N'7325479831', CAST(N'2000-10-10' AS Date), 2, 3, 1558)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (481, 462, N'4644951598', CAST(N'2000-10-10' AS Date), 1, 5, 1992)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (482, 629, N'2224337739', CAST(N'2000-10-10' AS Date), 1, 2, 2755)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (483, 580, N'2722367283', CAST(N'2000-10-10' AS Date), 1, 1, 1847)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (484, 1113, N'6141373300', CAST(N'2000-10-10' AS Date), 1, 3, 2910)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (485, 994, N'2904971679', CAST(N'2000-10-10' AS Date), 3, 2, 3083)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (486, 851, N'6740010052', CAST(N'2000-10-10' AS Date), 4, 1, 1838)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (487, 987, N'5214358976', CAST(N'2000-10-10' AS Date), 4, 5, 3130)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (488, 1845, N'4429460275', CAST(N'2000-10-10' AS Date), 4, 1, 2019)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (489, 1640, N'5843525968', CAST(N'2000-10-10' AS Date), 5, 1, 2633)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (490, 1416, N'5388455100', CAST(N'2000-10-10' AS Date), 5, 4, 2700)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (491, 1138, N'7380684022', CAST(N'2000-10-10' AS Date), 5, 5, 1990)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (492, 1703, N'8579840260', CAST(N'2000-10-10' AS Date), 5, 2, 2793)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (493, 869, N'6325886573', CAST(N'2000-10-10' AS Date), 2, 1, 1032)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (494, 924, N'7006118905', CAST(N'2000-10-10' AS Date), 2, 1, 3219)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (495, 1379, N'7776284700', CAST(N'2000-10-10' AS Date), 3, 2, 3404)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (496, 1901, N'4359011911', CAST(N'2000-10-10' AS Date), 3, 2, 2854)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (497, 954, N'8150148832', CAST(N'2000-10-10' AS Date), 4, 3, 1073)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (498, 844, N'4347196659', CAST(N'2000-10-10' AS Date), 4, 4, 2996)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (499, 1326, N'2857209927', CAST(N'2000-10-10' AS Date), 4, 1, 2408)
GO
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (500, 1195, N'9101072927', CAST(N'2000-10-10' AS Date), 5, 3, 3681)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (501, 1835, N'3864164398', CAST(N'2000-10-10' AS Date), 5, 3, 1861)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (502, 561, N'1267310714', CAST(N'2000-10-10' AS Date), 1, 5, 2933)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (503, 1405, N'8575179148', CAST(N'2000-10-10' AS Date), 1, 4, 2052)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (504, 931, N'2014521544', CAST(N'2000-10-10' AS Date), 1, 3, 1923)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (505, 791, N'9751051753', CAST(N'2000-10-10' AS Date), 1, 2, 2046)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (506, 1464, N'3256677465', CAST(N'2000-10-10' AS Date), 1, 5, 3802)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (507, 602, N'2747264462', CAST(N'2000-10-10' AS Date), 4, 4, 3544)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (508, 1006, N'2619816511', CAST(N'2000-10-10' AS Date), 4, 4, 2826)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (509, 1146, N'1850829966', CAST(N'2000-10-10' AS Date), 4, 4, 2003)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (510, 855, N'8144463399', CAST(N'2000-10-10' AS Date), 5, 3, 2121)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (511, 599, N'3120613399', CAST(N'2000-10-10' AS Date), 5, 2, 3129)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (512, 1565, N'1952084790', CAST(N'2000-10-10' AS Date), 5, 2, 3792)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (513, 1961, N'6785730811', CAST(N'2000-10-10' AS Date), 5, 3, 3297)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (514, 981, N'3146917894', CAST(N'2000-10-10' AS Date), 5, 1, 3097)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (515, 1879, N'3613494419', CAST(N'2000-10-10' AS Date), 1, 4, 1370)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (516, 1555, N'4113205441', CAST(N'2000-10-10' AS Date), 1, 3, 1733)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (517, 677, N'2962075698', CAST(N'2000-10-10' AS Date), 4, 4, 3066)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (518, 797, N'8370217765', CAST(N'2000-10-10' AS Date), 2, 2, 2077)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (519, 1142, N'6156322035', CAST(N'2000-10-10' AS Date), 2, 1, 3354)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (520, 604, N'6980013317', CAST(N'2000-10-10' AS Date), 2, 5, 2057)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (521, 1374, N'2866231350', CAST(N'2000-10-10' AS Date), 1, 2, 3799)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (522, 701, N'7640282036', CAST(N'2000-10-10' AS Date), 1, 5, 1319)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (523, 1627, N'7380237026', CAST(N'2000-10-10' AS Date), 3, 5, 2546)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (524, 1405, N'5086467469', CAST(N'2000-10-10' AS Date), 3, 1, 1800)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (525, 1122, N'6092160082', CAST(N'2000-10-10' AS Date), 3, 5, 2534)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (526, 833, N'6634109648', CAST(N'2000-10-10' AS Date), 3, 4, 1859)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (527, 1191, N'2263115106', CAST(N'2000-10-10' AS Date), 4, 1, 1136)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (528, 1550, N'9540255098', CAST(N'2000-10-10' AS Date), 4, 3, 1102)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (529, 553, N'5214201247', CAST(N'2000-10-10' AS Date), 5, 3, 2313)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (530, 1635, N'9685652092', CAST(N'2000-10-10' AS Date), 5, 5, 1717)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (531, 1333, N'6398362294', CAST(N'2000-10-10' AS Date), 5, 2, 2498)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (532, 591, N'3470636590', CAST(N'2000-10-10' AS Date), 5, 2, 1895)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (533, 564, N'3810222357', CAST(N'2000-10-10' AS Date), 5, 3, 1162)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (534, 828, N'7295859789', CAST(N'2000-10-10' AS Date), 2, 3, 3858)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (535, 1552, N'9868151880', CAST(N'2000-10-10' AS Date), 2, 1, 3248)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (536, 552, N'6876026531', CAST(N'2000-10-10' AS Date), 2, 4, 3383)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (537, 1781, N'9698984637', CAST(N'2000-10-10' AS Date), 2, 5, 3003)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (538, 1220, N'7247665747', CAST(N'2000-10-10' AS Date), 1, 1, 3475)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (539, 1022, N'8020168833', CAST(N'2000-10-10' AS Date), 1, 1, 2750)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (540, 1752, N'7653391844', CAST(N'2000-10-10' AS Date), 3, 1, 2490)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (541, 1164, N'3200563714', CAST(N'2000-10-10' AS Date), 3, 1, 1222)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (542, 1888, N'9704332043', CAST(N'2000-10-10' AS Date), 4, 2, 1923)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (543, 953, N'2938397909', CAST(N'2000-10-10' AS Date), 4, 1, 3052)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (544, 1409, N'2366326468', CAST(N'2000-10-10' AS Date), 4, 1, 2812)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (545, 1108, N'9634170861', CAST(N'2000-10-10' AS Date), 5, 3, 1237)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (546, 1568, N'3923595891', CAST(N'2000-10-10' AS Date), 5, 2, 1004)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (547, 959, N'9343416981', CAST(N'2000-10-10' AS Date), 2, 4, 1039)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (548, 497, N'4127100872', CAST(N'2000-10-10' AS Date), 1, 3, 1333)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (549, 1728, N'8665505067', CAST(N'2000-10-10' AS Date), 1, 5, 3460)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (550, 1290, N'8246477523', CAST(N'2000-10-10' AS Date), 1, 2, 1153)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (551, 1194, N'3193042953', CAST(N'2000-10-10' AS Date), 4, 1, 2375)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (552, 969, N'6934106446', CAST(N'2000-10-10' AS Date), 4, 3, 2415)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (553, 1862, N'4020816261', CAST(N'2000-10-10' AS Date), 4, 3, 1157)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (554, 1823, N'2887810351', CAST(N'2000-10-10' AS Date), 5, 5, 2100)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (555, 1128, N'1164814836', CAST(N'2000-10-10' AS Date), 2, 3, 1284)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (556, 1078, N'2354061035', CAST(N'2000-10-10' AS Date), 2, 3, 1154)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (557, 1593, N'9423455071', CAST(N'2000-10-10' AS Date), 2, 4, 2450)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (558, 1122, N'8180451577', CAST(N'2000-10-10' AS Date), 1, 1, 2623)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (559, 902, N'5230546255', CAST(N'2000-10-10' AS Date), 1, 5, 2737)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (560, 808, N'9077729622', CAST(N'2000-10-10' AS Date), 3, 5, 1501)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (561, 1937, N'5233688634', CAST(N'2000-10-10' AS Date), 3, 4, 2549)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (562, 793, N'6468763699', CAST(N'2000-10-10' AS Date), 3, 1, 3869)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (563, 1875, N'8350981983', CAST(N'2000-10-10' AS Date), 3, 4, 3151)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (564, 1217, N'4194059286', CAST(N'2000-10-10' AS Date), 3, 3, 1248)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (565, 495, N'3308988667', CAST(N'2000-10-10' AS Date), 3, 1, 2213)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (566, 595, N'4218724252', CAST(N'2000-10-10' AS Date), 4, 2, 3106)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (567, 461, N'4939081677', CAST(N'2000-10-10' AS Date), 4, 2, 1192)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (568, 1542, N'7672281352', CAST(N'2000-10-10' AS Date), 5, 3, 3517)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (569, 960, N'8853994558', CAST(N'2000-10-10' AS Date), 5, 4, 2185)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (570, 1708, N'7009441015', CAST(N'2000-10-10' AS Date), 5, 3, 3961)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (571, 836, N'3724679506', CAST(N'2000-10-10' AS Date), 2, 2, 3769)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (572, 1733, N'7249381720', CAST(N'2000-10-10' AS Date), 2, 1, 1703)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (573, 1561, N'7742873563', CAST(N'2000-10-10' AS Date), 2, 4, 3440)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (574, 1203, N'2884625402', CAST(N'2000-10-10' AS Date), 1, 1, 1213)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (575, 1782, N'6595765757', CAST(N'2000-10-10' AS Date), 1, 5, 1074)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (576, 1372, N'9831345129', CAST(N'2000-10-10' AS Date), 1, 2, 1675)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (577, 464, N'7908823410', CAST(N'2000-10-10' AS Date), 3, 3, 2703)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (578, 1157, N'2165786832', CAST(N'2000-10-10' AS Date), 3, 1, 2055)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (579, 537, N'5067747943', CAST(N'2000-10-10' AS Date), 4, 5, 3343)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (580, 1762, N'7374374427', CAST(N'2000-10-10' AS Date), 4, 2, 3548)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (581, 1317, N'4655209941', CAST(N'2000-10-10' AS Date), 4, 3, 1790)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (582, 902, N'5975491764', CAST(N'2000-10-10' AS Date), 4, 5, 3655)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (583, 1517, N'9703872852', CAST(N'2000-10-10' AS Date), 5, 4, 2608)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (584, 1096, N'3335766247', CAST(N'2000-10-10' AS Date), 5, 1, 1132)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (585, 985, N'2468258185', CAST(N'2000-10-10' AS Date), 5, 2, 1265)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (586, 1769, N'8818919940', CAST(N'2000-10-10' AS Date), 2, 5, 1203)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (587, 1476, N'2081735714', CAST(N'2000-10-10' AS Date), 2, 4, 1304)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (588, 795, N'9492980775', CAST(N'2000-10-10' AS Date), 2, 3, 2441)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (589, 1984, N'2703649025', CAST(N'2000-10-10' AS Date), 2, 2, 3772)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (590, 544, N'9990377306', CAST(N'2000-10-10' AS Date), 1, 3, 1038)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (591, 980, N'8772260260', CAST(N'2000-10-10' AS Date), 1, 2, 1590)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (592, 1421, N'2027614510', CAST(N'2000-10-10' AS Date), 1, 5, 3137)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (593, 1836, N'7835187703', CAST(N'2000-10-10' AS Date), 1, 5, 2067)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (594, 708, N'4161022290', CAST(N'2000-10-10' AS Date), 3, 4, 2855)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (595, 1755, N'4344161980', CAST(N'2000-10-10' AS Date), 3, 5, 1718)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (596, 605, N'5764701051', CAST(N'2000-10-10' AS Date), 4, 1, 2882)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (597, 1806, N'3482231657', CAST(N'2000-10-10' AS Date), 4, 4, 2056)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (598, 513, N'6418601357', CAST(N'2000-10-10' AS Date), 4, 2, 1658)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (599, 1420, N'5906903793', CAST(N'2000-10-10' AS Date), 5, 2, 2235)
GO
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (600, 458, N'8618924155', CAST(N'2000-10-10' AS Date), 5, 1, 1140)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (601, 1021, N'4062829195', CAST(N'2000-10-10' AS Date), 2, 1, 2917)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (602, 745, N'7110830284', CAST(N'2000-10-10' AS Date), 2, 3, 2506)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (603, 1432, N'1630953911', CAST(N'2000-10-10' AS Date), 2, 5, 1756)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (604, 724, N'8809130779', CAST(N'2000-10-10' AS Date), 1, 3, 2134)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (605, 566, N'6458505486', CAST(N'2000-10-10' AS Date), 1, 5, 1449)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (606, 1399, N'1215165609', CAST(N'2000-10-10' AS Date), 1, 5, 1672)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (607, 1746, N'3700683196', CAST(N'2000-10-10' AS Date), 1, 4, 1920)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (608, 1000, N'7198179084', CAST(N'2000-10-10' AS Date), 3, 2, 3934)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (609, 1459, N'8463326289', CAST(N'2000-10-10' AS Date), 3, 1, 3814)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (610, 618, N'7773676409', CAST(N'2000-10-10' AS Date), 4, 4, 2669)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (611, 1441, N'6328326449', CAST(N'2000-10-10' AS Date), 5, 5, 2301)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (612, 903, N'9585609225', CAST(N'2000-10-10' AS Date), 5, 3, 1417)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (613, 1776, N'6444369681', CAST(N'2000-10-10' AS Date), 2, 2, 3701)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (614, 1582, N'2260919493', CAST(N'2000-10-10' AS Date), 1, 1, 2518)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (615, 843, N'5265253867', CAST(N'2000-10-10' AS Date), 1, 3, 2960)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (616, 1657, N'3349932557', CAST(N'2000-10-10' AS Date), 1, 2, 2175)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (617, 1849, N'1608499178', CAST(N'2000-10-10' AS Date), 3, 1, 2536)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (618, 566, N'3719541815', CAST(N'2000-10-10' AS Date), 3, 1, 3294)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (619, 1351, N'6827514265', CAST(N'2000-10-10' AS Date), 4, 5, 2445)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (620, 551, N'4535223504', CAST(N'2000-10-10' AS Date), 4, 4, 2112)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (621, 1649, N'2350090600', CAST(N'2000-10-10' AS Date), 5, 4, 2511)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (622, 1888, N'8386116914', CAST(N'2000-10-10' AS Date), 2, 2, 1942)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (623, 1439, N'7334075198', CAST(N'2000-10-10' AS Date), 2, 2, 2888)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (624, 520, N'6761131560', CAST(N'2000-10-10' AS Date), 2, 4, 1293)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (625, 946, N'1893394138', CAST(N'2000-10-10' AS Date), 1, 5, 3274)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (626, 1001, N'5683904428', CAST(N'2000-10-10' AS Date), 1, 3, 1982)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (627, 1918, N'3349241304', CAST(N'2000-10-10' AS Date), 3, 5, 3888)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (628, 1717, N'4280726841', CAST(N'2000-10-10' AS Date), 3, 1, 3209)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (629, 648, N'6309408244', CAST(N'2000-10-10' AS Date), 3, 2, 1224)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (630, 1114, N'8498195156', CAST(N'2000-10-10' AS Date), 4, 5, 1384)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (631, 1986, N'4113631554', CAST(N'2000-10-10' AS Date), 4, 1, 3263)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (632, 1079, N'2918171691', CAST(N'2000-10-10' AS Date), 4, 1, 2163)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (633, 1780, N'6691863453', CAST(N'2000-10-10' AS Date), 5, 5, 3040)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (634, 1845, N'1893502203', CAST(N'2000-10-10' AS Date), 2, 4, 1136)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (635, 744, N'6178144640', CAST(N'2000-10-10' AS Date), 2, 5, 3841)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (636, 459, N'1662114466', CAST(N'2000-10-10' AS Date), 2, 4, 3745)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (637, 1065, N'9560658430', CAST(N'2000-10-10' AS Date), 2, 4, 1615)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (638, 1595, N'3022208855', CAST(N'2000-10-10' AS Date), 1, 4, 1852)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (639, 1999, N'1420988006', CAST(N'2000-10-10' AS Date), 1, 1, 1907)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (640, 1002, N'5961344374', CAST(N'2000-10-10' AS Date), 1, 5, 2569)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (641, 1864, N'1903329745', CAST(N'2000-10-10' AS Date), 1, 2, 3022)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (642, 466, N'7171640307', CAST(N'2000-10-10' AS Date), 3, 5, 1282)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (643, 1204, N'5077469298', CAST(N'2000-10-10' AS Date), 4, 2, 3079)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (644, 1754, N'1408632067', CAST(N'2000-10-10' AS Date), 4, 4, 3725)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (645, 1363, N'1026478583', CAST(N'2000-10-10' AS Date), 5, 4, 3634)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (646, 1111, N'5511359813', CAST(N'2000-10-10' AS Date), 5, 2, 3356)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (647, 487, N'2008294136', CAST(N'2000-10-10' AS Date), 5, 5, 2910)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (648, 1748, N'9919827565', CAST(N'2000-10-10' AS Date), 2, 3, 3372)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (649, 1102, N'9213829114', CAST(N'2000-10-10' AS Date), 2, 2, 1106)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (650, 1547, N'1072441093', CAST(N'2000-10-10' AS Date), 1, 1, 3581)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (651, 1934, N'1134189769', CAST(N'2000-10-10' AS Date), 1, 1, 1790)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (652, 1947, N'8293194179', CAST(N'2000-10-10' AS Date), 3, 4, 3245)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (653, 773, N'8509962485', CAST(N'2000-10-10' AS Date), 3, 3, 1513)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (654, 902, N'8518270240', CAST(N'2000-10-10' AS Date), 4, 2, 3585)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (655, 1683, N'9480152891', CAST(N'2000-10-10' AS Date), 5, 1, 1743)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (656, 1920, N'5655105174', CAST(N'2000-10-10' AS Date), 5, 2, 3457)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (657, 879, N'8676053773', CAST(N'2000-10-10' AS Date), 5, 4, 2543)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (658, 1092, N'5435662236', CAST(N'2000-10-10' AS Date), 2, 4, 3983)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (659, 1214, N'9177675136', CAST(N'2000-10-10' AS Date), 2, 1, 2566)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (660, 1227, N'7907528824', CAST(N'2000-10-10' AS Date), 1, 4, 2625)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (661, 1482, N'7285073052', CAST(N'2000-10-10' AS Date), 3, 3, 1990)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (662, 1496, N'2871854386', CAST(N'2000-10-10' AS Date), 3, 5, 2754)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (663, 549, N'7863552741', CAST(N'2000-10-10' AS Date), 4, 1, 2085)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (664, 703, N'6293382615', CAST(N'2000-10-10' AS Date), 4, 3, 2183)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (665, 1937, N'5889364948', CAST(N'2000-10-10' AS Date), 4, 5, 2888)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (666, 1862, N'2147595626', CAST(N'2000-10-10' AS Date), 4, 1, 2716)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (667, 1635, N'8742301100', CAST(N'2000-10-10' AS Date), 5, 5, 2568)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (668, 1562, N'9063618724', CAST(N'2000-10-10' AS Date), 5, 2, 3021)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (669, 1161, N'3487916055', CAST(N'2000-10-10' AS Date), 5, 5, 1616)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (670, 1333, N'7847871129', CAST(N'2000-10-10' AS Date), 5, 5, 2431)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (671, 1176, N'8306591992', CAST(N'2000-10-10' AS Date), 5, 5, 1428)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (672, 1722, N'8413067641', CAST(N'2000-10-10' AS Date), 5, 1, 2176)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (673, 1706, N'3802691754', CAST(N'2000-10-10' AS Date), 1, 5, 1194)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (674, 822, N'8906894963', CAST(N'2000-10-10' AS Date), 1, 1, 3998)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (675, 1833, N'5958167194', CAST(N'2000-10-10' AS Date), 1, 2, 3886)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (676, 1822, N'4467235075', CAST(N'2000-10-10' AS Date), 1, 1, 2650)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (677, 471, N'3684571453', CAST(N'2000-10-10' AS Date), 4, 5, 1637)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (678, 1022, N'7235105154', CAST(N'2000-10-10' AS Date), 2, 3, 2158)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (679, 1562, N'8759597682', CAST(N'2000-10-10' AS Date), 2, 2, 3388)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (680, 1960, N'7420673555', CAST(N'2000-10-10' AS Date), 2, 4, 1943)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (681, 627, N'7517897451', CAST(N'2000-10-10' AS Date), 2, 1, 1510)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (682, 984, N'8230702547', CAST(N'2000-10-10' AS Date), 1, 3, 3730)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (683, 618, N'7694811091', CAST(N'2000-10-10' AS Date), 1, 2, 2302)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (684, 1864, N'6954345704', CAST(N'2000-10-10' AS Date), 1, 2, 3171)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (685, 1449, N'3818419473', CAST(N'2000-10-10' AS Date), 1, 1, 3562)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (686, 1850, N'7087394821', CAST(N'2000-10-10' AS Date), 3, 3, 2074)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (687, 1350, N'3683707299', CAST(N'2000-10-10' AS Date), 3, 1, 2085)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (688, 1829, N'4658206125', CAST(N'2000-10-10' AS Date), 3, 1, 1901)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (689, 1770, N'9241339149', CAST(N'2000-10-10' AS Date), 3, 2, 3294)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (690, 1979, N'7409438396', CAST(N'2000-10-10' AS Date), 3, 2, 2022)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (691, 1845, N'7804582940', CAST(N'2000-10-10' AS Date), 4, 1, 3971)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (692, 1321, N'5774756435', CAST(N'2000-10-10' AS Date), 5, 1, 2579)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (693, 741, N'2189711968', CAST(N'2000-10-10' AS Date), 5, 5, 2257)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (694, 738, N'4822051327', CAST(N'2000-10-10' AS Date), 5, 5, 1120)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (695, 488, N'8803585376', CAST(N'2000-10-10' AS Date), 5, 3, 1990)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (696, 1979, N'3403023999', CAST(N'2000-10-10' AS Date), 2, 2, 2983)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (697, 1428, N'2984991784', CAST(N'2000-10-10' AS Date), 2, 3, 2786)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (698, 1857, N'7150275413', CAST(N'2000-10-10' AS Date), 2, 2, 1101)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (699, 1150, N'5347218606', CAST(N'2000-10-10' AS Date), 1, 5, 3817)
GO
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (700, 1605, N'9517053068', CAST(N'2000-10-10' AS Date), 1, 1, 2608)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (701, 1251, N'9014667087', CAST(N'2000-10-10' AS Date), 1, 2, 1676)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (702, 602, N'1780189003', CAST(N'2000-10-10' AS Date), 1, 5, 3607)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (703, 1643, N'1095566761', CAST(N'2000-10-10' AS Date), 3, 4, 2775)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (704, 822, N'3800901874', CAST(N'2000-10-10' AS Date), 4, 2, 1934)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (705, 506, N'4596171704', CAST(N'2000-10-10' AS Date), 4, 3, 3661)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (706, 817, N'8228923994', CAST(N'2000-10-10' AS Date), 4, 5, 3054)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (707, 524, N'8727410362', CAST(N'2000-10-10' AS Date), 4, 2, 2507)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (708, 660, N'3308758932', CAST(N'2000-10-10' AS Date), 5, 3, 2909)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (709, 1864, N'6482487258', CAST(N'2000-10-10' AS Date), 5, 5, 2694)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (710, 1202, N'1220293109', CAST(N'2000-10-10' AS Date), 5, 2, 2943)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (711, 1199, N'6681215665', CAST(N'2000-10-10' AS Date), 5, 2, 3471)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (712, 1661, N'7669325683', CAST(N'2000-10-10' AS Date), 2, 3, 3871)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (713, 716, N'1789383686', CAST(N'2000-10-10' AS Date), 2, 1, 1574)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (714, 1788, N'3050597781', CAST(N'2000-10-10' AS Date), 1, 5, 1496)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (715, 1661, N'5045808217', CAST(N'2000-10-10' AS Date), 1, 1, 2472)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (716, 1035, N'1547228423', CAST(N'2000-10-10' AS Date), 3, 1, 1512)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (717, 883, N'7597188540', CAST(N'2000-10-10' AS Date), 3, 1, 1134)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (718, 1660, N'4093469844', CAST(N'2000-10-10' AS Date), 3, 3, 2847)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (719, 659, N'8561910665', CAST(N'2000-10-10' AS Date), 3, 4, 3971)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (720, 1835, N'2415834531', CAST(N'2000-10-10' AS Date), 4, 2, 1800)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (721, 767, N'6084755561', CAST(N'2000-10-10' AS Date), 5, 4, 3479)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (722, 1937, N'6458992693', CAST(N'2000-10-10' AS Date), 5, 3, 1188)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (723, 659, N'6232261587', CAST(N'2000-10-10' AS Date), 5, 1, 2349)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (724, 782, N'8227521564', CAST(N'2000-10-10' AS Date), 5, 5, 1107)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (725, 684, N'8115819822', CAST(N'2000-10-10' AS Date), 2, 3, 1315)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (726, 559, N'2372421556', CAST(N'2000-10-10' AS Date), 2, 1, 3356)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (727, 729, N'5552980810', CAST(N'2000-10-10' AS Date), 2, 1, 1042)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (728, 1430, N'9579896887', CAST(N'2000-10-10' AS Date), 2, 3, 3587)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (729, 1230, N'4016972819', CAST(N'2000-10-10' AS Date), 2, 3, 2311)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (730, 1553, N'3878835856', CAST(N'2000-10-10' AS Date), 2, 3, 2901)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (731, 1885, N'3994835138', CAST(N'2000-10-10' AS Date), 1, 1, 2197)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (732, 1773, N'8595134931', CAST(N'2000-10-10' AS Date), 1, 2, 3899)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (733, 1939, N'2739626066', CAST(N'2000-10-10' AS Date), 4, 1, 3877)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (734, 615, N'1074604169', CAST(N'2000-10-10' AS Date), 5, 2, 1790)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (735, 1192, N'1366064425', CAST(N'2000-10-10' AS Date), 5, 1, 2336)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (736, 1281, N'7336491654', CAST(N'2000-10-10' AS Date), 2, 1, 3122)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (737, 1694, N'3657705033', CAST(N'2000-10-10' AS Date), 2, 2, 1484)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (738, 1640, N'6899548324', CAST(N'2000-10-10' AS Date), 2, 3, 1852)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (739, 1190, N'4848410037', CAST(N'2000-10-10' AS Date), 2, 2, 1003)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (740, 836, N'2685874130', CAST(N'2000-10-10' AS Date), 1, 2, 1278)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (741, 1833, N'9649243832', CAST(N'2000-10-10' AS Date), 1, 5, 1243)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (742, 1555, N'3331791296', CAST(N'2000-10-10' AS Date), 3, 2, 3779)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (743, 1722, N'6026460942', CAST(N'2000-10-10' AS Date), 3, 2, 1511)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (744, 842, N'2839577877', CAST(N'2000-10-10' AS Date), 3, 3, 2306)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (745, 919, N'6424696820', CAST(N'2000-10-10' AS Date), 3, 2, 2986)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (746, 1609, N'6308375876', CAST(N'2000-10-10' AS Date), 3, 3, 3291)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (747, 976, N'2131505160', CAST(N'2000-10-10' AS Date), 4, 4, 2475)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (748, 1482, N'6854338596', CAST(N'2000-10-10' AS Date), 4, 2, 2430)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (749, 1181, N'9612208914', CAST(N'2000-10-10' AS Date), 4, 1, 3276)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (750, 976, N'8345894860', CAST(N'2000-10-10' AS Date), 2, 2, 3678)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (751, 1232, N'7537739552', CAST(N'2000-10-10' AS Date), 2, 4, 3801)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (752, 899, N'5558431667', CAST(N'2000-10-10' AS Date), 2, 2, 2583)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (753, 742, N'3267703598', CAST(N'2000-10-10' AS Date), 1, 1, 1374)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (754, 603, N'8167259713', CAST(N'2000-10-10' AS Date), 3, 2, 2605)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (755, 664, N'6669908189', CAST(N'2000-10-10' AS Date), 4, 2, 3250)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (756, 1527, N'9555361967', CAST(N'2000-10-10' AS Date), 4, 2, 3959)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (757, 876, N'9833022354', CAST(N'2000-10-10' AS Date), 4, 1, 2521)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (758, 1395, N'2555438314', CAST(N'2000-10-10' AS Date), 5, 4, 3015)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (759, 608, N'8320272983', CAST(N'2000-10-10' AS Date), 5, 3, 2166)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (760, 1268, N'2010852043', CAST(N'2000-10-10' AS Date), 5, 4, 2613)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (761, 1859, N'6061499021', CAST(N'2000-10-10' AS Date), 5, 3, 2043)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (762, 781, N'2224262465', CAST(N'2000-10-10' AS Date), 2, 3, 2807)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (763, 891, N'9787454749', CAST(N'2000-10-10' AS Date), 2, 1, 1359)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (764, 1819, N'3605539910', CAST(N'2000-10-10' AS Date), 3, 2, 2178)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (765, 1222, N'8399102194', CAST(N'2000-10-10' AS Date), 5, 4, 3277)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (766, 1025, N'8177191977', CAST(N'2000-10-10' AS Date), 5, 5, 1887)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (767, 1459, N'3007261422', CAST(N'2000-10-10' AS Date), 1, 3, 1844)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (768, 1843, N'2248241824', CAST(N'2000-10-10' AS Date), 1, 3, 2636)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (769, 961, N'7382694521', CAST(N'2000-10-10' AS Date), 3, 2, 1098)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (770, 1514, N'9075672097', CAST(N'2000-10-10' AS Date), 4, 4, 2915)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (771, 1338, N'2198706639', CAST(N'2000-10-10' AS Date), 1, 3, 3815)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (772, 1877, N'7451059205', CAST(N'2000-10-10' AS Date), 1, 1, 3164)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (773, 1148, N'1867431315', CAST(N'2000-10-10' AS Date), 3, 4, 3239)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (774, 946, N'3090225985', CAST(N'2000-10-10' AS Date), 3, 1, 3769)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (775, 1485, N'4530334823', CAST(N'2000-10-10' AS Date), 4, 3, 2044)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (776, 1523, N'1637335775', CAST(N'2000-10-10' AS Date), 5, 3, 1002)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (777, 469, N'3304032193', CAST(N'2000-10-10' AS Date), 4, 3, 2986)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (778, 1019, N'9825799287', CAST(N'2000-10-10' AS Date), 5, 3, 3454)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (779, 825, N'2717961792', CAST(N'2000-10-10' AS Date), 2, 5, 3785)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (780, 1244, N'6811154099', CAST(N'2000-10-10' AS Date), 1, 4, 1379)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (781, 1673, N'7947000339', CAST(N'2000-10-10' AS Date), 4, 5, 3447)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (782, 1475, N'7501335245', CAST(N'2000-10-10' AS Date), 4, 2, 3790)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (783, 1245, N'5498449487', CAST(N'2000-10-10' AS Date), 4, 1, 2140)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (784, 594, N'4716172600', CAST(N'2000-10-10' AS Date), 5, 2, 2443)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (785, 573, N'5844630353', CAST(N'2000-10-10' AS Date), 2, 3, 1543)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (786, 1392, N'3124009257', CAST(N'2000-10-10' AS Date), 1, 1, 3141)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (787, 1029, N'6790875373', CAST(N'2000-10-10' AS Date), 1, 5, 1673)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (788, 661, N'8095428399', CAST(N'2000-10-10' AS Date), 4, 4, 3587)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (789, 780, N'8583392699', CAST(N'2000-10-10' AS Date), 5, 1, 2604)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (790, 806, N'9217158295', CAST(N'2000-10-10' AS Date), 2, 5, 2472)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (791, 1351, N'3748402105', CAST(N'2000-10-10' AS Date), 2, 3, 1611)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (792, 498, N'7025222732', CAST(N'2000-10-10' AS Date), 2, 5, 2289)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (793, 638, N'1369075155', CAST(N'2000-10-10' AS Date), 1, 4, 2618)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (794, 650, N'3869582585', CAST(N'2000-10-10' AS Date), 3, 5, 2195)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (795, 841, N'9832664101', CAST(N'2000-10-10' AS Date), 2, 1, 1596)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (796, 1806, N'8888682196', CAST(N'2000-10-10' AS Date), 2, 2, 3879)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (797, 1445, N'8222116446', CAST(N'2000-10-10' AS Date), 1, 4, 1584)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (798, 770, N'1951181635', CAST(N'2000-10-10' AS Date), 3, 4, 3132)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (799, 1548, N'8248902314', CAST(N'2000-10-10' AS Date), 4, 2, 2854)
GO
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (800, 545, N'2948366361', CAST(N'2000-10-10' AS Date), 4, 5, 2306)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (801, 1907, N'1607040816', CAST(N'2000-10-10' AS Date), 5, 1, 1334)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (802, 671, N'6035871111', CAST(N'2000-10-10' AS Date), 2, 2, 2390)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (803, 1204, N'3298289420', CAST(N'2000-10-10' AS Date), 5, 1, 1986)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (804, 1317, N'2507397499', CAST(N'2000-10-10' AS Date), 2, 3, 2606)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (805, 1288, N'7573161702', CAST(N'2000-10-10' AS Date), 2, 2, 3577)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (806, 1625, N'2589389318', CAST(N'2000-10-10' AS Date), 2, 4, 3022)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (807, 961, N'2344163397', CAST(N'2000-10-10' AS Date), 2, 1, 1694)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (808, 676, N'6019475900', CAST(N'2000-10-10' AS Date), 3, 4, 1693)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (809, 1014, N'3270980826', CAST(N'2000-10-10' AS Date), 4, 1, 3570)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (810, 1377, N'7657666608', CAST(N'2000-10-10' AS Date), 4, 4, 1230)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (811, 1226, N'2390721726', CAST(N'2000-10-10' AS Date), 4, 1, 2253)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (812, 1548, N'9852591938', CAST(N'2000-10-10' AS Date), 4, 5, 3731)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (813, 932, N'6360859046', CAST(N'2000-10-10' AS Date), 4, 3, 1616)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (814, 1272, N'2339585439', CAST(N'2000-10-10' AS Date), 5, 2, 3537)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (815, 1071, N'9180862179', CAST(N'2000-10-10' AS Date), 1, 4, 1726)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (816, 921, N'7624353415', CAST(N'2000-10-10' AS Date), 1, 1, 3723)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (817, 1434, N'9654649832', CAST(N'2000-10-10' AS Date), 1, 5, 3550)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (818, 919, N'9192005067', CAST(N'2000-10-10' AS Date), 3, 1, 3208)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (819, 745, N'3102343458', CAST(N'2000-10-10' AS Date), 3, 4, 1389)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (820, 1646, N'7849665181', CAST(N'2000-10-10' AS Date), 3, 3, 2323)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (821, 569, N'8040678537', CAST(N'2000-10-10' AS Date), 2, 1, 1159)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (822, 551, N'1509514450', CAST(N'2000-10-10' AS Date), 2, 1, 2624)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (823, 459, N'2257173720', CAST(N'2000-10-10' AS Date), 2, 4, 3146)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (824, 553, N'2342407387', CAST(N'2000-10-10' AS Date), 1, 1, 3307)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (825, 1844, N'4404326497', CAST(N'2000-10-10' AS Date), 1, 3, 2070)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (826, 1822, N'2922270073', CAST(N'2000-10-10' AS Date), 4, 1, 1708)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (827, 1532, N'3592758957', CAST(N'2000-10-10' AS Date), 4, 3, 1435)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (828, 616, N'7892750034', CAST(N'2000-10-10' AS Date), 1, 4, 3112)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (829, 1795, N'7646532453', CAST(N'2000-10-10' AS Date), 3, 5, 1986)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (830, 1492, N'6560942461', CAST(N'2000-10-10' AS Date), 3, 3, 3334)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (831, 909, N'1952365573', CAST(N'2000-10-10' AS Date), 4, 5, 3930)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (832, 741, N'1367401187', CAST(N'2000-10-10' AS Date), 4, 3, 1057)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (833, 1217, N'6099054041', CAST(N'2000-10-10' AS Date), 4, 5, 1909)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (834, 813, N'1971862224', CAST(N'2000-10-10' AS Date), 1, 2, 1421)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (835, 1122, N'4860403812', CAST(N'2000-10-10' AS Date), 4, 3, 3247)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (836, 1887, N'4959463945', CAST(N'2000-10-10' AS Date), 4, 5, 1865)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (837, 454, N'1185554327', CAST(N'2000-10-10' AS Date), 4, 1, 2620)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (838, 1290, N'6335643837', CAST(N'2000-10-10' AS Date), 5, 1, 2807)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (839, 1358, N'8861715043', CAST(N'2000-10-10' AS Date), 2, 2, 2752)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (840, 1582, N'9171608908', CAST(N'2000-10-10' AS Date), 5, 2, 2524)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (841, 1836, N'4264750302', CAST(N'2000-10-10' AS Date), 3, 5, 3556)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (842, 1983, N'2752779204', CAST(N'2000-10-10' AS Date), 5, 1, 3054)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (843, 1636, N'4222962153', CAST(N'2000-10-10' AS Date), 2, 3, 3934)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (844, 727, N'1337173425', CAST(N'2000-10-10' AS Date), 1, 2, 2384)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (845, 1190, N'9979628855', CAST(N'2000-10-10' AS Date), 4, 2, 2056)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (846, 507, N'4638024476', CAST(N'2000-10-10' AS Date), 4, 2, 3943)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (847, 1038, N'1943087464', CAST(N'2000-10-10' AS Date), 4, 1, 2469)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (848, 1874, N'4777614629', CAST(N'2000-10-10' AS Date), 5, 4, 2161)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (849, 892, N'6539288210', CAST(N'2000-10-10' AS Date), 1, 1, 2022)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (850, 1031, N'6190380095', CAST(N'2000-10-10' AS Date), 3, 4, 1990)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (851, 1086, N'5958426328', CAST(N'2000-10-10' AS Date), 4, 1, 3307)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (852, 1009, N'6334479135', CAST(N'2000-10-10' AS Date), 5, 1, 1990)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (853, 1455, N'6635297646', CAST(N'2000-10-10' AS Date), 2, 1, 3172)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (854, 894, N'8513797940', CAST(N'2000-10-10' AS Date), 2, 5, 3612)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (855, 1801, N'1347477614', CAST(N'2000-10-10' AS Date), 2, 5, 2233)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (856, 593, N'5903491175', CAST(N'2000-10-10' AS Date), 2, 4, 2650)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (857, 1170, N'2464482441', CAST(N'2000-10-10' AS Date), 3, 4, 3417)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (858, 696, N'4397474160', CAST(N'2000-10-10' AS Date), 5, 1, 2250)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (859, 659, N'1417750909', CAST(N'2000-10-10' AS Date), 5, 1, 3673)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (860, 820, N'2281864111', CAST(N'2000-10-10' AS Date), 2, 1, 2304)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (861, 1007, N'5299514912', CAST(N'2000-10-10' AS Date), 1, 3, 1749)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (862, 1001, N'1971824419', CAST(N'2000-10-10' AS Date), 4, 4, 1128)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (863, 841, N'9427759489', CAST(N'2000-10-10' AS Date), 5, 5, 2769)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (864, 1217, N'9809142148', CAST(N'2000-10-10' AS Date), 2, 2, 1207)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (865, 1965, N'4762431923', CAST(N'2000-10-10' AS Date), 1, 4, 2364)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (866, 520, N'3864314659', CAST(N'2000-10-10' AS Date), 3, 4, 3186)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (867, 636, N'8257050643', CAST(N'2000-10-10' AS Date), 3, 4, 3540)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (868, 553, N'8752436237', CAST(N'2000-10-10' AS Date), 5, 5, 3262)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (869, 1327, N'7923740244', CAST(N'2000-10-10' AS Date), 5, 1, 2926)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (870, 1939, N'9069052025', CAST(N'2000-10-10' AS Date), 5, 1, 3270)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (871, 1130, N'7223939882', CAST(N'2000-10-10' AS Date), 3, 1, 1784)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (872, 910, N'3316362561', CAST(N'2000-10-10' AS Date), 1, 1, 3817)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (873, 1758, N'4399216663', CAST(N'2000-10-10' AS Date), 5, 4, 1161)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (874, 1944, N'3360518371', CAST(N'2000-10-10' AS Date), 5, 3, 3414)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (875, 1174, N'7480619367', CAST(N'2000-10-10' AS Date), 4, 4, 1412)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (876, 451, N'8364328974', CAST(N'2000-10-10' AS Date), 2, 3, 3784)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (877, 1511, N'3016279460', CAST(N'2000-10-10' AS Date), 1, 2, 1954)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (878, 1200, N'1396891374', CAST(N'2000-10-10' AS Date), 3, 5, 3740)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (879, 1166, N'8979489949', CAST(N'2000-10-10' AS Date), 4, 1, 1373)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (880, 1935, N'2954987832', CAST(N'2000-10-10' AS Date), 1, 2, 2167)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (881, 767, N'9665795407', CAST(N'2000-10-10' AS Date), 1, 2, 1533)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (882, 903, N'1959610725', CAST(N'2000-10-10' AS Date), 1, 3, 1049)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (883, 1962, N'6100074209', CAST(N'2000-10-10' AS Date), 4, 3, 3175)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (884, 1248, N'2352066246', CAST(N'2000-10-10' AS Date), 3, 3, 2807)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (885, 952, N'1025324655', CAST(N'2000-10-10' AS Date), 4, 5, 3261)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (886, 1152, N'7423531453', CAST(N'2000-10-10' AS Date), 5, 3, 1477)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (887, 1290, N'3434709567', CAST(N'2000-10-10' AS Date), 1, 4, 2447)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (888, 1971, N'9784710533', CAST(N'2000-10-10' AS Date), 1, 1, 1407)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (889, 1583, N'5297349077', CAST(N'2000-10-10' AS Date), 3, 1, 2994)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (890, 1505, N'1486570279', CAST(N'2000-10-10' AS Date), 4, 5, 2716)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (891, 1014, N'9741108018', CAST(N'2000-10-10' AS Date), 4, 5, 3751)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (892, 1860, N'8710698821', CAST(N'2000-10-10' AS Date), 5, 1, 3092)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (893, 1379, N'4816071912', CAST(N'2000-10-10' AS Date), 5, 2, 2098)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (894, 1132, N'5712147254', CAST(N'2000-10-10' AS Date), 2, 5, 1352)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (895, 1681, N'1716712137', CAST(N'2000-10-10' AS Date), 3, 4, 1967)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (896, 1475, N'4746432587', CAST(N'2000-10-10' AS Date), 1, 5, 1305)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (897, 1281, N'9054692387', CAST(N'2000-10-10' AS Date), 4, 3, 3285)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (898, 824, N'7710395933', CAST(N'2000-10-10' AS Date), 2, 4, 3402)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (899, 542, N'2365938329', CAST(N'2000-10-10' AS Date), 3, 1, 3494)
GO
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (900, 1803, N'4562369122', CAST(N'2000-10-10' AS Date), 3, 5, 3499)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (901, 978, N'8550578211', CAST(N'2000-10-10' AS Date), 3, 1, 3831)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (902, 1257, N'6253735085', CAST(N'2000-10-10' AS Date), 4, 3, 1682)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (903, 1304, N'9541071586', CAST(N'2000-10-10' AS Date), 4, 5, 3776)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (904, 757, N'5429543445', CAST(N'2000-10-10' AS Date), 2, 5, 3642)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (905, 1390, N'4618255606', CAST(N'2000-10-10' AS Date), 1, 4, 3504)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (906, 1152, N'6093964089', CAST(N'2000-10-10' AS Date), 3, 3, 2595)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (907, 1671, N'6769409590', CAST(N'2000-10-10' AS Date), 2, 5, 1609)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (908, 1056, N'3536448488', CAST(N'2000-10-10' AS Date), 2, 1, 3614)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (909, 1932, N'3997295629', CAST(N'2000-10-10' AS Date), 1, 2, 3207)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (910, 1332, N'1362798921', CAST(N'2000-10-10' AS Date), 1, 4, 1397)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (911, 1420, N'4531823916', CAST(N'2000-10-10' AS Date), 3, 4, 2209)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (912, 1579, N'1907529132', CAST(N'2000-10-10' AS Date), 4, 5, 2677)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (913, 1067, N'4470363363', CAST(N'2000-10-10' AS Date), 5, 2, 2384)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (914, 632, N'9036167847', CAST(N'2000-10-10' AS Date), 5, 5, 2558)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (915, 1543, N'1641725728', CAST(N'2000-10-10' AS Date), 1, 1, 3666)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (916, 1575, N'8020909314', CAST(N'2000-10-10' AS Date), 5, 5, 1421)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (917, 1423, N'7693076735', CAST(N'2000-10-10' AS Date), 2, 1, 1925)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (918, 452, N'4989404951', CAST(N'2000-10-10' AS Date), 2, 1, 2504)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (919, 732, N'5577019156', CAST(N'2000-10-10' AS Date), 2, 5, 2735)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (920, 1671, N'1719319771', CAST(N'2000-10-10' AS Date), 2, 1, 2968)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (921, 1009, N'1957561638', CAST(N'2000-10-10' AS Date), 2, 2, 2400)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (922, 1362, N'5004151390', CAST(N'2000-10-10' AS Date), 1, 1, 3279)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (923, 1746, N'6761610057', CAST(N'2000-10-10' AS Date), 2, 5, 3484)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (924, 730, N'6171196233', CAST(N'2000-10-10' AS Date), 2, 4, 2472)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (925, 1932, N'8478090020', CAST(N'2000-10-10' AS Date), 4, 2, 2304)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (926, 1748, N'6604132068', CAST(N'2000-10-10' AS Date), 5, 5, 2749)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (927, 1656, N'7897037384', CAST(N'2000-10-10' AS Date), 5, 1, 1872)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (928, 924, N'6864135864', CAST(N'2000-10-10' AS Date), 2, 4, 1934)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (929, 1450, N'5970969338', CAST(N'2000-10-10' AS Date), 1, 4, 3545)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (930, 679, N'9833107414', CAST(N'2000-10-10' AS Date), 3, 3, 2124)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (931, 1277, N'4763919178', CAST(N'2000-10-10' AS Date), 4, 1, 2811)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (932, 1823, N'2276304988', CAST(N'2000-10-10' AS Date), 4, 1, 3229)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (933, 1192, N'6802420708', CAST(N'2000-10-10' AS Date), 4, 3, 1028)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (934, 1145, N'7277294121', CAST(N'2000-10-10' AS Date), 5, 1, 2207)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (935, 1824, N'4855661242', CAST(N'2000-10-10' AS Date), 5, 3, 2387)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (936, 476, N'5080080091', CAST(N'2000-10-10' AS Date), 2, 2, 3424)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (937, 611, N'6223596453', CAST(N'2000-10-10' AS Date), 2, 5, 1332)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (938, 1770, N'7026461980', CAST(N'2000-10-10' AS Date), 1, 3, 2116)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (939, 451, N'3760384156', CAST(N'2000-10-10' AS Date), 5, 3, 3825)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (940, 1236, N'5362523088', CAST(N'2000-10-10' AS Date), 5, 5, 2489)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (941, 1874, N'1720415342', CAST(N'2000-10-10' AS Date), 2, 3, 1853)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (942, 1807, N'2668634163', CAST(N'2000-10-10' AS Date), 3, 2, 1414)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (943, 1329, N'3879884164', CAST(N'2000-10-10' AS Date), 4, 5, 3100)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (944, 969, N'3914051910', CAST(N'2000-10-10' AS Date), 4, 3, 3802)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (945, 1125, N'7087754584', CAST(N'2000-10-10' AS Date), 5, 4, 1363)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (946, 1039, N'1985238823', CAST(N'2000-10-10' AS Date), 2, 5, 1080)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (947, 738, N'5540032066', CAST(N'2000-10-10' AS Date), 1, 4, 1249)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (948, 512, N'5622134921', CAST(N'2000-10-10' AS Date), 3, 3, 3166)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (949, 1298, N'2331765220', CAST(N'2000-10-10' AS Date), 3, 3, 2730)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (950, 849, N'6121362839', CAST(N'2000-10-10' AS Date), 4, 1, 3792)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (951, 1020, N'3970958094', CAST(N'2000-10-10' AS Date), 5, 1, 2434)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (952, 1992, N'5614865813', CAST(N'2000-10-10' AS Date), 3, 1, 2692)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (953, 989, N'9384226038', CAST(N'2000-10-10' AS Date), 3, 4, 2619)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (954, 1574, N'6343922350', CAST(N'2000-10-10' AS Date), 3, 1, 1596)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (955, 945, N'8892956337', CAST(N'2000-10-10' AS Date), 3, 4, 2420)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (956, 1560, N'5795506536', CAST(N'2000-10-10' AS Date), 3, 1, 2611)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (957, 1980, N'8919167418', CAST(N'2000-10-10' AS Date), 3, 4, 3454)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (958, 1089, N'9572757952', CAST(N'2000-10-10' AS Date), 4, 4, 3011)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (959, 1716, N'5718237481', CAST(N'2000-10-10' AS Date), 5, 2, 2400)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (960, 1304, N'2185946932', CAST(N'2000-10-10' AS Date), 1, 3, 3203)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (961, 1025, N'2901644089', CAST(N'2000-10-10' AS Date), 4, 5, 2443)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (962, 1676, N'5516766186', CAST(N'2000-10-10' AS Date), 4, 4, 2082)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (963, 1762, N'3147712575', CAST(N'2000-10-10' AS Date), 2, 2, 1698)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (964, 1547, N'6228843682', CAST(N'2000-10-10' AS Date), 2, 3, 3892)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (965, 688, N'2462824738', CAST(N'2000-10-10' AS Date), 2, 4, 2303)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (966, 934, N'5615320663', CAST(N'2000-10-10' AS Date), 2, 5, 2051)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (967, 565, N'7204922413', CAST(N'2000-10-10' AS Date), 1, 1, 2904)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (968, 1672, N'3543576688', CAST(N'2000-10-10' AS Date), 3, 3, 3725)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (969, 638, N'9199778092', CAST(N'2000-10-10' AS Date), 5, 1, 3065)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (970, 1648, N'1452718256', CAST(N'2000-10-10' AS Date), 5, 5, 3665)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (971, 1241, N'8028431651', CAST(N'2000-10-10' AS Date), 2, 1, 3171)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (972, 1207, N'4053040313', CAST(N'2000-10-10' AS Date), 3, 5, 3676)
INSERT [dbo].[Propiedad] ([ID], [Area], [ValorFiscal], [FechaRegistro], [IdTipoTerreno], [IdTipoZona], [NumeroFinca]) VALUES (973, 1850, N'9700194520', CAST(N'2000-10-10' AS Date), 3, 3, 1750)
SET IDENTITY_INSERT [dbo].[Propiedad] OFF
GO
SET IDENTITY_INSERT [dbo].[PXP] ON 

INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (1, 3, 1, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (2, 7, 2, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (3, 2, 4, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (4, 6, 6, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (5, 1, 7, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (6, 8, 8, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (7, 9, 9, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (8, 1, 10, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (9, 3, 10, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (10, 4, 10, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (11, 5, 12, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (12, 7, 12, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (13, 2, 587, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (14, 3, 941, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (15, 12, 15, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (16, 11, 17, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (17, 13, 17, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (18, 14, 20, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (19, 12, 21, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (20, 10, 25, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (21, 10, 26, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (22, 11, 26, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (23, 18, 30, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (24, 20, 30, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (25, 16, 31, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (26, 20, 32, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (27, 21, 33, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (28, 19, 34, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (29, 15, 37, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (30, 19, 37, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (31, 17, 38, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (32, 18, 39, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (33, 21, 569, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (34, 18, 708, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (35, 22, 42, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (36, 23, 47, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (37, 23, 53, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (38, 27, 56, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (39, 28, 57, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (40, 25, 64, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (41, 28, 65, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (42, 24, 66, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (43, 26, 68, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (44, 29, 70, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (45, 28, 92, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (46, 29, 836, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (47, 30, 35, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (48, 31, 71, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (49, 30, 79, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (50, 34, 81, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (51, 32, 84, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (52, 33, 84, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (53, 30, 86, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (54, 31, 86, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (55, 32, 86, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (56, 34, 195, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (57, 32, 707, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (58, 33, 707, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (59, 30, 893, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (60, 35, 87, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (61, 36, 88, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (62, 40, 89, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (63, 35, 93, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (64, 37, 94, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (65, 38, 95, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (66, 39, 97, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (67, 39, 101, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (68, 38, 158, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (69, 39, 309, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (70, 39, 465, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (71, 37, 818, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (72, 41, 102, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (73, 43, 102, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (74, 47, 102, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (75, 43, 103, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (76, 46, 104, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (77, 41, 105, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (78, 42, 105, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (79, 44, 107, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (80, 47, 108, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (81, 45, 109, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (82, 46, 109, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (83, 42, 110, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (84, 46, 143, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (85, 41, 263, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (86, 42, 263, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (87, 44, 495, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (88, 48, 116, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (89, 49, 117, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (90, 49, 118, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (91, 50, 118, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (92, 50, 120, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (93, 51, 121, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (94, 52, 124, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (95, 54, 124, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (96, 55, 125, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (97, 53, 129, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (98, 54, 132, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (99, 55, 133, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
GO
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (100, 56, 133, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (101, 52, 134, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (102, 56, 136, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (103, 57, 137, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (104, 52, 401, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (105, 54, 401, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (106, 57, 827, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (107, 58, 104, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (108, 64, 141, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (109, 59, 142, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (110, 58, 143, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (111, 62, 144, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (112, 61, 148, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (113, 60, 149, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (114, 61, 150, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (115, 63, 151, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (116, 59, 152, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (117, 60, 152, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (118, 64, 152, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (119, 65, 63, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (120, 67, 95, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (121, 68, 153, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (122, 65, 154, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (123, 67, 154, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (124, 67, 158, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (125, 65, 159, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (126, 66, 163, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (127, 65, 206, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (128, 65, 940, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (129, 67, 940, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (130, 75, 166, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (131, 78, 167, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (132, 74, 168, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (133, 78, 168, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (134, 72, 169, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (135, 73, 169, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (136, 71, 170, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (137, 73, 170, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (138, 69, 171, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (139, 71, 172, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (140, 72, 172, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (141, 76, 173, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (142, 70, 174, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (143, 74, 174, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (144, 77, 175, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (145, 74, 249, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (146, 78, 249, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (147, 71, 457, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (148, 73, 457, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (149, 76, 530, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (150, 74, 963, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (151, 78, 963, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (152, 80, 176, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (153, 83, 178, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (154, 83, 180, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (155, 79, 181, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (156, 81, 182, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (157, 81, 183, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (158, 82, 183, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (159, 82, 184, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (160, 80, 197, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (161, 82, 480, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (162, 80, 919, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (163, 86, 81, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (164, 89, 188, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (165, 87, 189, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (166, 88, 192, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (167, 84, 193, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (168, 85, 193, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (169, 85, 194, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (170, 86, 195, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (171, 84, 198, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (172, 90, 199, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (173, 97, 14, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (174, 94, 202, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (175, 96, 202, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (176, 92, 205, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (177, 91, 207, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (178, 97, 208, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (179, 91, 210, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (180, 92, 210, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (181, 93, 211, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (182, 95, 212, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (183, 96, 214, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (184, 92, 216, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (185, 91, 256, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (186, 92, 256, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (187, 96, 681, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (188, 104, 205, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (189, 100, 215, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (190, 104, 216, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (191, 105, 217, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (192, 99, 218, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (193, 102, 218, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (194, 103, 219, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (195, 104, 219, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (196, 106, 221, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (197, 98, 222, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (198, 101, 222, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (199, 102, 222, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
GO
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (200, 98, 223, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (201, 106, 223, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (202, 99, 224, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (203, 106, 789, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (204, 103, 857, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (205, 104, 857, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (206, 99, 912, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (207, 111, 228, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (208, 107, 230, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (209, 109, 230, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (210, 110, 231, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (211, 107, 233, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (212, 108, 234, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (213, 111, 234, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (214, 107, 334, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (215, 107, 900, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (216, 109, 900, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (217, 107, 949, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (218, 118, 237, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (219, 113, 238, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (220, 118, 238, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (221, 117, 239, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (222, 114, 241, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (223, 115, 242, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (224, 116, 242, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (225, 116, 243, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (226, 112, 244, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (227, 114, 244, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (228, 115, 244, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (229, 119, 246, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (230, 115, 289, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (231, 116, 289, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (232, 116, 330, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (233, 117, 644, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (234, 113, 918, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (235, 118, 918, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (236, 117, 968, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (237, 121, 247, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (238, 122, 248, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (239, 120, 251, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (240, 123, 254, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (241, 120, 259, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (242, 120, 475, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (243, 125, 261, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (244, 125, 262, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (245, 126, 262, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (246, 127, 267, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (247, 124, 270, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (248, 124, 273, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (249, 125, 702, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (250, 126, 702, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (251, 128, 274, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (252, 129, 275, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (253, 130, 277, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (254, 130, 278, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (255, 131, 278, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (256, 132, 278, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (257, 131, 279, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (258, 132, 279, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (259, 129, 280, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (260, 131, 660, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (261, 132, 660, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (262, 133, 284, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (263, 136, 284, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (264, 134, 285, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (265, 138, 285, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (266, 138, 288, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (267, 134, 290, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (268, 135, 290, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (269, 139, 290, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (270, 140, 292, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (271, 139, 293, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (272, 133, 294, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (273, 136, 294, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (274, 135, 295, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (275, 137, 295, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (276, 140, 296, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (277, 139, 873, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (278, 142, 82, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (279, 142, 301, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (280, 141, 302, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (281, 142, 302, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (282, 143, 97, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (283, 144, 97, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (284, 145, 97, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (285, 144, 252, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (286, 147, 264, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (287, 143, 305, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (288, 146, 307, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (289, 143, 309, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (290, 144, 309, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (291, 145, 309, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (292, 147, 310, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (293, 144, 311, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (294, 147, 312, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (295, 148, 313, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (296, 152, 316, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (297, 151, 317, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (298, 150, 318, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (299, 151, 319, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
GO
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (599, 301, 651, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (600, 301, 652, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (601, 297, 653, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (602, 302, 653, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (603, 303, 653, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (604, 297, 654, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (605, 302, 726, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (606, 299, 734, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (607, 301, 734, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (608, 306, 374, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (609, 307, 384, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (610, 308, 384, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (611, 307, 491, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (612, 308, 491, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (613, 306, 655, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (614, 310, 657, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (615, 311, 658, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (616, 307, 661, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (617, 308, 661, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (618, 308, 663, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (619, 305, 664, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (620, 309, 666, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (621, 308, 687, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (622, 307, 695, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (623, 308, 695, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (624, 307, 850, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (625, 308, 850, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (626, 307, 852, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (627, 308, 852, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (628, 309, 890, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (629, 312, 667, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (630, 315, 667, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (631, 313, 668, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (632, 317, 669, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (633, 318, 670, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (634, 319, 673, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (635, 315, 675, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (636, 316, 675, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (637, 316, 676, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (638, 314, 677, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (639, 318, 677, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (640, 317, 813, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (641, 316, 856, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (642, 325, 618, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (643, 321, 663, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (644, 322, 678, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (645, 324, 679, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (646, 320, 685, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (647, 321, 686, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (648, 321, 687, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (649, 323, 688, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (650, 325, 689, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (651, 328, 84, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (652, 331, 84, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (653, 327, 692, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (654, 329, 693, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (655, 330, 693, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (656, 332, 693, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (657, 328, 701, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (658, 331, 701, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (659, 326, 704, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (660, 332, 705, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (661, 326, 706, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (662, 327, 706, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (663, 330, 706, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (664, 328, 707, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (665, 331, 707, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (666, 326, 842, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (667, 327, 842, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (668, 330, 842, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (669, 326, 928, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (670, 334, 39, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (671, 339, 39, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (672, 338, 524, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (673, 334, 708, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (674, 339, 708, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (675, 336, 709, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (676, 337, 712, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (677, 333, 713, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (678, 335, 713, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (679, 339, 714, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (680, 333, 715, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (681, 337, 715, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (682, 340, 715, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (683, 340, 716, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (684, 338, 720, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (685, 333, 790, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (686, 337, 790, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (687, 340, 790, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (688, 333, 924, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (689, 337, 924, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (690, 340, 924, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (691, 346, 127, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (692, 342, 721, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (693, 348, 721, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (694, 345, 722, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (695, 347, 723, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (696, 344, 725, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (697, 346, 725, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (698, 346, 728, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
GO
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (699, 341, 729, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (700, 345, 729, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (701, 342, 730, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (702, 343, 731, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (703, 344, 731, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (704, 347, 731, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (705, 348, 732, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (706, 346, 788, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (707, 350, 581, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (708, 356, 581, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (709, 349, 638, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (710, 351, 638, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (711, 354, 638, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (712, 350, 651, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (713, 356, 651, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (714, 350, 734, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (715, 356, 734, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (716, 355, 736, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (717, 349, 738, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (718, 351, 738, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (719, 354, 738, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (720, 349, 739, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (721, 350, 739, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (722, 352, 739, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (723, 353, 739, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (724, 354, 741, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (725, 353, 742, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (726, 357, 746, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (727, 356, 747, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (728, 352, 748, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (729, 359, 750, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (730, 360, 751, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (731, 358, 753, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (732, 361, 754, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (733, 362, 762, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (734, 362, 838, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (735, 362, 884, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (736, 364, 763, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (737, 363, 764, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (738, 366, 60, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (739, 366, 257, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (740, 365, 460, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (741, 365, 765, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (742, 366, 770, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (743, 367, 571, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (744, 367, 774, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (745, 368, 775, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (746, 369, 745, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (747, 369, 777, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (748, 372, 450, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (749, 372, 779, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (750, 373, 781, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (751, 370, 782, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (752, 371, 783, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (753, 374, 715, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (754, 374, 790, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (755, 375, 793, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (756, 374, 924, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (757, 376, 496, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (758, 377, 744, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (759, 376, 799, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (760, 377, 800, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (761, 378, 801, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (762, 379, 804, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (763, 380, 805, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (764, 384, 240, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (765, 384, 382, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (766, 382, 807, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (767, 381, 809, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (768, 383, 811, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (769, 384, 812, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (770, 387, 29, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (771, 385, 94, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (772, 386, 814, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (773, 387, 816, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (774, 385, 818, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (775, 388, 821, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (776, 389, 822, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (777, 390, 823, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (778, 391, 306, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (779, 392, 435, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (780, 393, 828, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (781, 392, 831, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (782, 391, 833, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (783, 396, 62, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (784, 397, 70, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (785, 395, 834, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (786, 396, 835, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (787, 397, 836, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (788, 394, 837, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (789, 395, 916, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (790, 398, 839, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (791, 399, 840, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (792, 401, 3, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (793, 402, 384, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (794, 402, 491, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (795, 402, 661, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (796, 401, 690, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (797, 402, 695, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (798, 400, 824, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
GO
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (799, 401, 849, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (800, 402, 850, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (801, 400, 851, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (802, 402, 852, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (803, 403, 219, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (804, 404, 384, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (805, 406, 426, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (806, 404, 491, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (807, 404, 661, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (808, 404, 695, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (809, 404, 850, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (810, 404, 852, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (811, 405, 853, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (812, 406, 854, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (813, 407, 855, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (814, 403, 857, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (815, 410, 859, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (816, 408, 860, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (817, 409, 861, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (818, 408, 925, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (819, 411, 864, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (820, 412, 348, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (821, 412, 868, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (822, 414, 876, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (823, 413, 878, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (824, 415, 879, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (825, 416, 883, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (826, 417, 886, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (827, 418, 888, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (828, 420, 894, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (829, 419, 895, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (830, 421, 896, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (831, 423, 898, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (832, 424, 899, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (833, 422, 902, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (834, 425, 906, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (835, 428, 907, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (836, 427, 909, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (837, 426, 911, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (838, 429, 844, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (839, 429, 913, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (840, 431, 176, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (841, 431, 197, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (842, 430, 238, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (843, 430, 918, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (844, 431, 919, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (845, 432, 920, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (846, 433, 921, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (847, 433, 959, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (848, 434, 860, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (849, 435, 923, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (850, 434, 925, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (851, 436, 75, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (852, 439, 704, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (853, 437, 926, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (854, 439, 928, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (855, 436, 931, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (856, 438, 933, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (857, 440, 934, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (858, 441, 936, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (859, 442, 937, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (860, 443, 1, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (861, 443, 941, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (862, 444, 942, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (863, 447, 233, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (864, 447, 334, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (865, 445, 945, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (866, 446, 946, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (867, 447, 949, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (868, 448, 952, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (869, 449, 953, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (870, 450, 958, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (871, 451, 962, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (872, 452, 168, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (873, 455, 239, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (874, 452, 249, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (875, 455, 644, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (876, 452, 963, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (877, 453, 964, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (878, 454, 965, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (879, 456, 966, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (880, 455, 968, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (881, 458, 684, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (882, 457, 969, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (883, 458, 971, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (884, 459, 973, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (300, 149, 320, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (301, 150, 320, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (302, 149, 321, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (303, 151, 520, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (304, 155, 268, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (305, 153, 322, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (306, 154, 323, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (307, 156, 324, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (308, 155, 325, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (309, 153, 332, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (310, 157, 328, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (311, 158, 328, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (312, 160, 329, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (313, 160, 335, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
GO
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (314, 159, 337, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (315, 157, 338, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (316, 159, 338, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (317, 157, 625, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (318, 159, 625, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (319, 164, 339, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (320, 161, 340, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (321, 165, 341, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (322, 161, 343, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (323, 163, 343, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (324, 164, 344, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (325, 162, 345, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (326, 167, 345, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (327, 167, 346, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (328, 166, 347, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (329, 165, 365, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (330, 169, 98, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (331, 170, 98, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (332, 175, 98, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (333, 170, 348, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (334, 171, 348, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (335, 172, 348, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (336, 169, 349, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (337, 170, 349, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (338, 175, 349, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (339, 168, 350, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (340, 172, 350, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (341, 174, 352, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (342, 175, 353, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (343, 173, 354, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (344, 171, 355, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (345, 168, 356, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (346, 174, 356, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (347, 169, 357, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (348, 168, 489, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (349, 172, 489, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (350, 174, 733, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (351, 175, 819, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (352, 170, 868, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (353, 171, 868, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (354, 172, 868, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (355, 178, 191, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (356, 177, 341, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (357, 176, 362, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (358, 176, 364, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (359, 177, 364, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (360, 177, 365, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (361, 178, 366, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (362, 176, 547, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (363, 176, 548, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (364, 177, 548, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (365, 181, 368, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (366, 182, 369, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (367, 182, 370, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (368, 183, 370, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (369, 180, 373, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (370, 179, 379, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (371, 180, 379, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (372, 184, 380, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (373, 184, 588, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (374, 186, 74, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (375, 187, 384, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (376, 189, 386, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (377, 188, 388, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (378, 185, 389, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (379, 188, 394, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (380, 186, 397, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (381, 187, 491, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (382, 187, 661, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (383, 187, 695, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (384, 187, 850, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (385, 187, 852, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (386, 190, 315, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (387, 191, 315, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (388, 194, 315, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (389, 197, 315, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (390, 191, 359, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (391, 195, 399, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (392, 196, 400, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (393, 194, 403, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (394, 197, 404, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (395, 190, 406, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (396, 192, 407, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (397, 193, 408, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (398, 190, 409, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (399, 191, 409, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (400, 194, 409, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (401, 197, 409, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (402, 191, 410, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (403, 202, 177, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (404, 200, 412, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (405, 199, 413, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (406, 201, 413, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (407, 202, 413, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (408, 202, 415, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (409, 199, 417, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (410, 198, 419, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (411, 205, 426, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (412, 206, 430, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (413, 203, 431, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
GO
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (414, 207, 432, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (415, 203, 434, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (416, 204, 435, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (417, 205, 435, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (418, 206, 740, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (419, 204, 831, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (420, 205, 831, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (421, 205, 854, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (422, 213, 271, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (423, 213, 437, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (424, 213, 439, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (425, 209, 440, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (426, 210, 441, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (427, 211, 442, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (428, 212, 443, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (429, 208, 447, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (430, 209, 447, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (431, 214, 170, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (432, 218, 196, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (433, 215, 448, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (434, 216, 448, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (435, 217, 449, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (436, 222, 449, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (437, 221, 450, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (438, 215, 451, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (439, 219, 451, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (440, 221, 451, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (441, 218, 452, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (442, 220, 454, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (443, 214, 456, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (444, 219, 456, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (445, 214, 457, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (446, 222, 458, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (447, 221, 779, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (448, 226, 101, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (449, 223, 459, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (450, 224, 463, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (451, 225, 464, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (452, 227, 464, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (453, 226, 465, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (454, 225, 466, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (455, 227, 466, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (456, 224, 467, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (457, 230, 259, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (458, 229, 468, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (459, 230, 469, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (460, 231, 470, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (461, 232, 471, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (462, 228, 473, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (463, 232, 473, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (464, 231, 474, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (465, 230, 475, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (466, 228, 477, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (467, 229, 478, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (468, 234, 184, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (469, 239, 184, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (470, 237, 479, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (471, 234, 480, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (472, 239, 480, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (473, 233, 481, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (474, 234, 481, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (475, 235, 481, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (476, 238, 482, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (477, 233, 483, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (478, 236, 483, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (479, 237, 483, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (480, 240, 484, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (481, 239, 485, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (482, 236, 487, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (483, 240, 647, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (484, 242, 490, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (485, 243, 494, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (486, 241, 497, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (487, 241, 499, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (488, 244, 500, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (489, 244, 502, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (490, 245, 503, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (491, 246, 505, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (492, 247, 507, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (493, 246, 508, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (494, 248, 511, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (495, 250, 512, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (496, 249, 515, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (497, 250, 515, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (498, 250, 950, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (499, 253, 179, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (500, 256, 317, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (501, 255, 519, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (502, 256, 520, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (503, 251, 521, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (504, 253, 522, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (505, 254, 523, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (506, 252, 525, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (507, 253, 527, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (508, 254, 527, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (509, 251, 528, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (510, 256, 528, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (511, 253, 634, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (512, 254, 634, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (513, 258, 529, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
GO
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (514, 257, 538, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (515, 257, 540, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (516, 258, 541, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (517, 260, 362, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (518, 259, 364, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (519, 261, 545, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (520, 260, 547, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (521, 259, 548, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (522, 259, 549, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (523, 262, 551, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (524, 260, 552, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (525, 263, 552, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (526, 263, 553, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (527, 264, 73, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (528, 265, 73, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (529, 266, 557, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (530, 265, 558, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (531, 266, 562, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (532, 264, 564, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (533, 264, 565, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (534, 265, 565, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (535, 270, 33, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (536, 270, 569, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (537, 267, 573, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (538, 268, 574, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (539, 271, 579, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (540, 269, 580, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (541, 268, 581, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (542, 268, 651, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (543, 268, 734, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (544, 277, 380, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (545, 274, 583, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (546, 277, 588, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (547, 275, 591, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (548, 272, 594, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (549, 274, 594, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (550, 273, 595, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (551, 275, 595, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (552, 273, 596, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (553, 276, 596, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (554, 274, 700, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (555, 280, 600, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (556, 281, 600, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (557, 281, 601, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (558, 282, 601, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (559, 285, 602, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (560, 280, 603, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (561, 278, 606, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (562, 279, 607, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (563, 283, 607, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (564, 283, 608, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (565, 284, 609, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (566, 283, 843, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (567, 286, 402, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (568, 289, 402, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (569, 288, 611, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (570, 286, 614, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (571, 289, 614, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (572, 287, 616, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (573, 288, 616, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (574, 286, 619, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (575, 290, 623, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (576, 291, 626, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (577, 292, 626, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (578, 291, 628, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (579, 290, 631, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (580, 290, 665, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (581, 294, 635, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (582, 293, 636, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (583, 295, 636, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (584, 293, 639, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (585, 296, 639, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (586, 296, 643, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (587, 304, 484, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (588, 299, 581, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (589, 301, 581, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (590, 298, 645, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (591, 299, 645, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (592, 302, 646, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (593, 304, 647, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (594, 298, 648, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (595, 300, 648, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (596, 300, 649, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (597, 303, 650, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXP] ([ID], [IdPersona], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (598, 299, 651, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
SET IDENTITY_INSERT [dbo].[PXP] OFF
GO
SET IDENTITY_INSERT [dbo].[PXU] ON 

INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (599, 301, 651, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (600, 301, 652, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (601, 297, 653, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (602, 302, 653, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (603, 303, 653, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (604, 297, 654, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (605, 302, 726, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (606, 299, 734, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (607, 301, 734, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (608, 306, 374, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (609, 307, 384, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (610, 308, 384, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (611, 307, 491, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (612, 308, 491, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (613, 306, 655, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (614, 310, 657, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (615, 311, 658, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (616, 307, 661, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (617, 308, 661, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (618, 308, 663, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (619, 305, 664, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (620, 309, 666, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (621, 308, 687, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (622, 307, 695, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (623, 308, 695, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (624, 307, 850, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (625, 308, 850, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (626, 307, 852, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (627, 308, 852, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (628, 309, 890, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (629, 312, 667, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (630, 315, 667, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (631, 313, 668, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (632, 317, 669, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (633, 318, 670, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (634, 319, 673, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (635, 315, 675, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (636, 316, 675, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (637, 316, 676, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (638, 314, 677, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (639, 318, 677, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (640, 317, 813, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (641, 316, 856, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (642, 325, 618, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (643, 321, 663, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (644, 322, 678, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (645, 324, 679, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (646, 320, 685, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (647, 321, 686, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (648, 321, 687, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (649, 323, 688, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (650, 325, 689, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (651, 328, 84, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (652, 331, 84, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (653, 327, 692, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (654, 329, 693, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (655, 330, 693, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (656, 332, 693, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (657, 328, 701, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (658, 331, 701, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (659, 326, 704, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (660, 332, 705, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (661, 326, 706, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (662, 327, 706, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (663, 330, 706, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (664, 328, 707, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (665, 331, 707, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (666, 326, 842, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (667, 327, 842, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (668, 330, 842, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (669, 326, 928, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (670, 334, 39, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (671, 339, 39, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (672, 338, 524, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (673, 334, 708, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (674, 339, 708, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (675, 336, 709, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (676, 337, 712, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (677, 333, 713, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (678, 335, 713, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (679, 339, 714, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (680, 333, 715, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (681, 337, 715, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (682, 340, 715, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (683, 340, 716, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (684, 338, 720, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (685, 333, 790, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (686, 337, 790, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (687, 340, 790, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (688, 333, 924, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (689, 337, 924, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (690, 340, 924, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (691, 346, 127, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (692, 342, 721, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (693, 348, 721, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (694, 345, 722, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (695, 347, 723, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (696, 344, 725, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (697, 346, 725, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
GO
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (698, 346, 728, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (699, 341, 729, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (700, 345, 729, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (701, 342, 730, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (702, 343, 731, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (703, 344, 731, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (704, 347, 731, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (705, 348, 732, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (706, 346, 788, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (707, 350, 581, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (708, 356, 581, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (709, 349, 638, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (710, 351, 638, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (711, 354, 638, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (712, 350, 651, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (713, 356, 651, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (714, 350, 734, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (715, 356, 734, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (716, 355, 736, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (717, 349, 738, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (718, 351, 738, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (719, 354, 738, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (720, 349, 739, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (721, 350, 739, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (722, 352, 739, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (723, 353, 739, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (724, 354, 741, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (725, 353, 742, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (726, 357, 746, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (727, 356, 747, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (728, 352, 748, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (729, 359, 750, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (730, 360, 751, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (731, 358, 753, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (732, 361, 754, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (733, 362, 762, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (734, 362, 838, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (735, 362, 884, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (736, 364, 763, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (737, 363, 764, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (738, 366, 60, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (739, 366, 257, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (740, 365, 460, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (741, 365, 765, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (742, 366, 770, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (743, 367, 571, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (744, 367, 774, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (745, 368, 775, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (746, 369, 745, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (747, 369, 777, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (748, 372, 450, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (749, 372, 779, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (750, 373, 781, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (751, 370, 782, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (752, 371, 783, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (753, 374, 715, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (754, 374, 790, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (755, 375, 793, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (756, 374, 924, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (757, 376, 496, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (758, 377, 744, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (759, 376, 799, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (760, 377, 800, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (761, 378, 801, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (762, 379, 804, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (763, 380, 805, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (764, 384, 240, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (765, 384, 382, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (766, 382, 807, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (767, 381, 809, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (768, 383, 811, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (769, 384, 812, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (770, 387, 29, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (771, 385, 94, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (772, 386, 814, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (773, 387, 816, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (774, 385, 818, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (775, 388, 821, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (776, 389, 822, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (777, 390, 823, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (778, 391, 306, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (779, 392, 435, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (780, 393, 828, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (781, 392, 831, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (782, 391, 833, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (783, 396, 62, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (784, 397, 70, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (785, 395, 834, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (786, 396, 835, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (787, 397, 836, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (788, 394, 837, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (789, 395, 916, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (790, 398, 839, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (791, 399, 840, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (792, 401, 3, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (793, 402, 384, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (794, 402, 491, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (795, 402, 661, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (796, 401, 690, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (797, 402, 695, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
GO
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (798, 400, 824, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (799, 401, 849, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (800, 402, 850, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (801, 400, 851, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (802, 402, 852, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (803, 403, 219, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (804, 404, 384, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (805, 406, 426, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (806, 404, 491, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (807, 404, 661, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (808, 404, 695, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (809, 404, 850, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (810, 404, 852, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (811, 405, 853, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (812, 406, 854, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (813, 407, 855, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (814, 403, 857, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (815, 410, 859, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (816, 408, 860, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (817, 409, 861, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (818, 408, 925, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (819, 411, 864, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (820, 412, 348, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (821, 412, 868, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (822, 414, 876, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (823, 413, 878, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (824, 415, 879, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (825, 416, 883, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (826, 417, 886, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (827, 418, 888, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (828, 420, 894, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (829, 419, 895, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (830, 421, 896, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (831, 423, 898, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (832, 424, 899, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (833, 422, 902, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (834, 425, 906, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (835, 428, 907, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (836, 427, 909, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (837, 426, 911, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (838, 429, 844, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (839, 429, 913, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (840, 431, 176, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (841, 431, 197, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (842, 430, 238, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (843, 430, 918, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (844, 431, 919, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (845, 432, 920, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (846, 433, 921, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (847, 433, 959, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (848, 434, 860, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (849, 435, 923, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (850, 434, 925, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (851, 436, 75, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (852, 439, 704, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (853, 437, 926, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (854, 439, 928, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (855, 436, 931, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (856, 438, 933, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (857, 440, 934, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (858, 441, 936, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (859, 442, 937, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (860, 443, 1, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (861, 443, 941, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (862, 444, 942, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (863, 447, 233, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (864, 447, 334, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (865, 445, 945, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (866, 446, 946, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (867, 447, 949, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (868, 448, 952, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (869, 449, 953, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (870, 450, 958, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (871, 451, 962, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (872, 452, 168, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (873, 455, 239, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (874, 452, 249, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (875, 455, 644, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (876, 452, 963, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (877, 453, 964, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (878, 454, 965, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (879, 456, 966, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (880, 455, 968, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (881, 458, 684, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (882, 457, 969, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (883, 458, 971, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (884, 459, 973, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (1, 3, 1, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (2, 7, 2, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (3, 2, 4, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (4, 6, 6, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (5, 1, 7, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (6, 8, 8, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (7, 9, 9, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (8, 1, 10, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (9, 3, 10, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (10, 4, 10, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (11, 5, 12, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (12, 7, 12, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (13, 2, 587, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
GO
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (14, 3, 941, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (15, 12, 15, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (16, 11, 17, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (17, 13, 17, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (18, 14, 20, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (19, 12, 21, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (20, 10, 25, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (21, 10, 26, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (22, 11, 26, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (23, 18, 30, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (24, 20, 30, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (25, 16, 31, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (26, 20, 32, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (27, 21, 33, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (28, 19, 34, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (29, 15, 37, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (30, 19, 37, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (31, 17, 38, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (32, 18, 39, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (33, 21, 569, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (34, 18, 708, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (35, 22, 42, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (36, 23, 47, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (37, 23, 53, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (38, 27, 56, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (39, 28, 57, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (40, 25, 64, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (41, 28, 65, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (42, 24, 66, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (43, 26, 68, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (44, 29, 70, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (45, 28, 92, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (46, 29, 836, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (47, 30, 35, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (48, 31, 71, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (49, 30, 79, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (50, 34, 81, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (51, 32, 84, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (52, 33, 84, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (53, 30, 86, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (54, 31, 86, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (55, 32, 86, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (56, 34, 195, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (57, 32, 707, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (58, 33, 707, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (59, 30, 893, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (60, 35, 87, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (61, 36, 88, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (62, 40, 89, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (63, 35, 93, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (64, 37, 94, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (65, 38, 95, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (66, 39, 97, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (67, 39, 101, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (68, 38, 158, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (69, 39, 309, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (70, 39, 465, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (71, 37, 818, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (72, 41, 102, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (73, 43, 102, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (74, 47, 102, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (75, 43, 103, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (76, 46, 104, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (77, 41, 105, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (78, 42, 105, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (79, 44, 107, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (80, 47, 108, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (81, 45, 109, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (82, 46, 109, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (83, 42, 110, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (84, 46, 143, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (85, 41, 263, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (86, 42, 263, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (87, 44, 495, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (88, 48, 116, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (89, 49, 117, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (90, 49, 118, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (91, 50, 118, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (92, 50, 120, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (93, 51, 121, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (94, 52, 124, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (95, 54, 124, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (96, 55, 125, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (97, 53, 129, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (98, 54, 132, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (99, 55, 133, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (100, 56, 133, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (101, 52, 134, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (102, 56, 136, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (103, 57, 137, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (104, 52, 401, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (105, 54, 401, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (106, 57, 827, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (107, 58, 104, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (108, 64, 141, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (109, 59, 142, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (110, 58, 143, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (111, 62, 144, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (112, 61, 148, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (113, 60, 149, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
GO
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (114, 61, 150, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (115, 63, 151, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (116, 59, 152, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (117, 60, 152, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (118, 64, 152, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (119, 65, 63, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (120, 67, 95, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (121, 68, 153, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (122, 65, 154, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (123, 67, 154, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (124, 67, 158, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (125, 65, 159, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (126, 66, 163, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (127, 65, 206, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (128, 65, 940, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (129, 67, 940, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (130, 75, 166, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (131, 78, 167, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (132, 74, 168, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (133, 78, 168, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (134, 72, 169, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (135, 73, 169, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (136, 71, 170, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (137, 73, 170, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (138, 69, 171, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (139, 71, 172, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (140, 72, 172, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (141, 76, 173, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (142, 70, 174, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (143, 74, 174, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (144, 77, 175, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (145, 74, 249, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (146, 78, 249, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (147, 71, 457, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (148, 73, 457, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (149, 76, 530, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (150, 74, 963, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (151, 78, 963, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (152, 80, 176, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (153, 83, 178, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (154, 83, 180, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (155, 79, 181, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (156, 81, 182, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (157, 81, 183, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (158, 82, 183, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (159, 82, 184, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (160, 80, 197, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (161, 82, 480, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (162, 80, 919, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (163, 86, 81, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (164, 89, 188, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (165, 87, 189, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (166, 88, 192, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (167, 84, 193, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (168, 85, 193, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (169, 85, 194, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (170, 86, 195, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (171, 84, 198, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (172, 90, 199, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (173, 97, 14, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (174, 94, 202, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (175, 96, 202, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (176, 92, 205, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (177, 91, 207, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (178, 97, 208, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (179, 91, 210, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (180, 92, 210, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (181, 93, 211, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (182, 95, 212, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (183, 96, 214, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (184, 92, 216, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (185, 91, 256, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (186, 92, 256, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (187, 96, 681, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (188, 104, 205, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (189, 100, 215, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (190, 104, 216, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (191, 105, 217, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (192, 99, 218, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (193, 102, 218, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (194, 103, 219, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (195, 104, 219, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (196, 106, 221, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (197, 98, 222, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (198, 101, 222, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (199, 102, 222, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (200, 98, 223, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (201, 106, 223, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (202, 99, 224, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (203, 106, 789, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (204, 103, 857, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (205, 104, 857, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (206, 99, 912, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (207, 111, 228, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (208, 107, 230, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (209, 109, 230, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (210, 110, 231, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (211, 107, 233, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (212, 108, 234, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (213, 111, 234, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
GO
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (214, 107, 334, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (215, 107, 900, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (216, 109, 900, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (217, 107, 949, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (218, 118, 237, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (219, 113, 238, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (220, 118, 238, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (221, 117, 239, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (222, 114, 241, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (223, 115, 242, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (224, 116, 242, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (225, 116, 243, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (226, 112, 244, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (227, 114, 244, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (228, 115, 244, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (229, 119, 246, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (230, 115, 289, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (231, 116, 289, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (232, 116, 330, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (233, 117, 644, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (234, 113, 918, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (235, 118, 918, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (236, 117, 968, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (237, 121, 247, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (238, 122, 248, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (239, 120, 251, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (240, 123, 254, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (241, 120, 259, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (242, 120, 475, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (243, 125, 261, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (244, 125, 262, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (245, 126, 262, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (246, 127, 267, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (247, 124, 270, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (248, 124, 273, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (249, 125, 702, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (250, 126, 702, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (251, 128, 274, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (252, 129, 275, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (253, 130, 277, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (254, 130, 278, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (255, 131, 278, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (256, 132, 278, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (257, 131, 279, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (258, 132, 279, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (259, 129, 280, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (260, 131, 660, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (261, 132, 660, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (262, 133, 284, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (263, 136, 284, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (264, 134, 285, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (265, 138, 285, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (266, 138, 288, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (267, 134, 290, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (268, 135, 290, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (269, 139, 290, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (270, 140, 292, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (271, 139, 293, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (272, 133, 294, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (273, 136, 294, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (274, 135, 295, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (275, 137, 295, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (276, 140, 296, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (277, 139, 873, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (278, 142, 82, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (279, 142, 301, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (280, 141, 302, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (281, 142, 302, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (282, 143, 97, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (283, 144, 97, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (284, 145, 97, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (285, 144, 252, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (286, 147, 264, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (287, 143, 305, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (288, 146, 307, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (289, 143, 309, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (290, 144, 309, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (291, 145, 309, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (292, 147, 310, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (293, 144, 311, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (294, 147, 312, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (295, 148, 313, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (296, 152, 316, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (297, 151, 317, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (298, 150, 318, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (299, 151, 319, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (300, 149, 320, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (301, 150, 320, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (302, 149, 321, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (303, 151, 520, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (304, 155, 268, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (305, 153, 322, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (306, 154, 323, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (307, 156, 324, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (308, 155, 325, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (309, 153, 332, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (310, 157, 328, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (311, 158, 328, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (312, 160, 329, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (313, 160, 335, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
GO
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (314, 159, 337, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (315, 157, 338, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (316, 159, 338, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (317, 157, 625, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (318, 159, 625, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (319, 164, 339, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (320, 161, 340, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (321, 165, 341, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (322, 161, 343, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (323, 163, 343, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (324, 164, 344, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (325, 162, 345, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (326, 167, 345, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (327, 167, 346, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (328, 166, 347, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (329, 165, 365, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (330, 169, 98, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (331, 170, 98, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (332, 175, 98, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (333, 170, 348, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (334, 171, 348, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (335, 172, 348, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (336, 169, 349, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (337, 170, 349, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (338, 175, 349, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (339, 168, 350, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (340, 172, 350, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (341, 174, 352, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (342, 175, 353, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (343, 173, 354, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (344, 171, 355, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (345, 168, 356, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (346, 174, 356, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (347, 169, 357, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (348, 168, 489, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (349, 172, 489, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (350, 174, 733, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (351, 175, 819, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (352, 170, 868, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (353, 171, 868, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (354, 172, 868, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (355, 178, 191, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (356, 177, 341, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (357, 176, 362, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (358, 176, 364, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (359, 177, 364, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (360, 177, 365, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (361, 178, 366, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (362, 176, 547, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (363, 176, 548, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (364, 177, 548, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (365, 181, 368, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (366, 182, 369, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (367, 182, 370, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (368, 183, 370, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (369, 180, 373, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (370, 179, 379, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (371, 180, 379, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (372, 184, 380, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (373, 184, 588, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (374, 186, 74, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (375, 187, 384, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (376, 189, 386, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (377, 188, 388, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (378, 185, 389, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (379, 188, 394, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (380, 186, 397, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (381, 187, 491, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (382, 187, 661, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (383, 187, 695, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (384, 187, 850, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (385, 187, 852, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (386, 190, 315, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (387, 191, 315, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (388, 194, 315, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (389, 197, 315, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (390, 191, 359, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (391, 195, 399, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (392, 196, 400, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (393, 194, 403, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (394, 197, 404, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (395, 190, 406, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (396, 192, 407, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (397, 193, 408, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (398, 190, 409, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (399, 191, 409, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (400, 194, 409, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (401, 197, 409, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (402, 191, 410, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (403, 202, 177, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (404, 200, 412, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (405, 199, 413, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (406, 201, 413, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (407, 202, 413, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (408, 202, 415, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (409, 199, 417, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (410, 198, 419, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (411, 205, 426, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (412, 206, 430, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (413, 203, 431, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
GO
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (414, 207, 432, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (415, 203, 434, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (416, 204, 435, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (417, 205, 435, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (418, 206, 740, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (419, 204, 831, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (420, 205, 831, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (421, 205, 854, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (422, 213, 271, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (423, 213, 437, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (424, 213, 439, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (425, 209, 440, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (426, 210, 441, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (427, 211, 442, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (428, 212, 443, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (429, 208, 447, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (430, 209, 447, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (431, 214, 170, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (432, 218, 196, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (433, 215, 448, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (434, 216, 448, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (435, 217, 449, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (436, 222, 449, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (437, 221, 450, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (438, 215, 451, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (439, 219, 451, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (440, 221, 451, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (441, 218, 452, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (442, 220, 454, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (443, 214, 456, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (444, 219, 456, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (445, 214, 457, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (446, 222, 458, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (447, 221, 779, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (448, 226, 101, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (449, 223, 459, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (450, 224, 463, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (451, 225, 464, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (452, 227, 464, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (453, 226, 465, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (454, 225, 466, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (455, 227, 466, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (456, 224, 467, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (457, 230, 259, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (458, 229, 468, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (459, 230, 469, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (460, 231, 470, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (461, 232, 471, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (462, 228, 473, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (463, 232, 473, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (464, 231, 474, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (465, 230, 475, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (466, 228, 477, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (467, 229, 478, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (468, 234, 184, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (469, 239, 184, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (470, 237, 479, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (471, 234, 480, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (472, 239, 480, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (473, 233, 481, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (474, 234, 481, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (475, 235, 481, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (476, 238, 482, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (477, 233, 483, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (478, 236, 483, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (479, 237, 483, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (480, 240, 484, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (481, 239, 485, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (482, 236, 487, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (483, 240, 647, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (484, 242, 490, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (485, 243, 494, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (486, 241, 497, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (487, 241, 499, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (488, 244, 500, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (489, 244, 502, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (490, 245, 503, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (491, 246, 505, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (492, 247, 507, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (493, 246, 508, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (494, 248, 511, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (495, 250, 512, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (496, 249, 515, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (497, 250, 515, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (498, 250, 950, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (499, 253, 179, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (500, 256, 317, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (501, 255, 519, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (502, 256, 520, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (503, 251, 521, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (504, 253, 522, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (505, 254, 523, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (506, 252, 525, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (507, 253, 527, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (508, 254, 527, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (509, 251, 528, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (510, 256, 528, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (511, 253, 634, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (512, 254, 634, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (513, 258, 529, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
GO
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (514, 257, 538, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (515, 257, 540, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (516, 258, 541, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (517, 260, 362, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (518, 259, 364, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (519, 261, 545, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (520, 260, 547, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (521, 259, 548, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (522, 259, 549, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (523, 262, 551, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (524, 260, 552, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (525, 263, 552, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (526, 263, 553, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (527, 264, 73, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (528, 265, 73, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (529, 266, 557, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (530, 265, 558, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (531, 266, 562, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (532, 264, 564, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (533, 264, 565, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (534, 265, 565, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (535, 270, 33, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (536, 270, 569, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (537, 267, 573, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (538, 268, 574, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (539, 271, 579, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (540, 269, 580, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (541, 268, 581, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (542, 268, 651, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (543, 268, 734, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (544, 277, 380, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (545, 274, 583, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (546, 277, 588, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (547, 275, 591, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (548, 272, 594, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (549, 274, 594, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (550, 273, 595, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (551, 275, 595, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (552, 273, 596, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (553, 276, 596, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (554, 274, 700, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (555, 280, 600, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (556, 281, 600, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (557, 281, 601, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (558, 282, 601, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (559, 285, 602, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (560, 280, 603, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (561, 278, 606, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (562, 279, 607, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (563, 283, 607, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (564, 283, 608, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (565, 284, 609, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (566, 283, 843, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (567, 286, 402, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (568, 289, 402, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (569, 288, 611, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (570, 286, 614, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (571, 289, 614, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (572, 287, 616, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (573, 288, 616, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (574, 286, 619, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (575, 290, 623, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (576, 291, 626, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (577, 292, 626, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (578, 291, 628, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (579, 290, 631, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (580, 290, 665, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (581, 294, 635, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (582, 293, 636, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (583, 295, 636, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (584, 293, 639, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (585, 296, 639, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (586, 296, 643, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (587, 304, 484, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (588, 299, 581, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (589, 301, 581, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (590, 298, 645, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (591, 299, 645, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (592, 302, 646, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (593, 304, 647, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (594, 298, 648, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (595, 300, 648, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (596, 300, 649, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (597, 303, 650, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
INSERT [dbo].[PXU] ([ID], [IdUsuario], [IdPropiedad], [FechaInicio], [FechaFin]) VALUES (598, 299, 651, CAST(N'2000-10-10' AS Date), CAST(N'2001-10-10' AS Date))
SET IDENTITY_INSERT [dbo].[PXU] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoDocIdent] ON 

INSERT [dbo].[TipoDocIdent] ([ID], [Nombre], [Mascara]) VALUES (1, N'Cedula CR', N'X-XXXX-XXXX')
INSERT [dbo].[TipoDocIdent] ([ID], [Nombre], [Mascara]) VALUES (2, N'Persona Jurídica CR', N'X-XXX-XXXXXX')
INSERT [dbo].[TipoDocIdent] ([ID], [Nombre], [Mascara]) VALUES (3, N' Pasaporte CR', N'X-XXXX-XXXX')
SET IDENTITY_INSERT [dbo].[TipoDocIdent] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoMovimientoConsumo] ON 

INSERT [dbo].[TipoMovimientoConsumo] ([ID], [Nombre]) VALUES (1, N'Residencial')
INSERT [dbo].[TipoMovimientoConsumo] ([ID], [Nombre]) VALUES (2, N'Agricola')
INSERT [dbo].[TipoMovimientoConsumo] ([ID], [Nombre]) VALUES (3, N'Bosque')
INSERT [dbo].[TipoMovimientoConsumo] ([ID], [Nombre]) VALUES (4, N'Zona industrial')
INSERT [dbo].[TipoMovimientoConsumo] ([ID], [Nombre]) VALUES (5, N'Zona comercial')
INSERT [dbo].[TipoMovimientoConsumo] ([ID], [Nombre]) VALUES (6, N'Residencial')
INSERT [dbo].[TipoMovimientoConsumo] ([ID], [Nombre]) VALUES (7, N'Agricola')
INSERT [dbo].[TipoMovimientoConsumo] ([ID], [Nombre]) VALUES (8, N'Bosque')
INSERT [dbo].[TipoMovimientoConsumo] ([ID], [Nombre]) VALUES (9, N'Zona industrial')
INSERT [dbo].[TipoMovimientoConsumo] ([ID], [Nombre]) VALUES (10, N'Zona comercial')
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

INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (1, N'kindCaviar0', N'dCtEXV', N'Propietario', 1)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (2, N'cautiousCaribou2', N'bS6mWG', N'Propietario', 2)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (3, N'similarDinosaur0', N'VmAWHA', N'Propietario', 3)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (4, N'curiousBasmati8', N'bRL1Um', N'Propietario', 4)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (5, N'aboardLard0', N'aG4oxi', N'Propietario', 5)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (6, N'holisticCheetah1', N'ikf5oz', N'Propietario', 6)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (7, N'mercifulChough6', N'jMgNZk', N'Administrador', 7)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (8, N'troubledGelding7', N'CQXTpt', N'Administrador', 8)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (9, N'grudgingMackerel4', N'8dDqB4', N'Propietario', 9)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (10, N'humorousPudding4', N'yUE8o3', N'Propietario', 10)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (11, N'thrilledChamois4', N'bpeF4R', N'Propietario', 11)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (12, N'resolvedApples8', N'6M7ArQ', N'Administrador', 12)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (13, N'outlyingEagle2', N'PgqUyM', N'Administrador', 13)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (14, N'enragedSardines7', N'F5Icno', N'Propietario', 14)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (15, N'excitedPie6', N'vGTv9c', N'Administrador', 15)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (16, N'sincereAntelope9', N'uWjewP', N'Propietario', 16)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (17, N'superiorCurlew6', N'C07svM', N'Propietario', 17)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (18, N'enragedSnail5', N'A8jME2', N'Propietario', 18)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (19, N'insecureVenison3', N'6jZExr', N'Administrador', 19)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (20, N'resolvedPepper5', N'Os8n90', N'Administrador', 20)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (21, N'worldlyUnicorn6', N'rcdiho', N'Propietario', 21)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (22, N'boredPear4', N'ETdsnk', N'Administrador', 22)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (23, N'affectedGranola9', N'oj1uSx', N'Administrador', 23)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (24, N'cruelCurlew3', N'kVUjCb', N'Administrador', 24)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (25, N'enviousAntelope2', N'oUMzPe', N'Propietario', 25)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (26, N'boredPepper6', N'VM8ocK', N'Propietario', 26)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (27, N'eagerBuck8', N'D2jcBl', N'Administrador', 27)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (28, N'somberSnail6', N'Eo6vT7', N'Propietario', 28)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (29, N'finickyBaboon5', N'In42DT', N'Administrador', 29)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (30, N'pridefulDingo2', N'1VG3jF', N'Administrador', 30)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (31, N'forsakenMuesli1', N'9Jr9jP', N'Administrador', 31)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (32, N'tautRhino8', N'vCFsnW', N'Propietario', 32)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (33, N'peskyMussel3', N'R6fa9V', N'Administrador', 33)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (34, N'mildChile5', N'zimaiv', N'Propietario', 34)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (35, N'betrayedQuiche0', N'FXfcgX', N'Administrador', 35)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (36, N'drearyHawk5', N'JLY7Gq', N'Propietario', 36)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (37, N'scornfulMackerel9', N'HN0mgL', N'Administrador', 37)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (38, N'dearChowder5', N'aE1WPT', N'Propietario', 38)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (39, N'sheepishCoati2', N'xhqgRi', N'Propietario', 39)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (40, N'mercifulPoultry8', N'Qt4nhQ', N'Administrador', 40)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (41, N'panickyOryx0', N'kBhHYY', N'Administrador', 41)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (42, N'ardentVenison0', N'6XkF5v', N'Propietario', 42)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (43, N'euphoricCurlew1', N'3YvJ42', N'Administrador', 43)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (44, N'dearWeaver5', N'Pk8p8L', N'Administrador', 44)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (45, N'dejectedQuiche6', N'FzUQgi', N'Administrador', 45)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (46, N'wingedHawk9', N'qejweW', N'Propietario', 46)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (47, N'enviousLapwing7', N'epetgs', N'Administrador', 47)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (48, N'sheepishClam2', N'qB5Syk', N'Propietario', 48)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (49, N'boredWasp1', N'yy3e3a', N'Propietario', 49)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (50, N'awedStork9', N'VIfvDw', N'Administrador', 50)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (51, N'jubilantTeal7', N'kF06My', N'Administrador', 51)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (52, N'peacefulChough7', N'z6xyUO', N'Administrador', 52)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (53, N'spiritedSausage1', N'MbyK4I', N'Administrador', 53)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (54, N'excitedMare1', N'EPz80n', N'Propietario', 54)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (55, N'giddyWigeon8', N'skZ6ry', N'Administrador', 55)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (56, N'kindRat5', N'e9XNXO', N'Administrador', 56)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (57, N'joyfulSeafowl9', N'Lmrkan', N'Administrador', 57)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (58, N'gleefulDinosaur5', N'qkvOST', N'Propietario', 58)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (59, N'anxiousBaboon6', N'5hEv7W', N'Administrador', 59)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (60, N'annoyedTomatoe6', N'Cwi9bO', N'Propietario', 60)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (61, N'gloomyEland9', N'dKxqH6', N'Propietario', 61)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (62, N'puzzledPoultry1', N'Snjmi8', N'Propietario', 62)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (63, N'forsakenBagels4', N'tRoKtX', N'Propietario', 63)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (64, N'euphoricOryx7', N'h2asuq', N'Administrador', 64)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (65, N'forsakenThrush4', N'CY2qGW', N'Propietario', 65)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (66, N'solidTomatoe8', N'bAF7Zt', N'Propietario', 66)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (67, N'sugaryThrushe1', N'5yMt4X', N'Propietario', 67)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (68, N'lovesickAntelope2', N'b7ppOJ', N'Propietario', 68)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (69, N'insecureTermite0', N'I48qpd', N'Propietario', 69)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (70, N'selfishRuffs6', N'sgvhdt', N'Administrador', 70)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (71, N'ardentPolenta1', N'fbtegj', N'Administrador', 71)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (72, N'aboardBoars7', N'LXR2LF', N'Propietario', 72)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (73, N'enragedRhino4', N'Xp7N7a', N'Propietario', 73)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (74, N'mercifulBuck7', N'j5pH4l', N'Administrador', 74)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (75, N'murkyOrange5', N'NlsSod', N'Administrador', 75)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (76, N'lyingHeron5', N'bBuW3I', N'Propietario', 76)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (77, N'innocentRice0', N'RQbRBZ', N'Administrador', 77)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (78, N'wornoutRice2', N'umYoNf', N'Administrador', 78)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (79, N'tautSeafowl0', N'Fn0ebM', N'Propietario', 79)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (80, N'adoringPorpoise8', N'P7Y8JX', N'Propietario', 80)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (81, N'holisticSwift4', N'HHUNDM', N'Administrador', 81)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (82, N'dejectedBuck8', N'onAfhP', N'Administrador', 82)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (83, N'forsakenBagels2', N'7aRvNQ', N'Administrador', 83)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (84, N'yearningPepper9', N'Inj5Mr', N'Propietario', 84)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (85, N'peacefulLlama0', N'rPkwOK', N'Propietario', 85)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (86, N'euphoricEland6', N'YarNF5', N'Propietario', 86)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (87, N'giddyBuzzard5', N'QmskRM', N'Propietario', 87)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (88, N'giddyWeaver3', N'Qv7eGU', N'Propietario', 88)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (89, N'wakefulBobolink6', N'j4eAJQ', N'Administrador', 89)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (90, N'goofySnipe7', N'krx43G', N'Administrador', 90)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (91, N'obsessedPoultry1', N'3kR01h', N'Administrador', 91)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (92, N'culturedGnu7', N'JTRC8C', N'Propietario', 92)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (93, N'euphoricWidgeon3', N'uPIiaJ', N'Administrador', 93)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (94, N'kindTortoise4', N'yMCuJZ', N'Propietario', 94)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (95, N'spiritedOil7', N'cimUSI', N'Propietario', 95)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (96, N'relievedLollies4', N'd2rp3Z', N'Propietario', 96)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (97, N'amazedRaisins8', N'6BWS6A', N'Administrador', 97)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (98, N'hushedWildfowl8', N'Vxchps', N'Propietario', 98)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (99, N'outlyingBittern7', N'gLI6cA', N'Administrador', 99)
GO
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (100, N'annoyedZebra0', N'WGVaHZ', N'Administrador', 100)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (101, N'selfishMagpie3', N'pdTmGH', N'Propietario', 101)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (102, N'anxiousAntelope0', N'DSNqV1', N'Administrador', 102)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (103, N'mildRaisins3', N'rvy8QX', N'Administrador', 103)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (104, N'aloofGatorade6', N'lAvHq0', N'Administrador', 104)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (105, N'unhappyLocust9', N'TepcXC', N'Propietario', 105)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (106, N'dearGatorade8', N'6OzMhN', N'Propietario', 106)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (107, N'madUnicorn2', N'zIgI3G', N'Administrador', 107)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (108, N'grudgingSalami1', N'KRRVyR', N'Administrador', 108)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (109, N'blissfulBoa9', N'IO6Vhi', N'Propietario', 109)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (110, N'anxiousRuffs3', N'J4pofX', N'Administrador', 110)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (111, N'dejectedJaguar7', N'KKaAn8', N'Propietario', 111)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (112, N'alertLocust7', N'Mycba1', N'Administrador', 112)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (113, N'sincereBurritos9', N'iwIBCB', N'Administrador', 113)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (114, N'curiousSheep2', N'elp3v9', N'Propietario', 114)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (115, N'ardentBittern7', N'k0Yf5N', N'Administrador', 115)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (116, N'similarGelding4', N'oif21j', N'Propietario', 116)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (117, N'madPepper8', N'VjAXEZ', N'Administrador', 117)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (118, N'pridefulMackerel2', N'p5PNei', N'Administrador', 118)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (119, N'bubblyPup3', N'tNxFDe', N'Administrador', 119)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (120, N'resolvedEggs6', N'BcOJzq', N'Administrador', 120)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (121, N'thriftySalami8', N'DhLq97', N'Administrador', 121)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (122, N'stressedTruffle9', N'I5enKj', N'Administrador', 122)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (123, N'peskyChough7', N's6z1Yy', N'Administrador', 123)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (124, N'mercifulTruffle0', N'CaU5E3', N'Propietario', 124)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (125, N'grumpyBustard8', N'KleRRZ', N'Propietario', 125)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (126, N'dejectedCordial5', N'qfDHzN', N'Propietario', 126)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (127, N'forsakenMuesli8', N'PE8Bin', N'Administrador', 127)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (128, N'humorousPup5', N'CNDZVh', N'Propietario', 128)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (129, N'relievedMoth9', N'KYQqbz', N'Propietario', 129)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (130, N'relievedSalami6', N'xStSK1', N'Propietario', 130)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (131, N'scornfulCamel1', N'5Ru1yu', N'Propietario', 131)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (132, N'yearningPepper2', N'0wsg7S', N'Propietario', 132)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (133, N'pridefulCake5', N'd5Nx2Z', N'Propietario', 133)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (134, N'jubilantPlover9', N'FEVk2z', N'Administrador', 134)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (135, N'cockyDoves1', N'o6pmUl', N'Propietario', 135)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (136, N'importedRhino0', N'Hz07d3', N'Administrador', 136)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (137, N'dopeyAntelope0', N'sbSssl', N'Administrador', 137)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (138, N'ferventTomatoe8', N'nGkUTN', N'Propietario', 138)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (139, N'hushedFerret6', N'62SgAo', N'Administrador', 139)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (140, N'lyingMeerkat7', N'AfNJOq', N'Propietario', 140)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (141, N'joyfulOatmeal7', N'NfFmjx', N'Propietario', 141)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (142, N'grudgingJaguar3', N'UKXPZM', N'Administrador', 142)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (143, N'fondSheep3', N'5HwTVx', N'Propietario', 143)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (144, N'enviousGarlic9', N'QYD1x1', N'Administrador', 144)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (145, N'awedJerky0', N's0LGsl', N'Administrador', 145)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (146, N'awedCoati5', N'Wn5hA1', N'Propietario', 146)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (147, N'joyfulLemur5', N'AU0pOa', N'Propietario', 147)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (148, N'sheepishViper4', N'5VYaLT', N'Propietario', 148)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (149, N'thrilledDunbird5', N'Hj0IxP', N'Administrador', 149)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (150, N'worldlyCheetah0', N'pr9o9T', N'Propietario', 150)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (151, N'wornoutLion5', N'sjHPOA', N'Administrador', 151)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (152, N'gloomyTomatoe5', N'mFEfmN', N'Administrador', 152)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (153, N'somberHare9', N'E8rEzM', N'Administrador', 153)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (154, N'pridefulCordial8', N'Tp5KQh', N'Propietario', 154)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (155, N'giddyThrush9', N'bCsR68', N'Administrador', 155)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (156, N'eagerWhiting3', N'nXAnGj', N'Propietario', 156)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (157, N'solidRuffs5', N'mzrZcz', N'Propietario', 157)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (158, N'obsessedBagels0', N'jndxlt', N'Administrador', 158)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (159, N'guiltyFlamingo1', N'11jfNC', N'Propietario', 159)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (160, N'boredBoars4', N'zx0ZwL', N'Administrador', 160)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (161, N'mellowCod6', N'hapXtv', N'Propietario', 161)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (162, N'gutturalTeal7', N'Y36lm8', N'Propietario', 162)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (163, N'thrilledMussel8', N'R2wIe4', N'Administrador', 163)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (164, N'superiorCardinal4', N'lmD08j', N'Administrador', 164)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (165, N'needyBobolink0', N'2FCoXV', N'Administrador', 165)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (166, N'dopeyPepper3', N'yEnXDL', N'Administrador', 166)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (167, N'fondMussel1', N'17izjO', N'Propietario', 167)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (168, N'blissfulToucan4', N'YepjeW', N'Propietario', 168)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (169, N'troubledClam4', N'Xbb9Ms', N'Propietario', 169)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (170, N'ferventMallard9', N'EKeXPH', N'Propietario', 170)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (171, N'lazyMeerkat9', N'zNfSqr', N'Propietario', 171)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (172, N'drearyQuiche4', N'7eX8zC', N'Propietario', 172)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (173, N'bubblyToucan1', N'mZkSpr', N'Administrador', 173)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (174, N'forsakenOryx2', N'yN9ozW', N'Administrador', 174)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (175, N'murkyCurlew3', N'6nGarf', N'Administrador', 175)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (176, N'anxiousHawk5', N's07Zei', N'Administrador', 176)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (177, N'wakefulLemur4', N'jfPIDe', N'Administrador', 177)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (178, N'jubilantSardines5', N'lUOQob', N'Administrador', 178)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (179, N'contentPie2', N'HILq6k', N'Propietario', 179)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (180, N'culturedAbalone9', N'SbeFoo', N'Propietario', 180)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (181, N'thrilledWeaver0', N'fmon7r', N'Administrador', 181)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (182, N'aboardUnicorn2', N'QVx5Fa', N'Propietario', 182)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (183, N'importedHoopoe6', N'jniKmr', N'Administrador', 183)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (184, N'holisticCurlew4', N'X0zbvf', N'Propietario', 184)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (185, N'jumpyLemur1', N'Q7Kfoo', N'Administrador', 185)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (186, N'dopeyCod7', N'df9jof', N'Administrador', 186)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (187, N'trustingKitten6', N'7KwXFM', N'Propietario', 187)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (188, N'dreadfulWildfowl1', N'CnnkHQ', N'Propietario', 188)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (189, N'dejectedDoves8', N'8klTEf', N'Administrador', 189)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (190, N'lyingTacos1', N'TZiOfQ', N'Propietario', 190)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (191, N'obsessedAntelope7', N'3E46Kq', N'Administrador', 191)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (192, N'worldlyOcelot4', N'TASXOm', N'Propietario', 192)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (193, N'resolvedLeopard1', N'XKtslC', N'Propietario', 193)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (194, N'annoyedEagle9', N'3XKd6W', N'Propietario', 194)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (195, N'affectedBuck6', N'QdZXt4', N'Propietario', 195)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (196, N'ardentDotterel1', N'NA2zXz', N'Propietario', 196)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (197, N'artisticSausage9', N'rdghtl', N'Administrador', 197)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (198, N'thriftySheep9', N'MTP9c1', N'Propietario', 198)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (199, N'madPie1', N'P0Oqjj', N'Propietario', 199)
GO
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (200, N'kindApples2', N'kdKOcR', N'Administrador', 200)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (201, N'giddyWildfowl0', N'bbgphd', N'Propietario', 201)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (202, N'pridefulTruffle2', N'MsSXge', N'Propietario', 202)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (203, N'mercifulToucan4', N'tF4Kxk', N'Propietario', 203)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (204, N'ecstaticFish0', N'jInizI', N'Administrador', 204)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (205, N'thriftyRuffs3', N'oRSBFf', N'Administrador', 205)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (206, N'kindTruffle4', N'8PJjdx', N'Propietario', 206)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (207, N'adoringThrushe8', N'zrYVw0', N'Administrador', 207)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (208, N'shyRelish8', N'6d7YuK', N'Propietario', 208)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (209, N'zestySardines8', N'gNIczy', N'Propietario', 209)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (210, N'needfulBuzzard5', N'Oy8TCP', N'Administrador', 210)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (211, N'unhappyWigeon8', N'pG7pD6', N'Propietario', 211)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (212, N'resolvedEggs0', N'zCKI6h', N'Propietario', 212)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (213, N'stressedSalt6', N'z25ADT', N'Propietario', 213)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (214, N'artisticBittern5', N'WMES7e', N'Administrador', 214)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (215, N'madRice1', N'Mly2lN', N'Administrador', 215)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (216, N'amusedEagle1', N'gIDiQW', N'Administrador', 216)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (217, N'euphoricPie3', N'mpgUZM', N'Propietario', 217)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (218, N'relievedOatmeal5', N'dBi5Xw', N'Administrador', 218)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (219, N'amazedCordial6', N'2g1NzU', N'Administrador', 219)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (220, N'pitifulRat7', N'UHAb9c', N'Propietario', 220)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (221, N'peacefulSmelt5', N'liZZin', N'Administrador', 221)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (222, N'chicSnail1', N'o2TrmO', N'Propietario', 222)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (223, N'gleefulCheese3', N'izskPj', N'Administrador', 223)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (224, N'betrayedCrackers7', N'ygv1h2', N'Propietario', 224)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (225, N'lyingWeaver8', N'jF8F9J', N'Propietario', 225)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (226, N'yearningCurlew8', N'RduPM3', N'Administrador', 226)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (227, N'bubblyPepper7', N'gnsLJ6', N'Administrador', 227)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (228, N'pacifiedOcelot7', N'MUR4rq', N'Administrador', 228)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (229, N'ashamedPretzels0', N'r3uSbG', N'Propietario', 229)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (230, N'eagerDinosaur4', N'Imyj4b', N'Administrador', 230)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (231, N'excitedDove6', N'TsEv2z', N'Propietario', 231)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (232, N'anxiousPie6', N'udHe9n', N'Administrador', 232)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (233, N'kindShads7', N'4cIPrH', N'Administrador', 233)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (234, N'obsessedMackerel7', N'NrpLEc', N'Administrador', 234)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (235, N'shamefulPretzels0', N'96hcYF', N'Administrador', 235)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (236, N'crushedOil8', N'Jrfaqp', N'Propietario', 236)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (237, N'dopeyLapwing9', N'YjIxud', N'Propietario', 237)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (238, N'worriedSyrup7', N'yxDHvt', N'Propietario', 238)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (239, N'dreadfulHawk8', N'cWv5HI', N'Administrador', 239)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (240, N'culturedSausage5', N'eMFczO', N'Administrador', 240)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (241, N'resolvedSeagull7', N'6sEuHz', N'Propietario', 241)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (242, N'betrayedMuesli9', N'9Kbdpe', N'Propietario', 242)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (243, N'finickyOatmeal9', N'vy0hTy', N'Administrador', 243)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (244, N'wrathfulKitten3', N'NaePHs', N'Administrador', 244)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (245, N'eagerCockatoo8', N'Wm1VlS', N'Administrador', 245)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (246, N'enviousOwl8', N'feSBPl', N'Administrador', 246)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (247, N'pacifiedTomatoe7', N'X70AfN', N'Administrador', 247)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (248, N'mellowOatmeal2', N'vg2kul', N'Administrador', 248)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (249, N'cockyGranola3', N'CuyiZq', N'Propietario', 249)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (250, N'cautiousWildfowl4', N'KEv82H', N'Administrador', 250)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (251, N'euphoricKitten1', N'p6qqzW', N'Propietario', 251)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (252, N'mercifulPretzels1', N'HznG4l', N'Administrador', 252)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (253, N'fondOatmeal0', N'RNHPuC', N'Administrador', 253)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (254, N'hushedRhino7', N'me8aLX', N'Administrador', 254)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (255, N'gleefulLemur0', N'LnfGpB', N'Propietario', 255)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (256, N'gleefulSnail0', N'HnyAzI', N'Propietario', 256)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (257, N'forsakenPolenta0', N'0gbd3r', N'Propietario', 257)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (258, N'solidTacos6', N'xvPZWq', N'Administrador', 258)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (259, N'exactingGnu3', N'WDkHHM', N'Propietario', 259)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (260, N'thriftyBustard9', N'FlCmIw', N'Propietario', 260)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (261, N'similarCaviar9', N'vfBChq', N'Propietario', 261)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (262, N'yearningStork1', N'HozRh9', N'Propietario', 262)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (263, N'excludedBoars8', N'8xHQTb', N'Administrador', 263)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (264, N'culturedSwift4', N'fYGgBI', N'Propietario', 264)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (265, N'wornoutBasmati9', N'7rCGKG', N'Administrador', 265)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (266, N'hushedBuzzard1', N'jBDbYz', N'Propietario', 266)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (267, N'similarCoconut4', N'weh9EG', N'Propietario', 267)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (268, N'mercifulToucan3', N'6f8L9j', N'Propietario', 268)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (269, N'adoringWeaver6', N'hxa1yS', N'Administrador', 269)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (270, N'cruelFish5', N'7LN0uo', N'Propietario', 270)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (271, N'grizzledBobolink6', N'AyjZAy', N'Administrador', 271)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (272, N'cynicalCrackers7', N'QjA3PB', N'Administrador', 272)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (273, N'euphoricDunbird7', N'lboIB1', N'Administrador', 273)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (274, N'yearningMuesli5', N'fGvhD6', N'Administrador', 274)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (275, N'euphoricPaella4', N'sVJBKN', N'Propietario', 275)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (276, N'goofyHyena4', N'cA1oG6', N'Administrador', 276)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (277, N'gleefulWigeon6', N'YcPWFY', N'Propietario', 277)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (278, N'wingedStork9', N'lpKLgl', N'Administrador', 278)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (279, N'joyfulBobolink1', N'Isz3HH', N'Administrador', 279)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (280, N'madBuzzard7', N'k8uhQH', N'Administrador', 280)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (281, N'mildDotterel3', N'rdLPQh', N'Propietario', 281)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (282, N'chicFerret1', N'y3taPd', N'Administrador', 282)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (283, N'soreShads6', N'SuUCrR', N'Administrador', 283)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (284, N'cruelSeahorse1', N'hPUfuD', N'Administrador', 284)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (285, N'vengefulAbalone5', N'0xN0vB', N'Administrador', 285)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (286, N'stressedJerky7', N'ocNpYA', N'Propietario', 286)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (287, N'blissfulCamel2', N'OxiU7o', N'Propietario', 287)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (288, N'troubledCake6', N'KeW7v1', N'Propietario', 288)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (289, N'wakefulWigeon2', N'K0HdPV', N'Propietario', 289)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (290, N'empathicDove4', N'BYXJf5', N'Administrador', 290)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (291, N'lovesickGarlic3', N'5JxFKS', N'Administrador', 291)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (292, N'ardentTortoise8', N'y8MNec', N'Administrador', 292)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (293, N'ardentAntelope2', N'NUO1XP', N'Propietario', 293)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (294, N'euphoricApples6', N'u766UW', N'Propietario', 294)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (295, N'lovesickHare0', N'BZavRf', N'Propietario', 295)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (296, N'boredBobolink1', N'mZNgVm', N'Administrador', 296)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (297, N'holisticFalcon3', N'VYEFAv', N'Propietario', 297)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (298, N'somberPie9', N'XbwtWK', N'Propietario', 298)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (299, N'dearApples1', N'YYoYKn', N'Propietario', 299)
GO
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (300, N'enragedMare5', N'PnEC9C', N'Propietario', 300)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (301, N'worriedMagpie3', N'rha73L', N'Propietario', 301)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (302, N'thriftyMacaw9', N'2Xl4aT', N'Administrador', 302)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (303, N'exactingDoves0', N'53q9uC', N'Propietario', 303)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (304, N'lazyWeaver2', N'N5f7vy', N'Propietario', 304)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (305, N'superiorSmelt9', N'EN6BeQ', N'Propietario', 305)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (306, N'solemnTeal2', N'zXEeKI', N'Propietario', 306)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (307, N'pacifiedApricots8', N'y9yQ4L', N'Propietario', 307)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (308, N'pluckyWidgeon3', N'tGDkxH', N'Propietario', 308)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (309, N'goofyBittern3', N'Szbt7D', N'Propietario', 309)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (310, N'dejectedEggs9', N'lvyiok', N'Propietario', 310)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (311, N'stressedTruffle1', N'EYhZJB', N'Propietario', 311)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (312, N'hushedBittern1', N'm08UKs', N'Propietario', 312)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (313, N'giddyWasp2', N'DMd0UG', N'Propietario', 313)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (314, N'abjectChamois8', N'RKmhhH', N'Administrador', 314)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (315, N'sadLlama2', N'KHPsol', N'Administrador', 315)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (316, N'innocentChowder1', N'e9nHCP', N'Administrador', 316)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (317, N'crushedLard5', N'LZJQn9', N'Administrador', 317)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (318, N'sugaryRaisins5', N'yeUdro', N'Propietario', 318)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (319, N'excludedPie1', N'wvfgwA', N'Administrador', 319)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (320, N'holisticCur8', N'Xt6jfY', N'Propietario', 320)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (321, N'yearningOryx5', N'zRhghS', N'Propietario', 321)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (322, N'amazedPonie7', N'TKr83f', N'Administrador', 322)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (323, N'grudgingPoultry1', N'G8gvID', N'Administrador', 323)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (324, N'finickyRhino1', N'lIr2bZ', N'Propietario', 324)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (325, N'importedGranola3', N'pQ49Fa', N'Administrador', 325)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (326, N'eagerDunbird7', N'dgf3dE', N'Propietario', 326)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (327, N'culturedBass7', N'A6rMTi', N'Administrador', 327)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (328, N'adoringCheetah4', N'iC3icT', N'Propietario', 328)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (329, N'bubblyTomatoe4', N'XtZo2f', N'Propietario', 329)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (330, N'obsessedCamel3', N'zebW49', N'Propietario', 330)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (331, N'enragedEland0', N'mzHZ3c', N'Administrador', 331)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (332, N'pleasedZebra0', N'HJ1upp', N'Administrador', 332)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (333, N'mercifulApricots0', N'J4pGKd', N'Propietario', 333)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (334, N'superiorMallard6', N'mfbeWB', N'Propietario', 334)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (335, N'abjectFalcon7', N'9Buutd', N'Administrador', 335)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (336, N'euphoricJerky4', N'8c5E4x', N'Propietario', 336)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (337, N'offendedZebra6', N'gGd20w', N'Propietario', 337)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (338, N'pridefulMuesli0', N'LyFufN', N'Propietario', 338)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (339, N'humorousGatorade9', N'zGMfb3', N'Administrador', 339)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (340, N'shyMare0', N'C4MCMx', N'Administrador', 340)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (341, N'anxiousSheep2', N'S4PT4T', N'Administrador', 341)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (342, N'obsessedHeron7', N'8l1ovJ', N'Administrador', 342)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (343, N'puzzledMoth5', N'MwlY9F', N'Propietario', 343)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (344, N'selfishLapwing6', N'MCiWsu', N'Propietario', 344)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (345, N'annoyedStork5', N'rez8ap', N'Administrador', 345)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (346, N'thriftyCamel1', N'CmceOP', N'Propietario', 346)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (347, N'pluckyAntelope4', N'Qw0N1Y', N'Administrador', 347)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (348, N'jumpyRice8', N'RjQj53', N'Administrador', 348)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (349, N'dopeyThrushe2', N'JrD5nG', N'Administrador', 349)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (350, N'lyingCod2', N'X7MkfN', N'Administrador', 350)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (351, N'murkyBittern7', N'RAakek', N'Propietario', 351)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (352, N'blissfulWidgeon8', N'szb70m', N'Propietario', 352)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (353, N'lazyLapwing9', N'2Xhmrx', N'Propietario', 353)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (354, N'solidTortoise0', N'pMmkpp', N'Administrador', 354)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (355, N'selfishWhiting3', N'JDZtit', N'Propietario', 355)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (356, N'wingedRuffs7', N'SfWZNv', N'Administrador', 356)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (357, N'eagerLocust8', N'eILyot', N'Administrador', 357)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (358, N'vengefulHyena3', N'aDIIbf', N'Administrador', 358)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (359, N'needfulIguana8', N'JNVKgV', N'Administrador', 359)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (360, N'scornfulGelding5', N'O2za0Z', N'Propietario', 360)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (361, N'sheepishPiglet7', N'QbydoV', N'Administrador', 361)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (362, N'unhappyBass6', N'NRlZx8', N'Administrador', 362)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (363, N'jealousSalt3', N'Fs2d0P', N'Propietario', 363)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (364, N'finickyOryx6', N'mpeLHd', N'Propietario', 364)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (365, N'guiltyRaisins2', N'9Tl9jM', N'Propietario', 365)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (366, N'gleefulRat2', N'opi2eT', N'Administrador', 366)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (367, N'annoyedSwift8', N'LhGpFV', N'Propietario', 367)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (368, N'grudgingCardinal6', N'2vIroN', N'Propietario', 368)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (369, N'sadCow6', N'W4Cvqf', N'Administrador', 369)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (370, N'grizzledBuzzard8', N'0UzyRJ', N'Propietario', 370)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (371, N'lyingBittern1', N'PW5opu', N'Administrador', 371)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (372, N'pluckyBoa5', N'ZQRTSV', N'Propietario', 372)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (373, N'hushedHyena6', N'WU55bj', N'Administrador', 373)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (374, N'insecureJerky9', N'sivy1N', N'Administrador', 374)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (375, N'boredSmelt7', N'2Dcxlh', N'Propietario', 375)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (376, N'ashamedOryx3', N'B2uP4V', N'Propietario', 376)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (377, N'cautiousCurlew6', N'8mnVTv', N'Administrador', 377)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (378, N'alertDunbird4', N'IR35Gi', N'Propietario', 378)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (379, N'brainyWhiting5', N'VsNHHs', N'Administrador', 379)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (380, N'worldlyDove1', N'jLTEr5', N'Propietario', 380)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (381, N'dejectedVenison0', N'PqgVIq', N'Propietario', 381)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (382, N'gloomySeagull9', N'SCv4ZP', N'Propietario', 382)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (383, N'wakefulHeron1', N'rHNhw3', N'Administrador', 383)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (384, N'dopeyPonie5', N'vGW2wq', N'Propietario', 384)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (385, N'jubilantKitten3', N'LbHn12', N'Administrador', 385)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (386, N'lyingSeagull6', N'PkE8s9', N'Propietario', 386)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (387, N'needfulCamel2', N'YYGNdh', N'Propietario', 387)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (388, N'pacifiedSyrup1', N'kUe1G4', N'Administrador', 388)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (389, N'jubilantCardinal0', N'raxhmE', N'Propietario', 389)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (390, N'forsakenOtter6', N'Ju7xXM', N'Propietario', 390)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (391, N'holisticWildfowl8', N'Zgrvf4', N'Administrador', 391)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (392, N'finickyFalcon8', N'fvwI8z', N'Propietario', 392)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (393, N'obsessedGelding4', N'BNr7aa', N'Propietario', 393)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (394, N'offendedMandrill0', N'ENpFhO', N'Administrador', 394)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (395, N'aloofWasp2', N'lQQ0Uk', N'Propietario', 395)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (396, N'euphoricToucan9', N'xwRx5X', N'Administrador', 396)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (397, N'chicVenison1', N'dnZUWl', N'Propietario', 397)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (398, N'tautWildfowl8', N'MVAcXO', N'Administrador', 398)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (399, N'somberDunbird0', N'33TXvI', N'Administrador', 399)
GO
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (400, N'truthfulPaella8', N'8AfZtM', N'Propietario', 400)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (401, N'wearyApricots0', N'9iEes4', N'Administrador', 401)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (402, N'wakefulGnu4', N'radeKm', N'Propietario', 402)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (403, N'guiltySnail1', N'KPVjxR', N'Propietario', 403)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (404, N'emptyCrackers0', N'aPtDvV', N'Propietario', 404)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (405, N'goofyBurritos7', N'IzBmp1', N'Propietario', 405)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (406, N'cheerfulSnail2', N'Imxby0', N'Propietario', 406)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (407, N'selfishSausage5', N'SVarPd', N'Propietario', 407)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (408, N'dopeyCow7', N'3Qs2Ol', N'Administrador', 408)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (409, N'gutturalBobolink9', N'PG93t0', N'Administrador', 409)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (410, N'enragedHoopoe7', N'ptq39u', N'Administrador', 410)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (411, N'obsessedCow5', N'FnjJs4', N'Propietario', 411)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (412, N'mellowMussel7', N'977FA2', N'Administrador', 412)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (413, N'murkySeafowl2', N'LiCBJi', N'Administrador', 413)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (414, N'excludedMallard9', N'Nx7p1u', N'Administrador', 414)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (415, N'amazedSmelt6', N'pLiwJo', N'Administrador', 415)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (416, N'ecstaticOil3', N'vD7OFC', N'Propietario', 416)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (417, N'emptyCurlew3', N'CUfMjn', N'Administrador', 417)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (418, N'anxiousBittern0', N'ly3feZ', N'Administrador', 418)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (419, N'thrilledLeopard0', N'oM7tPY', N'Administrador', 419)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (420, N'shyFlamingo4', N'feUotR', N'Administrador', 420)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (421, N'affectedMare7', N'plHPYU', N'Administrador', 421)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (422, N'trustingGnu9', N'DYVats', N'Administrador', 422)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (423, N'giddyEagle6', N'z3gtRK', N'Propietario', 423)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (424, N'enragedBass4', N'2b8Ml3', N'Administrador', 424)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (425, N'kindGatorade8', N'JOKWbz', N'Propietario', 425)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (426, N'somberUnicorn9', N'H3bYPw', N'Propietario', 426)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (427, N'drearyMagpie1', N'ctElby', N'Propietario', 427)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (428, N'empathicQuiche4', N'PGztPJ', N'Administrador', 428)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (429, N'crummyChamois0', N'nrxux5', N'Administrador', 429)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (430, N'boredLollies8', N'd87eWp', N'Administrador', 430)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (431, N'yearningSeafowl0', N'jR3QNP', N'Administrador', 431)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (432, N'jumpyHare4', N'82HOaq', N'Administrador', 432)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (433, N'mellowBaboon1', N'jtFK8v', N'Propietario', 433)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (434, N'enviousWeaver3', N'jejlAq', N'Administrador', 434)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (435, N'madMagpie1', N'NUTPLZ', N'Propietario', 435)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (436, N'cautiousHoopoe9', N'57zo9J', N'Propietario', 436)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (437, N'sadCake6', N'6sVtUD', N'Propietario', 437)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (438, N'truthfulOrange2', N'KJdY1i', N'Propietario', 438)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (439, N'holisticDunbird0', N'ctym2Z', N'Administrador', 439)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (440, N'aloofChile4', N'qC7S4d', N'Administrador', 440)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (441, N'culturedOatmeal8', N'UrP6A8', N'Administrador', 441)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (442, N'peskyPoultry4', N'aqYGlr', N'Propietario', 442)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (443, N'gleefulCardinal2', N'0n1iYE', N'Administrador', 443)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (444, N'vengefulThrush5', N'qeRu0X', N'Propietario', 444)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (445, N'gutturalBoars1', N'smHiB9', N'Propietario', 445)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (446, N'sincereJerky0', N'KbouwP', N'Administrador', 446)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (447, N'fondLocust1', N'1TYRrX', N'Propietario', 447)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (448, N'gleefulDinosaur4', N'syinuS', N'Propietario', 448)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (449, N'wornoutSalami2', N'F9PKAn', N'Administrador', 449)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (450, N'giddyAbalone2', N'kAdE94', N'Propietario', 450)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (451, N'ashamedSnipe7', N'gZJsa2', N'Propietario', 451)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (452, N'solemnEland2', N'GXmlwp', N'Propietario', 452)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (453, N'dreadfulLizard0', N'FlfPlz', N'Propietario', 453)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (454, N'dreadfulPepper6', N'cvxzUt', N'Propietario', 454)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (455, N'ashamedOryx2', N'q7sCK7', N'Propietario', 455)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (456, N'affectedIguana8', N'HGJfYt', N'Propietario', 456)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (457, N'zestyWildfowl1', N'uUukHm', N'Administrador', 457)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (458, N'relievedCheese7', N'29o6Af', N'Administrador', 458)
INSERT [dbo].[Usuario] ([ID], [UserName], [Password], [TipoUsuario], [IdPersona]) VALUES (459, N'bubblyHyena2', N'kl8CWT', N'Propietario', 459)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
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
ALTER TABLE [dbo].[TipoConceptoCobro]  WITH CHECK ADD  CONSTRAINT [FK_TipoConceptoCobro_ConceptoCobro] FOREIGN KEY([ID])
REFERENCES [dbo].[ConceptoCobro] ([ID])
GO
ALTER TABLE [dbo].[TipoConceptoCobro] CHECK CONSTRAINT [FK_TipoConceptoCobro_ConceptoCobro]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Persona] FOREIGN KEY([IdPersona])
REFERENCES [dbo].[Persona] ([ID])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Persona]
GO
/****** Object:  StoredProcedure [dbo].[asociarPXP]    Script Date: 30/10/2022 22:19:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[asociarPXP]
	@inNumDocId BIGINT,
	@inNumeroFinca INT, 
	@inFechaInicio DATE,
	@inFechaFin DATE,
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
		IF NOT EXISTS(SELECT P.IdPersona, P.IdPropiedad, P.FechaInicio, P.FechaFin FROM dbo.PXP P WHERE 
					P.IdPersona = @inIdPersona and P.IdPropiedad = @inIdPropiedad and P.FechaInicio = @inFechaInicio
					and P.FechaFin = @inFechaFin) --Verifica que no exista la relación.
			BEGIN
			BEGIN TRANSACTION tAsociarPXP
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
				@inFechaInicio,
				@inFechaFin
				)

				COMMIT TRANSACTION tAsociarPXP
			END

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
/****** Object:  StoredProcedure [dbo].[asociarPXU]    Script Date: 30/10/2022 22:19:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[asociarPXU]
	@inUsername VARCHAR(128),
	@inNumeroFinca INT,
	@inFechaInicio DATE,
	@inFechaFin DATE, 
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
				P.IdUsuario = @inIdUsuario and P.IdPropiedad = @inIdPropiedad and P.FechaInicio = @inFechaInicio
				and P.FechaFin = @inFechaFin) --Verifica que no exista la relación.
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
						@inFechaInicio,
						@inFechaFin
						)
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
/****** Object:  StoredProcedure [dbo].[deletePerson]    Script Date: 30/10/2022 22:19:17 ******/
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
					DELETE FROM dbo.Persona WHERE ValorDocId = @inValorDocId; --Borra a la persona con su valor de Documento Identidad.
				END
		END TRY
	BEGIN CATCH --Recoge errores durante el SP
	IF @@TRANCOUNT > 0  
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
/****** Object:  StoredProcedure [dbo].[deleteProperty]    Script Date: 30/10/2022 22:19:17 ******/
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
/****** Object:  StoredProcedure [dbo].[deleteUser]    Script Date: 30/10/2022 22:19:17 ******/
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
				DELETE FROM dbo.Usuario WHERE Username = @inUsername and Password = @inPassword and TipoUsuario = @inTipoUsuario;
			END
	END TRY
	BEGIN CATCH --Toma errores en el SP
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
/****** Object:  StoredProcedure [dbo].[desasociarPXP]    Script Date: 30/10/2022 22:19:17 ******/
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
		DELETE FROM dbo.PXP WHERE IdPersona = @inIdPersona and IdPropiedad = @inIdPropiedad; --Elimina la relación en caso de existir. 
	END TRY
	BEGIN CATCH --Atrapa errores en el SP
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
			Set @outResultCode=50011;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[desasociarPXU]    Script Date: 30/10/2022 22:19:17 ******/
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
		DECLARE @inIdUsuario INT = (SELECT U.ID FROM dbo.Usuario U WHERE U.UserName = @inUsername);
		DECLARE @inIdPropiedad INT = (SELECT P.ID FROM dbo.Propiedad P WHERE P.NumeroFinca = @inNumeroFinca);
		DELETE FROM dbo.PXU WHERE IdUsuario = @inIdUsuario and IdPropiedad = @inIdPropiedad;
	END TRY 
	BEGIN CATCH --Atrapa errores durante la ejecución del SP.
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
/****** Object:  StoredProcedure [dbo].[insertPerson]    Script Date: 30/10/2022 22:19:17 ******/
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
/****** Object:  StoredProcedure [dbo].[insertProperty]    Script Date: 30/10/2022 22:19:17 ******/
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
/****** Object:  StoredProcedure [dbo].[insertUser]    Script Date: 30/10/2022 22:19:17 ******/
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
/****** Object:  StoredProcedure [dbo].[InsertXMLIterative]    Script Date: 30/10/2022 22:19:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertXMLIterative]

	@outResultCode INT

AS
BEGIN
	SET	@outResultCode = 0;
	SET NOCOUNT ON;

BEGIN TRY

DELETE FROM PXU
DBCC CHECKIDENT ('PXU', RESEED, 0)
DELETE FROM PXP
DBCC CHECKIDENT ('PXP', RESEED, 0)
DELETE FROM Usuario
DBCC CHECKIDENT ('Usuario', RESEED, 0)
DELETE FROM Propiedad
DBCC CHECKIDENT ('Propiedad', RESEED, 0)
DELETE FROM Persona
DBCC CHECKIDENT ('Persona', RESEED, 0)


DECLARE @xmlData XML, -- Se declara la variable XM
		@index		int = 0,
		@totalOp	int

SET @xmlData = ( -- Se define la variable XML, se utiliza la dirección del archivo
		SELECT *
		FROM OPENROWSET(BULK 'C:\Users\javie\Desktop\XML\Operaciones.xml', SINGLE_BLOB) 
		AS xmlData
		);

SET @totalOp = (SELECT COUNT(*) FROM @xmlData.nodes('Datos/Operacion') T(item)) --Define la cantidad de días de Operación

DECLARE @tempPersonas table(      --Declaramos las tablas temporale necesarias
			[Nombre]		VARCHAR(128),
			[ValorDocId]	BIGINT,
			[IdTipoDoc]		INT,
			[email]			VARCHAR(128),
			[telefono1]		BIGINT,
			[telefono2]		BIGINT
)

DECLARE @tempPropiedades table(

			[Area] FLOAT,
			[ValorFiscal] VARCHAR(128),
			[FechaRegistro] DATE,
			[IdTipoTerreno] INT,
			[IdTipoZona] INT,
			[NumeroFinca] INT
)

DECLARE @tempUsuario table(

			[UserName] VARCHAR(128),
			[Passwords] VARCHAR(128),
			[TipoUsuario] VARCHAR(128),
			[IdPersona] INT
)


DECLARE @tempPXP table(

			[IdPersona] INT,
			[IdPropiedad] INT,
			[FechaInicio] DATE,
			[FechaFin] DATE
)

DECLARE @tempPXU table(
			[IdUsuario] INT,
			[IdPropiedad] INT,
			[FechaInicio] DATE,
			[FechaFin] DATE
)



WHILE (@index < @totalOp) --Iniciamos el ciclo
BEGIN 
	SET @index = @index + 1;


	--INSERT INTO @tempPXU(IdUsuario,IdPropiedad,FechaInicio,FechaFin) --Insertamos los datos en las tablas temporales
	--	SELECT
	--	P.ID  AS 'IdUsuario',
	--	N.ID AS  'IdPropiedad',
	--	FechaInicio	=	'2000-10-10',
	--	FechaFin	=	'2001-10-10'
	--	FROM @xmlData.nodes('Datos/Operacion[sql:variable("@index")]/PropiedadesyUsuarios/UsuarioPropiedad') T(item)

	--	INNER JOIN dbo.Persona P
	--	ON P.ValorDocId = T.Item.value('@ValorDocumentoIdentidad', 'VARCHAR(128)')
	--	INNER JOIN dbo.Propiedad N
	--	ON N.NumeroFinca = T.Item.value('@NumeroFinca', 'VARCHAR(128)')

	--INSERT INTO @tempPXP(IdPersona,IdPropiedad,FechaInicio,FechaFin)
	--	SELECT
	--	P.ID  AS 'IdPersona',
	--	N.ID AS  'IdPropiedad',
	--	FechaInicio	=	'2000-10-10',
	--	FechaFin	=	'2001-10-10'
	--	FROM @xmlData.nodes('Datos/Operacion[sql:variable("@index")]/PersonasyPropiedades/PropiedadPersona') T(item)

	--	INNER JOIN dbo.Persona P
	--	ON P.ValorDocId = T.Item.value('@ValorDocumentoIdentidad', 'VARCHAR(128)')
	--	INNER JOIN dbo.Propiedad N
	--	ON N.NumeroFinca = T.Item.value('@NumeroFinca', 'VARCHAR(128)')


	INSERT INTO @tempPersonas(Nombre,ValorDocId,IdTipoDoc,email,telefono1,telefono2)
		SELECT
		item.value('@Nombre','VARCHAR(128)')	AS	'Nombre',
		item.value('@ValorDocumentoIdentidad','BIGINT')	AS	'ValorDocId',
		C.ID AS 'IdTipoDoc',
		item.value('@Email','VARCHAR(128)')	AS	'email',
		item.value('@Telefono1','BIGINT')	AS	'telefono1',
		item.value('@Telefono2','BIGINT')	AS	'telefono2'
		FROM @xmlData.nodes('Datos/Operacion[sql:variable("@index")]/Personas/Persona') T(item)
		INNER JOIN dbo.TipoDocIdent C
		ON C.Nombre = T.Item.value('@TipoDocumentoIdentidad', 'VARCHAR(128)')

	INSERT INTO @tempUsuario(UserName,Passwords,TipoUsuario,IdPersona)
		SELECT
		item.value('@Username','VARCHAR(128)')	AS	'UserName',
		item.value('@Password','VARCHAR(128)')	AS	'Passwords',
		item.value('@TipoUsuario', 'VARCHAR(128)')	AS	'TipoUsuario',
		P.ID	AS	'IdPersona'
		FROM @xmlData.nodes('Datos/Operacion[sql:variable("@index")]/Usuario/Usuario') T(item)
		INNER JOIN dbo.Persona P
		ON P.ValorDocId = T.Item.value('@ValorDocumentoIdentidad', 'VARCHAR(128)')
		CONTINUE

	INSERT INTO @tempPropiedades(Area,ValorFiscal,FechaRegistro,IdTipoTerreno,IdTipoZona,NumeroFinca)

		SELECT
		item.value('@MetrosCuadrados','FLOAT')	AS	'Area',
		item.value('@ValorFiscal','BIGINT')	AS	'ValorFiscal',
		FechaRegistro = '2000-10-10',
		X.ID	AS	'IdTipoTerreno',
		Z.ID	AS	'IdTipoZona',
		item.value('@NumeroFinca','INT')	AS	'NumeroFinca'
		FROM @xmlData.nodes('Datos/Operacion[sql:variable("@index")]/Propiedades/Propiedad') T(item)

		INNER JOIN dbo.TipoZona Z
		ON Z.Nombre = T.Item.value('@tipoZonaPropiedad', 'VARCHAR(128)')
		INNER JOIN dbo.TipoTerreno X
		ON X.Nombre = T.Item.value('@tipoUsoPropiedad', 'VARCHAR(128)')

		END

	INSERT INTO dbo.Persona --Insertamos los datos de las tablas temporales a las tablas permanentes
		SELECT * FROM @tempPersonas

	INSERT INTO dbo.Propiedad
		SELECT * FROM @tempPropiedades

	INSERT INTO dbo.Usuario
		SELECT * FROM @tempUsuario

	--INSERT INTO dbo.PXP
	--	SELECT * FROM @tempPXP

	--	INSERT INTO dbo.PXU
	--	SELECT * FROM @tempPXU

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
			SET @outResultCode=50025; --Establece el código de error 
END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[propiedadesPropietario]    Script Date: 30/10/2022 22:19:17 ******/
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
/****** Object:  StoredProcedure [dbo].[propiedadesUsuario]    Script Date: 30/10/2022 22:19:17 ******/
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
/****** Object:  StoredProcedure [dbo].[propietarioPropiedad]    Script Date: 30/10/2022 22:19:17 ******/
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
/****** Object:  StoredProcedure [dbo].[readPerson]    Script Date: 30/10/2022 22:19:17 ******/
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
/****** Object:  StoredProcedure [dbo].[readProperty]    Script Date: 30/10/2022 22:19:17 ******/
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
/****** Object:  StoredProcedure [dbo].[readUser]    Script Date: 30/10/2022 22:19:17 ******/
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
/****** Object:  StoredProcedure [dbo].[updatePerson]    Script Date: 30/10/2022 22:19:17 ******/
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
		UPDATE Persona 
		SET Nombre = @inNombre, IdTipoDoc = @inIdTipoDocId, email = @inEmail, telefono1 = @inTelefono1, telefono2 = @inTelefono2
		WHERE ValorDocId = @inValorDocId; --Actualiza la persona en caso de existir.
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
			Set @outResultCode=50003;
	END CATCH
	SET NOCOUNT OFF;
END

GO
/****** Object:  StoredProcedure [dbo].[updateProperty]    Script Date: 30/10/2022 22:19:17 ******/
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
/****** Object:  StoredProcedure [dbo].[updateUser]    Script Date: 30/10/2022 22:19:17 ******/
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
					UPDATE dbo.Usuario
					SET UserName = @inNewUsername, Password = @inNewPassword, TipoUsuario = @inNewTipoUsuario
					WHERE UserName = @inUsername and Password = @inPassword
				END
		--Las instrucciones anteriores encuentran al usuario en caso de que exista y actualizan sus datos.
	END TRY
	BEGIN CATCH --Se insertan errores en la tabla de errores en caso de que estos existan.
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
/****** Object:  StoredProcedure [dbo].[usuariosPropiedad]    Script Date: 30/10/2022 22:19:17 ******/
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
/****** Object:  StoredProcedure [dbo].[validateLogin]    Script Date: 30/10/2022 22:19:17 ******/
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
USE [master]
GO
ALTER DATABASE [Municipalidad] SET  READ_WRITE 
GO
