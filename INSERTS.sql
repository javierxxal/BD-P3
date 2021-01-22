

set datestyle to postgres, dmy;
/*INSERTS DE CLIENTES*/

insert into cliente values ('G6X585PF10','Javier','26287 Laila Courts','922035546','Maria','P');
insert into cliente values ('Z0EF2Y4ZTC','Rodrigo','1957 Sporer Place','951429429','Carmen','P');
insert into cliente values ('ASS4APN67H','Fernando','1957 Sporer Place','982805480','Oscar','P');
insert into cliente values ('K1DI6DFQK4','Jesus ','100 Cartwright Port','620786646','Alex','P');
insert into cliente values ('B1EDYBM1WB','Antonio','26925 Stracke Grove','681647550','Daniel','P');
insert into cliente values ('3LFUKW9H0Q','Luis','096 Hintz Prairie','788235233','Miguel','P');
insert into cliente values ('OGSW2L8OWP','Andrea','485 Estrella Ridges','650318896','Elena','P');
insert into cliente values ('JH9D9F1ROD','Vicente','8260 Lavonne Grove','777610746','Leonor','M');
insert into cliente values ('PZ3I3M9FCT','Rosa','8260 Lavonne Grove','633275887','Teresa','M');
insert into cliente values ('8UT2BWUWSH','Cristina','97626 Armand Throughway','677522319','Alberto','M');
insert into cliente values ('V2XYS90AAY','Incognito','Calle Falsa 123','999999999','Incognito','M');
insert into cliente values ('160MX3B9X3','Hugo','387 McCullough Extension','737811191','Cristian','M');
insert into cliente values ('HBHZXRL8CU','Helena','5973 Keith Cliffs','679823370','Paul','M');
insert into cliente values ('A01C12CY6X','Ester','38514 Zella Skyway','921767921','Federico','M');
insert into cliente values ('9OK0B9E7ZJ','Jorge','096 Hintz Prairie','980307517','Alejandro','M');
insert into cliente values ('LUJQOIOO0I','Carlos','94853 Bartell Meadow','980307517','Oscar','P');
insert into cliente values ('WZK4CM0BWM','Álvaro','40375 Kailyn Junctions','690324357','Rodrigo','M');
insert into cliente values ('YB94C6LPMO','Manuel','7949 Greenholt Terrace','795561745','Maria','P');


/*INSERTS DE CASTINGS*/

insert into casting values ('ILBNLLC6TW','BUSCAMOS MODELOS DE BAÑADOR','BLA BLA BLA bañadores bla bla bla pagos','06-07-2020','G6X585PF10','1500');
insert into casting values ('RQ3TCC0MTS','SESIÓN DE FOTOS','bla bla bla flores bla bla bla','18-12-2020','G6X585PF10','3000');
insert into casting values ('I96ICE30U7','EXTRAS PARA TERMINATOR 300','bla bla bla anuncio bla bla bla','17-11-2020','G6X585PF10','2000');
insert into casting values ('9C2JA0T52E','MISS FANTASTICO','Anuncio television bla bla bla','25-01-2020','PZ3I3M9FCT','110');
insert into casting values ('UCCD1YTVVJ','ACTORES PARA 300','bla bla bla anuncio tv ','12-01-2020','LUJQOIOO0I','6700');
insert into casting values ('QF8BYWIQFU','NATURALISTAS FLORES','bla bla naturaleza bla bla','21-07-2020','LUJQOIOO0I','9999');
insert into casting values ('ZQ8IT7ABC7','VOCALISTA PARA METALICA','bla bla bla bal','30-01-2020','YB94C6LPMO','875');
insert into casting values ('HK328Z8E63','NIÑOS PARA LOS GOONIES','bla bla tv bla','14-04-2020','V2XYS90AAY','15400');
insert into casting values ('9ETDJDGZOC','ADULTOS PARA SUPERMAN','bla bla tv bla','03-04-2020','8UT2BWUWSH','469');
insert into casting values ('ZDI2J077V0','SANTA CLAUS DE SUPERMERCADOS','bla bla bla anuncio tv ','06-10-2020','Z0EF2Y4ZTC','5127');

