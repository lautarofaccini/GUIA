/* 
Modelo relacional
PROFESORES(ID)
*/
CREATE TABLE PROFESORES(
    ID INTEGER,
    Titulo CHAR(50) NOT NULL,
    NyA CHAR(50) NOT NULL,
    PRIMARY KEY(ID)
)

Profesores(id:integer, titulo:string, NyA: string)
    CP: ID
    CF: -
    NN: titulo, NyA

CREATE TABLE MATERIAS(
    N_Mat INTEGER,
    Programa CHAR(4) NOT NULL,
    Titulo CHAR(10) NOT NULL,
    PRIMARY KEY(N_Mat)
)

Materias(N_Mat: integer, Programa: string, Titulo: string)
    CP: N_Mat
    CF: - 
    NN: Programa, Titulo

CREATE TABLE DICTADOS(
    Semestre CHAR,
    Ano CHAR(4),
    Horario CHAR(5),
    N_Mat INTEGER,
    PRIMARY KEY(N_Mat, Semestre, Ano, Horario),
    FOREIGN KEY N_Mat 
        REFERENCES MATERIAS 
        ON DELETE CASCADE 
        ON UPDATE CASCADE
)

Dictados(Semestre: string, año: string, horario:string, N_Mat: integer)
    CP: (N_Mat, Semestre, año, horario)
    CF: N_Mat -> Materias(N_Mat)
        Borrar: cascada
        Actualizar: cascada

CREATE TABLE requiere(
    mat1 INTEGER,
    mat2 INTEGER,
    PRIMARY KEY(mat1, mat2)
    FOREIGN KEY mat1 REFERENCES MATERIAS(N_Mat)
    FOREIGN KEY mat2 REFERENCES MATERIAS(N_Mat)
)

Requiere(mat1:integer, mat2: integer)
    CP: (mat1,mat2)
    CF: mat1 -> Materias(N_Mat)
    CF: mat2 -> Materias(N_Mat)

CREATE TABLE Realizan(
    ID INTEGER,
    Semestre CHAR,
    Ano CHAR(4),
    Horario CHAR(5),
    N_Mat INTEGER,
    PRIMARY KEY(ID, N_Mat, Semestre, Ano, Horario)
    FOREIGN KEY ID REFERENCES PROFESORES,
    FOREIGN KEY N_Mat REFERENCES DICTADOS
    FOREIGN KEY Semestre REFERENCES DICTADOS
    FOREIGN KEY Ano REFERENCES DICTADOS
    FOREIGN KEY Horario REFERENCES DICTADOS
)

CREATE TABLE ESTUDIANTES(
    ID INTEGER,
    Carrera CHAR(3) NOT NULL,
    NyA CHAR(50) NOT NULL,
    Departamento CHAR(50) NOT NULL,
    PRIMARY KEY(ID)
)
CREATE TABLE Asiste(
    ID INTEGER,
    Semestre CHAR,
    Ano CHAR(4),
    Horario CHAR(5),
    N_Mat INTEGER,
    nota SMALLINT,
    PRIMARY KEY(ID, N_Mat, Semestre, Ano, Horario)
    FOREIGN KEY ID REFERENCES ESTUDIANTES,
    FOREIGN KEY N_Mat REFERENCES DICTADOS
    FOREIGN KEY Semestre REFERENCES DICTADOS
    FOREIGN KEY Ano REFERENCES DICTADOS
    FOREIGN KEY Horario REFERENCES DICTADOS
)