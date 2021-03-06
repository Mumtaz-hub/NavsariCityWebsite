USE [Navsaricity]
GO
/****** Object:  Table [dbo].[Category_Master]    Script Date: 05/12/2018 13:31:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category_Master](
	[Category_Id] [int] IDENTITY(1,1) NOT NULL,
	[Category_Name] [varchar](50) NULL,
 CONSTRAINT [PK_Category_Master] PRIMARY KEY CLUSTERED 
(
	[Category_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Category_Master] ON
INSERT [dbo].[Category_Master] ([Category_Id], [Category_Name]) VALUES (1, N'BANK')
INSERT [dbo].[Category_Master] ([Category_Id], [Category_Name]) VALUES (2, N'SCHOOL')
INSERT [dbo].[Category_Master] ([Category_Id], [Category_Name]) VALUES (3, N'HOSPITAL')
INSERT [dbo].[Category_Master] ([Category_Id], [Category_Name]) VALUES (4, N'COLLEGE')
INSERT [dbo].[Category_Master] ([Category_Id], [Category_Name]) VALUES (5, N'FAMOUS PLACES')
INSERT [dbo].[Category_Master] ([Category_Id], [Category_Name]) VALUES (6, N'CLINIC')
SET IDENTITY_INSERT [dbo].[Category_Master] OFF
/****** Object:  Table [dbo].[User_Master]    Script Date: 05/12/2018 13:31:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User_Master](
	[User_Code] [int] IDENTITY(1,1) NOT NULL,
	[User_Name] [varchar](50) NULL,
	[User_Password] [varchar](50) NULL,
	[User_Email] [varchar](50) NULL,
	[User_Type] [varchar](1) NULL,
 CONSTRAINT [PK_User_Master] PRIMARY KEY CLUSTERED 
(
	[User_Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[User_Master] ON
INSERT [dbo].[User_Master] ([User_Code], [User_Name], [User_Password], [User_Email], [User_Type]) VALUES (1, N'Admin', N'123', N'admin@gmail.om', N'A')
INSERT [dbo].[User_Master] ([User_Code], [User_Name], [User_Password], [User_Email], [User_Type]) VALUES (2, N'User', N'123', N'user@gmail.com', N'U')
INSERT [dbo].[User_Master] ([User_Code], [User_Name], [User_Password], [User_Email], [User_Type]) VALUES (3, N'User2', N'123', N'User2@gmail.com', N'U')
INSERT [dbo].[User_Master] ([User_Code], [User_Name], [User_Password], [User_Email], [User_Type]) VALUES (4, N'User3', N'123', N'user3@gmail.com', N'U')
INSERT [dbo].[User_Master] ([User_Code], [User_Name], [User_Password], [User_Email], [User_Type]) VALUES (5, N'User3', N'123', N'user3@gmail.com', N'U')
SET IDENTITY_INSERT [dbo].[User_Master] OFF
/****** Object:  Table [dbo].[Place_Master]    Script Date: 05/12/2018 13:31:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Place_Master](
	[Place_Code] [int] IDENTITY(1,1) NOT NULL,
	[Place_Name] [varchar](50) NULL,
	[Place_Address] [varchar](100) NULL,
	[Place_Mobile] [varchar](50) NULL,
	[Category_Id] [int] NULL,
 CONSTRAINT [PK_Place_Master] PRIMARY KEY CLUSTERED 
(
	[Place_Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Place_Master] ON
INSERT [dbo].[Place_Master] ([Place_Code], [Place_Name], [Place_Address], [Place_Mobile], [Category_Id]) VALUES (3, N'ICICI', N'Lunsikui,Navsari', N'9724035505', 1)
INSERT [dbo].[Place_Master] ([Place_Code], [Place_Name], [Place_Address], [Place_Mobile], [Category_Id]) VALUES (4, N'Divine', N'Chhapra Road', N'9898123098', 2)
INSERT [dbo].[Place_Master] ([Place_Code], [Place_Name], [Place_Address], [Place_Mobile], [Category_Id]) VALUES (5, N'Navsari HighSchool', N'GEB', N'9724012309', 2)
INSERT [dbo].[Place_Master] ([Place_Code], [Place_Name], [Place_Address], [Place_Mobile], [Category_Id]) VALUES (6, N'Orange Hospital', N'Station Road', N'7788665544', 3)
INSERT [dbo].[Place_Master] ([Place_Code], [Place_Name], [Place_Address], [Place_Mobile], [Category_Id]) VALUES (7, N'S S Agrawal College', N'Gandevi Road', N'8877332211', 4)
INSERT [dbo].[Place_Master] ([Place_Code], [Place_Name], [Place_Address], [Place_Mobile], [Category_Id]) VALUES (8, N'Sayaji Library', N'New Depo Station', N'7766552211', 5)
INSERT [dbo].[Place_Master] ([Place_Code], [Place_Name], [Place_Address], [Place_Mobile], [Category_Id]) VALUES (9, N'Sanjiv Desai,Child Speialist', N'Station Road', N'02637554412', 6)
INSERT [dbo].[Place_Master] ([Place_Code], [Place_Name], [Place_Address], [Place_Mobile], [Category_Id]) VALUES (10, N'Ramaben Gynacologist', N'Kaharwaad', N'9898236789', 6)
SET IDENTITY_INSERT [dbo].[Place_Master] OFF
/****** Object:  ForeignKey [FK_Place_Master_Category_Master]    Script Date: 05/12/2018 13:31:27 ******/
ALTER TABLE [dbo].[Place_Master]  WITH CHECK ADD  CONSTRAINT [FK_Place_Master_Category_Master] FOREIGN KEY([Category_Id])
REFERENCES [dbo].[Category_Master] ([Category_Id])
GO
ALTER TABLE [dbo].[Place_Master] CHECK CONSTRAINT [FK_Place_Master_Category_Master]
GO