insert into casting values ('T9HKMMPL3X','MODELOS MASCULINOS PARIS','bla bla bla anuncio bla bla bla','15-11-2020','9OK0B9E7ZJ','750');
insert into casting values ('JZ8BU8Z15Y','CASTING PARA BATERIA','bla bla bla bal','18-08-2020','A01C12CY6X','5788');

insert into casting values ('AA3KB6F1VQ','ACTORES DE DOBLAJE','bla bla bla bal','15-06-2020','160MX3B9X3','1843');
insert into casting values ('QOBB2CQ13E','ORQUESTA MIAMI','bla bla bla bal','03-02-2020','PZ3I3M9FCT','32256');
insert into casting values ('L7XKK57LFX','FILM EN VALENCIA','bla bla pelicula anuncio bla tv bal','01-03-2020','ASS4APN67H','2186');


/*INSERTS DE CASTING ONLINE*/

insert into online values('100','03-02-2020','www.casting.com','L7XKK57LFX');
insert into online values('202','03-02-2020','www.rincondePelis.com','QOBB2CQ13E');
insert into online values('45','03-02-2020','www.jardinesMariaJesus.es','AA3KB6F1VQ');


/*INSERTS DE AGENTE*/
insert into agente values ('84511807S','Cain','9601 Rodrick Creek');
insert into agente values ('36002833J','Jose','266 Bartell Squares');
insert into agente values ('42886401A','Roberto','62745 Carolina Brooks');
insert into agente values ('25800941R','Lorenzo','526 Jenkins Summit');
insert into agente values ('98062359L','Ana','575 Skiles Vista');
insert into agente values ('65031822N','Celia','728 Colt Freeway');


/*INSERTS DE CASTING PRESENCIAL*/

insert into presencial values('12','ILBNLLC6TW','84511807S');
insert into presencial values('144','RQ3TCC0MTS','84511807S');
insert into presencial values('50','I96ICE30U7','84511807S');
insert into presencial values('300','9C2JA0T52E','36002833J');
insert into presencial values('200','UCCD1YTVVJ','36002833J');
insert into presencial values('18','QF8BYWIQFU','25800941R');
insert into presencial values('45','ZQ8IT7ABC7','98062359L');
insert into presencial values('67','HK328Z8E63','84511807S');
insert into presencial values('90','9ETDJDGZOC','42886401A');
insert into presencial values('80','ZDI2J077V0','42886401A');


/*INSERTS DE FASE*/

insert into fase values('QE04G16CET','03-12-2020','ILBNLLC6TW');
insert into fase values('ENHTF4CLZG','05-11-2020','ILBNLLC6TW');
insert into fase values('ODSG9HFHOV','15-02-2020','ILBNLLC6TW');
insert into fase values('SYO393AGH0','22-05-2019','RQ3TCC0MTS');
insert into fase values('Z6M45PPVQM','30-06-2020','RQ3TCC0MTS');
insert into fase values('NB8J3LKLN0','13-03-2020','I96ICE30U7');
insert into fase values('O3Y8Z64D3U','23-05-2020','I96ICE30U7');
insert into fase values('W5F0S3BEWA','12-07-2020','9C2JA0T52E');
insert into fase values('CBT1TOLBYS','11-08-2019','UCCD1YTVVJ');
insert into fase values('AB0WQYBN4X','14-09-2020','QF8BYWIQFU');
insert into fase values('G5R4P3UUOR','18-01-2020','QF8BYWIQFU');
insert into fase values('RGDUDTA2K2','16-03-2020','ZQ8IT7ABC7');
insert into fase values('HUYFELPZPC','24-04-2019','ZQ8IT7ABC7');
insert into fase values('ZIOZ6SL2NJ','27-07-2020','HK328Z8E63');
insert into fase values('OVR1LWY1CJ','29-09-2020','HK328Z8E63');
insert into fase values('U1N2IG6SOQ','20-12-2020','9ETDJDGZOC');
insert into fase values('B9UE2FQP2M','11-04-2019','ZDI2J077V0');
insert into fase values('LMBJHFWLQE','10-05-2020','ZDI2J077V0');
insert into fase values('OMP7H7EM5D','07-01-2020','ILBNLLC6TW');
insert into fase values('EGOOS4JNFU','05-11-2019','RQ3TCC0MTS');


