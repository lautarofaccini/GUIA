CREATE TABLE Provincia(
    CodPostal CHAR(4),
    Nombre CHAR(10),
    PRIMARY KEY(CodPostal)
)
CREATE TABLE Camioneros(
    DNI INTEGER,
    Matricula CHAR(20),
    FechaIngreso DATE, 
    FechaPartida DATE, 
    Provincia CHAR(50), 
    Salario INTEGER, 
    Teléfono INTEGER, 
    Domicilio CHAR(100), 
    Nombre CHAR(50), 
    PRIMARY KEY(DNI, Matricula),
    FOREIGN KEY(Matricula) REFERENCES Camiones
        UNIQUE
)
CREATE TABLE Camiones(
    Matricula CHAR(20), 
    Modelo CHAR(2), 
    Tipo CHAR(10), 
    Potencia INTEGER,
    PRIMARY KEY(Matricula)
)
CREATE TABLE Paquete(
    CodPaq INTEGER, 
    DNI INTEGER, 
    Matricula CHAR(20),
    CodPostal CHAR(4),
    Descripcion CHAR(100), 
    Destination CHAR(50), 
    DomicilioDestino CHAR(50), 
    PRIMARY KEY(CodPaq, DNI, Matricula, CodPostal),
    FOREIGN KEY(DNI, Matricula) REFERENCES Camioneros,
    FOREIGN KEY(CodPostal) REFERENCES Provincia
)