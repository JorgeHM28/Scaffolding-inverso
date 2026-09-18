USE HeroesDb;
GO
-- Restablece únicamente las tablas ausentes del modelo Database First.
IF OBJECT_ID(N'dbo.Heroes', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.Heroes (
        Id int IDENTITY(1,1) NOT NULL CONSTRAINT PK_Heroes PRIMARY KEY,
        Nombre nvarchar(100) NOT NULL,
        Ciudad nvarchar(100) NOT NULL,
        IdentidadSecreta nvarchar(100) NULL
    );
END;
IF OBJECT_ID(N'dbo.SuperPoderes', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.SuperPoderes (
        Id int IDENTITY(1,1) NOT NULL CONSTRAINT PK_SuperPoderes PRIMARY KEY,
        Nombre nvarchar(100) NOT NULL,
        Descripcion nvarchar(250) NULL,
        HeroeId int NOT NULL,
        CONSTRAINT FK_SuperPoderes_Heroes FOREIGN KEY (HeroeId)
            REFERENCES dbo.Heroes(Id) ON DELETE CASCADE
    );
    CREATE INDEX IX_SuperPoderes_HeroeId ON dbo.SuperPoderes(HeroeId);
END;
GO
