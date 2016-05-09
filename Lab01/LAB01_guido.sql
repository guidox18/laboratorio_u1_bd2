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
/*Actividad NÂ° 02 
â€“ Reconociendo la estructura*/
/*2.El departamento de Recursos Humanos 
requiere un reporte que muestre los campos: 
employee_id, last_name y job_id, asicomo el 
campo hire_date con el alias StartDate.*/

SELECT EMPLOYEE_ID,LAST_NAME, JOB_ID, HIRE_DATE as 'StartDate' 
FROM HR.EMPLOYEES;

/*3.Finalmente el departamento de Recursos Humanos 
requiere un listado de todos valores del campo JOB_ID 
de la tabla EMPLOYEES pero que se muestren de forma 
Ãºnica y no repetida*/

SELECT DISTINCT JOB_ID FROM HR.EMPLOYEES;


/*Actividad NÂ° 03 
â€“ Consultas BÃ¡sicas*/
/*1.El departamento de Recursos Humanos requiere 
ampliar el reporte anterior (2.2) para hacerlo mÃ¡s 
comprensible, por lo que se requiere que los encabezados 
de las columnas sean: Emp NÂ°, Empleado, Puesto y Fecha ContrataciÃ³n.*/
SELECT EMPLOYEE_ID as 'Emp NÂº',LAST_NAME as 'Empleado', JOB_ID as 'Puesto', HIRE_DATE as 'Fecha ContrataciÃ³n' 
FROM HR.EMPLOYEES;

/*2.Adicionalmente el departamento de Recursos Humanos
 requiere un reporte mÃ¡s sencillo, en el que se muestre 
 los campos: last_name y job_id en una sola y Ãºnica columna 
 (los datos deben estar separados por una coma) que tenga
 como alias Empleado y Puesto.*/
SELECT (LAST_NAME + ', ' + JOB_ID) As 'Empleado y Puesto' FROM HR.EMPLOYEES

/*3.Finalmente a modo de prÃ¡ctica, realizar una consulta 
que muestre todos los campos de la tabla EMPLOYEES, en una 
sola y Ãºnica columna, los datos deben estar separados por 
una coma y la columna debe tener como encabezado Los Empleados*/

SELECT (FIRST_NAME + ', ' + LAST_NAME+ ', ' + EMAIL + ', ' 
+PHONE_NUMBER + ', ' + CONVERT(varchar(10), HIRE_DATE) + ', ' + JOB_ID + ', ' + CONVERT(varchar(10), SALARY)+ ', ' 
+  CONVERT(varchar(10), COMMISSION_PCT)+ ', ' +  CONVERT(varchar(10), MANAGER_ID) + ', ' + DEPARTMENT_ID) As 'Los Empleados' FROM HR.EMPLOYEES


<<<<<<< HEAD
/*Actividad N° 04 
–Restricción y Ordenamiento*/
/*1.Debido a problemas con el presupuesto, el departamento de Recursos Humanos requiere un reporte que muestre los apellidos (last_name) y 
salarios (salary) de todos los empleados que ganen más de $ 12,000.*/
Select LAST_NAME,SALARY FROM HR.EMPLOYEES WHERE SALARY< 12000

/*2.Asimismo  se  requiere  realizar una  consulta  que  muestre  los  apellidos  (last_name)  y  el 
número de departamento (department_id) para los empleados que tengan numero (employee_id) 176.*/
Select LAST_NAME, DEPARTMENT_ID from HR.EMPLOYEES WHERE EMPLOYEE_ID =176

/*3.El departamento de Recursos Humanos necesita determinar los mayores y menores sueldos, modificar 
la consulta del ítem 4.1. para mostrar el apellido y salario de cada empleado cuyo sueldo no esté en el rango de $ 5,000 a $ 12,000*/

--falta corregir
SELECT DISTINCT LAST_NAME,
        MIN(SALARY)  AS MinSalary
       , MAX(SALARY) AS MaxSalary
FROM HR.EMPLOYEES 
group by EMPLOYEE_ID
having SALARY not between 5000 and 12000;
go

