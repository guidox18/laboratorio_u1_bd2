use HumanResource
/*

CREATE TABLE HR.EMPLOYEES 
    ( 
     EMPLOYEE_ID INT   NOT NULL , --!identity 
     FIRST_NAME VARCHAR (20) , --!identity 
     LAST_NAME VARCHAR (25)  NOT NULL , --!identity 
     EMAIL VARCHAR (25)  NOT NULL , 
     PHONE_NUMBER VARCHAR (20) , 
     HIRE_DATE DATETIME  NOT NULL , 
     JOB_ID VARCHAR (10)   NOT NULL , --!identity 
     SALARY DECIMAL (8,2) , 
     COMMISSION_PCT DECIMAL (2,2) , 
     MANAGER_ID INT , --!identity 
     DEPARTMENT_ID SMALLINT   --!identity 
    ) 
;

*/

/*Actividad 1 - Revision de Sintaxis*/
/*1 Error porque HR.employess,el nombre de esa tabla no existe,  la solucion es :*/
SELECT last_name, job_id, salary AS Sal
FROM HR.employees;
/*2 No va a mostrar nada porque esa tabla no existe, la solucion es :*/
SELECT * FROM HR.job_grades;
/*3 Sale el error porque el campo sal no existe, y tambien por que el nombre de  la tabla h.employees
no existe, la solucion es :*/
SELECT * employee_id,last_name sal x 12 ANNUAL SALARY from HR.employess;


/*Actividad N° 02 
– Reconociendo la estructura*/
/*2.El departamento de Recursos Humanos 
requiere un reporte que muestre los campos: 
employee_id, last_name y job_id, asicomo el 
campo hire_date con el alias StartDate.*/

SELECT EMPLOYEE_ID,LAST_NAME, JOB_ID, HIRE_DATE as 'StartDate' 
FROM HR.EMPLOYEES;

/*3.Finalmente el departamento de Recursos Humanos 
requiere un listado de todos valores del campo JOB_ID 
de la tabla EMPLOYEES pero que se muestren de forma 
única y no repetida*/

SELECT DISTINCT JOB_ID FROM HR.EMPLOYEES;


/*Actividad N° 03 
– Consultas Básicas*/
/*1.El departamento de Recursos Humanos requiere 
ampliar el reporte anterior (2.2) para hacerlo más 
comprensible, por lo que se requiere que los encabezados 
de las columnas sean: Emp N°, Empleado, Puesto y Fecha Contratación.*/
SELECT EMPLOYEE_ID as "Emp Nº",LAST_NAME as "Empleado", JOB_ID as "Puesto", HIRE_DATE as "Fecha Contratación"
FROM HR.EMPLOYEES;

/*2.Adicionalmente el departamento de Recursos Humanos
 requiere un reporte más sencillo, en el que se muestre 
 los campos: last_name y job_id en una sola y única columna 
 (los datos deben estar separados por una coma) que tenga
 como alias Empleado y Puesto.*/
SELECT (LAST_NAME + ', ' + JOB_ID) As "Empleado y Puesto" FROM HR.EMPLOYEES

/*3.Finalmente a modo de práctica, realizar una consulta 
que muestre todos los campos de la tabla EMPLOYEES, en una 
sola y única columna, los datos deben estar separados por 
una coma y la columna debe tener como encabezado Los Empleados*/

SELECT (FIRST_NAME + ', ' + LAST_NAME+ ', ' + EMAIL + ', ' 
+PHONE_NUMBER + ', ' + CONVERT(varchar(10), HIRE_DATE) + ', ' + JOB_ID + ', ' + CONVERT(varchar(10), SALARY)+ ', ' 
+  CONVERT(varchar(10), COMMISSION_PCT)+ ', ' +  CONVERT(varchar(10), MANAGER_ID) + ', ' + DEPARTMENT_ID) As "Los Empleados" FROM HR.EMPLOYEES


/*Actividad N° 05 
– Funciones*/
/*1.Se requiere realizar una consulta que visualice la fecha del sistema.*/
Select GETDATE()