/*INSERTS DE PRUEBA INDIVIDUAL*/

insert into prueba_individual values ('01','12-12-2020','Sala','100 saltos en 10 segundos','12','QE04G16CET','ILBNLLC6TW');
insert into prueba_individual values ('02','09-01-2020','Sala','Saltar a la comba "bien"','100','QE04G16CET','ILBNLLC6TW');
insert into prueba_individual values ('03','22-11-2019','Sala Isla','Prueba de supervivencia','40','QE04G16CET','ILBNLLC6TW');
insert into prueba_individual values ('04','25-03-2019','Sala Piscina','Prueba de nado','55','QE04G16CET','ILBNLLC6TW');

insert into prueba_individual values ('01','15-12-2019','Sala Flores','Olisquear flores','60','ENHTF4CLZG','ILBNLLC6TW');
insert into prueba_individual values ('02','11-10-2019','Sala flor','Cortar flores','34','ENHTF4CLZG','ILBNLLC6TW');

insert into prueba_individual values ('01','27-05-2019','Sala edificio','Escalar edifio','18','ODSG9HFHOV','ILBNLLC6TW');
insert into prueba_individual values ('02','30-07-2019','Sala Biblioteca','Memorizar el diccionario','66','ODSG9HFHOV','ILBNLLC6TW');

insert into prueba_individual values ('01','04-02-2019','Sala Biblioteca','Deletrear el alfabeto al reves','120','SYO393AGH0','RQ3TCC0MTS');
insert into prueba_individual values ('02','08-03-2019','Sala Sala','Saber distinguir los colores','150','SYO393AGH0','RQ3TCC0MTS');

insert into prueba_individual values ('01','11-04-2019','Sala Bosque','Describir un arbol','170','Z6M45PPVQM','RQ3TCC0MTS');
insert into prueba_individual values ('02','10-04-2019','Sala Sala','Identificar billetes falsos','190','Z6M45PPVQM','RQ3TCC0MTS');

insert into prueba_individual values ('01','20-05-2019','Sala Voz','Gritar mucho','200','NB8J3LKLN0','I96ICE30U7');
insert into prueba_individual values ('02','17-07-2019','Sala Piscina','Actuar en traje de bañador','213','NB8J3LKLN0','I96ICE30U7');

insert into prueba_individual values ('01','16-06-2019','Sala Piscina','Aguantar 30 minutos debajo del agua','140','O3Y8Z64D3U','I96ICE30U7');
insert into prueba_individual values ('02','01-01-2019','Sala Aeropuerto','Volar en avión comercial','11','O3Y8Z64D3U','I96ICE30U7');
insert into prueba_individual values ('03','04-01-2019','Sala Montaña','Escalar una montaña','7','O3Y8Z64D3U','I96ICE30U7');
insert into prueba_individual values ('04','07-01-2019','Sala Gimnasio','Hacer el pino','32','O3Y8Z64D3U','I96ICE30U7');

insert into prueba_individual values ('01','11-01-2019','Sala flor','Identificar flores','55','W5F0S3BEWA','9C2JA0T52E');

insert into prueba_individual values ('01','23-06-2019','Sala Sala','Ordenar lacasitos','76','CBT1TOLBYS','UCCD1YTVVJ');
insert into prueba_individual values ('02','22-06-2019','Sala Canina','Adiestrar a 100 perros','19','CBT1TOLBYS','UCCD1YTVVJ');
insert into prueba_individual values ('03','21-04-2019','Sala Gimnasio','Sostener un vaso','78','CBT1TOLBYS','UCCD1YTVVJ');
insert into prueba_individual values ('04','26-04-2019','Sala Tarro','Abrir un tarro','666','CBT1TOLBYS','UCCD1YTVVJ');

insert into prueba_individual values ('01','30-11-2019','Sala Cocina','Preparar un sandwitch','90','AB0WQYBN4X','QF8BYWIQFU');
insert into prueba_individual values ('02','14-03-2019','Sala Isla','Preparar una boda','45','AB0WQYBN4X','QF8BYWIQFU');
insert into prueba_individual values ('03','16-12-2019','Sala edificio','Lamerse el codo','3','AB0WQYBN4X','QF8BYWIQFU');
insert into prueba_individual values ('04','19-12-2019','Sala Montaña','Jugar a los dardos','21','AB0WQYBN4X','QF8BYWIQFU');

