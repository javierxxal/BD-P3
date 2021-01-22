--Triggers
-- 	Triggers necesarios para el correcto funcinamiento:

-- // VALIDAR COSAS? //

--Triggers especificados en la práctica:
-- 	Calcular el importe total que ha pagado cada candidato
-- 	teniendo en cuenta todas las pruebas que ha realizado.
drop trigger tr_importe_candidato on candidato_realiza_prueba;
drop function fun_importe_candidato();


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