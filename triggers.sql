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
begin
	
end
$$
Language plpgsql;

create trigger tr_importe_candidato after insert on candidato_realiza_prueba
execute procedure fun_importe_candidato();