insert into prueba_individual values ('01','10-11-2019','Sala Aula','Describir un casting','15','G5R4P3UUOR','QF8BYWIQFU');
insert into prueba_individual values ('02','23-10-2019','Sala Aula','Inventarse un casting','75','G5R4P3UUOR','QF8BYWIQFU');

insert into prueba_individual values ('01','26-05-2019','Sala ????','????','23','RGDUDTA2K2','ZQ8IT7ABC7');
insert into prueba_individual values ('02','20-07-2019','Sala Aula','Hacer un ensayo sin aburrir a nadie','66','RGDUDTA2K2','ZQ8IT7ABC7');
insert into prueba_individual values ('03','30-10-2019','Sala Voz','Tocar la bateria del reves','88','RGDUDTA2K2','ZQ8IT7ABC7');

insert into prueba_individual values ('01','31-07-2019','Sala Voz','Cantar Heavy Metal','77','OVR1LWY1CJ','HK328Z8E63');
insert into prueba_individual values ('01','31-08-2019','Sala flor','Maquillarse como una flor','250','U1N2IG6SOQ','9ETDJDGZOC');
insert into prueba_individual values ('01','22-08-2019','Sala Edificio','Escapar de un edificio en llamas','300','B9UE2FQP2M','ZDI2J077V0');

insert into prueba_individual values ('01','01-09-2019','Sala Biblioteca','Leerse el señor de los anillos','400','LMBJHFWLQE','ZDI2J077V0');
insert into prueba_individual values ('02','15-06-2019','Sala Aula','Dormir','110','LMBJHFWLQE','ZDI2J077V0');
insert into prueba_individual values ('03','12-05-2019','Sala Piscina','Cruzar el oceano Atlantico a nado ','105','LMBJHFWLQE','ZDI2J077V0');

insert into prueba_individual values ('01','14-01-2019','Sala Aula','Terminar un proyecto de base de datos','56','OMP7H7EM5D','ILBNLLC6TW');
insert into prueba_individual values ('01','19-03-2019','Sala Biblioteca','Contar hasta 300','77','EGOOS4JNFU','RQ3TCC0MTS');

-- Inserts representante
INSERT INTO representante VALUES ('80534731R', 'Alberto', '674761306', '4857 Klocko Plaza');
INSERT INTO representante VALUES ('39168063Y', 'Julia', '956055123', '1777 Stehr Divide');
INSERT INTO representante VALUES ('12102279R', 'Ricardo', '685290866', '4013 Reichert Mission');
INSERT INTO representante VALUES ('54365748G', 'Maria', '685629484', '617 Swaniawski Camp');
INSERT INTO representante VALUES ('94831235G', 'Carlos', '608303524', '159 Shields Island');
INSERT INTO representante VALUES ('29525765K', 'Juan', '674761306', '158 Shields Island');
INSERT INTO representante VALUES ('32090069D', 'Pepe', '996061073', '67637 Dibbert Haven');
INSERT INTO representante VALUES ('70081709L', 'Sara', '689516452', '4993 Gleason Harbors');
INSERT INTO representante VALUES ('80270025W', 'Wilson', '661713946', '476 Wilderman Ville');
INSERT INTO representante VALUES ('11735828D', 'Arturo', '689573469', '2594 Frami Loop');
--Inserts perfil
INSERT INTO perfil VALUES ('4FH8OJER99', 'Girona', 'M', '184', '25', 'Castaño', 'Castaños', 'Actor', TRUE);
INSERT INTO perfil VALUES ('QAU8GWQRXD', 'Madrid', 'F', '176', '20', 'Rubio', 'Verdes', 'Modelo', FALSE);
INSERT INTO perfil VALUES ('F1SHWOI1FX', 'La Rioja', 'F', '193', '48', 'Pelirojo', 'Castaños', 'Actor', TRUE);
INSERT INTO perfil VALUES ('KPW6TUZKDQ', 'Soria', 'M', '157', '16', 'Negro', 'Azules', 'Modelo', TRUE);
INSERT INTO perfil VALUES ('29TO6C7ALK', 'Guadalajara', 'N', '174', '19', 'Castaño', 'Castaños', 'Actor', FALSE);
INSERT INTO perfil VALUES ('ZFMIOI42PS', 'Madrid', 'N', '154', '64', 'Rubio', 'Verdes', 'Actor', FALSE);
INSERT INTO perfil VALUES ('55GH5Y203E', 'Barcelona', 'F', '169', '87', 'Rubio', 'Azules', 'Modelo', TRUE);
INSERT INTO perfil VALUES ('J4R9OQEUW3', 'Lugo', 'M', '201', '30', 'Pelirojo', 'Castaños', 'Modelo', FALSE);
INSERT INTO perfil VALUES ('DD1IYABIES', 'Guadalajara', 'F', '143', '56', 'Negro', 'Castaños', 'Actor', TRUE);
INSERT INTO perfil VALUES ('5R71U58U1Z', 'Murcia', 'M', '188', '17', 'Castaño', 'Azules', 'Modelo', TRUE);
--Inserts candidato

