-- ================================================
-- Template generated from Template Explorer using:
-- Create Multi-Statement Function (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION ufnNumeroAlbumPerGenere 
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