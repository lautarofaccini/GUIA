-- 1.1 Encuentre los snombres de Proveedores que provean alguna parte roja.

SELECT distinct sname from suppliers natural join catalog natural join parts
	where color like 'Red%';
    
-- 1.2 Encuentre los sids de Proveedores que provean alguna red o parte verde.

SELECT distinct sid from catalog natural join parts
	where color like 'Red%' or color like 'Green%';
    
-- 1.3 Encuentre los sids de Proveedores que provean alguna parte roja o vivan en “221 Packer Street”.

SELECT distinct sid from suppliers natural join catalog natural join parts
	where color like 'Red%' or address like '221 Pecker Street%';

-- 1.4 Encuentre los sids de Proveedores que provean alguna parte roja and alguna parte verde.

SELECT distinct sid from catalog natural join parts
	where color like 'Red%' and color like 'Green%';

-- 1.5 Encuentre los sids de Proveedores que provean cada parte.

with ProovedoresPartes as (
	select sid, pid from catalog natural join parts order by sid
),
Partes as (
	select distinct pid from parts
),
q1 as (
	select distinct sid from ProovedoresPartes
),
q21 as (
-- q21 = Partes x q1
	select * from Partes, q1
),
q22 as (
-- q21 - ProovedoresPartes 
	select q21.* 
    from q21 left join ProovedoresPartes 
    on q21.sid = ProovedoresPartes.sid and q21.pid = ProovedoresPartes.pid
    where ProovedoresPartes.sid is null
),
q23 as (
	select sid from q22
)
-- ProovedoresPartes / Partes = q1 - q23 
select q1.sid 
from q1 left join q23 
on q1.sid = q23.sid 
where q23.sid is null;

-- 1.6 Encuentre los sids de Proveedores que provean cada parte roja.

with ProovedoresParte as (
	select sid, pid from catalog natural join parts order by sid
),
PartesRojas as (
	select distinct pid from parts where color like 'Red%'
),
q1 as (
	select distinct sid from ProovedoresParte 
),
q21 as (
-- q21 = PartesRojas x q1
	select * from PartesRojas, q1
),
q22 as (
-- q21 - ProovedoresParte 
	select q21.* 
    from q21 left join ProovedoresParte 
    on q21.sid = ProovedoresParte.sid and q21.pid = ProovedoresParte.pid
    where ProovedoresParte.sid is null
),
q23 as (
	select sid from q22
)
-- ProovedoresParte / PartesRojas = q1 - q23 
select q1.sid 
from q1 left join q23 
on q1.sid = q23.sid 
where q23.sid is null;

-- 1.7 Encuentre los sids de Proveedores que provean cada parte roja o verde.

with ProovedoresParte as (
	select sid, pid from catalog natural join parts order by sid
),
PartesRojasVerdes as (
	select distinct pid from parts where color like 'Red%' or color like 'Green%'
),
q1 as (
	select distinct sid from ProovedoresParte 
),
q21 as (
-- q21 = PartesRojasVerdes x q1
	select * from PartesRojasVerdes, q1
),
q22 as (
-- q21 - ProovedoresParte 
	select q21.* 
    from q21 left join ProovedoresParte 
    on q21.sid = ProovedoresParte.sid and q21.pid = ProovedoresParte.pid
    where ProovedoresParte.sid is null
),
q23 as (
	select sid from q22
)
-- ProovedoresParte / PartesRojasVerdes = q1 - q23 
select q1.sid 
from q1 left join q23 
on q1.sid = q23.sid 
where q23.sid is null;

-- 1.8 Encuentre los sids de Proveedores que provean cada parte roja o provean cada parte verde.

with ProovedoresParte as (
	select sid, pid from catalog natural join parts order by sid
),
PartesRojas as (
	select distinct pid from parts where color like 'Red%'
),
PartesVerdes as (
	select distinct pid from parts where color like 'Green%'
),
q1 as (
	select distinct sid from ProovedoresParte 
),
q21 as (
-- q21 = PartesRojas x q1
	select * from PartesRojas, q1
),
q22 as (
-- q21 - ProovedoresParte 
	select q21.sid 
    from q21 left join ProovedoresParte 
    on q21.sid = ProovedoresParte.sid and q21.pid = ProovedoresParte.pid
    where ProovedoresParte.sid is null
),
q31 as (
-- q31 = PartesVerdes x q1
	select * from PartesVerdes, q1
),
q32 as (
-- q31 - ProovedoresParte 
	select q31.sid 
    from q31 left join ProovedoresParte 
    on q31.sid = ProovedoresParte.sid and q31.pid = ProovedoresParte.pid
    where ProovedoresParte.sid is null
)
-- ProovedoresParte / PartesRojas U ProovedoresParte / PartesVerdes = q1 - q22 U q1 - q32
select q1.sid 
from q1 left join q22 
on q1.sid = q22.sid 
where q22.sid is null
union
select q1.sid 
from q1 left join q32 
on q1.sid = q32.sid 
where q32.sid is null;

-- 1.9 Encuentre los pares de sids tal que los Proveedores con el primer sid cueste mas por alguna parte que los proveedor del segundo sid.

select distinct A.sid, B.sid from catalog A, catalog B where A.sid <> B.sid and A.pid = B.pid and A.cost > B.cost;

-- 1.10 Encuentre los pids de partes provista por al menos dos proveedores diferentes.

select distinct A.pid from catalog A, catalog B where A.pid = B.pid and A.sid <> B.sid;

-- 1.11 Encuentre los pids de las partes mas caras provistas por el proveedor llamado Yosemite Sham.

with catYosemite as (select * from catalog natural join (select sid from suppliers where sname = 'Yosemite Sham') as idYosemite)
select pid from catYosemite
where cost >= all (select cost from catYosemite);

-- 1.12 Encuentre los pids de partes provistas por cada proveedor a menos que $200. (Si algún proveedor no provee las partes o cuesta igual o más de $200, las partes no deberán ser listadas.)

with ProovedoresPartes as (
-- ProovedoresPartes = (sid, pid) proovedores que proovean partes a menos de 200
	select sid, pid from catalog natural join parts where catalog.cost < 200 order by pid
),
Proovedores as (
-- Proovedores = (sid) proovedores unicos
	select distinct sid from suppliers
),
q1 as (
-- q1 = (pid) unicos de ProovedoresPartes
	select distinct pid from ProovedoresPartes
),
q21 as (
-- q21 = Proovedores x q1
	select * from Proovedores, q1
),
q22 as (
-- q22 = (pid) q21 - ProovedoresPartes 
	select q21.pid 
    from q21 left join ProovedoresPartes 
    on q21.sid = ProovedoresPartes.sid and q21.pid = ProovedoresPartes.pid
    where ProovedoresPartes.pid is null
)
-- ProovedoresPartes / Proovedores = q1 - q22 
select q1.pid 
from q1 left join q22 
on q1.pid = q22.pid 
where q22.pid is null;