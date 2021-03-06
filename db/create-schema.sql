
CREATE LOGIN DcsApp 
    WITH PASSWORD = 'DCSAppPassword';
GO

-- Creates a database user for the login created above.
CREATE USER DcsApp FOR LOGIN DcsApp;
GO

ALTER ROLE [db_datareader] ADD MEMBER [DcsApp]
ALTER ROLE [db_datawriter] ADD MEMBER [DcsApp]
GO




/****** Object:  Table [dbo].[BusSubscription]    Script Date: 3/29/2015 8:57:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusSubscription](
	[message_type] [nvarchar](200) NOT NULL,
	[endpoint] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_BusSubscription] PRIMARY KEY CLUSTERED 
(
	[message_type] ASC,
	[endpoint] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BusTransport]    Script Date: 3/29/2015 8:57:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BusTransport](
	[recipient] [nvarchar](200) NOT NULL,
	[seq] [bigint] IDENTITY(1,1) NOT NULL,
	[priority] [tinyint] NOT NULL,
	[label] [nvarchar](max) NOT NULL,
	[headers] [nvarchar](max) NOT NULL,
	[body] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_BusTransport] PRIMARY KEY CLUSTERED 
(
	[recipient] ASC,
	[priority] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Commit]    Script Date: 3/29/2015 8:57:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Commit](
	[Id] [varchar](40) NOT NULL,
	[CommittedAt] [datetime] NOT NULL,
	[UserId] [uniqueidentifier] NULL,
	[Username] [varchar](100) NOT NULL,
	[CommitMessage] [varchar](500) NULL,
	[RepositoryId] [uniqueidentifier] NULL,
	[RepositoryName] [varchar](200) NOT NULL,
	[Challenge] [varchar](100) NOT NULL,
	[CurrentStageNumber] [int] NULL,
	[ResultsUpdatedAt] [datetime] NULL,
	[Outcome] [varchar](50) NULL,
	[OutcomeDetail] [varchar](1000) NULL,
	[BuildLog] [varchar](max) NULL,
	[TestOutputFormat] [varchar](10) NOT NULL,
	[TestOutput] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 3/29/2015 8:57:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Contact](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](500) NOT NULL,
	[Created] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EventLog]    Script Date: 3/29/2015 8:57:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EventLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EventDate] [datetime] NOT NULL,
	[Thread] [varchar](255) NOT NULL,
	[Level] [varchar](50) NOT NULL,
	[Logger] [varchar](255) NOT NULL,
	[Message] [varchar](max) NOT NULL,
	[Exception] [varchar](max) NULL,
 CONSTRAINT [PK_EventLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Repository]    Script Date: 3/29/2015 8:57:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Repository](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [varchar](200) NULL,
	[Challenge] [varchar](100) NULL,
	[LockedAt] [datetime] NULL,
	[UserId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 3/29/2015 8:57:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[Id] [uniqueidentifier] NOT NULL,
	[Username] [varchar](100) NOT NULL,
	[Email] [varchar](500) NOT NULL,
	[Password] [varchar](200) NOT NULL,
	[IsTestUser] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserChallenge]    Script Date: 3/29/2015 8:57:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserChallenge](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Name] [varchar](100) NULL,
	[StageNumber] [int] NOT NULL,
	[RepositoryId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Commit]  WITH CHECK ADD  CONSTRAINT [FK_Commit_Repository_RepositoryId] FOREIGN KEY([RepositoryId])
REFERENCES [dbo].[Repository] ([Id])
GO
ALTER TABLE [dbo].[Commit] CHECK CONSTRAINT [FK_Commit_Repository_RepositoryId]
GO
ALTER TABLE [dbo].[Commit]  WITH CHECK ADD  CONSTRAINT [FK_Commit_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Commit] CHECK CONSTRAINT [FK_Commit_User_UserId]
GO
ALTER TABLE [dbo].[Repository]  WITH CHECK ADD  CONSTRAINT [FK_Repository_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Repository] CHECK CONSTRAINT [FK_Repository_User_UserId]
GO
ALTER TABLE [dbo].[UserChallenge]  WITH CHECK ADD  CONSTRAINT [FK_UserChallenge_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[UserChallenge] CHECK CONSTRAINT [FK_UserChallenge_User_UserId]
GO

