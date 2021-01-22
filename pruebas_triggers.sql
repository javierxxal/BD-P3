-- Pruebas de triggers
-- Prueba de trigger 1: calcular importe total de un candidato 
-- Observar
select codigo_candidato, sum(coste) as dinero_a_pagar
from candidato_realiza_prueba inner join prueba_individual
on prueba_individual.numero = candidato_realiza_prueba.numero and
prueba_individual.codigo_fase = candidato_realiza_prueba.codigo_fase and
prueba_individual.codigo_casting = candidato_realiza_prueba.codigo_casting
group by codigo_candidato;

delete from candidato_realiza_prueba where codigo_candidato = 'I2ZPQSTI3X' and numero = '2'
insert into candidato_realiza_prueba values('I2ZPQSTI3X', '2', 'LMBJHFWLQE', 'ZDI2J077V0', 'FALSE');
select * from candidato_realiza_prueba