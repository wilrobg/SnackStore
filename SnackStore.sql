USE [master]
GO
/****** Object:  Database [SnackStoreDB]    Script Date: 2/9/2019 17:51:01 ******/
CREATE DATABASE [SnackStoreDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SnackStoreDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\SnackStoreDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SnackStoreDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\SnackStoreDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [SnackStoreDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SnackStoreDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SnackStoreDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SnackStoreDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SnackStoreDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SnackStoreDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SnackStoreDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SnackStoreDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SnackStoreDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SnackStoreDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SnackStoreDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SnackStoreDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SnackStoreDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SnackStoreDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SnackStoreDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SnackStoreDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SnackStoreDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SnackStoreDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SnackStoreDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SnackStoreDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SnackStoreDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SnackStoreDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SnackStoreDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [SnackStoreDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SnackStoreDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SnackStoreDB] SET  MULTI_USER 
GO
ALTER DATABASE [SnackStoreDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SnackStoreDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SnackStoreDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SnackStoreDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SnackStoreDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SnackStoreDB] SET QUERY_STORE = OFF
GO
USE [SnackStoreDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2/9/2019 17:51:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 2/9/2019 17:51:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 2/9/2019 17:51:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 2/9/2019 17:51:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 2/9/2019 17:51:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 2/9/2019 17:51:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 2/9/2019 17:51:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 2/9/2019 17:51:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LikesTrack]    Script Date: 2/9/2019 17:51:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LikesTrack](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_LikesTrack] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PriceProductLog]    Script Date: 2/9/2019 17:51:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PriceProductLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[UserId] [nvarchar](450) NULL,
	[NewPrice] [money] NOT NULL,
	[OldPrice] [money] NOT NULL,
	[UpdateDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_PriceProductLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 2/9/2019 17:51:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Price] [money] NOT NULL,
	[Stock] [int] NOT NULL,
	[Likes] [int] NOT NULL,
	[Availability] [bit] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseHistory]    Script Date: 2/9/2019 17:51:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [int] NOT NULL,
	[PurchaseTotal] [money] NOT NULL,
	[PurchasePrice] [money] NOT NULL,
	[PurchaseDate] [datetime2](7) NOT NULL,
	[ProductId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_PurchaseHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190830160841_SnackStoreDB-v1', N'2.2.6-servicing-10079')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190830204042_SnackStoreDB-v2', N'2.2.6-servicing-10079')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190831153828_SnackStoreDB-v3', N'2.2.6-servicing-10079')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190902000906_SnackStoreDB-v4', N'2.2.6-servicing-10079')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190902194458_SnackStoreDB-v5', N'2.2.6-servicing-10079')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'14a61d67-a7e8-405a-a703-2add1112e2e2', N'Admin', N'ADMIN', N'8e7b8e7d-4184-44a2-a66f-094e0c454e09')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'256f76d1-415f-4429-963d-eb28260ae017', N'Costumer', N'COSTUMER', N'715239ed-2026-4214-8db5-955a7a806990')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'4ed7c967-31a7-400b-bd67-a985ac379412', N'14a61d67-a7e8-405a-a703-2add1112e2e2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'50ff7f7f-a2ba-4c2a-868f-23f34379c028', N'14a61d67-a7e8-405a-a703-2add1112e2e2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'7ba66768-8fb4-4b98-b396-b5afaf275280', N'14a61d67-a7e8-405a-a703-2add1112e2e2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'be369498-6e95-4281-94e4-5c2d03eababd', N'14a61d67-a7e8-405a-a703-2add1112e2e2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'4ed7c967-31a7-400b-bd67-a985ac379412', N'256f76d1-415f-4429-963d-eb28260ae017')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'50ff7f7f-a2ba-4c2a-868f-23f34379c028', N'256f76d1-415f-4429-963d-eb28260ae017')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'4ed7c967-31a7-400b-bd67-a985ac379412', N'costumer@gmail.com', N'COSTUMER@GMAIL.COM', N'costumer@gmail.com', N'COSTUMER@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEFJqfYnWbAsBq8DZlgjd8hP9NN+EsU2yRinUcXiWmgaI/JY8XgxSjjRIQ+KAh1DkqQ==', N'EHDKGFO4BDG7DIX7DMKSEDDO24W2GJNK', N'90fb9ff2-36d0-48c2-b844-8710834bd3c6', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'50ff7f7f-a2ba-4c2a-868f-23f34379c028', N'nelson@gmail.com', N'NELSON@GMAIL.COM', N'nelson@gmail.com', N'NELSON@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEDK6ZgfBot6R/I1DIn28Wt7gIGI5Uac7RxMdB3Pd3byWdMRaAh1gr8ExkJXkGlKe8A==', N'TPNZFPICPNLMHPL52AQ5M3A44BYO6EKN', N'fb13611e-f145-4d2a-97af-427a45c4b2de', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'7ba66768-8fb4-4b98-b396-b5afaf275280', N'admin@gmail.com', N'ADMIN@GMAIL.COM', N'admin@gmail.com', N'ADMIN@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEGFN2nibtiWOC9Fsyd7cHwRh1C0n/GatoRb5l7B2a4/lNaAv/cvcsZr9dVeD1KypPA==', N'GQRCU55QMSZ6KHUQTMK2ZOKZ44GAUVEJ', N'f3e62a88-df12-487a-a4b2-e361bcaf32d5', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'8897cb27-9956-44f1-a128-1194620f7e34', N'wilfredo@gmail.com', N'WILFREDO@GMAIL.COM', N'wilfredo@gmail.com', N'WILFREDO@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAECC1ybDBWjrxrzEdJqPVfBHdfQsHbBgHX6RAqUKFBfl9w7dmbp/t+g0QKC8bkNsQrA==', N'KLW2LDGOH7ANND7JWSTDPNC466A2UKJZ', N'2fea5dd9-8e7c-44fb-9102-bdecf8ad8c59', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'8e1c3d81-8014-4a17-b041-0631930563c4', N'diego@gmail.com', N'DIEGO@GMAIL.COM', N'diego@gmail.com', N'DIEGO@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEBwC1shVZ0jHzjIH5yRVvoZm46MISeA4f9PhgzhfzifuWLoLzdA/vC3/iFTBTEQYeQ==', N'47NNCBMTQK5P37XSLIUH5FKPCJLVRVKY', N'0ecaef08-9a81-4fc4-b202-392bdeb7143c', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'be369498-6e95-4281-94e4-5c2d03eababd', N'roxana@gmail.com', N'ROXANA@GMAIL.COM', N'roxana@gmail.com', N'ROXANA@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAENjItdR6DnYaZFpo7XqytsgkWBIOQD0enXsg02zn3fdWhEHfWFx4rFqQ/jg49GMZww==', N'F2WS42MNHEDXPAFDJRRGS4ZN3DKU5ETQ', N'11c98629-f3a6-4c9f-956b-1fca590c576c', NULL, 0, 0, NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[LikesTrack] ON 