/*2.El departamento de Recursos Humanos necesita un reporte de todos los empleados que muestre 
el N° de Empleado,  Apellidos, Salario y una columna más con el cálculo del salario incrementado en 15.5% 
(expresado solo en enteros) esta columna debe etiquetarse Nuevo Salario. */
SELECT 
EMPLOYEE_ID as "Nº de empleado"
,LAST_NAME as "Apellidos"
,SALARY as "Salario"
,CONVERT(integer, SALARY + (15.5 * SALARY / 100 ))  as "Nuevo Salario"
FROM HR.EMPLOYEES

/*3.Modificar  la  consulta  anterior  y  adicionar  una  columna  que  
muestre  el  resultado  de  la  resta  entre  el antiguo salario y el 
nuevo salario. Etiquetar esta columna como Incremento.*/
SELECT 
EMPLOYEE_ID as "Nº de empleado"
,LAST_NAME as "Apellidos"
,SALARY as "Salario"
,CONVERT(integer, SALARY + (15.5 * SALARY / 100 ))  as "Nuevo Salario"
,CONVERT(integer, SALARY - (SALARY + (15.5 * SALARY / 100 )))  as "Incremento" 
FROM HR.EMPLOYEES
/*4.Crear  un  reporte  que  muestre  los  Apellidos  (con  la  primera  letra  en  Mayúsculas  y  las  demás  en 
Minúsculas)  y  la  longitud  de  los  apellidos  (colocar  alias  Longitud),  para  todos  aquellos  empleados 
quienes sus apellidos empiecen con las letras ‘J’, ‘A’ y ‘M’. Ordenar los resultados por la columna 
Apellido.*/
SELECT 
CONCAT(
	UPPER(LEFT(FIRST_NAME,1))
	,LOWER(SUBSTRING(FIRST_NAME,2,null))) as Apellidos 
	,LEN(FIRST_NAME) as Longitud
FROM  HR.EMPLOYEES
WHERE
	LEFT(FIRST_NAME,1) = 'J' or
	LEFT(FIRST_NAME,1) = 'A'  or 
	LEFT(FIRST_NAME,1) = 'M' 
ORDER BY FIRST_NAME 

/*5.Modificar la consulta anterior a fin de que consulte primero al usuario con que letra empieza el apellido 
a  buscar.  Considerar  que  no  importa  si  la  letra  esta  mayúscula  o  minúscula  de  igual  manera  debe 
mostrar los resultados.*/
CREATE PROCEDURE ConsultaApellidos
    @letra varchar(25)
AS 
    SELECT 
	CONCAT(UPPER(LEFT(FIRST_NAME,1)),
	LOWER(SUBSTRING(FIRST_NAME,2,null))) as Apellidos 
	,LEN(FIRST_NAME) as Longitud
	FROM  HR.EMPLOYEES
	WHERE
		LEFT(FIRST_NAME,1) LIKE '%'+@letra+'%' 
	ORDER BY FIRST_NAME 
GO

/*6. El  departamento  de  Recursos  Humanos  la  duración  o  
tiempo  de  permanencia  de  cada  empleado, mostrar  el  Apellido
y  el  calculo  del  número  de  meses  entre  la  fecha  de  hoy
y  la  fecha  en  que  fue contratado el empleado,  Etiquetar la 
columna como Meses Trabajados, ordenar los resultados por el resultado de 
los números de meses, Redondear el número de meses al entero más cercano*/
SELECT LAST_NAME, DATEDIFF(MONTH, HIRE_DATE,GETDATE()) as "Meses Trabajados" FROM HR.EMPLOYEES
Order BY 2


/*7.Crear una consulta que devuelva los Apellidos y Salarios de todos los 
empleados, Formatear la columna salario para que muestre 15 caracteres, 
completar con el símbolo ‘$’ los espacios previos al valor de la columna 
salario, ejemplo: $$$$$$$$$$10000. Etiquetar esta columna como Salario.*/
/*
SELECT last_name, LPAD(salary,15,'$') AS "SALARIO"
FROM employees;*/
SELECT LAST_NAME , REPLACE(SALARY,15,'$') AS "Salario" FROM HR.EMPLOYEES

SELECT "Salario" = REPLACE(STR(SALARY, 10), SPACE(1), '$')  FROM HR.EMPLOYEES 

SELECT left(cast(SALARY as varchar(15))+replicate('0',10),10) as "Salario" FROM HR.EMPLOYEES 

