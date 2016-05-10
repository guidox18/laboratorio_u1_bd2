
/*Actividad N° 04 
–Restricción y Ordenamiento*/
/*1.Debido a problemas con el presupuesto, el departamento de Recursos Humanos requiere un reporte que muestre los apellidos (last_name) y 
salarios (salary) de todos los empleados que ganen más de $ 12,000.*/
Select LAST_NAME,SALARY FROM HR.EMPLOYEES WHERE SALARY< 12000

/*2.Asimismo  se  requiere  realizar una  consulta  que  muestre  los  apellidos  (last_name)  y  el 
número de departamento (department_id) para los empleados que tengan numero (employee_id) 176.*/
Select LAST_NAME, DEPARTMENT_ID from HR.EMPLOYEES WHERE EMPLOYEE_ID =176

/*3.El departamento de Recursos Humanos necesita determinar los mayores y menores sueldos, modificar 
la consulta del ítem 4.1. para mostrar el apellido y salario de cada empleado cuyo sueldo no esté en el rango de 
$ 5,000 a $ 12,000*/

--falta corregir
SELECT DISTINCT LAST_NAME
        ,MIN(SALARY)  AS MinSalary
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
select last_name, salary, commission_pct from hr.EMPLOYEES
order by salary ,COMMISSION_PCT desc;

/*10.El personal del  departamento  de  Recursos Humanos desea tener mayor  flexibilidad con  los reportes hechos. Por ejemplo se requiere 
un reporte de los apellidos (last_name) y salarios (salary) de todos los empleados que tengan un salario mayor a un monto que el personal 
de Recursos Humanos ingresará. Probar con el valor $ 12,000*/
declare @salario integer=12000;
select last_name, salary from hr.EMPLOYEES
where SALARY > @salario;

/*11.El  departamento  de  Recursos  Humanos  requiere  extraer  reporte  basados  en  el  Administrador (manager_id). Se requiere 
crear una consulta que pregunte al usuario por el Administrador (manager_id) y  genere  un reporte  con  los  números  de  empleado  (employee_id),  
apellidos  (last_name),  salarios (salary)  y  numero  de  departamento  de  los  empleados  que  este  Administrador  tiene  a  su  cargo. 
Adicionalmente también se desea tener la habilidad de ordenar este reporte en base a una determinada columna. Probar con los siguientes valores:
Administrador (manager_id) = 103, ordenado por Apellido (last_name)
Administrador (manager_id) = 201, ordenado por Salario (salary)
Administrador (manager_id) = 124, ordenado por N° de Empleado (employee_id)*/


/*12.Generar un listado de apellidos (last_name) de todos los empleados que tengan la letra ‘a’ en la tercera 
letra de su apellido.*/
select last_name from hr.EMPLOYEES
where LAST_NAME like '___a%'

/*13.Mostrar los apellidos (last_name) de todos los empleados que tengan tanto la letra ‘a’ como la letra ‘e’ 
en su apellido.*/
select last_name from hr.EMPLOYEES
where LAST_NAME like '%a%'and LAST_NAME like '%e%';

/*14.Mostrar los apellidos (last_name), puestos (job_id) y salario (salary) de todos los empleados que sean 
Representantes de Ventas (SA_REP) o Responsables de Inventario (ST_CLERK) y cuyos salarios no 
sean iguales a $ 2,500, $ 3,500 o $ 7,000.*/
select last_name, job_id, salary from hr.EMPLOYEES
where SALARY in (2500,3500,7000);

/*15.Modificar el reporte del ítem 4.6 y mostrar adicionalmente los datos de comisión (commission_pct) de 
todos los empleados que solamente el 20% de comisión.*/

/*Actividad N° 06
–Funciones de Conversión*/
/*1.Crear un reporte que muestre lo siguiente por cada empleado. [Apellido del empleado] gana [Salario] pero quisiera [3 veces Salario].
Etiquetar la columna como Sueldos Soñados*/
select last_name, salary, SALARY*3 as 'sueldo soñado' from hr.EMPLOYEES

/*2.Realizar  una  consulta  que  muestre  el  Apellido  del  empleado,  fecha  de  contratación  y  la  Fecha  de 
Revisión del Salario, la cual es el primer Lunes después de cada seis meses de servicio, etiquetar la columna como Revisión, asimismo el formato 
de esta fecha debe ser similar al siguiente: Lunes, el veintiuno de julio, 2003 */
SELECT last_name, hire_date, TO_CHAR(NEXT_DAY(ADD_MONTHS(hire_date, 6),'MONDAY'), 'fmDay , "the" Ddspth "of" Month, YYYY') AS 'Revisión del salario'
FROM hr.employees;

/*3.Mostrar un reporte que tenga los Apellidos, Fecha de Contratación y el Día de Inicio de cada empleado 
(Lunes, Martes, etc...), etiquetar la última columna como Día. Ordenar los resultados por el Día de Inicio empezando por Lunes.*/
--falta
select last_name, hire_date from hr.employees

/*4.Crear un listado que muestre los Apellidos de los empleados  y sus Montos de Comisión, en caso no 
tenga comisión deberá mostrar el texto ‘Sin Comisión’, etiquetar esta ultima columna como Comisión.*/
--falta
select last_name, commission_pct from hr.employees

/*5.Utilizando la función DECODE, crear un reporte que muestre los apellidos, los puestos y los grados de los empleados basados en sus puestos, 
utilizando la siguiente información:
Puesto Grado AD_PRESAST_MAN BIT_PROGCSA_REPDST_CLERKE Ninguno de los Anteriores*/

SELECT CARGO_ID, DECODE(
'AD_PRES','A',
'ST_MAN','B',
'IT_PROG','C',
'SA_REP','D',
'ST_CLERK','E',
'0'
)
FROM HR.EMPLOYEES;

/*6.Rescribir la consulta anterior utilizando la función CASE*/
 SELECT CARGO_ID , CASE CARGO_ID
WHEN 'AD_PRES' THEN 'A'
WHEN 'ST_MAN' THEN 'B'
WHEN 'IT_PROG' THEN 'C'
WHEN 'SA_REP' THEN 'D'
WHEN 'ST_CLERK' THEN 'E'
ELSE '0'
FROM HR.EMPLOYEES;