INSERT [dbo].[LikesTrack] ([Id], [ProductId], [UserId]) VALUES (5, 5, N'8897cb27-9956-44f1-a128-1194620f7e34')
INSERT [dbo].[LikesTrack] ([Id], [ProductId], [UserId]) VALUES (6, 8, N'50ff7f7f-a2ba-4c2a-868f-23f34379c028')
INSERT [dbo].[LikesTrack] ([Id], [ProductId], [UserId]) VALUES (7, 10, N'50ff7f7f-a2ba-4c2a-868f-23f34379c028')
SET IDENTITY_INSERT [dbo].[LikesTrack] OFF
SET IDENTITY_INSERT [dbo].[PriceProductLog] ON 

INSERT [dbo].[PriceProductLog] ([Id], [ProductId], [UserId], [NewPrice], [OldPrice], [UpdateDate]) VALUES (5, 5, N'7ba66768-8fb4-4b98-b396-b5afaf275280', 11.0000, 0.5000, CAST(N'2019-09-02T14:18:06.4872885' AS DateTime2))
INSERT [dbo].[PriceProductLog] ([Id], [ProductId], [UserId], [NewPrice], [OldPrice], [UpdateDate]) VALUES (6, 4, N'50ff7f7f-a2ba-4c2a-868f-23f34379c028', 11.0000, 0.5000, CAST(N'2019-09-02T17:34:03.3323382' AS DateTime2))
SET IDENTITY_INSERT [dbo].[PriceProductLog] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Price], [Stock], [Likes], [Availability]) VALUES (4, N'Soda Lata', 11.0000, 20, 0, 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [Stock], [Likes], [Availability]) VALUES (5, N'Soda envase', 11.0000, 10, 1, 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [Stock], [Likes], [Availability]) VALUES (7, N'Palito', 0.5000, 10, 0, 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [Stock], [Likes], [Availability]) VALUES (8, N'Churrito Diana', 0.1500, 10, 1, 0)
INSERT [dbo].[Products] ([Id], [Name], [Price], [Stock], [Likes], [Availability]) VALUES (10, N'Fanta', 0.1500, 10, 1, 0)
INSERT [dbo].[Products] ([Id], [Name], [Price], [Stock], [Likes], [Availability]) VALUES (11, N'Sprite', 0.1500, 10, 0, 0)
INSERT [dbo].[Products] ([Id], [Name], [Price], [Stock], [Likes], [Availability]) VALUES (12, N'Pochicleta', 0.2500, 10, 0, 0)
INSERT [dbo].[Products] ([Id], [Name], [Price], [Stock], [Likes], [Availability]) VALUES (13, N'Frijoli', 0.2500, 10, 0, 0)
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[PurchaseHistory] ON 

