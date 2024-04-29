/* 
EXAMENES(id_exam: Integer)
    CP: id_exam
MATERIAS(nombre: String, departamento: String, numero_a: Integer)
    CP: nombre
AULAS(numero_a: Integer, edificio: String, capacidad: Integer)
    CP: numero_a
    CNN:edificio
Corresponde_a(id_exam: Integer, nombre: String, numero_a)
    CP: id_exam, nombre, numero_a
    CF: id_exam -> EXAMENES
        nombre -> MATERIAS
        numero_a -> AULAS
SECCIONES(nombre: String, numero_s: Integer, matriculados: Integer)
    CP: nombre, numero_s
    CF: nombre -> MATERIAS
        Borrado: Cascada
        Actualizacion: Cascada
*/