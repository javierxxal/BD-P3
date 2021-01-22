--Triggers
-- 	Triggers necesarios para el correcto funcinamiento:

-- // VALIDAR COSAS? //

--Triggers especificados en la práctica:
-- 	Calcular el importe total que ha pagado cada candidato
-- 	teniendo en cuenta todas las pruebas que ha realizado.
drop trigger tr_importe_candidato on candidato_realiza_prueba;
drop function fun_importe_candidato();
drop trigger tr_insertar_contrata on candidato_realiza_prueba;
drop function fun_insertar_contrata();

create function fun_importe_candidato() returns Trigger as
$$
declare
	coste_prueba smallint;
begin
	coste_prueba = (select coste from prueba_individual inner join
	candidato_realiza_prueba on
	prueba_individual.numero = new.numero and
	prueba_individual.codigo_fase = new.codigo_fase and
	prueba_individual.codigo_casting = new.codigo_casting);
	
	raise notice 'COSTEEEEEEE: %', new.codigo_candidato;
	
	update candidatos
	set importe_total = importe_total + coste_prueba
	where codigo_candidato = new.codigo_candidato;
	return NULL;
end
$$
Language plpgsql;

create trigger tr_importe_candidato after insert on candidato_realiza_prueba
execute procedure fun_importe_candidato();



-- SEGUNDO TRIGGER AHHHHH COJO
--Cuando un candidato supera una prueba de un casting, se debe calcular el número de pruebas superadas por dicho candidato.
--Si ese número coincide con el número de pruebas totales de dicho casting, se mostrará un mensaje y se insertará en la tabla “contrata”.

create function fun_insertar_contrata() returns Trigger as
$$
declare
	pruebas_totales smallint;
	pruebas_pasadas smallint;
	candidato character;
	casting character;
begin
	pruebas_pasadas = (select count(*) from candidato_realiza_prueba where codigo_candidato = new.codigo_candidato);
	candidato = new.codigo_candidato;
	casting = new.casting;
	
	pruebas_totales = (select count(*) from prueba_individual where codigo_casting = casting);

	if(pruebas_pasadas = pruebas_totales) then
					   insert into contrata values (casting , candidato);
	return NULL;
end
$$
Language plpgsql;

create trigger tr_insertar_contrata after insert on candidato_realiza_prueba
execute procedure fun_insertar_contrata();

					   
-- CUARTo TRIGER AHAHDHAWHDAHDHA
--Cuando un candidato realiza una prueba de un determinado casting,
--se debe comprobar si su perfil encaja en alguno de los perfiles requeridos por en dicho casting.
					   					   
create function fun_insertar_prueba() returns Trigger as
$$
declare

begin
	if((select count(*) from casting_necesita_perfil group by codigo_de_perfil)>0)then
						delete from casting_necesita_perfil 
						where 'Falta poner la condición que hace que se borre la tupla exacta.'
	return NULL;
end
$$
Language plpgsql;

create trigger tr_insertar_prueba before insert on candidato_realiza_prueba
execute procedure fun_insertar_prueba();					   