/*1*/
create view VW_Empleados
	as 
	select employee_id as ID_empleados,first_name as nombre,e.DEPARTMENT_ID as id_departamente 
	from HR.EMPLOYEES  ae 
	Inner join HR.departments e 
	on ae.DEPARTMENT_ID =e.DEPARTMENT_ID
	go


/*2*/
create view VW_Empleados2 as select ae.first_name as nombre,e.DEPARTMENT_ID as id_departamente from HR.EMPLOYEES  ae 
Inner join HR.departments e on ae.DEPARTMENT_ID =e.DEPARTMENT_ID where e.DEPARTMENT_ID =ae.first_name
go

/*3*/
create view VW_Dept50 as select ae.employee_id as EmpNo,last_name as Empleado, e.DEPARTMENT_ID as DeptNo from HR.EMPLOYEES ae
	Inner join HR.departments e on ae.DEPARTMENT_ID =e.DEPARTMENT_ID 
	where e.DEPARTMENT_ID=50
/*4*/

select * from VW_Dept50 where DeptNo=80 
/*5*/

create sequence SEQ_Departamentos_ID
INCREMENT BY 10
START WITH 200
MAXVALUE 1000
NO CACHE
NO CYCLE;


/*6*/
alter table HR.DEPARTMENTS ADD educacion varchar(25);
alter table HR.DEPARTMENTS ADD administracion varchar(25);

/*7*/

 CREATE INDEX nombre ON HR.DEPARTMENTS 
    ( 
     DEPARTMENT_NAME ASC 
    ) 
;

/*8*/
create SYNONYM EMP
for HR.employees ;
