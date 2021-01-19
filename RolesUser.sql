create role administrador;
grant all privileges on adultos, agente, candidato_realiza_prueba, candidatos, casting, casting_necesita_perfil, cliente, fase, niño, online, perfil,
presencial, prueba_individual, representante to administrador;

create role gestor;
grant select, update, delete, insert   on adultos, agente, candidato_realiza_prueba, candidatos, casting, casting_necesita_perfil, cliente, fase, niño, online, perfil,
presencial, prueba_individual, representante to gestor;


create role recepcionista;
grant select  on adultos, agente, candidato_realiza_prueba, candidatos, casting, casting_necesita_perfil, cliente, fase, niño, online, perfil,
presencial, prueba_individual, representante to recepcionista;

create user javier;
create user rodrigo;
create user jefe;

grant administrador to recepcionista;
grant gestor to rodrigo;
grant recepcionista to javier;