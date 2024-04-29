CREATE TABLE ALUMNOS(
    ide CHAR(10),
    nombre CHAR(50),
    usuario CHAR(50),
    edad SMALLINT,
    nota SMALLINT
    PRIMARY KEY(ide)
)
CREATE TABLE ASIGNATURAS(
    idp CHAR(10),
    nombrep CHAR(50),
    sueldo INTEGER,
    PRIMARY KEY(idp)
)
CREATE TABLE AULAS(
    nau CHAR(10),
    direccion CHAR(100),
    capacidad INTEGER,
    PRIMARY KEY(nau)
)
CREATE TABLE Matriculados(
    ide CHAR(10),
    idp CHAR(10),
    curso CHAR(3),
    PRIMARY KEY(ide, idp)
)
CREATE TABLE Imparte(
    idp CHAR(10),
    ida CHAR(10),
    PRIMARY KEY(idp, ida)
)
CREATE TABLE Impartida_en(
    idp CHAR(10),
    nau CHAR(10),
    hora CHAR(5),
    PRIMARY KEY(idp, nau)
)