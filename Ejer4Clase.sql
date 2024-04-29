/*
PACIENTES(IdPaciente: integer, 
IdMedico: Integer,
NombreP: string, 
ApellidoP: string,
Domicilio: string,
Telefono: integer,
FechaNacim: string)
    CP: IdPaciente
    CF: IdMedico -> MEDICOS
    CNN: IdMedico
MEDICOS(IdMedico: integer,
Nombre: string,
Apellido: string,
Telefono: integer,
Especialidad: string)
    CP: IdMedico
INTERNACIONES(IdInter: integer,
IdPaciente: integer,
Habitacion: integer,
Cama: integer,
FIngreso: string,
FEgreso: string)
    CP: IdInter
    CF: IdPaciente -> PACIENTES
    CNN: IdPaciente
*/
CREATE TABLE PACIENTES(
    IdPaciente INTEGER, 
    IdMedico INTEGER,
    NombreP CHAR(50), 
    ApellidoP CHAR(50),
    Domicilio CHAR(100),
    Telefono INTEGER,
    FechaNacim DATE,
    PRIMARY KEY(IdPaciente),
    FOREIGN KEY(IdMedico) REFERENCES MEDICOS
        NOT NULL
)
CREATE TABLE MEDICOS(
    IdMedico INTEGER,
    Nombre CHAR(50),
    Apellido CHAR(50),
    Telefono INTEGER,
    Especialidad CHAR(50),
    PRIMARY KEY(IdMedico)
)
CREATE TABLE INTERNACIONES(
    IdInter INTEGER,
    IdPaciente INTEGER,
    Habitacion INTEGER,
    Cama INTEGER,
    FIngreso DATE,
    FEgreso DATE,
    PRIMARY KEY(IdInter),
    FOREIGN KEY(IdPaciente) REFERENCES PACIENTES
        NOT NULL
)

