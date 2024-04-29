/* 
Clientes(DNI: string, Nombre: string, Apellido: string, Domicilio: string, FNacim: string)
    CP: DNI
Productos(CodProd: string, Nombre: string, PrecioUnitario: integer)
    CP: CodProd
Empresa(CUIT: string, Nombre: string,Domicilio: string)
    CP: CUIT
Fabrica(CodProd: string, CUIT: string)
    CP: (CodProd, CUIT)
    CF: CodProd -> Productos
        CUIT -> Empresa
Compra(DNI: string, CodProd: string, CUIT:string)
    CP: (DNI, CodProd, CUIT)
    CF: DNI -> Clientes
        CodProd -> Fabrica
        CUIT -> Fabrica
*/
CREATE TABLE CLIENTES(
    DNI INTEGER,
    Nombre CHAR(50),
    Apellido CHAR(50),
    Domicilio CHAR(100),
    FNac DATE,
    PRIMARY KEY(DNI)
)
CREATE TABLE PRODUCTOS(
    CodProd INTEGER,
    Nombre CHAR(50),
    PrecioUnitario INTEGER,
    PRIMARY KEY(CodProd)
)
CREATE TABLE Fabrica(
    CodProd INTEGER,
    CUIT INTEGER,
    PRIMARY KEY(CodProd, CUIT),
    FOREIGN KEY(CodProd) REFERENCES PRODUCTOS,
    FOREIGN KEY(CUIT) REFERENCES EMPRESA
)
CREAtE TABLE EMPRESA(
    CUIT INTEGER,
    Nombre CHAR(50),
    Domicilio CHAR(100),
    PRIMARY KEY(CUIL)    
)
CREATE TABLE Compra(
    DNI INTEGER,
    CodProd INTEGER,
    CUIT INTEGER,
    PRIMARY KEY(DNI, CodProd, CUIT),
    FOREIGN KEY(DNI) REFERENCES CLIENTES,
    FOREIGN KEY(CodProd, CUIT) REFERENCES Fabrica
)