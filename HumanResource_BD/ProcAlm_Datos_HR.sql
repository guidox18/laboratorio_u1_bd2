use HumanResource


CREATE PROCEDURE sp_addregion
(
	@id FLOAT,
	@Nombre nvarchar(25)
)
AS BEGIN
INSERT INTO HR.REGIONS
(REGION_ID, REGION_NAME) VALUES
(@id, @Nombre)
END

exec sp_addregion 1,'nombreregion1'
exec sp_addregion 2,'nombreregion2'
exec sp_addregion 3,'nombreregion3'
exec sp_addregion 4,'nombreregion4'
exec sp_addregion 5,'nombreregion5'
exec sp_addregion 6,'nombreregion6'
exec sp_addregion 7,'nombreregion7'
exec sp_addregion 8,'nombreregion8'
exec sp_addregion 9,'nombreregion9'


select * from HR.REGIONS



CREATE PROCEDURE sp_addcountries
(
	@COUNTRY_ID CHAR (2)  , --!identity 
    @COUNTRY_NAME VARCHAR (40) , 
    @REGION_ID FLOAT
)
AS BEGIN
INSERT INTO HR.COUNTRIES
(COUNTRY_ID, COUNTRY_NAME,REGION_ID) VALUES
(@COUNTRY_ID, @COUNTRY_NAME,@REGION_ID)
END

exec sp_addcountries 1,'nombrecountries1',1
exec sp_addcountries 2,'nombrecountries2',2
exec sp_addcountries 3,'nombrecountries3',3
exec sp_addcountries 4,'nombrecountries4',4
exec sp_addcountries 5,'nombrecountries5',5
exec sp_addcountries 6,'nombrecountries6',6
exec sp_addcountries 7,'nombrecountries7',7
exec sp_addcountries 8,'nombrecountries8',8
exec sp_addcountries 9,'nombrecountriesn9',9

CREATE PROCEDURE sp_addLOCATIONS
(
	 @LOCATION_ID SMALLINT    , --!identity 
     @STREET_ADDRESS VARCHAR (40) , 
     @POSTAL_CODE VARCHAR (12) , 
     @CITY VARCHAR (30)   , --!identity 
     @STATE_PROVINCE VARCHAR (25) , --!identity 
     @COUNTRY_ID CHAR (2) --!identity 
)
AS BEGIN
INSERT INTO HR.LOCATIONS
(LOCATION_ID, STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) VALUES
(@LOCATION_ID,@STREET_ADDRESS,@POSTAL_CODE,@CITY,@STATE_PROVINCE,@COUNTRY_ID)
END

exec sp_addLOCATIONS 1,'STREET_ADDRESS1','001','city1','pro1',1
exec sp_addLOCATIONS 2,'STREET_ADDRESS2','002','city2','pro2',2
exec sp_addLOCATIONS 3,'STREET_ADDRESS3','003','city3','pro3',3
exec sp_addLOCATIONS 4,'STREET_ADDRESS4','004','city4','pro4',4
exec sp_addLOCATIONS 5,'STREET_ADDRESS5','005','city5','pro5',5
exec sp_addLOCATIONS 6,'STREET_ADDRESS6','006','city6','pro6',6
exec sp_addLOCATIONS 7,'STREET_ADDRESS7','007','city7','pro7',7
exec sp_addLOCATIONS 8,'STREET_ADDRESS8','008','city8','pro8',8
exec sp_addLOCATIONS 9,'STREET_ADDRESS9','009','city9','pro9',9
CREATE PROCEDURE sp_addDEPARTMENTS 
(
	   @DEPARTMENT_ID SMALLINT, --!identity 
     @DEPARTMENT_NAME VARCHAR (30), 
     @MANAGER_ID INT  , 
     @LOCATION_ID SMALLINT --!identity 
)
AS BEGIN
INSERT INTO HR.DEPARTMENTS
(DEPARTMENT_ID, DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) VALUES
(@DEPARTMENT_ID, @DEPARTMENT_NAME,@MANAGER_ID,@LOCATION_ID)
END

exec sp_addDEPARTMENTS  1,'nombredepa1',NULL,1
exec sp_addDEPARTMENTS  2,'nombredepa2',NULL,2
exec sp_addDEPARTMENTS  3,'nombredepa3',NULL,3
exec sp_addDEPARTMENTS  4,'nombredepa4',NULL,4
exec sp_addDEPARTMENTS  5,'nombredepa5',NULL,5
exec sp_addDEPARTMENTS  6,'nombredepa6',NULL,6
exec sp_addDEPARTMENTS  7,'nombredepa7',NULL,7
exec sp_addDEPARTMENTS  8,'nombredepa8',NULL,8
exec sp_addDEPARTMENTS  9,'nombredepa9',NULL,9



