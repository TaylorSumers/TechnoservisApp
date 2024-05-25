USE [master]
GO
/****** Object:  Database [Technoservis]    Script Date: 25.05.2024 21:51:31 ******/
CREATE DATABASE [Technoservis]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Technoservis', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Technoservis.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Technoservis_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Technoservis_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Technoservis] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Technoservis].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Technoservis] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Technoservis] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Technoservis] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Technoservis] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Technoservis] SET ARITHABORT OFF 
GO
ALTER DATABASE [Technoservis] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Technoservis] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Technoservis] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Technoservis] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Technoservis] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Technoservis] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Technoservis] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Technoservis] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Technoservis] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Technoservis] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Technoservis] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Technoservis] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Technoservis] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Technoservis] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Technoservis] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Technoservis] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Technoservis] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Technoservis] SET RECOVERY FULL 
GO
ALTER DATABASE [Technoservis] SET  MULTI_USER 
GO
ALTER DATABASE [Technoservis] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Technoservis] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Technoservis] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Technoservis] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Technoservis] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Technoservis] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Technoservis', N'ON'
GO
ALTER DATABASE [Technoservis] SET QUERY_STORE = ON
GO
ALTER DATABASE [Technoservis] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Technoservis]
GO
/****** Object:  Table [dbo].[Component]    Script Date: 25.05.2024 21:51:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Component](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Cost] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_Component] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DefectType]    Script Date: 25.05.2024 21:51:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DefectType](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DefectType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquipmentType]    Script Date: 25.05.2024 21:51:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquipmentType](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_EquipmentType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Priority]    Script Date: 25.05.2024 21:51:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Priority](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Priority] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RepairingRequest]    Script Date: 25.05.2024 21:51:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RepairingRequest](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[StartDate] [datetime] NULL,
	[CompleteDate] [datetime] NULL,
	[EquipmentTypeId] [int] NOT NULL,
	[EquipmentSerial] [nvarchar](50) NOT NULL,
	[DefectTypeId] [int] NOT NULL,
	[DefectDesc] [nvarchar](max) NULL,
	[PriorityId] [int] NOT NULL,
	[RequesterId] [int] NOT NULL,
	[PerformerId] [int] NULL,
	[StatusId] [int] NOT NULL,
	[Comments] [nvarchar](max) NULL,
 CONSTRAINT [PK_RepairingRequest] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReparingComponent]    Script Date: 25.05.2024 21:51:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReparingComponent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RepairingRequestId] [int] NOT NULL,
	[ComponentId] [int] NOT NULL,
	[Amount] [int] NOT NULL,
 CONSTRAINT [PK_ReparingComponent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Report]    Script Date: 25.05.2024 21:51:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report](
	[Id] [int] NOT NULL,
	[HoursSpent] [int] NOT NULL,
	[Cost] [decimal](10, 2) NOT NULL,
	[DefectCause] [nvarchar](100) NULL,
	[RepairingDesc] [nvarchar](200) NULL,
 CONSTRAINT [PK_Report] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RequestStatus]    Script Date: 25.05.2024 21:51:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequestStatus](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_RequestStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 25.05.2024 21:51:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 25.05.2024 21:51:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NULL,
	[Login] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Component] ([Id], [Name], [Cost]) VALUES (1, N'Дисплей Iphone X', CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Component] ([Id], [Name], [Cost]) VALUES (2, N'Аккумулатор ноутбука MSI', CAST(3000.00 AS Decimal(10, 2)))
INSERT [dbo].[Component] ([Id], [Name], [Cost]) VALUES (3, N'Термопаста', CAST(500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DefectType] ([Id], [Name]) VALUES (1, N'повреждение экрана')
INSERT [dbo].[DefectType] ([Id], [Name]) VALUES (2, N'снижение емкости аккумулятора')
INSERT [dbo].[DefectType] ([Id], [Name]) VALUES (3, N'перегрев')
GO
INSERT [dbo].[EquipmentType] ([Id], [Name]) VALUES (1, N'Смартфон')
INSERT [dbo].[EquipmentType] ([Id], [Name]) VALUES (2, N'Ноутбук')
INSERT [dbo].[EquipmentType] ([Id], [Name]) VALUES (3, N'Системный блок')
GO
INSERT [dbo].[Priority] ([Id], [Name]) VALUES (1, N'Низкий')
INSERT [dbo].[Priority] ([Id], [Name]) VALUES (2, N'Средний')
INSERT [dbo].[Priority] ([Id], [Name]) VALUES (3, N'Высокий')
GO
SET IDENTITY_INSERT [dbo].[RepairingRequest] ON 

INSERT [dbo].[RepairingRequest] ([Id], [CreationDate], [StartDate], [CompleteDate], [EquipmentTypeId], [EquipmentSerial], [DefectTypeId], [DefectDesc], [PriorityId], [RequesterId], [PerformerId], [StatusId], [Comments]) VALUES (3, CAST(N'2024-04-01T00:00:00.000' AS DateTime), CAST(N'2024-04-01T12:00:00.000' AS DateTime), CAST(N'2024-04-05T00:00:00.000' AS DateTime), 1, N'ASSCZXSS1234', 1, N'Разбит экран', 2, 1, 2, 3, N'Необходимо заказать экран')
INSERT [dbo].[RepairingRequest] ([Id], [CreationDate], [StartDate], [CompleteDate], [EquipmentTypeId], [EquipmentSerial], [DefectTypeId], [DefectDesc], [PriorityId], [RequesterId], [PerformerId], [StatusId], [Comments]) VALUES (4, CAST(N'2024-04-03T00:00:00.000' AS DateTime), CAST(N'2024-04-03T10:00:00.000' AS DateTime), CAST(N'2024-04-04T00:00:00.000' AS DateTime), 2, N'HGSDF52132', 2, N'Заряда аккумулятора хватает на полчаса', 3, 1, 2, 3, N'')
INSERT [dbo].[RepairingRequest] ([Id], [CreationDate], [StartDate], [CompleteDate], [EquipmentTypeId], [EquipmentSerial], [DefectTypeId], [DefectDesc], [PriorityId], [RequesterId], [PerformerId], [StatusId], [Comments]) VALUES (5, CAST(N'2024-05-15T00:00:00.000' AS DateTime), NULL, NULL, 3, N'FAHJKFAD12', 3, N'Отключение из-за перегрева', 1, 1, 2, 1, N'')
INSERT [dbo].[RepairingRequest] ([Id], [CreationDate], [StartDate], [CompleteDate], [EquipmentTypeId], [EquipmentSerial], [DefectTypeId], [DefectDesc], [PriorityId], [RequesterId], [PerformerId], [StatusId], [Comments]) VALUES (6, CAST(N'2024-05-21T22:14:58.037' AS DateTime), CAST(N'2024-05-21T11:27:56.430' AS DateTime), CAST(N'2024-05-22T11:33:23.940' AS DateTime), 1, N'DAHJKDH2132131', 1, N'Экран вдребезги', 2, 1, 2, 3, NULL)
INSERT [dbo].[RepairingRequest] ([Id], [CreationDate], [StartDate], [CompleteDate], [EquipmentTypeId], [EquipmentSerial], [DefectTypeId], [DefectDesc], [PriorityId], [RequesterId], [PerformerId], [StatusId], [Comments]) VALUES (7, CAST(N'2024-05-23T10:31:39.973' AS DateTime), CAST(N'2024-05-23T10:33:41.047' AS DateTime), CAST(N'2024-05-23T10:34:29.123' AS DateTime), 1, N'FSDHJFDA1234512', 2, N'Медленная зарядка', 3, 1, 2, 3, NULL)
INSERT [dbo].[RepairingRequest] ([Id], [CreationDate], [StartDate], [CompleteDate], [EquipmentTypeId], [EquipmentSerial], [DefectTypeId], [DefectDesc], [PriorityId], [RequesterId], [PerformerId], [StatusId], [Comments]) VALUES (8, CAST(N'2024-05-24T11:38:05.970' AS DateTime), CAST(N'2024-05-24T11:39:31.813' AS DateTime), CAST(N'2024-05-24T11:42:08.843' AS DateTime), 1, N'FDHSKJA55142312', 1, N'Царапина', 2, 1, 2, 3, N'коммент от менеджера:)')
SET IDENTITY_INSERT [dbo].[RepairingRequest] OFF
GO
SET IDENTITY_INSERT [dbo].[ReparingComponent] ON 

INSERT [dbo].[ReparingComponent] ([Id], [RepairingRequestId], [ComponentId], [Amount]) VALUES (1, 3, 1, 1)
INSERT [dbo].[ReparingComponent] ([Id], [RepairingRequestId], [ComponentId], [Amount]) VALUES (2, 4, 2, 1)
INSERT [dbo].[ReparingComponent] ([Id], [RepairingRequestId], [ComponentId], [Amount]) VALUES (3, 5, 3, 1)
INSERT [dbo].[ReparingComponent] ([Id], [RepairingRequestId], [ComponentId], [Amount]) VALUES (4, 5, 3, 2)
INSERT [dbo].[ReparingComponent] ([Id], [RepairingRequestId], [ComponentId], [Amount]) VALUES (5, 5, 3, 1)
INSERT [dbo].[ReparingComponent] ([Id], [RepairingRequestId], [ComponentId], [Amount]) VALUES (6, 7, 2, 3)
INSERT [dbo].[ReparingComponent] ([Id], [RepairingRequestId], [ComponentId], [Amount]) VALUES (7, 8, 1, 1)
SET IDENTITY_INSERT [dbo].[ReparingComponent] OFF
GO
INSERT [dbo].[Report] ([Id], [HoursSpent], [Cost], [DefectCause], [RepairingDesc]) VALUES (3, 96, CAST(10000.00 AS Decimal(10, 2)), N'', N'Заменен дисплей')
INSERT [dbo].[Report] ([Id], [HoursSpent], [Cost], [DefectCause], [RepairingDesc]) VALUES (4, 24, CAST(3000.00 AS Decimal(10, 2)), N'Некачественная зарядка', N'Заменен аккумулятор')
INSERT [dbo].[Report] ([Id], [HoursSpent], [Cost], [DefectCause], [RepairingDesc]) VALUES (6, 24, CAST(5000.00 AS Decimal(10, 2)), N'Падение', N'Заменен экран')
INSERT [dbo].[Report] ([Id], [HoursSpent], [Cost], [DefectCause], [RepairingDesc]) VALUES (7, 0, CAST(10000.00 AS Decimal(10, 2)), N'Плохой аккум', N'Помогли)')
INSERT [dbo].[Report] ([Id], [HoursSpent], [Cost], [DefectCause], [RepairingDesc]) VALUES (8, 0, CAST(10000.00 AS Decimal(10, 2)), N'Царапина лол)', N'Поменяли экран')
GO
INSERT [dbo].[RequestStatus] ([Id], [Name]) VALUES (1, N'в ожидании')
INSERT [dbo].[RequestStatus] ([Id], [Name]) VALUES (2, N'в работе')
INSERT [dbo].[RequestStatus] ([Id], [Name]) VALUES (3, N'выполнено')
GO
INSERT [dbo].[Role] ([Id], [Name]) VALUES (1, N'Клиент')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (2, N'Ремонтный специалист')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (3, N'Менеджер')
GO
INSERT [dbo].[User] ([Id], [RoleId], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (1, 1, N'Иванов', N'Иван', N'Иванович', NULL, NULL)
INSERT [dbo].[User] ([Id], [RoleId], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (2, 2, N'Андреев', N'Андрей', N'Андреевич', N'L2', N'P2')
INSERT [dbo].[User] ([Id], [RoleId], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (3, 3, N'Окафор', N'Висдом', N'', N'L3', N'P3')
GO
ALTER TABLE [dbo].[RepairingRequest]  WITH CHECK ADD  CONSTRAINT [FK_RepairingRequest_DefectType] FOREIGN KEY([DefectTypeId])
REFERENCES [dbo].[DefectType] ([Id])
GO
ALTER TABLE [dbo].[RepairingRequest] CHECK CONSTRAINT [FK_RepairingRequest_DefectType]
GO
ALTER TABLE [dbo].[RepairingRequest]  WITH CHECK ADD  CONSTRAINT [FK_RepairingRequest_EquipmentType] FOREIGN KEY([EquipmentTypeId])
REFERENCES [dbo].[EquipmentType] ([Id])
GO
ALTER TABLE [dbo].[RepairingRequest] CHECK CONSTRAINT [FK_RepairingRequest_EquipmentType]
GO
ALTER TABLE [dbo].[RepairingRequest]  WITH CHECK ADD  CONSTRAINT [FK_RepairingRequest_Priority] FOREIGN KEY([PriorityId])
REFERENCES [dbo].[Priority] ([Id])
GO
ALTER TABLE [dbo].[RepairingRequest] CHECK CONSTRAINT [FK_RepairingRequest_Priority]
GO
ALTER TABLE [dbo].[RepairingRequest]  WITH CHECK ADD  CONSTRAINT [FK_RepairingRequest_RequestStatus] FOREIGN KEY([StatusId])
REFERENCES [dbo].[RequestStatus] ([Id])
GO
ALTER TABLE [dbo].[RepairingRequest] CHECK CONSTRAINT [FK_RepairingRequest_RequestStatus]
GO
ALTER TABLE [dbo].[RepairingRequest]  WITH CHECK ADD  CONSTRAINT [FK_RepairingRequest_User] FOREIGN KEY([RequesterId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[RepairingRequest] CHECK CONSTRAINT [FK_RepairingRequest_User]
GO
ALTER TABLE [dbo].[RepairingRequest]  WITH CHECK ADD  CONSTRAINT [FK_RepairingRequest_User1] FOREIGN KEY([PerformerId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[RepairingRequest] CHECK CONSTRAINT [FK_RepairingRequest_User1]
GO
ALTER TABLE [dbo].[ReparingComponent]  WITH CHECK ADD  CONSTRAINT [FK_ReparingComponent_Component] FOREIGN KEY([ComponentId])
REFERENCES [dbo].[Component] ([Id])
GO
ALTER TABLE [dbo].[ReparingComponent] CHECK CONSTRAINT [FK_ReparingComponent_Component]
GO
ALTER TABLE [dbo].[ReparingComponent]  WITH CHECK ADD  CONSTRAINT [FK_ReparingComponent_RepairingRequest] FOREIGN KEY([RepairingRequestId])
REFERENCES [dbo].[RepairingRequest] ([Id])
GO
ALTER TABLE [dbo].[ReparingComponent] CHECK CONSTRAINT [FK_ReparingComponent_RepairingRequest]
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD  CONSTRAINT [FK_Report_RepairingRequest] FOREIGN KEY([Id])
REFERENCES [dbo].[RepairingRequest] ([Id])
GO
ALTER TABLE [dbo].[Report] CHECK CONSTRAINT [FK_Report_RepairingRequest]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [Technoservis] SET  READ_WRITE 
GO
