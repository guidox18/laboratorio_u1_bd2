/*Actividad N° 09 – Subconsultas*/

/*1. El departamento de Recursos Humanos requiere una consulta que pregunte al usuario por el Apellido
del empleado, Luego la consulta deberá mostrar los Apellidos y Fecha de Contratación de todos los
empleados del mismo departamento excluyendo o con excepción del empleado el cual ha sido
proporcionado su apellido reporte que muestre las direcciones de todos los departamentos.*/

 SELECT LAST_NAME, HIRE_DATE
 FROM HR.EMPLOYEES 
 WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM HR.EMPLOYEES WHERE LAST_NAME = '' );

 /*2. Crear un reporte que muestre el N° del Empleado, Apellidos y Salarios de todos los empleados que
tienen un salario superior al promedio de salarios de todos los empleados. Ordenar los resultados por
el Salario de forma ascendente*/

SELECT EMPLOYEE_ID, LAST_NAME, SALARY
FROM HR.EMPLOYEES
WHERE  SALARY = (SELECT AVG(SALARY) FROM HR.EMPLOYEES)
ORDER BY SALARY ASC;

/*3. Realizar un reporte que muestre el N° de Empleado y Apellidos de todos los empleados quienes trabajan
en el departamento de cualquier empleado que su apellido contenga la letra ‘u’ */

SELECT EMPLOYEE_ID, LAST_NAME
FROM HR.EMPLOYEES
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID FROM HR.EMPLOYEES WHERE LAST_NAME LIKE '%u%');

/*4. El departamento de Recursos Humanos requiere un reporte que muestre los Apellidos, N° de
Departamento y Puestos de los empleados cuya locación de departamento es 1700.*/

SELECT LAST_NAME, DEPARTMENT_ID, JOB_ID
FROM HR.EMPLOYEES
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID FROM HR.DEPARTMENTS WHERE LOCATION_ID = 1700);

/*5. Modificar la consulta anterior de forma que el usuario pueda introducir el N° de locación*/

SELECT LAST_NAME, DEPARTMENT_ID, JOB_ID
FROM HR.EMPLOYEES
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID FROM HR.DEPARTMENTS WHERE LOCATION_ID = ''); 

/*6. Crear un reporte para el departamento de Recursos Humanos que muestre los Apellidos y Salarios de
todos los empleados cuyo Administrador apellide ‘King’. */

SELECT LAST_NAME, SALARY
FROM HR.EMPLOYEES
WHERE MANAGER_ID IN (SELECT MANAGER_ID FROM HR.EMPLOYEES WHERE LAST_NAME = 'King');