INSERT [dbo].[PurchaseHistory] ([Id], [Quantity], [PurchaseTotal], [PurchasePrice], [PurchaseDate], [ProductId], [UserId]) VALUES (5, 1, 1.5000, 1.5000, CAST(N'2019-08-31T10:18:30.8465508' AS DateTime2), 6, N'8897cb27-9956-44f1-a128-1194620f7e34')
INSERT [dbo].[PurchaseHistory] ([Id], [Quantity], [PurchaseTotal], [PurchasePrice], [PurchaseDate], [ProductId], [UserId]) VALUES (6, 1, 11.0000, 11.0000, CAST(N'2019-09-02T14:28:17.7633684' AS DateTime2), 5, N'7ba66768-8fb4-4b98-b396-b5afaf275280')
SET IDENTITY_INSERT [dbo].[PurchaseHistory] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 2/9/2019 17:51:02 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 2/9/2019 17:51:02 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 2/9/2019 17:51:02 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 2/9/2019 17:51:02 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 2/9/2019 17:51:02 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 2/9/2019 17:51:02 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 2/9/2019 17:51:02 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_LikesTrack_ProductId]    Script Date: 2/9/2019 17:51:02 ******/
CREATE NONCLUSTERED INDEX [IX_LikesTrack_ProductId] ON [dbo].[LikesTrack]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_LikesTrack_UserId]    Script Date: 2/9/2019 17:51:02 ******/
CREATE NONCLUSTERED INDEX [IX_LikesTrack_UserId] ON [dbo].[LikesTrack]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PriceProductLog_ProductId]    Script Date: 2/9/2019 17:51:02 ******/
CREATE NONCLUSTERED INDEX [IX_PriceProductLog_ProductId] ON [dbo].[PriceProductLog]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_PriceProductLog_UserId]    Script Date: 2/9/2019 17:51:02 ******/
CREATE NONCLUSTERED INDEX [IX_PriceProductLog_UserId] ON [dbo].[PriceProductLog]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_PurchaseHistory_UserId]    Script Date: 2/9/2019 17:51:02 ******/
CREATE NONCLUSTERED INDEX [IX_PurchaseHistory_UserId] ON [dbo].[PurchaseHistory]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PriceProductLog] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [UpdateDate]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[LikesTrack]  WITH CHECK ADD  CONSTRAINT [FK_LikesTrack_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LikesTrack] CHECK CONSTRAINT [FK_LikesTrack_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[LikesTrack]  WITH CHECK ADD  CONSTRAINT [FK_LikesTrack_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LikesTrack] CHECK CONSTRAINT [FK_LikesTrack_Products_ProductId]
GO
ALTER TABLE [dbo].[PriceProductLog]  WITH CHECK ADD  CONSTRAINT [FK_PriceProductLog_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[PriceProductLog] CHECK CONSTRAINT [FK_PriceProductLog_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[PriceProductLog]  WITH CHECK ADD  CONSTRAINT [FK_PriceProductLog_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PriceProductLog] CHECK CONSTRAINT [FK_PriceProductLog_Products_ProductId]
GO
ALTER TABLE [dbo].[PurchaseHistory]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseHistory_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PurchaseHistory] CHECK CONSTRAINT [FK_PurchaseHistory_AspNetUsers_UserId]
GO
USE [master]
GO
ALTER DATABASE [SnackStoreDB] SET  READ_WRITE 
GO
