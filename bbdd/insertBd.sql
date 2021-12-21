-- Meter minijuegos
INSERT INTO Minijuego (nombre, ruta, portada) 
VALUES
('Los multiplos', 'ruta1','portada1'),
('Tabla periodica', 'ruta2','portada2'),
('Reciclaje', 'ruta3','portada3'),
('Mekatrhon3000', 'ruta4','portada4'),
('Dora La Programadora', 'ruta5','portada5'),
('El cascanueces', 'ruta6','portada6'),
('Caperucita y la tabla periodica', 'ruta7','portada7');

-- Meter Partida
INSERT INTO Partida (idMinijuego, nick, puntuacion) 
VALUES
(1, 'tumorenito',100),
(1, 'ManuRelajao',250),
(2, 'DaniAngel',120),
(2, 'Richard',1),
(5, 'Ale66',2),
(6, 'AbelR',230),
(4, 'ruas3',240),
(5, 'Isa66',5),
(6, 'JuanR',4),
(4, 'rudss3',300);

-- Consultas utiles

-- Contar partidas que esten
SELECT COUNT(*) AS numPartidas FROM partida WHERE idMinijuego = 1 ;

--Crear partida
INSERT INTO Partida (idMinijuego, nick, puntuacion) VALUES (1, 'msg8',10);

--Puntos minimos de las partidas
SELECT MIN(puntuacion) as puntos FROM partida WHERE idMinijuego = 1 

--Actualizar las partidas si solo se modifica un campo aunque este el valor repetido
UPDATE partida 
SET nick='nick1', puntuacion=10, fechaHora=NOW() 
WHERE idPartida = (SELECT idPartida 
                    FROM partida 
                    WHERE idMinijuego = 1 AND puntuacion = (SELECT MIN(puntuacion) 
                                                            FROM partida 
                                                            WHERE idMinijuego = 1) 
                    LIMIT 1);

--Actualizar las partidas, si tienes valores igual al del ranking lo añades, si hay varios iguales y hay uno mayor a meter elimina todo los de valor menor
-- Si ya hay 10 filas y hay otra igual o mayor se eliminara a todos los que tienen en el ranking elnumero menor y añade al ranking la nueva puntuacion
-- asi podra probarse lo de ver si tiene menos de 10 filas o se actualiza el ranking
DELETE FROM partida WHERE  puntuacion = (SELECT MIN(puntuacion) 
                                                            FROM partida 
                                                            WHERE idMinijuego = 1);

INSERT INTO Partida (idMinijuego, nick, puntuacion) VALUES (1, 'nick', 10); 
