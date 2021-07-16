--1)Scrivere una query che restituisca i titoli degli album di Franco Battiato
SELECT DISTINCT a.TitoloAlbum
FROM Album a
INNER JOIN Band b
ON a.BandID=b.ID
WHERE b.Nome='Franco Battiato'

--2)Selezionare tutti gli album editi dalla casa discografica nell’anno specificato
SELECT *
FROM Album
WHERE AnnoUscita=2000 AND CasaDiscografica='Sony' 

--3)Scrivere una query che restituisca tutti i titoli delle canzoni dei U2 appartenenti ad album pubblicati prima del 1990;
SELECT DISTINCT b.Titolo
FROM Brano b
INNER JOIN BraniAlbum ba
ON b.ID=ba.BranoID
   INNER JOIN Album a
   ON ba.AlbumID=a.ID
      INNER JOIN Band bb
	  ON a.BandID=bb.ID
WHERE bb.Nome='U2' AND a.AnnoUscita<1990

--4)Individuare tutti gli album in cui è contenuta la canzone “Imagine”;
SELECT a.*
FROM Album a 
INNER JOIN BraniAlbum ba
ON a.ID=ba.AlbumID
   INNER JOIN Brano b
   ON ba.BranoID=b.ID
WHERE b.Titolo='Imagine'

--5)Restituire il numero totale di canzoni eseguite dai Pooh;
SELECT COUNT(DISTINCT b.Titolo) AS [Numero Totale Canzoni Pooh] 
FROM Brano b
INNER JOIN BraniAlbum ba
ON b.ID=ba.BranoID
   INNER JOIN Album a
   ON ba.AlbumID=a.ID
      INNER JOIN Band bb
	  ON a.BandID=bb.ID
WHERE bb.Nome='Pooh'
GROUP BY bb.Nome

--6)Contare per ogni album, la somma dei secondi dei brani contenuti
SELECT a.TitoloAlbum, SUM(Durata) AS [Durata Totale in secondi] 
FROM Album a 
INNER JOIN BraniAlbum ba
ON a.ID=ba.AlbumID
   INNER JOIN Brano b
   ON ba.BranoID=b.ID
GROUP BY a.TitoloAlbum

--7)Una delle query (a scelta) deve essere realizzata come Stored Procedure con parametri.
--(ho realizzato la prima query come Stored Procedure in un altro script)

--8)Creare una view che mostri i dati completi dell’album, della band e dei brani contenuti in esso.
--(svolto in un altro script)

--9)Scrivere una funzione utente che calcoli per ogni genere musicale quanti album sono inseriti in catalogo.
--Realizzo una tabella con tutti i generi e il numero di album per genere
SELECT Genere, COUNT(*) AS [Numero Album per Genere]
FROM Album 
GROUP BY Genere
--Chiamo una funzione che per ogni genere che le passo mi restituisce il numero di album per quel genere
SELECT *
FROM dbo.ufnNumeroAlbumPerGenere('Rock')