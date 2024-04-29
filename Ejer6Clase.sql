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