/*8.Crear  una  consulta  que  muestre  en  una  única  columna  los  primeros  8  caracteres  del  apellido  de  los 
empleados e indique sus salarios representados por asteriscos (‘*’), cada asterisco representa el valor 1000.  
Ordenar  el  listado  por  el  salario  de  los  empleados.  Asimismo  Etiquetar  la  columna  como 
‘Empleados y sus Salarios’*/

SELECT SUBSTRING(LAST_NAME,1,8) as "Empleados y sus Salarios" FROM HR.EMPLOYEES;

SELECT SUBSTRING(LAST_NAME,1,8) + REPLACE(' ' , SALARY/1000+1,'*') as "Empleados y sus Salarios" FROM HR.EMPLOYEES;

/*9.Finalmente  crear  una  consulta  que  muestre  los  Apellidos  de  los  
empleados  y  el  N°  de  Semanas Empleado hasta la actualidad para todos los
empleados del departamento N° 90, truncar el número de semanas  a  sin  decimales.  
Ordenar  el  resultado  por  el  N°  de  Semanas  y  etiquetar  la  columna  como 
tenencia.*/

SELECT 
LAST_NAME as Empleados
, CONVERT(integer, DATEDIFF(WEEK, HIRE_DATE,GETDATE()))  as "tenencia" 
FROM HR.EMPLOYEES
WHERE DEPARTMENT_ID = 1;






/*Actividad N° 07 – Funciones de Agrupación*/
/*1.El departamento de Recursos Humanos requiere un reporte que muestre el máximo, el
mínimo, la suma y el promedio de los salarios de todos los empleados, Etiquetar esta 
columnas como Máximo, Mínimo, Suma y Promedio respectivamente, Redondear estos valores 
a enteros sin decimales.*/
SELECT ROUND(MAX(SALARY),0) AS "Maximo" , ROUND(MIN(SALARY),0) AS "Minimo", ROUND(SUM(SALARY),0) AS "Sumatoria", ROUND(AVG(SALARY),0) AS "Promedio"
FROM HR.EMPLOYEES;

/*2.Modificar  la  consulta  anterior  para  mostrar  el  máximo,  mínimo,  suma  y  promedio  de  los  salarios  por 
cada Puesto de trabajo. */
SELECT ROUND(MAX(SALARY),0) AS "Maximo" , ROUND(MIN(SALARY),0) AS "Minimo", ROUND(SUM(SALARY),0) AS "Sumatoria", ROUND(AVG(SALARY),0) AS "Promedio"
FROM HR.EMPLOYEES
GROUP BY JOB_ID;

/*3.Realizar un reporte que muestre la cantidad de empleados por Puesto de trabajo. 
Con la opción de que el usuario pueda ingresar todos los puestos o uno solo.*/
SELECT COUNT(*)
FROM HR.EMPLOYEES
GROUP BY JOB_ID;

/*4.Determinar  el  número  de  Administradores  o  Supervisores  utilizar  la  columna  manager_id  para  esto. 
Etiquetar la columna como N° de Administradores*/
SELECT COUNT(DISTINCT MANAGER_ID) AS "Número de Administradores"
FROM HR.EMPLOYEES;

/*5.Encontrar la diferencia entre el máximo y mínimo salario de los empleados. Etiquetar la columna como Diferencia*/
SELECT (MAX(SALARY) - MIN(SALARY)) AS "diferencia"
FROM HR.EMPLOYEES;


/*6.Crear un reporte que muestre los N° de Administradores (manager_id) y el salario de su empleado peor 
pagado. Excluir a los empleados cuyo Administrador no se conozca. Excluir asimismo cualquier grupo 
cuyo  salario  mínimo  sea  $6000  o  menos.  Ordenar  los  resultados  por  el  mínimo  salario  en  forma 
descendente*/
SELECT MANAGER_ID ,SALARY
FROM  HR.EMPLOYEES
WHERE MANAGER_ID IS NOT NULL
GROUP BY MANAGER_ID
HAVING MIN(SALARY) &gt; 6000 
ORDER BY MIN(SALARY) DESC;

