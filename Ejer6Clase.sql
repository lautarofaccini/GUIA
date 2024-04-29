/* 
Persona con Empleado y Cliente 
    hay solapamiento
    hay cobertura
Empleado con oficial, cajero, secretario
    no hay solapamiento
    hay cobertura

Oficiales(
    id_persona: integer, 
    numero_despacho: integer
)
    CP: id_persona
    CF: id_persona -> Empleados
Cajeros(
    id_persona: integer, 
    numero_caja: integer,
    horas_trabajadas: integer
)
    CP: id_persona
    CF: id_persona -> Empleados
Secretarias(
    id_persona: integer, 
    horas_trabajadas: integer
)
    CP: id_persona
    CF: id_persona -> Empleados
Empleados(
    id_persona: integer, 
    sueldo: integer
)
    CP: id_persona
    CF: id_persona -> Personas
Clientes(
    id_persona: integer,
    calificacion_crediticia: string
)
    CP: id_persona
    CF: id_persona -> Personas
Personas(
    id_persona: integer,
    nombre: string,
    calle: integer,
    ciudad: string
)
    CP: id_persona
*/
CREATE TABLE Oficiales(
    id_persona INTEGER, 
    numero_despacho INTEGER,
    PRIMARY KEY(id_persona),
    FOREIGN KEY(id_persona) REFERENCES Empleados
)

CREATE TABLE Cajeros(
    id_persona INTEGER, 
    numero_caja INTEGER,
    horas_trabajadas INTEGER,
    PRIMARY KEY(id_persona),
    FOREIGN KEY(id_persona) REFERENCES Empleados,
)

CREATE TABLE Secretarias(
    id_persona INTEGER, 
    horas_trabajadas INTEGER,
    PRIMARY KEY(id_persona),
    FOREIGN KEY(id_persona) REFERENCES Empleados
)

CREATE TABLE Empleados(
    id_persona INTEGER, 
    sueldo INTEGER,
    PRIMARY KEY(id_persona),
    FOREIGN KEY(id_persona) REFERENCES Personas
)

CREATE TABLE Clientes(
    id_persona INTEGER,
    calificacion_crediticia CHAR(50),
    PRIMARY KEY(id_persona),
    FOREIGN KEY(id_persona) REFERENCES Personas
)

CREATE TABLE Personas(
    id_persona INTEGER,
    nombre CHAR(50),
    calle INTEGER,
    ciudad CHAR(50),
    PRIMARY KEY(id_persona)
)