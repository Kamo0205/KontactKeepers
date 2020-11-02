USE [Kontactkeeper]
GO
/****** Object:  Table [dbo].[tblAdmin]    Script Date: 31 Oct 2020 11:39:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAdmin](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FName] [nvarchar](50) NOT NULL,
	[LName] [nvarchar](50) NOT NULL,
	[UName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFBUser]    Script Date: 31 Oct 2020 11:39:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFBUser](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FBID] [nvarchar](50) NOT NULL,
	[FBName] [nvarchar](50) NOT NULL,
	[LastSeen] [datetime] NOT NULL,
 CONSTRAINT [PK_tblFBUser] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblAdmin] ON 

INSERT [dbo].[tblAdmin] ([ID], [FName], [LName], [UName], [Password]) VALUES (1, N'James', N'Ventura', N'james', N'009')
SET IDENTITY_INSERT [dbo].[tblAdmin] OFF
SET IDENTITY_INSERT [dbo].[tblFBUser] ON 

INSERT [dbo].[tblFBUser] ([ID], [FBID], [FBName], [LastSeen]) VALUES (3, N'100002231520176', N'Kobus Vreugdenburg', CAST(N'2020-09-09T20:03:04.000' AS DateTime))
INSERT [dbo].[tblFBUser] ([ID], [FBID], [FBName], [LastSeen]) VALUES (4, N'100001232954457', N'Cornie Vreugdenburg', CAST(N'2020-09-09T20:03:04.000' AS DateTime))
INSERT [dbo].[tblFBUser] ([ID], [FBID], [FBName], [LastSeen]) VALUES (5, N'100009183283779', N'Peter Vorster', CAST(N'2020-09-09T20:03:04.000' AS DateTime))
INSERT [dbo].[tblFBUser] ([ID], [FBID], [FBName], [LastSeen]) VALUES (6, N'100022739145064', N'Div Dup', CAST(N'2020-09-09T20:03:04.000' AS DateTime))
INSERT [dbo].[tblFBUser] ([ID], [FBID], [FBName], [LastSeen]) VALUES (34, N'100055394520141', N'Piet Pot', CAST(N'2020-09-09T20:31:07.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblFBUser] OFF
