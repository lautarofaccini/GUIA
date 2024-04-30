/* 
Jugadores(
    DNILocal: integer, 
    Nombre_Equipo: string, 
    id_resultado: integer, 
    DNIVisitante: integer, 
    NyA: string, 
    TotalFuera: integer, 
    TotalTarjetasAm: integer, 
    TotalTarjetasRo: integer, 
    TotalGoles: integer, 
    TotalAsistencias: integer, 
    Partidos_Jugados: integer, 
    TarjetasRojas: integer, 
    GolesJugador: integer, 
    TarjetasAmarillas: integer, 
    Asistencias: integer, 
    FueraDeJuegos: integer,
)
    CP: DNILocal
    CF: Nombre_Equipo -> Equipos
        DNIVisitante -> Jugadores(DNILocal)
        id_Resultado -> Resultado
    CNN: Nombre_Equipo, id_Resultado, DNIVisitante
    VU: DNIVisitante

Equipos(
    Nombre_Equipo: string,
    Partidos_empatados: integer, 
    partidos_ganados: integer, 
    partidos_perdidos: integer
)
    CP: Nombre_Equipo

Resultado(
    id_Resultado: integer, 
    GolesLocal: integer, 
    Visitante: integer
)
    CP: id_Resultado
*/
CREATE TABLE Jugadores(
    DNILocal INTEGER, 
    Nombre_Equipo CHAR(50), 
    id_resultado INTEGER, 
    DNIVisitante INTEGER, 
    NyA CHAR(50), 
    TotalFuera INTEGER, 
    TotalTarjetasAm INTEGER, 
    TotalTarjetasRo INTEGER, 
    TotalGoles INTEGER, 
    TotalAsistencias INTEGER, 
    Partidos_Jugados INTEGER, 
    TarjetasRojas INTEGER, 
    GolesJugador INTEGER, 
    TarjetasAmarillas INTEGER, 
    Asistencias INTEGER, 
    FueraDeJuegos INTEGER,
    PRIMARY KEY(DNILocal),
    FOREIGN KEY(Nombre_Equipo) REFERENCES Equipos
        NOT NULL,
    FOREIGN KEY(DNIVisitante) REFERENCES Jugadores(DNILocal)
        NOT NULL
        UNIQUE,
    FOREIGN KEY(id_Resultado) REFERENCES Resultado
        NOT NULL,
)

CREATE TABLE Equipos(
    Nombre_Equipo CHAR(50),
    Partidos_empatados INTEGER, 
    partidos_ganados INTEGER, 
    partidos_perdidos INTEGER,
    PRIMARY KEY(Nombre_Equipo)
)

CREATE TABLE Resultado(
    id_Resultado INTEGER, 
    GolesLocal INTEGER, 
    Visitante INTEGER,
    PRIMARY KEY(id_Resultado)
)