/*4.Crear  un  reporte  que muestre  los  apellidos  (last_name),  puesto  (job_id)  y  fecha  de  contratación (hire_date), de los empleados 
que apellidan ‘Matos’ y ‘Taylor’, asimismo presentar el reporte ordenado ascendentemente por fecha de contratación*/
Select Last_Name, job_id, hire_date from HR.EMPLOYEES
WHERE LAST_NAME= 'Matos' and LAST_NAME = 'Taylor';
go

/*5.Mostrar los apellidos (last_name) y número de departamento (departamento_id) de todos los empleados que pertenezcan a los departamentos 
20 o 50 en orden alfabético ascendente por el apellido.*/
select last_name, department_id from HR.EMPLOYEES 
WHERE DEPARTMENT_ID=20 OR DEPARTMENT_ID= 50
ORDER BY LAST_NAME asc;

/*6.Modificar el reporte del ítem 4.1. para mostrar los apellidos y salarios de los empleados que teng
an un salario entre los $ 5,000 a $ 12,000 y pertenezcan a los números de departamento 20 o 50. Asimismo 
etiquetar las cabeceras de los resultados con los alias Empleado y Salario Mensual  respectivamente.*/


/*7.El  departamento  de  Recursos  Humanos  necesita  un  listado  de  apellidos  (last_name)  y  fecha  de contratación (hire_date) de 
todos los empleados que fueron contratados el año 1994.*/
select last_name, hire_date from HR.EMPLOYEES 
where HIRE_DATE = CONVERT(varchar(20),getdate(),1994),

/*8.Crear un reporte que muestre los apellidos (last_name) y puesto (job_id) de todos los empleados que no tengan un administrador (manager).*/
select last_name, job_id from hr.EMPLOYEES
where MANAGER_ID is null;

/*9.Crear   un   reporte   para   mostrar   los   apellidos   (last_name),   salario   (salary)   y   %   de   comisión 
(commission_pct). Ordenar los datos por salario y comisión de manera descendente, utilizar la opción numérica de la 
cláusula ORDER BY.*/


/*10.El personal del  departamento  de  Recursos Humanos desea tener mayor  flexibilidad con  los reportes hechos. Por ejemplo se requiere 
un reporte de los apellidos (last_name) y salarios (salary) de todos los empleados que tengan un salario mayor a un monto que el personal 
de Recursos Humanos ingresará. Probar con el valor $ 12,000*/

/*11.El  departamento  de  Recursos  Humanos  requiere  extraer  reporte  basados  en  el  Administrador (manager_id). Se requiere 
crear una consulta que pregunte al usuario por el Administrador (manager_id) y  genere  un reporte  con  los  números  de  empleado  (employee_id),  
apellidos  (last_name),  salarios (salary)  y  numero  de  departamento  de  los  empleados  que  este  Administrador  tiene  a  su  cargo. 
Adicionalmente también se desea tener la habilidad de ordenar este reporte en base a una determinada columna. Probar con los siguientes valores:
Administrador (manager_id) = 103, ordenado por Apellido (last_name)
Administrador (manager_id) = 201, ordenado por Salario (salary)
Administrador (manager_id) = 124, ordenado por N° de Empleado (employee_id)*/

/*12.Generar un listado de apellidos (last_name) de todos los empleados que tengan la letra ‘a’ en la tercera 
letra de su apellido.*/

/*13.Mostrar los apellidos (last_name) de todos los empleados que tengan tanto la letra ‘a’ como la letra ‘e’ 
en su apellido.*/

/*14.Mostrar los apellidos (last_name), puestos (job_id) y salario (salary) de todos los empleados que sean 
Representantes de Ventas (SA_REP) o Responsables de Inventario (ST_CLERK) y cuyos salarios no 
sean iguales a $ 2,500, $ 3,500 o $ 7,000.*/

/*15.Modificar el reporte del ítem 4.6 y mostrar adicionalmente los datos de comisión (commission_pct) de 
todos los empleados que solamente el 20% de comisión.*/

/*Actividad N° 05 
– Funciones*/
=======
/*Actividad NÂ° 05 
â€“ Funciones*/
>>>>>>> origin/master
/*1.Se requiere realizar una consulta que visualice la fecha del sistema.*/
Select GETDATE()

