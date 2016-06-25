select * 
from comprashechas

INSERT INTO comprashechas (articulo,categoria,fecha, preciounidad,cantidadcomprada,tienda) 
VALUES('polvos', 'aseo','2016-06-9','12.000','1','MERK-DURACION S.A.S (PLAZA DE FLORES) ')

####################
### IMPORTANTE #####

# Obtener la fecha y hora en MYSQL
select now()  #   ejemplo:  '2010-01-12 10:50:43'

#Otener solo dia mes y año en MYSQL

select CURDATE()  # ejemplo: '2010-01-12'  #sin hora

#DATE_ADD() y DATE_SUB(): Para sumar y restar fechas respectivamente.

select CURTIME() nos devuelve la hora actual en el formato HH:M:SS.

# tutorial completo de fechas en mysql  http://www.cristalab.com/tutoriales/fechas-con-mysql-c84136l/


#consultar valor que esta dentro del intervalo en el dia de hoy
SELECT *
FROM comprashechas 
WHERE date(fecha) = date(now())

#consultar valor que esta dentro del intervalo de ayer

SELECT * 
FROM comprashechas 
WHERE fecha = DATE_SUB(CONCAT(CURDATE(), ' 00:00:00'), INTERVAL 1 DAY)

#consultar valor que esta dentro del intervalo de antier

SELECT * 
FROM comprashechas 
WHERE fecha = DATE_SUB(CONCAT(CURDATE(), ' 00:00:00'), INTERVAL 2 DAY)


#consultar valor que esta dentro del intervalo en los ultimos 3 dias de la semana 

SELECT *
FROM comprashechas 
WHERE date_sub(curdate(), interval 3 day ) <= fecha 

#consultar valor que esta dentro del intervalo en los ultimos 7 dias de la semana
SELECT *
FROM comprashechas 
WHERE date_sub(curdate(), interval 7 day ) <= fecha

#consultar valor que esta dentro del intervalo en los ultimos 15 dias de la semana 

SELECT *
FROM comprashechas 
WHERE date_sub(curdate(), interval 15 day ) <= fecha

#consultar valor que esta dentro del intervalo en los ultimos 20 dias de la semana 

SELECT *
FROM comprashechas 
WHERE date_sub(curdate(), interval 20 day ) <= fecha

#consultar valor que esta dentro del intervalo en el ultimo mes

#en php  http://www.lawebdelprogramador.com/foros/PHP/1397786-Consultas-por-mes-en-una-base-de-datos-mysql-php.html
SELECT *
FROM comprashechas 
WHERE MONTH(fecha) = MONTH(DATE_ADD(CURDATE(),INTERVAL -1 MONTH))

# consultar valor que se encuentra a partir de hoy en el mes siguiente osea los proximos 30 dias.  

SELECT *
FROM comprashechas
WHERE fecha >= curdate()
AND fecha <= DATE_ADD(curdate(), INTERVAL 30 day) 
order by fecha ASC

#consultar valor que esta dentro del intervalo en los ultimos 2 meses
SELECT *
FROM comprashechas 
WHERE MONTH(fecha) = MONTH(DATE_ADD(CURDATE(),INTERVAL -2 MONTH))

SELECT *
FROM comprashechas
WHERE fecha <= DATE_ADD(curdate(), INTERVAL -30 day) 
order by fecha ASC

SELECT *
FROM comprashechas
WHERE fecha <= DATE_ADD(curdate(), INTERVAL -2 MONTH) 
order by fecha ASC

SELECT *
FROM comprashechas
WHERE fecha <= DATE_ADD(curdate(), INTERVAL -1 MONTH) 
order by fecha ASC

SELECT * 
FROM comprashechas
WHERE (DATE_ADD( fecha, INTERVAL 1 MONTH ) < CURDATE( ) )

# consultar valor que esta dentro del intervalo en los ultimos 12 meses 

SELECT * 
FROM comprashechas 
WHERE fecha >= date_sub(curdate(), interval 12 month) 
order by fecha ASC

#consulta por dias

SELECT * 
FROM comprashechas 
WHERE day(fecha) = 9

#consulta por mes 

SELECT * 
FROM comprashechas 
WHERE month(fecha) = 5

#consulta por año

SELECT * 
FROM comprashechas 
WHERE year(fecha) = 2016


#concatenar

SELECT CONCAT_WS(", ", articulo, preciounidad) AS "compra"
FROM comprashechas;






















