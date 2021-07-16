CREATE DATABASE NegozioDischi

CREATE TABLE Brano(
ID int NOT NULL IDENTITY(1,1),
Titolo nvarchar(50),
Durata int,
CONSTRAINT PK_Brano PRIMARY KEY (ID)
)

CREATE TABLE Band(
ID int NOT NULL IDENTITY(1,1),
Nome nvarchar(50),
NumeroComponenti int
CONSTRAINT PK_Band PRIMARY KEY (ID)
)

CREATE TABLE Album(
ID int NOT NULL IDENTITY(1,1),
TitoloAlbum nvarchar(50),
AnnoUscita int,
CasaDiscografica nvarchar(50),
Genere nvarchar(50) CHECK (Genere IN ('Classico', 'Jazz', 'Pop', 'Rock', 'Metal')),
Supporto nvarchar(50) CHECK (Supporto IN ('CD', 'Vinile', 'Streaming')),
BandID int,
CONSTRAINT PK_Album PRIMARY KEY (ID),
CONSTRAINT FK_Album_Band FOREIGN KEY (BandID) REFERENCES Band (ID),
CONSTRAINT albumUnico UNIQUE (TitoloAlbum, AnnoUscita, CasaDiscografica, Genere, Supporto)
)

CREATE TABLE BraniAlbum(
BranoID int,
AlbumID int,
CONSTRAINT PK_BraniAlbum PRIMARY KEY (BranoID, AlbumID),
CONSTRAINT FK_BraniAlbum_Brano FOREIGN KEY (BranoID) REFERENCES Brano (ID),
CONSTRAINT FK_BraniAlbum_Album FOREIGN KEY (AlbumID) REFERENCES Album (ID)
)