CREATE PROCEDURE sp_addJOBS
(
	 @JOB_ID VARCHAR (10)  , --!identity 
     @JOB_TITLE VARCHAR (35) , 
     @MIN_SALARY INT  , 
     @MAX_SALARY INT 
)
AS BEGIN
INSERT INTO HR.JOBS
(JOB_ID, JOB_TITLE,MIN_SALARY,MAX_SALARY) VALUES
(@JOB_ID, @JOB_TITLE,@MIN_SALARY,@MAX_SALARY)
END

exec sp_addJOBS 1,'j1',10,1000
exec sp_addJOBS 2,'j2',20,2000
exec sp_addJOBS 3,'j3',30,3000
exec sp_addJOBS 4,'j4',40,4000
exec sp_addJOBS 5,'j5',50,5000
exec sp_addJOBS 6,'j6',60,6000
exec sp_addJOBS 7,'j7',70,7000
exec sp_addJOBS 8,'j8',80,8000
exec sp_addJOBS 9,'j9',90,9000
/*****/

CREATE PROCEDURE sp_addEMPLOYEES
(
	 @EMPLOYEE_ID INT   , --!identity 
     @FIRST_NAME VARCHAR (20) , --!identity 
     @LAST_NAME VARCHAR (25)  , --!identity 
     @EMAIL VARCHAR (25)   , 
     @PHONE_NUMBER VARCHAR (20) , 
     @HIRE_DATE DATETIME   , 
     @JOB_ID VARCHAR (10) , --!identity 
     @SALARY DECIMAL (8,2) , 
     @COMMISSION_PCT DECIMAL (2,2) , 
     @MANAGER_ID INT , --!identity 
     @DEPARTMENT_ID SMALLINT   --!identity 
)
AS BEGIN
INSERT INTO HR.EMPLOYEES
(EMPLOYEE_ID, FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) VALUES
(@EMPLOYEE_ID, @FIRST_NAME,@LAST_NAME,@EMAIL, @PHONE_NUMBER, @HIRE_DATE, @JOB_ID, @SALARY,@COMMISSION_PCT,@MANAGER_ID,@DEPARTMENT_ID)
END




exec sp_addEMPLOYEES 1,'aaaa','bbib','eeeqe',123865,'2012-02-01',1,10,NULL,1,1
exec sp_addEMPLOYEES 2,'aasa','bbwb','eewee',423465,'2012-02-01',2,10,NULL,2,2
exec sp_addEMPLOYEES 3,'asda','bbeb','eeeee',123965,'2012-02-01',3,10,NULL,3,3
exec sp_addEMPLOYEES 4,'aada','bbrb','eeree',123464,'2012-02-01',4,10,NULL,4,4
exec sp_addEMPLOYEES 5,'affa','bbtb','eetee',123445,'2012-02-01',5,10,NULL,5,5
exec sp_addEMPLOYEES 6,'aava','bbyb','eeeye',123265,'2012-02-01',6,10,NULL,6,6
exec sp_addEMPLOYEES 7,'aaba','bbub','eeuee',123425,'2012-02-01',7,10,NULL,7,7
exec sp_addEMPLOYEES 8,'ahaa','bbib','eeiee',123462,'2012-02-01',8,10,NULL,8,8
exec sp_addEMPLOYEES 9,'ajja','bbob','eekee',122465,'2012-02-01',9,10,NULL,9,9





/*****/
CREATE PROCEDURE sp_addJOB_HISTORY 
(
	 @EMPLOYEE_ID INT   , --!identity 
     @START_DATE DATETIME   , --!identity 
     @END_DATE DATETIME  , 
     @JOB_ID VARCHAR (10)   ,  --!identity 
     @DEPARTMENT_ID SMALLINT  --!identity
)
AS BEGIN

INSERT INTO HR.JOB_HISTORY
(EMPLOYEE_ID, START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) VALUES
(@EMPLOYEE_ID, @START_DATE,@END_DATE,@JOB_ID,@DEPARTMENT_ID)
END

exec sp_addJOB_HISTORY 1,'2016-01-01','2017-05-01',1,1
exec sp_addJOB_HISTORY 2,'2016-01-01','2017-05-01',2,2
exec sp_addJOB_HISTORY 3,'2016-01-01','2017-05-01',3,3
exec sp_addJOB_HISTORY 4,'2016-01-01','2017-05-01',4,4
exec sp_addJOB_HISTORY 5,'2016-01-01','2017-05-01',5,5
exec sp_addJOB_HISTORY 6,'2016-01-01','2017-05-01',6,6
exec sp_addJOB_HISTORY 7,'2016-01-01','2017-05-01',7,7
exec sp_addJOB_HISTORY 8,'2016-01-01','2017-05-01',8,8
exec sp_addJOB_HISTORY 9,'2016-01-01','2017-05-01',9,9
