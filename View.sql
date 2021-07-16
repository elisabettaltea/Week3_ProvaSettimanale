--Creare una view che mostri i dati completi dell’album, della band e dei brani contenuti in esso.
ALTER VIEW ContenutoAlbum AS
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
--WHERE a.TitoloAlbum='titoloAlbumDiCuiVogliamoCercareTuttiIDati'