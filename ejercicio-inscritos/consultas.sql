--CONSULTAS
--¿Cuántos registros hay?
SELECT COUNT (*)
FROM INSCRITOS;

--Cantidad de inscritos
SELECT COUNT(*) AS total_inscritos
FROM INSCRITOS;

--Registros de mayor antigüedad
SELECT * FROM INSCRITOS
WHERE fecha = (SELECT MIN(fecha) FROM inscritos);

--Inscritos por día
SELECT fecha, COUNT (*) AS inscritos_por_dia
FROM INSCRITOS
GROUP BY fecha;

--Inscritos por fuente
SELECT fuente, COUNT(*) AS inscritos_por_fuente
FROM INSCRITOS
GROUP BY fuente;

--¿Qué día se inscribió la mayor cantidad de personas?
--Y ¿Cuántas personas se inscribieron en ese día?
SELECT fecha, COUNT(*) AS inscritos
FROM INSCRITOS
GROUP BY fecha
ORDER BY inscritos DESC
LIMIT 1;

--¿Qué día se inscribieron la mayor cantidad de personas utilizando el blog? ¿Cuántas
--personas fueron?
SELECT fecha, COUNT(*) AS inscritos
FROM INSCRITOS
WHERE fuente = 'Blog'
GROUP BY fecha
ORDER BY inscritos DESC
LIMIT 1;

--¿Cuál es el promedio de personas inscritas por día?
SELECT fecha,
AVG(cantidad) AS promedio_inscritos_diario
FROM INSCRITOS
GROUP BY fecha
ORDER BY fecha;

--¿Qué días se inscribieron más de 50 personas?
SELECT fecha, SUM(cantidad) AS total_inscritos
FROM inscritos
GROUP BY fecha
HAVING SUM(cantidad) > 50
ORDER BY fecha;