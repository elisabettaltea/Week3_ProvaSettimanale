USE [master]
GO
/****** Object:  Database [NegozioDischi]    Script Date: 16/07/2021 14:59:10 ******/
CREATE DATABASE [NegozioDischi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NegozioDischi', FILENAME = N'C:\Users\Betta\NegozioDischi.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NegozioDischi_log', FILENAME = N'C:\Users\Betta\NegozioDischi_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [NegozioDischi] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NegozioDischi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NegozioDischi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NegozioDischi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NegozioDischi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NegozioDischi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NegozioDischi] SET ARITHABORT OFF 
GO
ALTER DATABASE [NegozioDischi] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [NegozioDischi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NegozioDischi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NegozioDischi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NegozioDischi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NegozioDischi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NegozioDischi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NegozioDischi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NegozioDischi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NegozioDischi] SET  ENABLE_BROKER 
GO
ALTER DATABASE [NegozioDischi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NegozioDischi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NegozioDischi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NegozioDischi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NegozioDischi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NegozioDischi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NegozioDischi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NegozioDischi] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [NegozioDischi] SET  MULTI_USER 
GO
ALTER DATABASE [NegozioDischi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NegozioDischi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NegozioDischi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NegozioDischi] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NegozioDischi] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [NegozioDischi] SET QUERY_STORE = OFF
GO
USE [NegozioDischi]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [NegozioDischi]
GO
/****** Object:  Table [dbo].[Brano]    Script Date: 16/07/2021 14:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brano](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Titolo] [nvarchar](50) NULL,
	[Durata] [int] NULL,
 CONSTRAINT [PK_Brano] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Band]    Script Date: 16/07/2021 14:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Band](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](50) NULL,
	[NumeroComponenti] [int] NULL,
 CONSTRAINT [PK_Band] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Album]    Script Date: 16/07/2021 14:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Album](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TitoloAlbum] [nvarchar](50) NULL,
	[AnnoUscita] [int] NULL,
	[CasaDiscografica] [nvarchar](50) NULL,
	[Genere] [nvarchar](50) NULL,
	[Supporto] [nvarchar](50) NULL,
	[BandID] [int] NULL,
 CONSTRAINT [PK_Album] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [albumUnico] UNIQUE NONCLUSTERED 
(
	[TitoloAlbum] ASC,
	[AnnoUscita] ASC,
	[CasaDiscografica] ASC,
	[Genere] ASC,
	[Supporto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BraniAlbum]    Script Date: 16/07/2021 14:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BraniAlbum](
	[BranoID] [int] NOT NULL,
	[AlbumID] [int] NOT NULL,
 CONSTRAINT [PK_BraniAlbum] PRIMARY KEY CLUSTERED 
(
	[BranoID] ASC,
	[AlbumID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ContenutoAlbum]    Script Date: 16/07/2021 14:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Creare una view che mostri i dati completi dell’album, della band e dei brani contenuti in esso.
CREATE VIEW [dbo].[ContenutoAlbum] AS
SELECT a.TitoloAlbum
       , a.AnnoUscita
	   , a.CasaDiscografica
	   , a.Genere
	   , a.Supporto
	   , bb.Nome as NomeArtista
	   , bb.NumeroComponenti
	   , b.Titolo as Canzoni
	   , b.Durata as DurataCanzone
FROM Brano b
INNER JOIN BraniAlbum ba
ON b.ID=ba.BranoID
   INNER JOIN Album a
   ON ba.AlbumID=a.ID
      INNER JOIN Band bb
	  ON a.BandID=bb.ID
--WHERE a.TitoloAlbum='titoloAlbumDiCuiVogliamoCercareTuttiIDati
GO
/****** Object:  UserDefinedFunction [dbo].[NumeroAlbumPerGenere]    Script Date: 16/07/2021 14:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[NumeroAlbumPerGenere] 
(
	--@genere nvarchar(50)
)
RETURNS TABLE
AS
	RETURN (SELECT Genere, COUNT(*) AS [Numero Album per Genere]
            FROM Album 
            GROUP BY Genere)

GO
/****** Object:  UserDefinedFunction [dbo].[ufnNumeroAlbumPerGenere]    Script Date: 16/07/2021 14:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[ufnNumeroAlbumPerGenere] 
(
	@genere nvarchar(50)
)
RETURNS TABLE 
AS
	RETURN (SELECT Genere, COUNT(*) AS [Numero Album per Genere]
            FROM Album 
            WHERE Genere=@genere 
			GROUP BY Genere)

GO
ALTER TABLE [dbo].[Album]  WITH CHECK ADD  CONSTRAINT [FK_Album_Band] FOREIGN KEY([BandID])
REFERENCES [dbo].[Band] ([ID])
GO
ALTER TABLE [dbo].[Album] CHECK CONSTRAINT [FK_Album_Band]
GO
ALTER TABLE [dbo].[BraniAlbum]  WITH CHECK ADD  CONSTRAINT [FK_BraniAlbum_Album] FOREIGN KEY([AlbumID])
REFERENCES [dbo].[Album] ([ID])
GO
ALTER TABLE [dbo].[BraniAlbum] CHECK CONSTRAINT [FK_BraniAlbum_Album]
GO
ALTER TABLE [dbo].[BraniAlbum]  WITH CHECK ADD  CONSTRAINT [FK_BraniAlbum_Brano] FOREIGN KEY([BranoID])
REFERENCES [dbo].[Brano] ([ID])
GO
ALTER TABLE [dbo].[BraniAlbum] CHECK CONSTRAINT [FK_BraniAlbum_Brano]
GO
ALTER TABLE [dbo].[Album]  WITH CHECK ADD CHECK  (([Genere]='Metal' OR [Genere]='Rock' OR [Genere]='Pop' OR [Genere]='Jazz' OR [Genere]='Classico'))
GO
ALTER TABLE [dbo].[Album]  WITH CHECK ADD CHECK  (([Supporto]='Streaming' OR [Supporto]='Vinile' OR [Supporto]='CD'))
GO
/****** Object:  StoredProcedure [dbo].[ListaAlbumPerBand]    Script Date: 16/07/2021 14:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ListaAlbumPerBand]
	@nome nvarchar(50)
AS
BEGIN

	SET NOCOUNT ON;

    SELECT a.TitoloAlbum
    FROM Album a
    INNER JOIN Band b
    ON a.BandID=b.ID
    WHERE b.Nome=@nome

END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -769
         Left = 0
      End
      Begin Tables = 
         Begin Table = "b"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 148
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ba"
            Begin Extent = 
               Top = 154
               Left = 48
               Bottom = 273
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "a"
            Begin Extent = 
               Top = 273
               Left = 48
               Bottom = 436
               Right = 257
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "bb"
            Begin Extent = 
               Top = 441
               Left = 48
               Bottom = 582
               Right = 279
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ContenutoAlbum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ContenutoAlbum'
GO
USE [master]
GO
ALTER DATABASE [NegozioDischi] SET  READ_WRITE 
GO
