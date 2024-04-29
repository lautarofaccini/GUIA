/* 
Esquema relacional
JUGADORES(id_jug: Integer, NyA: String, Posicion: String)
    CP: id_jug
    CNN: NyA
PARTIDOS(Fecha: Date, Torneo: String)
    CP: Fecha
    CNN: Torneo
ESTADISTICAS(id_est: Integer, id_jug: Integer, Fecha: Date, amarillas: Integer, faltas: Integer, goles: Integer, rojas: Integer, tiros_libres: Integer, resultado: String, asistencias: Integer)
    CP: id_est
    CF: id_jug -> JUGADORES
        Fecha -> PARTIDOS
    CNN: id_jug, Fecha
*/
