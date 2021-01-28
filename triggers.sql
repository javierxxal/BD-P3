--Triggers especificados en la práctica:

-- PRIMER TRIGGER
--Calcular el importe total que ha pagado cada candidato
--teniendo en cuenta todas las pruebas que ha realizado.

create or replace function fun_importe_candidato() returns Trigger as
$actualizarImporte$
begin
	update candidatos
	set importe_total = importe_total + (select coste from prueba_individual where
	numero = new.numero and
	codigo_fase = new.codigo_fase and
	codigo_casting = new.codigo_casting)
	
	where codigo_candidato = new.codigo_candidato;
	
	return new;
end
$actualizarImporte$
Language plpgsql;

create trigger tr_importe_candidato after insert on candidato_realiza_prueba
for each row
execute procedure fun_importe_candidato();



-- SEGUNDO TRIGGER
--Cuando un candidato supera una prueba de un casting, se debe calcular el número de pruebas superadas por dicho candidato.
--Si ese número coincide con el número de pruebas totales de dicho casting, se mostrará un mensaje y se insertará en la tabla “contrata”.

create or replace function fun_insertar_contrata() returns Trigger as
$insertarContratados$
declare
	num_pruebas_totales smallint;
	num_pruebas_pasadas smallint;
begin
	if(new.resultado_prueba = 'TRUE') then
	
		num_pruebas_pasadas = (select count(*) from candidato_realiza_prueba where codigo_candidato = new.codigo_candidato
						  and resultado_prueba = 'TRUE');
		num_pruebas_totales = (select count(*) from prueba_individual where codigo_casting = new.codigo_casting);
		
		if(num_pruebas_pasadas = num_pruebas_totales) then
					   raise notice 'El candidato ha superado todas las pruebas, está contratado';
					   insert into contrata values (new.codigo_casting , new.codigo_candidato);
		end if;
	end if;
	return new;
end
$insertarContratados$
Language plpgsql;

create trigger tr_insertar_contrata after insert on candidato_realiza_prueba
for each row
execute procedure fun_insertar_contrata();

	
-- TERCER TRIGGER
--Al insertar un candidato en la tabla “contrata” se debe comprobar si para ese casting en particular
--ya se han contratado suficientes personas. Para ello, se deberá comparar el número de candidatos 
--seleccionados para ese casting con el número de personas requerido al contratar el casting.

create or replace function fun_comprobar_contrata() returns Trigger as
$comprobarContratados$
declare
	num_personas_requeridas smallint;
	num_personas_contratadas smallint;
begin
	num_personas_requeridas = (select numero_de_personas from presencial 
		where codigo_casting = new.codigo_casting);
	num_personas_contratadas = (select count(*) from contrata
		where codigo_casting = new.codigo_casting);
		
	if(num_personas_requeridas = num_personas_contratadas) then
		raise notice 'Ya se han contratado a todos los candidatos necesarios';
		return null;
	else
		return new;
	end if;
end
$comprobarContratados$
Language plpgsql;

create trigger tr_comprobar_contrata before insert on contrata
for each row
execute procedure fun_comprobar_contrata();
					 
-- CUARTO TRIGGER
--Cuando un candidato realiza una prueba de un determinado casting,
--se debe comprobar si su perfil encaja en alguno de los perfiles requeridos por en dicho casting.
					   					   
create function fun_comprobar_perfil() returns Trigger as
$comprobarPerfil$
declare
	perfil_buscado character(10);
	perfil_candidato character(10);
begin
	perfil_buscado = (select codigo_de_perfil from casting_necesita_perfil
					 where codigo_casting = new.codigo_casting);
	perfil_candidato = (select codigo_de_perfil from candidatos
					   where codigo_candidato = new.codigo_candidato);
					   
	if (perfil_buscado = perfil_candidato) then
		return new;
	else
		raise notice 'El candidato no puede realizar la prueba porque no encaja en ningún perfil';
		return null;
	end if;
end
$comprobarPerfil$
Language plpgsql;

create trigger tr_comprobar_perfil before insert on candidato_realiza_prueba
for each row
execute procedure fun_comprobar_perfil();			










