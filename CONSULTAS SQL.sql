--1
select nombre from cliente where codigo_cliente not in
(select codigo_cliente from casting);

-- 2
select nombre from candidatos where codigo_candidato not in
(select codigo_candidato from candidato_realiza_prueba where resultado_prueba = false);

--3
select codigo_de_perfil, count(codigo_de_perfil) as num_candidatos from candidatos
group by codigo_de_perfil;

--4 
select nombre from agente where dni in 
(select dni from presencial group by dni having count(dni) = 
(select max(num_dni) from (select dni, count(dni) as num_dni from presencial group by dni) as cuantosdni));

--5
select casting.codigo_casting, count(distinct codigo_candidato) from casting
inner join candidato_realiza_prueba on
casting.codigo_casting = candidato_realiza_prueba.codigo_casting
group by casting.codigo_casting;

--6 
select nombre , direccion from candidatos where 
codigo_de_perfil in (select codigo_de_perfil from perfil where color_del_pelo ='Rubio' and provincia = 'Madrid');

--7
select codigo_de_perfil from casting_necesita_perfil
where codigo_casting in 
(select codigo_casting from casting where descripcion like '%anuncio tv%');

--8
select codigo_candidato from candidatos where codigo_de_perfil in (select codigo_de_perfil from perfil where color_del_pelo ='Castaño')
and nif_representante != 'null';

--9
select codigo_candidato, sum(coste) as dinero_a_pagar
from candidato_realiza_prueba inner join prueba_individual
on prueba_individual.numero = candidato_realiza_prueba.numero and
prueba_individual.codigo_fase = candidato_realiza_prueba.codigo_fase and
prueba_individual.codigo_casting = candidato_realiza_prueba.codigo_casting
group by codigo_candidato;

--10
select count(*) as adultos,(select count(*) from niño) as niño from adultos;

--11
select dni from presencial where codigo_casting in
(select codigo_casting from prueba_individual where sala_de_celebracion = 'Sala flor');

--12
select plataforma_web , cliente.nombre from casting inner join cliente on casting.codigo_cliente = cliente.codigo_cliente 
inner join online on casting.codigo_casting = online.codigo_casting 
where coste = (select max(mayor_coste) from (select coste as mayor_coste from casting) as costes); 

--13
select actividad, count(actividad)*100/(select count(*) from cliente) as porcentaje
from cliente group by actividad;

--14
select distinct candidatos.nombre, casting.nombre from candidato_realiza_prueba inner join candidatos
on candidato_realiza_prueba.codigo_candidato = candidatos.codigo_candidato
inner join casting on candidato_realiza_prueba.codigo_casting = casting.codigo_casting
where resultado_prueba = true ;

--15
select sum(coste) from casting;

--16
select nombre , telefono from representante where nif in (select nif_representante from candidatos 
group by nif_representante having count(nif_representante)>=2);

--17
select dni from candidatos inner join adultos 
on candidatos.codigo_candidato = adultos.codigo_candidato
where nif_representante is null;

--18
select cliente.nombre as nombre_cliente, perfil.* from casting_necesita_perfil inner join casting on
casting_necesita_perfil.codigo_casting = casting.codigo_casting
inner join perfil on 
casting_necesita_perfil.codigo_de_perfil = perfil.codigo_de_perfil
inner join cliente on
casting.codigo_cliente = cliente.codigo_cliente
where perfil.codigo_de_perfil in
(select codigo_de_perfil from casting_necesita_perfil group by codigo_de_perfil 
having count(codigo_de_perfil) = 
(select max(veces_solicitado) from (select codigo_de_perfil, count(codigo_de_perfil) as veces_solicitado
from casting_necesita_perfil
group by codigo_de_perfil) as cuantosperfil));

--19
select count(*), niño.codigo_candidato from candidato_realiza_prueba inner join candidatos 
on candidato_realiza_prueba.codigo_candidato = candidatos.codigo_candidato
inner join niño on niño.codigo_candidato = candidatos.codigo_candidato
where resultado_prueba = 'true' group by niño.codigo_candidato;

--20
select codigo_casting from fase
group by codigo_casting having count(codigo_casting) = 
(select max(nfases) from 
(select codigo_casting, count(codigo_casting) as nfases from fase
group by codigo_casting) 
 as cuantasfases);