INSERT INTO candidatos VALUES ('4QU32DOAEZ', 'Antonio', '125 Morar Gateway', '945828318', '11/02/1995', NULL, '4FH8OJER99');
INSERT INTO candidatos VALUES ('NK9IRY891Y', 'Alba', '312 Winnifred Prairie', '690227262', '27/01/2000', NULL, 'J4R9OQEUW3');
INSERT INTO candidatos VALUES ('TZCCRGP35Y', 'Isabel', '3616 Tremblay Creek', '630118643', '17/03/2000', NULL, 'QAU8GWQRXD');
INSERT INTO candidatos VALUES ('EWXLXMLBEW', 'Yolanda', '1590 Meagan Islands', '903314681', '22/04/1972', '80534731R', '55GH5Y203E');
INSERT INTO candidatos VALUES ('CPPCIOQ8L0', 'Clara', '55249 Schumm Fort', '969428568', '02/08/1972', '80534731R', 'F1SHWOI1FX');
INSERT INTO candidatos VALUES ('A5PID5RX9Z', 'Fernando', '21044 Marvin Mills', '669478568', '14/08/2004', '29525765K', 'KPW6TUZKDQ');
INSERT INTO candidatos VALUES ('SJ1Q6TM842', 'Antonio', '32200 Rath Fork', '626307674', '18/10/2001', '29525765K', '29TO6C7ALK');
INSERT INTO candidatos VALUES ('770C6RCUSM', 'Aurelio', '52948 Hodkiewicz Key', '626375542', '13/07/1956', '11735828D', 'ZFMIOI42PS');
INSERT INTO candidatos VALUES ('0GMYVXM68R', 'Andrea', '317 Margarete Extensions', '944288632', '07/12/1964', '80270025W', 'DD1IYABIES');
INSERT INTO candidatos VALUES ('I2ZPQSTI3X', 'Miguel', '461 Jedediah Ranch', '685921952', '26/11/2003', '70081709L', '5R71U58U1Z');
--Inserts niño
INSERT INTO niño VALUES ('Pepita', 'I2ZPQSTI3X');
INSERT INTO niño VALUES ('Juan', 'A5PID5RX9Z');
--Inserts adultos
INSERT INTO adultos VALUES ('39790452S', '4QU32DOAEZ');
INSERT INTO adultos VALUES ('62598751L', 'NK9IRY891Y');
INSERT INTO adultos VALUES ('49671721R', 'TZCCRGP35Y');
INSERT INTO adultos VALUES ('66804762C', 'EWXLXMLBEW');
INSERT INTO adultos VALUES ('12307372A', 'CPPCIOQ8L0');
INSERT INTO adultos VALUES ('82551800Q', 'SJ1Q6TM842');
INSERT INTO adultos VALUES ('70374864Q', '770C6RCUSM');
INSERT INTO adultos VALUES ('36010008N', '0GMYVXM68R');
--Insert casting_necesita_perfil
INSERT INTO casting_necesita_perfil VALUES ('ILBNLLC6TW', '4FH8OJER99');
INSERT INTO casting_necesita_perfil VALUES ('RQ3TCC0MTS', 'QAU8GWQRXD');
INSERT INTO casting_necesita_perfil VALUES ('I96ICE30U7', '55GH5Y203E');
INSERT INTO casting_necesita_perfil VALUES ('9C2JA0T52E', 'J4R9OQEUW3');
INSERT INTO casting_necesita_perfil VALUES ('QF8BYWIQFU', 'DD1IYABIES');
INSERT INTO casting_necesita_perfil VALUES ('ZQ8IT7ABC7', '55GH5Y203E');
INSERT INTO casting_necesita_perfil VALUES ('HK328Z8E63', '5R71U58U1Z');
INSERT INTO casting_necesita_perfil VALUES ('9ETDJDGZOC', 'ZFMIOI42PS');
INSERT INTO casting_necesita_perfil VALUES ('ZDI2J077V0', 'QAU8GWQRXD');
INSERT INTO casting_necesita_perfil VALUES ('T9HKMMPL3X', '4FH8OJER99');
INSERT INTO casting_necesita_perfil VALUES ('JZ8BU8Z15Y', 'F1SHWOI1FX');
INSERT INTO casting_necesita_perfil VALUES ('AA3KB6F1VQ', 'KPW6TUZKDQ');
INSERT INTO casting_necesita_perfil VALUES ('QOBB2CQ13E', '29TO6C7ALK');
INSERT INTO casting_necesita_perfil VALUES ('L7XKK57LFX', '29TO6C7ALK');
INSERT INTO casting_necesita_perfil VALUES ('UCCD1YTVVJ', '4FH8OJER99');

