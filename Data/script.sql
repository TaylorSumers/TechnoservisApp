USE [master]
GO
/****** Object:  Database [AutoTrans]    Script Date: 29.05.2024 12:40:21 ******/
CREATE DATABASE [AutoTrans]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Technoservis', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Technoservis.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Technoservis_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Technoservis_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [AutoTrans] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AutoTrans].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AutoTrans] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AutoTrans] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AutoTrans] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AutoTrans] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AutoTrans] SET ARITHABORT OFF 
GO
ALTER DATABASE [AutoTrans] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AutoTrans] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AutoTrans] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AutoTrans] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AutoTrans] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AutoTrans] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AutoTrans] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AutoTrans] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AutoTrans] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AutoTrans] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AutoTrans] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AutoTrans] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AutoTrans] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AutoTrans] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AutoTrans] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AutoTrans] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AutoTrans] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AutoTrans] SET RECOVERY FULL 
GO
ALTER DATABASE [AutoTrans] SET  MULTI_USER 
GO
ALTER DATABASE [AutoTrans] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AutoTrans] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AutoTrans] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AutoTrans] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AutoTrans] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AutoTrans] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'AutoTrans', N'ON'
GO
ALTER DATABASE [AutoTrans] SET QUERY_STORE = ON
GO
ALTER DATABASE [AutoTrans] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [AutoTrans]
GO
/****** Object:  Table [dbo].[CarBrand]    Script Date: 29.05.2024 12:40:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarBrand](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CarBrand] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarModel]    Script Date: 29.05.2024 12:40:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarModel](
	[Id] [int] NOT NULL,
	[BrandId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[TypeId] [int] NOT NULL,
 CONSTRAINT [PK_CarModel] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarType]    Script Date: 29.05.2024 12:40:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarType](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_EquipmentType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 29.05.2024 12:40:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
	[MasterId] [int] NOT NULL,
	[RequestId] [int] NOT NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Component]    Script Date: 29.05.2024 12:40:21 ******/
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
/****** Object:  Table [dbo].[Priority]    Script Date: 29.05.2024 12:40:21 ******/
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
/****** Object:  Table [dbo].[RepairingRequest]    Script Date: 29.05.2024 12:40:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RepairingRequest](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[StartDate] [datetime] NULL,
	[CompleteDate] [datetime] NULL,
	[CarModelId] [int] NULL,
	[ProblemDesc] [nvarchar](max) NULL,
	[PriorityId] [int] NULL,
	[ClientId] [int] NOT NULL,
	[MasterId] [int] NULL,
	[StatusId] [int] NOT NULL,
 CONSTRAINT [PK_RepairingRequest] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReparingComponent]    Script Date: 29.05.2024 12:40:21 ******/
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
/****** Object:  Table [dbo].[Report]    Script Date: 29.05.2024 12:40:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report](
	[Id] [int] NOT NULL,
	[HoursSpent] [int] NOT NULL,
	[Cost] [decimal](10, 2) NOT NULL,
	[RepairingDesc] [nvarchar](max) NULL,
 CONSTRAINT [PK_Report] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RequestStatus]    Script Date: 29.05.2024 12:40:21 ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 29.05.2024 12:40:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NULL,
	[Phone] [nvarchar](11) NULL,
	[Login] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[TypeId] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserType]    Script Date: 29.05.2024 12:40:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserType](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CarBrand] ([Id], [Name]) VALUES (1, N'Hyundai')
INSERT [dbo].[CarBrand] ([Id], [Name]) VALUES (2, N'Nissan')
INSERT [dbo].[CarBrand] ([Id], [Name]) VALUES (3, N'Toyota')
INSERT [dbo].[CarBrand] ([Id], [Name]) VALUES (4, N'Citroen')
INSERT [dbo].[CarBrand] ([Id], [Name]) VALUES (5, N'УАЗ')
GO
INSERT [dbo].[CarModel] ([Id], [BrandId], [Name], [TypeId]) VALUES (1, 1, N'Avante (CN7)', 1)
INSERT [dbo].[CarModel] ([Id], [BrandId], [Name], [TypeId]) VALUES (2, 2, N'180SX', 1)
INSERT [dbo].[CarModel] ([Id], [BrandId], [Name], [TypeId]) VALUES (3, 3, N'2000GT', 1)
INSERT [dbo].[CarModel] ([Id], [BrandId], [Name], [TypeId]) VALUES (4, 4, N'Berlingo (B9)', 2)
INSERT [dbo].[CarModel] ([Id], [BrandId], [Name], [TypeId]) VALUES (5, 5, N'2360', 2)
GO
INSERT [dbo].[CarType] ([Id], [Name]) VALUES (1, N'Легковая')
INSERT [dbo].[CarType] ([Id], [Name]) VALUES (2, N'Грузовая')
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([Id], [Message], [MasterId], [RequestId]) VALUES (1, N'Очень странно.', 2, 1)
INSERT [dbo].[Comment] ([Id], [Message], [MasterId], [RequestId]) VALUES (2, N'Будем разбираться!', 3, 2)
INSERT [dbo].[Comment] ([Id], [Message], [MasterId], [RequestId]) VALUES (3, N'Будем разбираться!', 3, 3)
SET IDENTITY_INSERT [dbo].[Comment] OFF
GO
INSERT [dbo].[Priority] ([Id], [Name]) VALUES (1, N'Низкий')
INSERT [dbo].[Priority] ([Id], [Name]) VALUES (2, N'Средний')
INSERT [dbo].[Priority] ([Id], [Name]) VALUES (3, N'Высокий')
GO
SET IDENTITY_INSERT [dbo].[RepairingRequest] ON 

INSERT [dbo].[RepairingRequest] ([Id], [CreationDate], [StartDate], [CompleteDate], [CarModelId], [ProblemDesc], [PriorityId], [ClientId], [MasterId], [StatusId]) VALUES (1, CAST(N'2023-06-06T00:00:00.000' AS DateTime), CAST(N'2023-06-06T00:00:00.000' AS DateTime), NULL, 1, N'Отказали тормоза.', 2, 7, 2, 1)
INSERT [dbo].[RepairingRequest] ([Id], [CreationDate], [StartDate], [CompleteDate], [CarModelId], [ProblemDesc], [PriorityId], [ClientId], [MasterId], [StatusId]) VALUES (2, CAST(N'2023-05-05T00:00:00.000' AS DateTime), CAST(N'2023-05-05T00:00:00.000' AS DateTime), NULL, 2, N'Отказали тормоза.', 2, 8, 3, 1)
INSERT [dbo].[RepairingRequest] ([Id], [CreationDate], [StartDate], [CompleteDate], [CarModelId], [ProblemDesc], [PriorityId], [ClientId], [MasterId], [StatusId]) VALUES (3, CAST(N'2022-07-07T00:00:00.000' AS DateTime), CAST(N'2022-07-07T00:00:00.000' AS DateTime), CAST(N'2023-01-01T00:00:00.000' AS DateTime), 3, N'В салоне пахнет бензином.', 2, 9, 3, 2)
INSERT [dbo].[RepairingRequest] ([Id], [CreationDate], [StartDate], [CompleteDate], [CarModelId], [ProblemDesc], [PriorityId], [ClientId], [MasterId], [StatusId]) VALUES (4, CAST(N'2023-08-02T00:00:00.000' AS DateTime), CAST(N'2023-08-02T00:00:00.000' AS DateTime), NULL, 4, N'Руль плохо крутится.', 2, 8, NULL, 3)
INSERT [dbo].[RepairingRequest] ([Id], [CreationDate], [StartDate], [CompleteDate], [CarModelId], [ProblemDesc], [PriorityId], [ClientId], [MasterId], [StatusId]) VALUES (5, CAST(N'2023-08-02T00:00:00.000' AS DateTime), CAST(N'2023-08-02T00:00:00.000' AS DateTime), NULL, 5, N'Руль плохо крутится.', 2, 9, NULL, 3)
SET IDENTITY_INSERT [dbo].[RepairingRequest] OFF
GO
INSERT [dbo].[RequestStatus] ([Id], [Name]) VALUES (1, N'В процессе ремонта')
INSERT [dbo].[RequestStatus] ([Id], [Name]) VALUES (2, N'Готова к выдаче')
INSERT [dbo].[RequestStatus] ([Id], [Name]) VALUES (3, N'Новая заявка')
INSERT [dbo].[RequestStatus] ([Id], [Name]) VALUES (4, N'Ожидание автозапчастей')
INSERT [dbo].[RequestStatus] ([Id], [Name]) VALUES (5, N'Завершена')
GO
INSERT [dbo].[User] ([Id], [Surname], [Name], [Patronymic], [Phone], [Login], [Password], [TypeId]) VALUES (1, N'Белов', N'Александр', N'Давидович', N'89210563128', N'login1', N'pass1', 1)
INSERT [dbo].[User] ([Id], [Surname], [Name], [Patronymic], [Phone], [Login], [Password], [TypeId]) VALUES (2, N'Харитонова', N'Мария', N'Павловна', N'89535078985', N'login2', N'pass2', 2)
INSERT [dbo].[User] ([Id], [Surname], [Name], [Patronymic], [Phone], [Login], [Password], [TypeId]) VALUES (3, N'Марков', N'Давид', N'Иванович', N'89210673849', N'login3', N'pass3', 2)
INSERT [dbo].[User] ([Id], [Surname], [Name], [Patronymic], [Phone], [Login], [Password], [TypeId]) VALUES (4, N'Громова', N'Анна', N'Семёновна', N'89990563748', N'login4', N'pass4', 3)
INSERT [dbo].[User] ([Id], [Surname], [Name], [Patronymic], [Phone], [Login], [Password], [TypeId]) VALUES (5, N'Карташова', N'Мария', N'Данииловна', N'89994563847', N'login5', N'pass5', 3)
INSERT [dbo].[User] ([Id], [Surname], [Name], [Patronymic], [Phone], [Login], [Password], [TypeId]) VALUES (6, N'Касаткин', N'Егор', N'Львович', N'89219567849', N'login11', N'pass11', 4)
INSERT [dbo].[User] ([Id], [Surname], [Name], [Patronymic], [Phone], [Login], [Password], [TypeId]) VALUES (7, N'Ильина', N'Тамара', N'Даниловна', N'89219567841', N'login12', N'pass12', 4)
INSERT [dbo].[User] ([Id], [Surname], [Name], [Patronymic], [Phone], [Login], [Password], [TypeId]) VALUES (8, N'Елисеева', N'Юлиана', N'Алексеевна', N'89219567842', N'login13', N'pass13', 4)
INSERT [dbo].[User] ([Id], [Surname], [Name], [Patronymic], [Phone], [Login], [Password], [TypeId]) VALUES (9, N'Никифорова', N'Алиса', N'Тимофеевна', N'89219567843', N'login14', N'pass14', 4)
INSERT [dbo].[User] ([Id], [Surname], [Name], [Patronymic], [Phone], [Login], [Password], [TypeId]) VALUES (10, N'Васильев', N'Али', N'Евгеньевич', N'89219567844', N'login15', N'pass15', 2)
GO
INSERT [dbo].[UserType] ([Id], [Name]) VALUES (1, N'Менеджер')
INSERT [dbo].[UserType] ([Id], [Name]) VALUES (2, N'Автомеханик')
INSERT [dbo].[UserType] ([Id], [Name]) VALUES (3, N'Оператор')
INSERT [dbo].[UserType] ([Id], [Name]) VALUES (4, N'Заказчик')
GO
ALTER TABLE [dbo].[CarModel]  WITH CHECK ADD  CONSTRAINT [FK_CarModel_CarBrand] FOREIGN KEY([BrandId])
REFERENCES [dbo].[CarBrand] ([Id])
GO
ALTER TABLE [dbo].[CarModel] CHECK CONSTRAINT [FK_CarModel_CarBrand]
GO
ALTER TABLE [dbo].[CarModel]  WITH CHECK ADD  CONSTRAINT [FK_CarModel_CarType] FOREIGN KEY([TypeId])
REFERENCES [dbo].[CarType] ([Id])
GO
ALTER TABLE [dbo].[CarModel] CHECK CONSTRAINT [FK_CarModel_CarType]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_RepairingRequest] FOREIGN KEY([RequestId])
REFERENCES [dbo].[RepairingRequest] ([Id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_RepairingRequest]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_User] FOREIGN KEY([MasterId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_User]
GO
ALTER TABLE [dbo].[RepairingRequest]  WITH CHECK ADD  CONSTRAINT [FK_RepairingRequest_CarModel] FOREIGN KEY([CarModelId])
REFERENCES [dbo].[CarModel] ([Id])
GO
ALTER TABLE [dbo].[RepairingRequest] CHECK CONSTRAINT [FK_RepairingRequest_CarModel]
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
ALTER TABLE [dbo].[RepairingRequest]  WITH CHECK ADD  CONSTRAINT [FK_RepairingRequest_User] FOREIGN KEY([ClientId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[RepairingRequest] CHECK CONSTRAINT [FK_RepairingRequest_User]
GO
ALTER TABLE [dbo].[RepairingRequest]  WITH CHECK ADD  CONSTRAINT [FK_RepairingRequest_User1] FOREIGN KEY([MasterId])
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
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([TypeId])
REFERENCES [dbo].[UserType] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [AutoTrans] SET  READ_WRITE 
GO