/*2.El departamento de Recursos Humanos necesita un reporte de todos los empleados que muestre 
el NÂ° de Empleado,  Apellidos, Salario y una columna mÃ¡s con el cÃ¡lculo del salario incrementado en 15.5% 
(expresado solo en enteros) esta columna debe etiquetarse Nuevo Salario. */
SELECT 
EMPLOYEE_ID as 'NÂº de empleado'
,LAST_NAME as 'Apellidos'
,SALARY as 'Salario'
,CONVERT(integer, SALARY + (15.5 * SALARY / 100 ))  as 'Nuevo Salario' 
FROM HR.EMPLOYEES

/*3.Modificar  la  consulta  anterior  y  adicionar  una  columna  que  
muestre  el  resultado  de  la  resta  entre  el antiguo salario y el 
nuevo salario. Etiquetar esta columna como Incremento.*/
SELECT 
EMPLOYEE_ID as 'NÂº de empleado'
,LAST_NAME as 'Apellidos'
,SALARY as 'Salario'
,CONVERT(integer, SALARY + (15.5 * SALARY / 100 ))  as 'Nuevo Salario' 
,CONVERT(integer, SALARY - (SALARY + (15.5 * SALARY / 100 )))  as 'Incremento' 
FROM HR.EMPLOYEES
/*4.Crear  un  reporte  que  muestre  los  Apellidos  (con  la  primera  letra  en  MayÃºsculas  y  las  demÃ¡s  en 
MinÃºsculas)  y  la  longitud  de  los  apellidos  (colocar  alias  Longitud),  para  todos  aquellos  empleados 
quienes sus apellidos empiecen con las letras â€˜Jâ€™, â€˜Aâ€™ y â€˜Mâ€™. Ordenar los resultados por la columna 
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
SELECT LAST_NAME, DATEDIFF(MONTH, HIRE_DATE,GETDATE()) as 'Meses Trabajados' FROM HR.EMPLOYEES
Order BY 2


/*7.Crear una consulta que devuelva los Apellidos y Salarios de todos los 
empleados, Formatear la columna salario para que muestre 15 caracteres, 
completar con el símbolo ‘$’ los espacios previos al valor de la columna 
salario, ejemplo: $$$$$$$$$$10000. Etiquetar esta columna como Salario.*/
/*
SELECT last_name, LPAD(salary,15,'$') AS "SALARIO"
FROM employees;*/
SELECT LAST_NAME , REPLACE(SALARY,15,'$') AS "Salario" FROM HR.EMPLOYEES

SELECT 'Salario' = REPLACE(STR(SALARY, 10), SPACE(1), '$')  FROM HR.EMPLOYEES 

SELECT left(cast(SALARY as varchar(15))+replicate('0',10),10) as 'Salario' FROM HR.EMPLOYEES 

/*8.Crear  una  consulta  que  muestre  en  una  única  columna  los  primeros  8  caracteres  del  apellido  de  los 
empleados e indique sus salarios representados por asteriscos (‘*’), cada asterisco representa el valor 1000.  
Ordenar  el  listado  por  el  salario  de  los  empleados.  Asimismo  Etiquetar  la  columna  como 
‘Empleados y sus Salarios’*/

SELECT SUBSTRING(LAST_NAME,1,8) as 'Empleados y sus Salarios' FROM HR.EMPLOYEES;

SELECT SUBSTRING(LAST_NAME,1,8) + REPLACE(' ' , SALARY/1000+1,'*') as 'Empleados y sus Salarios' FROM HR.EMPLOYEES;

/*9.Finalmente  crear  una  consulta  que  muestre  los  Apellidos  de  los  
empleados  y  el  N°  de  Semanas Empleado hasta la actualidad para todos los
empleados del departamento N° 90, truncar el número de semanas  a  sin  decimales.  
Ordenar  el  resultado  por  el  N°  de  Semanas  y  etiquetar  la  columna  como 
tenencia.*/

SELECT 
LAST_NAME as Empleados
, CONVERT(integer, DATEDIFF(WEEK, HIRE_DATE,GETDATE()))  as 'tenencia' 
FROM HR.EMPLOYEES
WHERE DEPARTMENT_ID = 1

;
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
    );
*/