--Insert candidato_realiza_prueba
insert into candidato_realiza_prueba values ('4QU32DOAEZ','01','QE04G16CET','ILBNLLC6TW','TRUE');
insert into candidato_realiza_prueba values ('4QU32DOAEZ','02','QE04G16CET','ILBNLLC6TW','TRUE');
insert into candidato_realiza_prueba values ('4QU32DOAEZ','03','QE04G16CET','ILBNLLC6TW','TRUE');
insert into candidato_realiza_prueba values ('4QU32DOAEZ','04','QE04G16CET','ILBNLLC6TW','TRUE');

insert into candidato_realiza_prueba values ('TZCCRGP35Y','01','SYO393AGH0','RQ3TCC0MTS','FALSE');
insert into candidato_realiza_prueba values ('TZCCRGP35Y','02','SYO393AGH0','RQ3TCC0MTS','TRUE');

insert into candidato_realiza_prueba values ('EWXLXMLBEW','02','NB8J3LKLN0','I96ICE30U7','FALSE');
insert into candidato_realiza_prueba values ('EWXLXMLBEW','01','NB8J3LKLN0','I96ICE30U7','FALSE');

insert into candidato_realiza_prueba values ('NK9IRY891Y','01','W5F0S3BEWA','9C2JA0T52E','TRUE');

insert into candidato_realiza_prueba values ('0GMYVXM68R','01','G5R4P3UUOR','QF8BYWIQFU','TRUE');
insert into candidato_realiza_prueba values ('0GMYVXM68R','02','G5R4P3UUOR','QF8BYWIQFU','TRUE');

insert into candidato_realiza_prueba values ('0GMYVXM68R','01','RGDUDTA2K2','ZQ8IT7ABC7','FALSE');
insert into candidato_realiza_prueba values ('0GMYVXM68R','02','RGDUDTA2K2','ZQ8IT7ABC7','TRUE');
insert into candidato_realiza_prueba values ('0GMYVXM68R','03','RGDUDTA2K2','ZQ8IT7ABC7','FALSE');

insert into candidato_realiza_prueba values ('I2ZPQSTI3X','01','OVR1LWY1CJ','HK328Z8E63','TRUE');
insert into candidato_realiza_prueba values ('770C6RCUSM','01','U1N2IG6SOQ','9ETDJDGZOC','FALSE');


insert into candidato_realiza_prueba values ('TZCCRGP35Y','01','LMBJHFWLQE','ZDI2J077V0','FALSE');
insert into candidato_realiza_prueba values ('TZCCRGP35Y','02','LMBJHFWLQE','ZDI2J077V0','FALSE');
insert into candidato_realiza_prueba values ('TZCCRGP35Y','03','LMBJHFWLQE','ZDI2J077V0','FALSE');