/*7.Crear una consulta que muestre el número total de empleados, así como el número total de empleados 
contratados en los años 1995, 1996, 1997 y 1998, etiquetar las columnas apropiadamente*/
SELECT COUNT(*) AS "Total" ,
SUM(DECODE(TO_CHAR(hire_date,'YYYY'),1995,1,0)) AS "1995" ,
SUM(DECODE(TO_CHAR(hire_date,'YYYY'),1996,1,0)) AS "1996" ,
SUM(DECODE(TO_CHAR(hire_date,'YYYY'),1997,1,0)) AS "1997" ,
SUM(DECODE(TO_CHAR(hire_date,'YYYY'),1998,1,0)) AS "1998"
FROM HR.EMPLOYEES;

/*8.Crear  una  consulta  matriz  que  muestre  el  puesto,  el  salario  por  cada  puesto  basado  en  el  N°  de 
Departamento del empleado y el total del salario para cada puesto para los departamento 20, 50, 80 y 90, colocar un nombre apropiado a cada columna.*/
SELECT JOB_ID,
SUM (DECODE(departament_id,20,salary)) AS "Departamento 20",
SUM (DECODE(departament_id,50,salary)) AS "Departamento 50",
SUM (DECODE(departament_id,80,salary)) AS "Departamento 80",
SUM (DECODE(departament_id,90,salary)) AS "Departamento 90",
SUM(SALARY) AS "Salario Total"
FROM HR.EMPLOYEES
GROUP BY JOB_ID;



/*Actividad N°  08– Enlaces*/
/*1.El departamento de Recursos Humanos requiere un reporte que muestre las direcciones de todos los 
departamentos.  Utilizar  las  tablas  LOCATIONS  y  COUNTRIES.  Mostrar  el  ID  de  la  Ubicación 
(location_id),  dirección  (street_address),  ciudad  (city),  estado  o  provincia  (state_province)  y  país 
(country_name). Utilizar NATURAL JOIN para producir el resultado*/




/*2.El  departamento  de  Recursos  Humanos  necesita  un  reporte  de  todos  empleados,  que  muestres  los 
apellidos   de   empleado   (last_name), el   n°   de   departamento   (department_id)   y   el   nombre   del 
departamento (depertment_date) al cual pertenece*/
SELECT e.last_name, d.departament_name
FROM HR.EMPLOYEES  e, departaments d
WHERE e.departament_id = d.departament_id
AND e.last_name LIKE '%a%';


/*3.El departamento de Recursos Humanos necesita un reporte de los empleados de la ciudad de Toronto. 
Mostrar los Apellidos, Puesto, N° de Departamento y 
Nombre de Departamento de todos los empleados 
que trabajan en Toronto.*/
SELECT e.last_name, e.job_id, d.DEPARTMENT_ID, d.departament_name
FROM HR.EMPLOYEES  e, departaments d, locations l
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID AND d.location_id = l.location_id
AND LOWER(l.city) = LOWER('Toronto');

/*4.Crear un reporte que muestre los Apellidos y N° de Identificación de los empleados, asimismo también 
debe mostrarse el Apellido y N° de Identificación de su Administrador.*/
SELECT e.last_name AS "Empleado" , e.employee_id AS "Emp#", a.last_name AS "Administrador", a.manager_id AS "Mgr#"
FROM HR.EMPLOYEES  e, managers a
WHERE e.manager_id = a.MANAGER_ID;


/*5.Modificar la consulta anterior para que incluya también a los empleados quienes no tienen Administrador 
asignado*/

/*6.Crear un reporte que muestre los N° de Departamento y Apellidos de todos los empleados, asimismo 
adicionar una columna con los Apellidos de todos emplea
dos que trabajan en el mismo departamento. 
Etiquetar esta columna como Colega.*/

/*7.El  departamento  de  Recursos  Humanos  requiere  un  reporte  de  todo  el  personal  que  fue  contratado 
después  del  empleado  apellidado  ‘Davies’.  Crear  un  reporte  que  muestre  el  apellid
os  y  fecha  de 
contratación de todo los empleados contratado después de ‘Davies’.*/



/*.8El departamento de Recursos Humanos requiere de un reporte que el apellido del empleado, fecha de 
contratación  del  empleado,  apellido  del  administrador,  fecha  de  contratación
del  administrador.  Para 
todos aquellos empleados que fueron contratados antes que sus Administradores.*/
