USE [ProyectoFinal]
GO
/****** Object:  User [usuarioFinal]    Script Date: 6/12/2021 5:02:15 PM ******/
CREATE USER [usuarioFinal] FOR LOGIN [usuarioFinal] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [usuarioFinal]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 6/12/2021 5:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[idAddress] [int] IDENTITY(1,1) NOT NULL,
	[idCustomer] [int] NOT NULL,
	[addressLine1] [varchar](60) NOT NULL,
	[addressLine2] [varchar](60) NOT NULL,
	[zipCode] [varchar](5) NOT NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[idAddress] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carrier]    Script Date: 6/12/2021 5:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carrier](
	[idCarrier] [int] IDENTITY(1,1) NOT NULL,
	[carrierName] [varchar](32) NOT NULL,
	[carrierLastName] [varchar](32) NOT NULL,
	[carrierEmail] [varchar](128) NOT NULL,
	[carrierPhone] [varchar](16) NOT NULL,
	[gender] [char](1) NOT NULL,
	[active] [bit] NULL,
	[licensePlate] [varchar](16) NOT NULL,
	[vehicleType] [int] NOT NULL,
 CONSTRAINT [PK_Carrier] PRIMARY KEY CLUSTERED 
(
	[idCarrier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Costumer]    Script Date: 6/12/2021 5:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Costumer](
	[idCustomer] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](32) NOT NULL,
	[lastName] [varchar](32) NOT NULL,
	[email] [varchar](128) NOT NULL,
	[phone] [varchar](16) NOT NULL,
	[birthdate] [smalldatetime] NOT NULL,
	[gender] [char](1) NOT NULL,
	[active] [bit] NULL,
 CONSTRAINT [PK_Costumer] PRIMARY KEY CLUSTERED 
(
	[idCustomer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[County]    Script Date: 6/12/2021 5:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[County](
	[idState] [smallint] NOT NULL,
	[idCounty] [smallint] NOT NULL,
	[countyName] [varchar](50) NOT NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_County] PRIMARY KEY CLUSTERED 
(
	[idState] ASC,
	[idCounty] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[District]    Script Date: 6/12/2021 5:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[District](
	[idState] [smallint] NOT NULL,
	[idCounty] [smallint] NOT NULL,
	[idDistrict] [smallint] NOT NULL,
	[zipCode] [varchar](5) NOT NULL,
	[districtName] [varchar](50) NOT NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_District] PRIMARY KEY CLUSTERED 
(
	[zipCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 6/12/2021 5:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[idOrder] [int] IDENTITY(1,1) NOT NULL,
	[idCustomer] [int] NOT NULL,
	[invoiceNumber] [varchar](16) NOT NULL,
	[idUser] [int] NOT NULL,
	[createdDate] [datetime] NOT NULL,
	[status] [smallint] NOT NULL,
	[lastModification] [datetime] NOT NULL,
	[idCarrier] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[idOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdersLog]    Script Date: 6/12/2021 5:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdersLog](
	[idOrderLog] [int] NOT NULL,
	[idOrder] [int] NOT NULL,
	[status] [char](1) NOT NULL,
	[lastModification] [datetime] NOT NULL,
 CONSTRAINT [PK_OrdersLog] PRIMARY KEY CLUSTERED 
(
	[idOrderLog] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[States]    Script Date: 6/12/2021 5:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[States](
	[idState] [smallint] NOT NULL,
	[stateName] [varchar](15) NOT NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_States] PRIMARY KEY CLUSTERED 
(
	[idState] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/12/2021 5:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[idUser] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](128) NOT NULL,
	[name] [varchar](32) NOT NULL,
	[lastName] [varchar](32) NOT NULL,
	[userType] [smallint] NOT NULL,
	[active] [bit] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[idUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicles]    Script Date: 6/12/2021 5:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicles](
	[vehicleType] [int] NOT NULL,
	[description] [varchar](64) NOT NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_Vehicles] PRIMARY KEY CLUSTERED 
(
	[vehicleType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (1, 1, N'San Jose', 1)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (1, 2, N'Escazu', 1)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (1, 3, N'Desamparados', 1)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (1, 4, N'Puriscal', 1)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (1, 5, N'Tarrazu', 1)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (1, 6, N'Aserri', 1)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (1, 7, N'Mora', 1)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (1, 8, N'Goicoechea', 1)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (1, 9, N'Santa Ana', 1)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (1, 10, N'Alajuelita', 1)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (1, 11, N'Vasquez De coronado', 1)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (1, 12, N'Acosta', 1)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (1, 13, N'Tibas', 1)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (1, 14, N'Moravia', 1)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (1, 15, N'Montes De oca', 1)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (1, 16, N'Turrubares', 1)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (1, 17, N'Dota', 1)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (1, 18, N'Curridabat', 1)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (1, 19, N'Perez Zeledon', 1)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (1, 20, N'Leon Cortes', 1)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (2, 1, N'Alajuela', 0)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (2, 2, N'San Ramon', 0)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (2, 3, N'Grecia', 0)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (2, 4, N'San Mateo', 0)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (2, 5, N'Atenas', 0)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (2, 6, N'Naranjo', 0)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (2, 7, N'Palmares', 0)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (2, 8, N'Poas', 0)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (2, 9, N'Orotina', 0)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (2, 10, N'San Carlos', 0)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (2, 11, N'Alfaro Ruiz', 0)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (2, 12, N'Valverde Vega', 0)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (2, 13, N'Upala', 0)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (2, 14, N'Los Chiles', 0)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (2, 15, N'Guatuso', 0)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (3, 1, N'Cartago', 0)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (3, 2, N'Paraiso', 0)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (3, 3, N'La Union', 1)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (3, 4, N'Jimenez', 0)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (3, 5, N'Turrialba', 0)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (3, 6, N'Alvarado', 0)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (3, 7, N'Oreamuno', 0)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (3, 8, N'El Guarco', 0)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (4, 1, N'Heredia', 0)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (4, 2, N'Barva', 0)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (4, 3, N'Santo Domingo', 0)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (4, 4, N'Santa Barbara', 0)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (4, 5, N'San Rafael', 0)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (4, 6, N'San Isidro', 0)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (4, 7, N'Belen', 0)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (4, 8, N'Flores', 0)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (4, 9, N'San Pablo', 0)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (4, 10, N'Sarapiqui', 0)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (5, 1, N'Liberia', 0)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (5, 2, N'Nicoya', 0)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (5, 3, N'Santa Cruz', 0)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (5, 4, N'Bagaces', 0)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (5, 5, N'Carrillo', 0)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (5, 6, N'Cañas', 0)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (5, 7, N'Abangares', 0)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (5, 8, N'Tilaran', 0)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (5, 9, N'Nandayure', 0)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (5, 10, N'La Cruz', 0)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (5, 11, N'Hojancha', 0)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (6, 1, N'Puntarenas', 0)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (6, 2, N'Esparza', 0)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (6, 3, N'Buenos Aires', 0)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (6, 4, N'Montes De oro', 0)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (6, 5, N'Osa', 0)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (6, 6, N'Aguirre', 0)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (6, 7, N'Golfito', 0)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (6, 8, N'Coto Brus', 0)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (6, 9, N'Parrita', 0)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (6, 10, N'Corredores', 0)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (6, 11, N'Garabito', 0)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (7, 1, N'Limon', 0)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (7, 2, N'Pococi', 0)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (7, 3, N'Siquirres', 0)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (7, 4, N'Talamanca', 0)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (7, 5, N'Matina', 0)
INSERT [dbo].[County] ([idState], [idCounty], [countyName], [active]) VALUES (7, 6, N'Guacimo', 0)
GO
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 1, 101, N'10101', N'Carmen ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 1, 102, N'10102', N'Merced ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 1, 103, N'10103', N'Hospital ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 1, 104, N'10104', N'Catedral ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 1, 105, N'10105', N'Zapote ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 1, 106, N'10106', N'San Francisco de Dos Ríos ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 1, 107, N'10107', N'Uruca ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 1, 108, N'10108', N'Mata Redonda ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 1, 109, N'10109', N'Pavas ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 1, 110, N'10110', N'Hatillo ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 1, 111, N'10111', N'San Sebastián ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 2, 201, N'10201', N'Escazú ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 2, 202, N'10202', N'San Antonio ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 2, 203, N'10203', N'San Rafael ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 3, 301, N'10301', N'Desamparados ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 3, 302, N'10302', N'San Miguel ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 3, 303, N'10303', N'San Juan de Dios ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 3, 304, N'10304', N'San Rafael Arriba ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 3, 305, N'10305', N'San Antonio ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 3, 306, N'10306', N'Frailes ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 3, 307, N'10307', N'Patarrá ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 3, 308, N'10308', N'San Cristóbal ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 3, 309, N'10309', N'Rosario ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 3, 310, N'10310', N'Damas ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 3, 311, N'10311', N'San Rafael Abajo ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 3, 312, N'10312', N'Gravilias ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 3, 313, N'10313', N'Los Guido ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 4, 401, N'10401', N'Santiago ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 4, 402, N'10402', N'Mercedes Sur ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 4, 403, N'10403', N'Barbacoas ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 4, 404, N'10404', N'Grifo Alto ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 4, 405, N'10405', N'San Rafael ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 4, 406, N'10406', N'Candelaria ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 4, 407, N'10407', N'Desamparaditos ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 4, 408, N'10408', N'San Antonio ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 4, 409, N'10409', N'Chires ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 5, 501, N'10501', N'San Marcos ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 5, 502, N'10502', N'San Lorenzo ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 5, 503, N'10503', N'San Carlos ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 6, 601, N'10601', N'Aserrí ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 6, 602, N'10602', N'Tarbaca o Praga ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 6, 603, N'10603', N'Vuelta de Jorco ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 6, 604, N'10604', N'San Gabriel ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 6, 605, N'10605', N'La Legua ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 6, 606, N'10606', N'Monterrey ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 6, 607, N'10607', N'Salitrillos ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 7, 701, N'10701', N'Colón ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 7, 702, N'10702', N'Guayabo ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 7, 703, N'10703', N'Tabarcia ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 7, 704, N'10704', N'Piedras Negras ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 7, 705, N'10705', N'Picagres ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 8, 801, N'10801', N'Guadalupe ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 8, 802, N'10802', N'San Francisco ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 8, 803, N'10803', N'Calle Blancos ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 8, 804, N'10804', N'Mata de Plátano ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 8, 805, N'10805', N'Ipís ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 8, 806, N'10806', N'Rancho Redondo ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 8, 807, N'10807', N'Purral ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 9, 901, N'10901', N'Santa Ana ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 9, 902, N'10902', N'Salitral ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 9, 903, N'10903', N'Pozos o Concepción ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 9, 904, N'10904', N'Uruca o San Joaquín ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 9, 905, N'10905', N'Piedades ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 9, 906, N'10906', N'Brasil ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 10, 1, N'11001', N'Alajuelita ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 10, 2, N'11002', N'San Josecito ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 10, 3, N'11003', N'San Antonio ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 10, 4, N'11004', N'Concepción ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 10, 5, N'11005', N'San Felipe ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 11, 101, N'11101', N'San Isidro ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 11, 102, N'11102', N'San Rafael ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 11, 103, N'11103', N'Dulce Nombre de Jesús ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 11, 104, N'11104', N'Patalillo ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 11, 105, N'11105', N'Cascajal ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 12, 201, N'11201', N'San Ignacio ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 12, 202, N'11202', N'Guaitil ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 12, 203, N'11203', N'Palmichal ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 12, 204, N'11204', N'Cangrejal ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 12, 205, N'11205', N'Sabanillas ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 13, 301, N'11301', N'San Juan ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 13, 302, N'11302', N'Cinco Esquinas ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 13, 303, N'11303', N'Anselmo Llorente ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 13, 304, N'11304', N'León XIII ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 13, 305, N'11305', N'Colima ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 14, 401, N'11401', N'San Vicente ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 14, 402, N'11402', N'San Jerónimo ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 14, 403, N'11403', N'Trinidad ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 15, 501, N'11501', N'San Pedro ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 15, 502, N'11502', N'Sabanilla ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 15, 503, N'11503', N'Mercedes o Betania ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 15, 504, N'11504', N'San Rafael ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 16, 601, N'11601', N'San Pablo ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 16, 602, N'11602', N'San Pedro ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 16, 603, N'11603', N'San Juan de Mata ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 16, 604, N'11604', N'San Luis ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 16, 605, N'11605', N'Cárara ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 17, 701, N'11701', N'Santa María ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 17, 702, N'11702', N'Jardín ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 17, 703, N'11703', N'Copey ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 18, 801, N'11801', N'Curridabat ', 1)
GO
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 18, 802, N'11802', N'Granadilla ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 18, 803, N'11803', N'Sánchez ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 18, 804, N'11804', N'Tirrases ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 19, 901, N'11901', N'San Isidro de el General ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 19, 902, N'11902', N'General ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 19, 903, N'11903', N'Daniel Flores ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 19, 904, N'11904', N'Rivas ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 19, 905, N'11905', N'San Pedro ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 19, 906, N'11906', N'Platanares ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 19, 907, N'11907', N'Pejibaye ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 19, 908, N'11908', N'Cajón ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 19, 909, N'11909', N'Barú ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 19, 910, N'11910', N'Río Nuevo ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 19, 911, N'11911', N'Páramo ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 20, 1, N'12001', N'San Pablo ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 20, 2, N'12002', N'San Andrés ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 20, 3, N'12003', N'Llano Bonito ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 20, 4, N'12004', N'San Isidro ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 20, 5, N'12005', N'Santa Cruz ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (1, 20, 6, N'12006', N'San Antonio ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 1, 101, N'20101', N'Alajuela ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 1, 102, N'20102', N'San José ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 1, 103, N'20103', N'Carrizal ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 1, 104, N'20104', N'San Antonio ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 1, 105, N'20105', N'Guácima ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 1, 106, N'20106', N'San Isidro ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 1, 107, N'20107', N'Sabanilla ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 1, 108, N'20108', N'San Rafael ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 1, 109, N'20109', N'Río Segundo ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 1, 110, N'20110', N'Desamparados ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 1, 111, N'20111', N'Turrucares ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 1, 112, N'20112', N'Tambor ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 1, 113, N'20113', N'La Garita ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 1, 114, N'20114', N'Sarapiquí ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 2, 201, N'20201', N'San Ramón ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 2, 202, N'20202', N'Santiago ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 2, 203, N'20203', N'San Juan ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 2, 204, N'20204', N'Piedades Norte ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 2, 205, N'20205', N'Piedades Sur ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 2, 206, N'20206', N'San Rafael ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 2, 207, N'20207', N'San Isidro ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 2, 208, N'20208', N'Angeles ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 2, 209, N'20209', N'Alfaro ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 2, 210, N'20210', N'Volio ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 2, 211, N'20211', N'Concepción ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 2, 212, N'20212', N'Zapotal ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 2, 213, N'20213', N'San Isidro de Peñas Blancas ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 3, 301, N'20301', N'Grecia ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 3, 302, N'20302', N'San Isidro ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 3, 303, N'20303', N'San José ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 3, 304, N'20304', N'San Roque ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 3, 305, N'20305', N'Tacares ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 3, 306, N'20306', N'Río Cuarto ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 3, 307, N'20307', N'Puente Piedra ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 3, 308, N'20308', N'Bolívar ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 4, 401, N'20401', N'San Mateo ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 4, 402, N'20402', N'Desmonte ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 4, 403, N'20403', N'Jesús María ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 5, 501, N'20501', N'Atenas ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 5, 502, N'20502', N'Jesús ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 5, 503, N'20503', N'Mercedes ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 5, 504, N'20504', N'San Isidro ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 5, 505, N'20505', N'Concepción ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 5, 506, N'20506', N'San José ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 5, 507, N'20507', N'Santa Eulalia ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 5, 508, N'20508', N'Escobal ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 6, 601, N'20601', N'Naranjo ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 6, 602, N'20602', N'San Miguel ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 6, 603, N'20603', N'San José ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 6, 604, N'20604', N'Cirrí Sur ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 6, 605, N'20605', N'San Jerónimo ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 6, 606, N'20606', N'San Juan ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 6, 607, N'20607', N'Rosario ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 7, 701, N'20701', N'Palmares ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 7, 702, N'20702', N'Zaragoza ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 7, 703, N'20703', N'Buenos Aires ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 7, 704, N'20704', N'Santiago ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 7, 705, N'20705', N'Candelaria ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 7, 706, N'20706', N'Esquipulas ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 7, 707, N'20707', N'La Granja ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 8, 801, N'20801', N'San Pedro ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 8, 802, N'20802', N'San Juan ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 8, 803, N'20803', N'San Rafael ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 8, 804, N'20804', N'Carrillos ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 8, 805, N'20805', N'Sabana Redonda ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 9, 901, N'20901', N'Orotina ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 9, 902, N'20902', N'Mastate ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 9, 903, N'20903', N'Hacienda Vieja ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 9, 904, N'20904', N'Coyolar ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 9, 905, N'20905', N'Ceiba ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 10, 1, N'21001', N'Quesada ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 10, 2, N'21002', N'Florencia ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 10, 3, N'21003', N'Buenavista ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 10, 4, N'21004', N'Aguas Zarcas ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 10, 5, N'21005', N'Venecia ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 10, 6, N'21006', N'Pital ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 10, 7, N'21007', N'Fortuna ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 10, 8, N'21008', N'Tigra ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 10, 9, N'21009', N'Palmera ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 10, 10, N'21010', N'Venado ', 0)
GO
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 10, 11, N'21011', N'Cutris ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 10, 12, N'21012', N'Monterrey ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 10, 13, N'21013', N'Pocosol ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 11, 101, N'21101', N'Zarcero ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 11, 102, N'21102', N'Laguna ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 11, 103, N'21103', N'Tapezco ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 11, 104, N'21104', N'Guadalupe ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 11, 105, N'21105', N'Palmira ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 11, 106, N'21106', N'Zapote ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 11, 107, N'21107', N'Las Brisas ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 12, 201, N'21201', N'Sarchí Norte ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 12, 202, N'21202', N'Sarchí Sur ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 12, 203, N'21203', N'Toro Amarillo ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 12, 204, N'21204', N'San Pedro ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 12, 205, N'21205', N'Rodríguez ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 13, 301, N'21301', N'Upala ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 13, 302, N'21302', N'Aguas Claras ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 13, 303, N'21303', N'San José o Pizote ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 13, 304, N'21304', N'Bijagua ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 13, 305, N'21305', N'Delicias ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 13, 306, N'21306', N'Dos Ríos ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 13, 307, N'21307', N'Yolillal ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 14, 401, N'21401', N'Los Chiles ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 14, 402, N'21402', N'Caño Negro ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 14, 403, N'21403', N'Amparo ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 14, 404, N'21404', N'San Jorge ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 15, 501, N'21501', N'San Rafael ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 15, 502, N'21502', N'Buenavista ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (2, 15, 503, N'21503', N'Cote ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (3, 1, 101, N'30101', N'Oriental ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (3, 1, 102, N'30102', N'Occidental ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (3, 1, 103, N'30103', N'Carmen ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (3, 1, 104, N'30104', N'San Nicolás ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (3, 1, 105, N'30105', N'Aguacaliente o San Francisco', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (3, 1, 106, N'30106', N'Guadalupe o Arenilla ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (3, 1, 107, N'30107', N'Corralillo ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (3, 1, 108, N'30108', N'Tierra Blanca ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (3, 1, 109, N'30109', N'Dulce Nombre ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (3, 1, 110, N'30110', N'Llano Grande ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (3, 1, 111, N'30111', N'Quebradilla ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (3, 2, 201, N'30201', N'Paraíso ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (3, 2, 202, N'30202', N'Santiago ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (3, 2, 203, N'30203', N'Orosi ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (3, 2, 204, N'30204', N'Cachí ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (3, 2, 205, N'30205', N'Los Llanos de Santa Lucía ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (3, 3, 301, N'30301', N'Tres Ríos ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (3, 3, 302, N'30302', N'San Diego ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (3, 3, 303, N'30303', N'San Juan ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (3, 3, 304, N'30304', N'San Rafael ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (3, 3, 305, N'30305', N'Concepción ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (3, 3, 306, N'30306', N'Dulce Nombre ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (3, 3, 307, N'30307', N'San Ramón ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (3, 3, 308, N'30308', N'Río Azul ', 1)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (3, 4, 401, N'30401', N'Juan Viñas ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (3, 4, 402, N'30402', N'Tucurrique ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (3, 4, 403, N'30403', N'Pejibaye ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (3, 5, 501, N'30501', N'Turrialba ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (3, 5, 502, N'30502', N'La Suiza ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (3, 5, 503, N'30503', N'Peralta ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (3, 5, 504, N'30504', N'Santa Cruz ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (3, 5, 505, N'30505', N'Santa Teresita ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (3, 5, 506, N'30506', N'Pavones ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (3, 5, 507, N'30507', N'Tuis ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (3, 5, 508, N'30508', N'Tayutic ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (3, 5, 509, N'30509', N'Santa Rosa ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (3, 5, 510, N'30510', N'Tres Equis ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (3, 5, 511, N'30511', N'La Isabel ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (3, 5, 512, N'30512', N'Chirripó ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (3, 6, 601, N'30601', N'Pacayas ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (3, 6, 602, N'30602', N'Cervantes ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (3, 6, 603, N'30603', N'Capellades ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (3, 7, 701, N'30701', N'San Rafael ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (3, 7, 702, N'30702', N'Cot ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (3, 7, 703, N'30703', N'Potrero Cerrado ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (3, 7, 704, N'30704', N'Cipreses ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (3, 7, 705, N'30705', N'Santa Rosa ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (3, 8, 801, N'30801', N'El Tejar ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (3, 8, 802, N'30802', N'San Isidro ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (3, 8, 803, N'30803', N'Tobosi ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (3, 8, 804, N'30804', N'Patio de Agua ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (4, 1, 101, N'40101', N'Heredia ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (4, 1, 102, N'40102', N'Mercedes ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (4, 1, 103, N'40103', N'San Francisco ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (4, 1, 104, N'40104', N'Ulloa ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (4, 1, 105, N'40105', N'Varablanca ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (4, 2, 201, N'40201', N'Barva ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (4, 2, 202, N'40202', N'San Pedro ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (4, 2, 203, N'40203', N'San Pablo ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (4, 2, 204, N'40204', N'San Roque ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (4, 2, 205, N'40205', N'Santa Lucía ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (4, 2, 206, N'40206', N'San José de la Montaña ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (4, 3, 301, N'40301', N'Santo Domingo ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (4, 3, 302, N'40302', N'San Vicente ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (4, 3, 303, N'40303', N'San Miguel ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (4, 3, 304, N'40304', N'Paracito ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (4, 3, 305, N'40305', N'Santo Tomás ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (4, 3, 306, N'40306', N'Santa Rosa ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (4, 3, 307, N'40307', N'Tures ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (4, 3, 308, N'40308', N'Pará ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (4, 4, 401, N'40401', N'Santa Bárbara ', 0)
GO
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (4, 4, 402, N'40402', N'San Pedro ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (4, 4, 403, N'40403', N'San Juan ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (4, 4, 404, N'40404', N'Jesús ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (4, 4, 405, N'40405', N'Santo Domingo del Roble ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (4, 4, 406, N'40406', N'Puraba ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (4, 5, 501, N'40501', N'San Rafael ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (4, 5, 502, N'40502', N'San Josecito ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (4, 5, 503, N'40503', N'Santiago ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (4, 5, 504, N'40504', N'Angeles ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (4, 5, 505, N'40505', N'Concepción ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (4, 6, 601, N'40601', N'San Isidro ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (4, 6, 602, N'40602', N'San José ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (4, 6, 603, N'40603', N'Concepción ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (4, 6, 604, N'40604', N'San Francisco ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (4, 7, 701, N'40701', N'San Antonio ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (4, 7, 702, N'40702', N'La Ribera ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (4, 7, 703, N'40703', N'Asunción ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (4, 8, 801, N'40801', N'San Joaquín ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (4, 8, 802, N'40802', N'Barrantes ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (4, 8, 803, N'40803', N'Llorente ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (4, 9, 901, N'40901', N'San Pablo ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (4, 10, 1, N'41001', N'Puerto Viejo ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (4, 10, 2, N'41002', N'La Virgen ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (4, 10, 3, N'41003', N'Horquetas ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (4, 10, 4, N'41004', N'Llanuras de Gaspar ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (4, 10, 5, N'41005', N'Cureña ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (5, 1, 101, N'50101', N'Liberia ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (5, 1, 102, N'50102', N'Cañas Dulces ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (5, 1, 103, N'50103', N'Mayorga ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (5, 1, 104, N'50104', N'Nacascolo ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (5, 1, 105, N'50105', N'Curubande ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (5, 2, 201, N'50201', N'Nicoya ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (5, 2, 202, N'50202', N'Mansión ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (5, 2, 203, N'50203', N'San Antonio ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (5, 2, 204, N'50204', N'Quebrada Honda ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (5, 2, 205, N'50205', N'Sámara ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (5, 2, 206, N'50206', N'Nósara ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (5, 2, 207, N'50207', N'Belén de Nosarita ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (5, 3, 301, N'50301', N'Santa Cruz ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (5, 3, 302, N'50302', N'Bolsón ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (5, 3, 303, N'50303', N'Veintisiete de Abril ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (5, 3, 304, N'50304', N'Tempate ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (5, 3, 305, N'50305', N'Cartagena ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (5, 3, 306, N'50306', N'Cuajiniquil ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (5, 3, 307, N'50307', N'Diriá ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (5, 3, 308, N'50308', N'Cabo Velas ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (5, 3, 309, N'50309', N'Tamarindo ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (5, 4, 401, N'50401', N'Bagaces ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (5, 4, 402, N'50402', N'Fortuna ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (5, 4, 403, N'50403', N'Mogote ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (5, 4, 404, N'50404', N'Río Naranjo ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (5, 5, 501, N'50501', N'Filadelfia ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (5, 5, 502, N'50502', N'Palmira ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (5, 5, 503, N'50503', N'Sardinal ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (5, 5, 504, N'50504', N'Belén ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (5, 6, 601, N'50601', N'Cañas ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (5, 6, 602, N'50602', N'Palmira ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (5, 6, 603, N'50603', N'San Miguel ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (5, 6, 604, N'50604', N'Bebedero ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (5, 6, 605, N'50605', N'Porozal ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (5, 7, 701, N'50701', N'Juntas ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (5, 7, 702, N'50702', N'Sierra ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (5, 7, 703, N'50703', N'San Juan ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (5, 7, 704, N'50704', N'Colorado ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (5, 8, 801, N'50801', N'Tilarán ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (5, 8, 802, N'50802', N'Quebrada Grande ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (5, 8, 803, N'50803', N'Tronadora ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (5, 8, 804, N'50804', N'Santa Rosa ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (5, 8, 805, N'50805', N'Líbano ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (5, 8, 806, N'50806', N'Tierras Morenas ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (5, 8, 807, N'50807', N'Arenal ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (5, 9, 901, N'50901', N'Carmona ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (5, 9, 902, N'50902', N'Santa Rita ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (5, 9, 903, N'50903', N'Zapotal ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (5, 9, 904, N'50904', N'San Pablo ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (5, 9, 905, N'50905', N'Porvenir ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (5, 9, 906, N'50906', N'Bejuco ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (5, 10, 1, N'51001', N'La Cruz ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (5, 10, 2, N'51002', N'Santa Cecilia ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (5, 10, 3, N'51003', N'Garita ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (5, 10, 4, N'51004', N'Santa Elena ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (5, 11, 101, N'51101', N'Hojancha ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (5, 11, 102, N'51102', N'Monte Romo ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (5, 11, 103, N'51103', N'Puerto Carrillo ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (5, 11, 104, N'51104', N'Huacas ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (6, 1, 101, N'60101', N'Puntarenas ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (6, 1, 102, N'60102', N'Pitahaya ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (6, 1, 103, N'60103', N'Chomes ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (6, 1, 104, N'60104', N'Lepanto ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (6, 1, 105, N'60105', N'Paquera ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (6, 1, 106, N'60106', N'Manzanillo ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (6, 1, 107, N'60107', N'Guacimal ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (6, 1, 108, N'60108', N'Barranca ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (6, 1, 109, N'60109', N'Monte Verde ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (6, 1, 110, N'60110', N'Isla del Coco ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (6, 1, 111, N'60111', N'Cóbano ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (6, 1, 112, N'60112', N'Chacarita ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (6, 1, 113, N'60113', N'Chira ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (6, 1, 114, N'60114', N'Acapulco ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (6, 1, 115, N'60115', N'Roble ', 0)
GO
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (6, 1, 116, N'60116', N'Arancibia ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (6, 2, 201, N'60201', N'Espíritu Santo ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (6, 2, 202, N'60202', N'San Juan Grande ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (6, 2, 203, N'60203', N'Macacona ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (6, 2, 204, N'60204', N'San Rafael ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (6, 2, 205, N'60205', N'San Jerónimo ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (6, 3, 301, N'60301', N'Buenos Aires ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (6, 3, 302, N'60302', N'Volcán ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (6, 3, 303, N'60303', N'Potrero Grande ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (6, 3, 304, N'60304', N'Boruca ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (6, 3, 305, N'60305', N'Pilas ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (6, 3, 306, N'60306', N'Colinas o Bajo de Maíz ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (6, 3, 307, N'60307', N'Chánguena ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (6, 3, 308, N'60308', N'Bioley ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (6, 3, 309, N'60309', N'Brunka ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (6, 4, 401, N'60401', N'Miramar ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (6, 4, 402, N'60402', N'Unión ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (6, 4, 403, N'60403', N'San Isidro ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (6, 5, 501, N'60501', N'Puerto Cortés ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (6, 5, 502, N'60502', N'Palmar ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (6, 5, 503, N'60503', N'Sierpe ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (6, 5, 504, N'60504', N'Bahía Ballena ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (6, 5, 505, N'60505', N'Piedras Blancas ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (6, 6, 601, N'60601', N'Quepos ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (6, 6, 602, N'60602', N'Savegre ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (6, 6, 603, N'60603', N'Naranjito ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (6, 7, 701, N'60701', N'Golfito ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (6, 7, 702, N'60702', N'Puerto Jiménez ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (6, 7, 703, N'60703', N'Guaycará ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (6, 7, 704, N'60704', N'Pavon ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (6, 8, 801, N'60801', N'San Vito ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (6, 8, 802, N'60802', N'Sabalito ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (6, 8, 803, N'60803', N'Agua Buena ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (6, 8, 804, N'60804', N'Limoncito ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (6, 8, 805, N'60805', N'Pittier ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (6, 9, 901, N'60901', N'Parrita ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (6, 10, 1, N'61001', N'Corredor ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (6, 10, 2, N'61002', N'La Cuesta ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (6, 10, 3, N'61003', N'Paso Canoas ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (6, 10, 4, N'61004', N'Laurel ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (6, 11, 101, N'61101', N'Jacó ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (6, 11, 102, N'61102', N'Tárcoles ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (7, 1, 101, N'70101', N'Limón ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (7, 1, 102, N'70102', N'Valle La Estrella ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (7, 1, 103, N'70103', N'Río Blanco ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (7, 1, 104, N'70104', N'Matama ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (7, 2, 201, N'70201', N'Guápiles ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (7, 2, 202, N'70202', N'Jiménez ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (7, 2, 203, N'70203', N'Rita ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (7, 2, 204, N'70204', N'Roxana ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (7, 2, 205, N'70205', N'Cariari ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (7, 2, 206, N'70206', N'Colorado ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (7, 3, 301, N'70301', N'Siquirres ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (7, 3, 302, N'70302', N'Pacuarito ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (7, 3, 303, N'70303', N'Florida ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (7, 3, 304, N'70304', N'Germania ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (7, 3, 305, N'70305', N'Cairo ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (7, 3, 306, N'70306', N'Alegría ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (7, 4, 401, N'70401', N'Bratsi ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (7, 4, 402, N'70402', N'Sixaola ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (7, 4, 403, N'70403', N'Cahuita ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (7, 4, 404, N'70404', N'Telire ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (7, 5, 501, N'70501', N'Matina ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (7, 5, 502, N'70502', N'Batán ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (7, 5, 503, N'70503', N'Carrandí ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (7, 6, 601, N'70601', N'Guácimo ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (7, 6, 602, N'70602', N'Mercedes ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (7, 6, 603, N'70603', N'Pocora ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (7, 6, 604, N'70604', N'Río Jiménez ', 0)
INSERT [dbo].[District] ([idState], [idCounty], [idDistrict], [zipCode], [districtName], [active]) VALUES (7, 6, 605, N'70605', N'Duacarí ', 0)
GO
INSERT [dbo].[States] ([idState], [stateName], [active]) VALUES (1, N'San José', 1)
INSERT [dbo].[States] ([idState], [stateName], [active]) VALUES (2, N'Alajuela', 0)
INSERT [dbo].[States] ([idState], [stateName], [active]) VALUES (3, N'Cartago', 1)
INSERT [dbo].[States] ([idState], [stateName], [active]) VALUES (4, N'Herédia', 1)
INSERT [dbo].[States] ([idState], [stateName], [active]) VALUES (5, N'Guanacaste', 0)
INSERT [dbo].[States] ([idState], [stateName], [active]) VALUES (6, N'Puntarenas', 0)
INSERT [dbo].[States] ([idState], [stateName], [active]) VALUES (7, N'Limón', 0)
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_Costumer] FOREIGN KEY([idCustomer])
REFERENCES [dbo].[Costumer] ([idCustomer])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_Costumer]
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_District] FOREIGN KEY([zipCode])
REFERENCES [dbo].[District] ([zipCode])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_District]
GO
ALTER TABLE [dbo].[Carrier]  WITH CHECK ADD  CONSTRAINT [FK_Carrier_Vehicles] FOREIGN KEY([vehicleType])
REFERENCES [dbo].[Vehicles] ([vehicleType])
GO
ALTER TABLE [dbo].[Carrier] CHECK CONSTRAINT [FK_Carrier_Vehicles]
GO
ALTER TABLE [dbo].[County]  WITH CHECK ADD  CONSTRAINT [FK_County_States] FOREIGN KEY([idState])
REFERENCES [dbo].[States] ([idState])
GO
ALTER TABLE [dbo].[County] CHECK CONSTRAINT [FK_County_States]
GO
ALTER TABLE [dbo].[District]  WITH CHECK ADD  CONSTRAINT [FK_District_County] FOREIGN KEY([idState], [idCounty])
REFERENCES [dbo].[County] ([idState], [idCounty])
GO
ALTER TABLE [dbo].[District] CHECK CONSTRAINT [FK_District_County]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Order_Carrier] FOREIGN KEY([idCarrier])
REFERENCES [dbo].[Carrier] ([idCarrier])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Order_Carrier]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Order_Costumer] FOREIGN KEY([idCustomer])
REFERENCES [dbo].[Costumer] ([idCustomer])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Order_Costumer]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Order_Users] FOREIGN KEY([idUser])
REFERENCES [dbo].[Users] ([idUser])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Order_Users]
GO
ALTER TABLE [dbo].[OrdersLog]  WITH CHECK ADD  CONSTRAINT [FK_OrdersLog_Orders] FOREIGN KEY([idOrder])
REFERENCES [dbo].[Orders] ([idOrder])
GO
ALTER TABLE [dbo].[OrdersLog] CHECK CONSTRAINT [FK_OrdersLog_Orders]
GO
/****** Object:  StoredProcedure [dbo].[Address_Add]    Script Date: 6/12/2021 5:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
--                                Agregar Address
--
CREATE PROCEDURE [dbo].[Address_Add]
(
    @idAddress int, 
    @idCustomer int, 
    @addressLine1 varchar (60), 
    @addressLine2 varchar (60), 
    @zipCode varchar (5), 
    @active bit)
AS 
SET NOCOUNT OFF
INSERT INTO Address(idAddress, idCustomer, addressLine1, addressLine2, zipCode, active)
VALUES (@idAddress, @idCustomer, @addressLine1, @addressLine2, @zipCode, @active);
GO
/****** Object:  StoredProcedure [dbo].[Address_Get]    Script Date: 6/12/2021 5:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
--                                Traer Uno Address
--
CREATE PROCEDURE [dbo].[Address_Get]
(@idAddress int)
AS
SET NOCOUNT ON;
SELECT idAddress, idCustomer, addressLine1, addressLine2, zipCode, active
FROM Address
WHERE  (idAddress = @idAddress)
GO
/****** Object:  StoredProcedure [dbo].[Address_Update]    Script Date: 6/12/2021 5:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
--                                Modificar Address
--
CREATE PROCEDURE [dbo].[Address_Update]
( 
    @idAddress int, 
    @idCustomer int, 
    @addressLine1 varchar (60), 
    @addressLine2 varchar (60), 
    @zipCode varchar (5), 
    @active bit,
    @Original_idAddress int
) AS 
	SET NOCOUNT OFF;
 UPDATE Address
   SET idCustomer = @idCustomer, addressLine1 = @addressLine1, addressLine2 = @addressLine2, zipCode = @zipCode, active = @active
WHERE  (idAddress = @idAddress);

SET QUOTED_IDENTIFIER OFF
GO
/****** Object:  StoredProcedure [dbo].[Carrier_Add]    Script Date: 6/12/2021 5:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
--                                Agregar Carrier
--
CREATE PROCEDURE [dbo].[Carrier_Add]
(
    @idCarrier int, 
    @carrierName varchar (32), 
    @carrierLastName varchar (32), 
    @carrierEmail varchar (128), 
    @carrierPhone varchar (16), 
    @gender char (1), 
    @active bit, 
    @licensePlate varchar (16), 
    @vehicleType int)
AS 
SET NOCOUNT OFF
INSERT INTO Carrier(idCarrier, carrierName, carrierLastName, carrierEmail, carrierPhone, gender, active, licensePlate, vehicleType)
VALUES (@idCarrier, @carrierName, @carrierLastName, @carrierEmail, @carrierPhone, @gender, @active, @licensePlate, @vehicleType);
GO
/****** Object:  StoredProcedure [dbo].[Carrier_Get]    Script Date: 6/12/2021 5:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
--                                Traer Uno Carrier
--
CREATE PROCEDURE [dbo].[Carrier_Get]
(@idCarrier int)
AS
SET NOCOUNT ON;
SELECT idCarrier, carrierName, carrierLastName, carrierEmail, carrierPhone, gender, active, licensePlate, vehicleType
FROM Carrier
WHERE  (idCarrier = @idCarrier)
GO
/****** Object:  StoredProcedure [dbo].[Carrier_Update]    Script Date: 6/12/2021 5:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



--
--                                Modificar Carrier
--
CREATE PROCEDURE [dbo].[Carrier_Update]
( 
    @idCarrier int, 
    @carrierName varchar (32), 
    @carrierLastName varchar (32), 
    @carrierEmail varchar (128), 
    @carrierPhone varchar (16), 
    @gender char (1), 
    @active bit, 
    @licensePlate varchar (16), 
    @vehicleType int,
    @Original_idCarrier int
) AS 
	SET NOCOUNT OFF;
 UPDATE Carrier
   SET carrierName = @carrierName, carrierLastName = @carrierLastName, carrierEmail = @carrierEmail, carrierPhone = @carrierPhone, gender = @gender, active = @active, licensePlate = @licensePlate, vehicleType = @vehicleType
WHERE  (idCarrier = @idCarrier);

SET QUOTED_IDENTIFIER OFF
GO
/****** Object:  StoredProcedure [dbo].[Costumer_Add]    Script Date: 6/12/2021 5:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
--                                Agregar Costumer
--
CREATE PROCEDURE [dbo].[Costumer_Add]
(
    @idCustomer int, 
    @name varchar (32), 
    @lastName varchar (32), 
    @email varchar (128), 
    @phone varchar (16), 
    @birthdate smalldatetime, 
    @gender char (1), 
    @active bit,
	@idCustomerOut int output)
AS 
SET NOCOUNT OFF
INSERT INTO Costumer(idCustomer, name, lastName, email, phone, birthdate, gender, active)
VALUES (@idCustomer, @name, @lastName, @email, @phone, @birthdate, @gender, @active);

set @idCustomerOut = SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [dbo].[Costumer_Get]    Script Date: 6/12/2021 5:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
--                                Traer Uno Costumer
--
CREATE PROCEDURE [dbo].[Costumer_Get]
(@idCustomer int)
AS
SET NOCOUNT ON;
SELECT idCustomer, name, lastName, email, phone, birthdate, gender, active
FROM Costumer
WHERE  (idCustomer = @idCustomer)
GO
/****** Object:  StoredProcedure [dbo].[Costumer_Update]    Script Date: 6/12/2021 5:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
--                                Modificar Costumer
--
CREATE PROCEDURE [dbo].[Costumer_Update]
( 
    @idCustomer int, 
    @name varchar (32), 
    @lastName varchar (32), 
    @email varchar (128), 
    @phone varchar (16), 
    @birthdate smalldatetime, 
    @gender char (1), 
    @active bit,
    @Original_idCustomer int
) AS 
	SET NOCOUNT OFF;
 UPDATE Costumer
   SET name = @name, lastName = @lastName, email = @email, phone = @phone, birthdate = @birthdate, gender = @gender, active = @active
WHERE  (idCustomer = @idCustomer);

SET QUOTED_IDENTIFIER OFF
GO
/****** Object:  StoredProcedure [dbo].[County_Add]    Script Date: 6/12/2021 5:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
--                                Agregar County
--
CREATE PROCEDURE [dbo].[County_Add]
(
    @idState smallint, 
    @idCounty smallint, 
    @countyName varchar (50), 
    @active bit)
AS 
SET NOCOUNT OFF
INSERT INTO County(idState, idCounty, countyName, active)
VALUES (@idState, @idCounty, @countyName, @active);
GO
/****** Object:  StoredProcedure [dbo].[County_Get]    Script Date: 6/12/2021 5:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
--                                Traer Uno County
--
CREATE PROCEDURE [dbo].[County_Get]
(@idState smallint, 
@idCounty smallint)
AS
SET NOCOUNT ON;
SELECT idState, idCounty, countyName, active
FROM County
WHERE  (idState = @idState) AND  (idCounty = @idCounty)
GO
/****** Object:  StoredProcedure [dbo].[County_Update]    Script Date: 6/12/2021 5:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
--                                Modificar County
--
CREATE PROCEDURE [dbo].[County_Update]
( 
    @idState smallint, 
    @idCounty smallint, 
    @countyName varchar (50), 
    @active bit,
    @Original_idState smallint, 
    @Original_idCounty smallint
) AS 
	SET NOCOUNT OFF;
 UPDATE County
   SET countyName = @countyName, active = @active
WHERE  (idState = @idState) AND  (idCounty = @idCounty);

SET QUOTED_IDENTIFIER OFF
GO
/****** Object:  StoredProcedure [dbo].[District_Add]    Script Date: 6/12/2021 5:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
--                                Agregar District
--
CREATE PROCEDURE [dbo].[District_Add]
(
    @idState smallint, 
    @idCounty smallint, 
    @idDistrict smallint, 
    @zipCode varchar (5), 
    @districtName varchar (50), 
    @active bit)
AS 
SET NOCOUNT OFF
INSERT INTO District(idState, idCounty, idDistrict, zipCode, districtName, active)
VALUES (@idState, @idCounty, @idDistrict, @zipCode, @districtName, @active);
GO
/****** Object:  StoredProcedure [dbo].[District_Get]    Script Date: 6/12/2021 5:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
--                                Traer Uno District
--
CREATE PROCEDURE [dbo].[District_Get]
(@zipCode varchar (5))
AS
SET NOCOUNT ON;
SELECT idState, idCounty, idDistrict, zipCode, districtName, active
FROM District
WHERE  (zipCode = @zipCode)
GO
/****** Object:  StoredProcedure [dbo].[District_Update]    Script Date: 6/12/2021 5:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
--                                Modificar District
--
CREATE PROCEDURE [dbo].[District_Update]
( 
    @idState smallint, 
    @idCounty smallint, 
    @idDistrict smallint, 
    @zipCode varchar (5), 
    @districtName varchar (50), 
    @active bit,
    @Original_zipCode varchar (5)
) AS 
	SET NOCOUNT OFF;
 UPDATE District
   SET idState = @idState, idCounty = @idCounty, idDistrict = @idDistrict, districtName = @districtName, active = @active
WHERE  (zipCode = @zipCode);

SET QUOTED_IDENTIFIER OFF
GO
/****** Object:  StoredProcedure [dbo].[Order_Add]    Script Date: 6/12/2021 5:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
--                                Agregar Order
--
CREATE PROCEDURE [dbo].[Order_Add]
(
    @idOrder int, 
    @idCustomer int, 
    @invoiceNumber varchar (16), 
    @idUser int, 
    @createdDate datetime, 
    @status smallint, 
    @lastModification datetime, 
    @idCarrier int,
	@idOrderOut int output
)
AS 
SET NOCOUNT OFF
INSERT INTO Orders(idOrder, idCustomer, invoiceNumber, idUser, createdDate, status, lastModification, idCarrier)
VALUES (@idOrder, @idCustomer, @invoiceNumber, @idUser, @createdDate, @status, @lastModification, @idCarrier);

set @idOrderOut =  SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [dbo].[Order_Get]    Script Date: 6/12/2021 5:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
--                                Traer Uno Order
--
CREATE PROCEDURE [dbo].[Order_Get]
(@idOrder int)
AS
SET NOCOUNT ON;
SELECT idOrder, idCustomer, invoiceNumber, idUser, createdDate, status, lastModification, idCarrier
FROM Orders
WHERE  (idOrder = @idOrder)
GO
/****** Object:  StoredProcedure [dbo].[Orders_Update]    Script Date: 6/12/2021 5:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
--                                Modificar Order
--
CREATE PROCEDURE [dbo].[Orders_Update]
( 
    @idOrder int, 
    @idCustomer int, 
    @invoiceNumber varchar (16), 
    @idUser int, 
    @createdDate datetime, 
    @status smallint, 
    @lastModification datetime, 
    @idCarrier int,
    @Original_idOrder int
) AS 
	SET NOCOUNT OFF;
 UPDATE Orders
   SET idCustomer = @idCustomer, invoiceNumber = @invoiceNumber, idUser = @idUser, createdDate = @createdDate, status = @status, lastModification = @lastModification, idCarrier = @idCarrier
WHERE  (idOrder = @idOrder);

SET QUOTED_IDENTIFIER OFF
GO
/****** Object:  StoredProcedure [dbo].[OrdersLog_Add]    Script Date: 6/12/2021 5:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
--                                Agregar OrdersLog
--
CREATE PROCEDURE [dbo].[OrdersLog_Add]
(
    @idOrderLog int, 
    @idOrder int, 
    @status char (1), 
    @lastModification datetime)
AS 
SET NOCOUNT OFF
INSERT INTO OrdersLog(idOrderLog, idOrder, status, lastModification)
VALUES (@idOrderLog, @idOrder, @status, @lastModification);
GO
/****** Object:  StoredProcedure [dbo].[OrdersLog_Get]    Script Date: 6/12/2021 5:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
--                                Traer Uno OrdersLog
--
CREATE PROCEDURE [dbo].[OrdersLog_Get]
(@idOrderLog int)
AS
SET NOCOUNT ON;
SELECT idOrderLog, idOrder, status, lastModification
FROM OrdersLog
WHERE  (idOrderLog = @idOrderLog)
GO
/****** Object:  StoredProcedure [dbo].[OrdersLog_Update]    Script Date: 6/12/2021 5:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
--                                Modificar OrdersLog
--
CREATE PROCEDURE [dbo].[OrdersLog_Update]
( 
    @idOrderLog int, 
    @idOrder int, 
    @status char (1), 
    @lastModification datetime,
    @Original_idOrderLog int
) AS 
	SET NOCOUNT OFF;
 UPDATE OrdersLog
   SET idOrder = @idOrder, status = @status, lastModification = @lastModification
WHERE  (idOrderLog = @idOrderLog);

SET QUOTED_IDENTIFIER OFF
GO
/****** Object:  StoredProcedure [dbo].[States_Add]    Script Date: 6/12/2021 5:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
--                                Agregar States
--
CREATE PROCEDURE [dbo].[States_Add]
(
    @idState smallint, 
    @stateName varchar (15), 
    @active bit)
AS 
SET NOCOUNT OFF
INSERT INTO States(idState, stateName, active)
VALUES (@idState, @stateName, @active);
GO
/****** Object:  StoredProcedure [dbo].[States_Get]    Script Date: 6/12/2021 5:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
--                                Traer Uno States
--
CREATE PROCEDURE [dbo].[States_Get]
(@idState smallint)
AS
SET NOCOUNT ON;
SELECT idState, stateName, active
FROM States
WHERE  (idState = @idState)
GO
/****** Object:  StoredProcedure [dbo].[States_Update]    Script Date: 6/12/2021 5:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
--                                Modificar States
--
CREATE PROCEDURE [dbo].[States_Update]
( 
    @idState smallint, 
    @stateName varchar (15), 
    @active bit,
    @Original_idState smallint
) AS 
	SET NOCOUNT OFF;
 UPDATE States
   SET stateName = @stateName, active = @active
WHERE  (idState = @idState);

SET QUOTED_IDENTIFIER OFF
GO
/****** Object:  StoredProcedure [dbo].[Users_Add]    Script Date: 6/12/2021 5:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
--                                Agregar User
--
CREATE PROCEDURE [dbo].[Users_Add]
(
    @idUser int, 
    @email varchar (128), 
    @name varchar (32), 
    @lastName varchar (32), 
    @userType smallint, 
    @active bit)
AS 
SET NOCOUNT OFF
INSERT INTO Users(idUser, email, name, lastName, userType, active)
VALUES (@idUser, @email, @name, @lastName, @userType, @active);
GO
/****** Object:  StoredProcedure [dbo].[Users_Get]    Script Date: 6/12/2021 5:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--
--                                Traer Uno User
--
CREATE PROCEDURE [dbo].[Users_Get]
(@idUser int)
AS
SET NOCOUNT ON;
SELECT idUser, email, name, lastName, userType, active
FROM Users
WHERE  (idUser = @idUser)
GO
/****** Object:  StoredProcedure [dbo].[Users_Update]    Script Date: 6/12/2021 5:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
--                                Modificar User
--
CREATE PROCEDURE [dbo].[Users_Update]
( 
    @idUser int, 
    @email varchar (128), 
    @name varchar (32), 
    @lastName varchar (32), 
    @userType smallint, 
    @active bit,
    @Original_idUser int
) AS 
	SET NOCOUNT OFF;
 UPDATE Users
   SET email = @email, name = @name, lastName = @lastName, userType = @userType, active = @active
WHERE  (idUser = @idUser);

SET QUOTED_IDENTIFIER OFF
GO
