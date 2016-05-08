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
SELECT EMPLOYEE_ID as 'Emp Nº',LAST_NAME as 'Empleado', JOB_ID as 'Puesto', HIRE_DATE as 'Fecha Contratación' 
FROM HR.EMPLOYEES;

/*2.Adicionalmente el departamento de Recursos Humanos
 requiere un reporte más sencillo, en el que se muestre 
 los campos: last_name y job_id en una sola y única columna 
 (los datos deben estar separados por una coma) que tenga
 como alias Empleado y Puesto.*/
SELECT (LAST_NAME + ', ' + JOB_ID) As 'Empleado y Puesto' FROM HR.EMPLOYEES

/*3.Finalmente a modo de práctica, realizar una consulta 
que muestre todos los campos de la tabla EMPLOYEES, en una 
sola y única columna, los datos deben estar separados por 
una coma y la columna debe tener como encabezado Los Empleados*/

SELECT (FIRST_NAME + ', ' + LAST_NAME+ ', ' + EMAIL + ', ' 
+PHONE_NUMBER + ', ' + HIRE_DATE+ ', ' + JOB_ID+ ', ' + SALARY+ ', ' 
+ COMMISSION_PCT+ ', ' + MANAGER_ID + ', ' +DEPARTMENT_ID) As 'Los Empleados' FROM HR.EMPLOYEES


/*Actividad N° 05 
– Funciones*/
/*Se requiere realizar una consulta que visualice la fecha del sistema.*/
Select GETDATE()

