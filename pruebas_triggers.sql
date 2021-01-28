-- Pruebas de triggers
delete from candidato_realiza_prueba;
delete from contrata
-- Prueba trigger 1: 
-- Hacemos que el candidato 'I2ZPQSTI3X' haga una prueba cuyo coste es 110
-- Importe candidato (llamado importe_total) antes del trigger:
select * from candidatos where codigo_candidato = 'TZCCRGP35Y';
-- Despues del trigger:
insert into candidato_realiza_prueba values ('TZCCRGP35Y','02','LMBJHFWLQE','ZDI2J077V0','TRUE');
select * from candidatos where codigo_candidato = 'TZCCRGP35Y';


-- Prueba trigger 2: 
-- Vamos a hacer que un candidato supere todas las pruebas para comprobar el funcionamiento
-- (necesita haber hecho la prueba que se inserta en la comprobación del trigger 1):
-- insert into candidato_realiza_prueba values ('TZCCRGP35Y','02','LMBJHFWLQE','ZDI2J077V0','TRUE');
insert into candidato_realiza_prueba values ('TZCCRGP35Y','03','LMBJHFWLQE','ZDI2J077V0','TRUE');
select * from contrata where codigo_candidato = 'TZCCRGP35Y';

-- Prueba trigger 3:
-- El casting 'ZDI2J077V0' solo necesita 1 persona tal y como podemos comprobar en:
select numero_de_personas from presencial where codigo_casting = 'ZDI2J077V0';
-- Por lo que no deberíamos contratar más candidatos incluso si superan las pruebas:
-- (para hacer la prueba haremos un insert directamente)
insert into contrata values('ZDI2J077V0', 'NK9IRY891Y');
-- Comprobamos que no se ha añadido al casting 'ZDI2J077V0' (puede estar en otros)
select * from contrata where codigo_candidato = 'NK9IRY891Y';

--Prueba trigger 4:
-- El casting 'ZDI2J077V0' necesita del perfil: 'QAU8GWQRXD'
-- Por lo que el candidato '4QU32DOAEZ' no puede hacer pruebas para ese casting ya
-- que tiene otro perfil, tal y como podemos ver en el siguiente select:
select codigo_de_perfil from candidatos where codigo_candidato = '4QU32DOAEZ';
-- Comprobacion trigger:
insert into candidato_realiza_prueba values('4QU32DOAEZ', '1', 'LMBJHFWLQE', 'ZDI2J077V0', 'TRUE');
-- Comprobamos que no se ha añadido 
select * from candidato_realiza_prueba where
codigo_candidato = '4QU32DOAEZ' and numero = '1' and codigo_fase = 'LMBJHFWLQE' 
and codigo_casting = 'ZDI2J077V0';



