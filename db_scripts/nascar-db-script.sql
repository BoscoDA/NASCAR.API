/****** Object:  Database [NASCAR]    Script Date: 5/9/2024 10:23:52 PM ******/
CREATE DATABASE [NASCAR]  (EDITION = 'GeneralPurpose', SERVICE_OBJECTIVE = 'GP_S_Gen5_1', MAXSIZE = 32 GB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS, LEDGER = OFF;
GO
ALTER DATABASE [NASCAR] SET COMPATIBILITY_LEVEL = 150
GO
ALTER DATABASE [NASCAR] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NASCAR] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NASCAR] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NASCAR] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NASCAR] SET ARITHABORT OFF 
GO
ALTER DATABASE [NASCAR] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NASCAR] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NASCAR] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NASCAR] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NASCAR] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NASCAR] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NASCAR] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NASCAR] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NASCAR] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [NASCAR] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NASCAR] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [NASCAR] SET  MULTI_USER 
GO
ALTER DATABASE [NASCAR] SET ENCRYPTION ON
GO
ALTER DATABASE [NASCAR] SET QUERY_STORE = ON
GO
ALTER DATABASE [NASCAR] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 100, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/*** The scripts of database scoped configurations in Azure should be executed inside the target database connection. ***/
GO
-- ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 8;
GO
/****** Object:  Table [dbo].[Leaderboard]    Script Date: 5/9/2024 10:23:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Leaderboard](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Score] [int] NOT NULL,
 CONSTRAINT [PK_Leaderboard] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 5/9/2024 10:23:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[TypeID] [int] NOT NULL,
	[Avatar] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserType]    Script Date: 5/9/2024 10:23:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](6) NOT NULL,
 CONSTRAINT [PK_UserType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Leaderboard] ON 

INSERT [dbo].[Leaderboard] ([ID], [UserID], [Score]) VALUES (1, 37, 310)
INSERT [dbo].[Leaderboard] ([ID], [UserID], [Score]) VALUES (2, 38, 300)
INSERT [dbo].[Leaderboard] ([ID], [UserID], [Score]) VALUES (3, 39, 290)
INSERT [dbo].[Leaderboard] ([ID], [UserID], [Score]) VALUES (4, 40, 280)
INSERT [dbo].[Leaderboard] ([ID], [UserID], [Score]) VALUES (5, 41, 240)
INSERT [dbo].[Leaderboard] ([ID], [UserID], [Score]) VALUES (6, 42, 200)
SET IDENTITY_INSERT [dbo].[Leaderboard] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [Username], [TypeID], [Avatar]) VALUES (1, N'Daniel Suarez', 2, 20)
INSERT [dbo].[User] ([ID], [Username], [TypeID], [Avatar]) VALUES (2, N'Bubba Wallace', 2, 21)
INSERT [dbo].[User] ([ID], [Username], [TypeID], [Avatar]) VALUES (3, N'Ryan Blaney', 2, 22)
INSERT [dbo].[User] ([ID], [Username], [TypeID], [Avatar]) VALUES (4, N'Corey Lajoie', 2, 23)
INSERT [dbo].[User] ([ID], [Username], [TypeID], [Avatar]) VALUES (5, N'Tyler Reddick', 2, 24)
INSERT [dbo].[User] ([ID], [Username], [TypeID], [Avatar]) VALUES (6, N'Austin Cindric', 2, 25)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[UserType] ON 

INSERT [dbo].[UserType] ([ID], [Type]) VALUES (1, N'player')
INSERT [dbo].[UserType] ([ID], [Type]) VALUES (2, N'driver')
SET IDENTITY_INSERT [dbo].[UserType] OFF
GO
ALTER TABLE [dbo].[Leaderboard]  WITH CHECK ADD  CONSTRAINT [FK_Leaderboard_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Leaderboard] CHECK CONSTRAINT [FK_Leaderboard_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_UserType] FOREIGN KEY([TypeID])
REFERENCES [dbo].[UserType] ([ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_UserType]
GO
/****** Object:  StoredProcedure [dbo].[Leaderboard_GetByUserID]    Script Date: 5/9/2024 10:23:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Leaderboard_GetByUserID] 
	-- Add the parameters for the stored procedure here
	@UserID int
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Leaderboard
	WHERE UserID = @UserID
END
GO
/****** Object:  StoredProcedure [dbo].[Leaderboard_GetPaged]    Script Date: 5/9/2024 10:23:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Leaderboard_GetPaged]
	@rowOffset int = 0,
	@fetchNextRows int = 5
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
	L.ID,
	L.Score,
	U.Username,
	U.Avatar,
	UT.Type

	FROM Leaderboard as L
	INNER JOIN [dbo].[User] as U ON L.UserID = U.ID
	INNER JOIN [dbo].[UserType] as UT ON U.TypeID = UT.ID
	ORDER BY Score asc
	OFFSET @rowOffset ROWS FETCH NEXT @fetchNextRows ROWS ONLY;
END
GO
/****** Object:  StoredProcedure [dbo].[Leaderboard_Insert]    Script Date: 5/9/2024 10:23:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Leaderboard_Insert] 
	@UserID int,
	@Score int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF EXISTS(SELECT 1 FROM [dbo].[Leaderboard] as l WHERE l.UserID = @UserID) AND NOT ((SELECT Score FROM [dbo].[Leaderboard] WHERE UserID = @UserID) < @Score)
	BEGIN
		UPDATE [dbo].[Leaderboard]
		SET Score = @Score
		WHERE UserID = @UserID;
	END
	ELSE IF NOT EXISTS(SELECT 1 FROM [dbo].[Leaderboard] as l WHERE l.UserID = @UserID)
	BEGIN
		INSERT INTO [dbo].[Leaderboard](UserID, Score)
		VALUES(@UserID, @Score);
	END
END
GO
/****** Object:  StoredProcedure [dbo].[Leaderboard_UpdateScoreByUser]    Script Date: 5/9/2024 10:23:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Leaderboard_UpdateScoreByUser] 
	-- Add the parameters for the stored procedure here
	@UserID int,
	@Score int
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Leaderboard
	Set Score = @Score
	WHERE UserID = @UserID;
END
GO
/****** Object:  StoredProcedure [dbo].[User_GetById]    Script Date: 5/9/2024 10:23:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[User_GetById]
	@UserID int
AS
BEGIN

	SET NOCOUNT ON;

   SELECT
	U.[ID],
	U.[Username],
	UT.[Type],
	U.[Avatar]
	FROM [dbo].[User] as U
	INNER JOIN [dbo].[UserType] UT ON U.TypeID = UT.ID
	WHERE U.[ID] = @UserID;

END
GO
/****** Object:  StoredProcedure [dbo].[User_GetByUsername]    Script Date: 5/9/2024 10:23:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[User_GetByUsername]
	@Username nvarchar(50)
AS
BEGIN

	SET NOCOUNT ON;

   SELECT
	U.[ID],
	U.[Username],
	UT.[Type],
	U.[Avatar]
	FROM [dbo].[User] as U
	INNER JOIN [dbo].[UserType] UT ON U.TypeID = UT.ID
	WHERE U.[Username] = @Username;
END
GO
/****** Object:  StoredProcedure [dbo].[User_Insert]    Script Date: 5/9/2024 10:23:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nick Eisner
-- Create date: 4/20/24
-- Description:	Insert record into Users table
-- =============================================
CREATE PROCEDURE [dbo].[User_Insert]
	-- Add the parameters for the stored procedure here
	@Username nvarchar(50),
	@TypeID int,
	@Avatar int,
	@ID int OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	INSERT INTO [dbo].[User] (
		[Username],
		[TypeID],
		[Avatar])
	VALUES(
		@Username,
		@TypeID,
		@Avatar
		)
	SET @ID = SCOPE_IDENTITY();
END
GO
ALTER DATABASE [NASCAR] SET  READ_WRITE 
GO
