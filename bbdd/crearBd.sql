DROP DATABASE IF EXISTS Minijuegos_Invitados;
CREATE DATABASE IF NOT EXISTS Minijuegos_Invitados DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE Minijuegos_Invitados;

-- Tabla Minijuego
CREATE TABLE  Minijuego
(
    idMinijuego tinyint UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre varchar(60) NOT NULL,
    ruta varchar (240) NOT NULL,
    portada varchar (240) NOT NULL,
    fechaHora datetime  NOT NULL default NOW()
);
-- Tabla Partida
CREATE TABLE  Partida
(
    idPartida int UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    idMinijuego tinyint UNSIGNED NOT NULL,
    nick  char(30) NOT NULL,
    puntuacion smallint UNSIGNED NOT NULL,
    fechaHora datetime  NOT NULL default NOW(),
    CONSTRAINT FK_idMinijuego_Partida FOREIGN KEY (idMinijuego) REFERENCES Minijuego(idMinijuego) ON DELETE CASCADE
);
