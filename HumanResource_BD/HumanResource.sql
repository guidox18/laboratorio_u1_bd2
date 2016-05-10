create database HumanResource
go
use HumanResource
go
CREATE TABLE regions
(
	region_id INT PRIMARY KEY (region_id) NOT NULL,
	region_name VARCHAR(25)
);
GO

CREATE TABLE countries
(
	country_id CHAR (2) PRIMARY KEY (country_id) NOT NULL,
	country_name VARCHAR(40),
	region_id INT,
	FOREIGN KEY (region_id) REFERENCES regions (region_id)
);
GO

CREATE TABLE locations
(
	location_id INT PRIMARY KEY NOT NULL,
	street_adress VARCHAR(40),
	postal_code VARCHAR(12),
	city VARCHAR(30),
	state_province VARCHAR(25),
	country_id CHAR(2),
	FOREIGN KEY (country_id) REFERENCES countries (country_id)
);
GO

CREATE TABLE departments
(
	department_id INT PRIMARY KEY NOT NULL,
	department_name VARCHAR(30),
	manager_id INT,
	location_id INT,
	FOREIGN KEY (location_id) REFERENCES locations (location_id)
);
GO

CREATE TABLE jobs
(
	job_id VARCHAR(10) PRIMARY KEY NOT NULL,
	job_title VARCHAR(35) NOT NULL,
	min_salary INT,
	max_salary INT
);
GO

CREATE TABLE employees
(
	employee_id INT PRIMARY KEY NOT NULL,
	first_name VARCHAR(20),
	last_name VARCHAR(25) NOT NULL,
	email VARCHAR(25) NOT NULL,
	phone_number VARCHAR(20),
	hire_date DATETIME NOT NULL,
	job_id VARCHAR(10) NOT NULL,
	salary DECIMAL(8,2) CHECK (salary>0),
	commission_pct DECIMAL(2,2),
	manager_id INT,
	department_id INT,
	FOREIGN KEY (department_id) REFERENCES departments,
	FOREIGN KEY (job_id) REFERENCES jobs (job_id),
	FOREIGN KEY (manager_id) REFERENCES employees
);
GO

CREATE TABLE job_history
(
	employee_id INT NOT NULL,
	start_date DATETIME NOT NULL,
	end_date DATETIME NOT NULL,
	job_id VARCHAR(10) NOT NULL,
	department_id INT,
	PRIMARY KEY (employee_id, start_date),
	FOREIGN KEY (job_id) REFERENCES jobs,
	FOREIGN KEY (employee_id) REFERENCES employees,
	FOREIGN KEY (department_id) REFERENCES departments
);
GO