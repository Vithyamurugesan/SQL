CREATE SCHEMA hr;
USE hr;
CREATE TABLE regions (
    region_id INT NOT NULL,
    region_name VARCHAR(25),
    PRIMARY KEY (region_id)
);
CREATE TABLE countries (
    country_id CHAR(2),
    country_name VARCHAR(40),
    region_id INT,
    PRIMARY KEY (country_id),
    FOREIGN KEY (region_id) REFERENCES regions(region_id)
);
CREATE TABLE locations (
    location_id INT AUTO_INCREMENT,
    street_address VARCHAR(40),
    postal_code VARCHAR(12),
    city VARCHAR(30) NOT NULL,
    state_province VARCHAR(25),
    country_id CHAR(2),
    PRIMARY KEY (location_id),
    FOREIGN KEY (country_id) REFERENCES countries(country_id)
);
CREATE TABLE departments (
    department_id INT,
    department_name VARCHAR(30) NOT NULL,
    manager_id INT,
    location_id INT,
    PRIMARY KEY (department_id),
    FOREIGN KEY (location_id) REFERENCES locations(location_id)
);
CREATE TABLE job (
    job_id VARCHAR(10),
    job_title VARCHAR(35) NOT NULL,
    min_salary DECIMAL(10,2) SIGNED,
    max_salary DECIMAL(10,2) SIGNED,
    PRIMARY KEY (job_id)
);
CREATE TABLE employees (
    employee_id INT,
    first_name VARCHAR(20),
    last_name VARCHAR(25) NOT NULL,
    email VARCHAR(50) NOT NULL,
    phone_number VARCHAR(20),
    hire_date DATE NOT NULL,
    job_id VARCHAR(10),
    salary DECIMAL(10,2),
    commission_pct DECIMAL(4,2),
    manager_id INT,
    department_id INT,
    PRIMARY KEY (employee_id),
    FOREIGN KEY (job_id) REFERENCES jobs(job_id),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);
ALTER TABLE employees
ADD CONSTRAINT emp_manager_fk
FOREIGN KEY (manager_id)
REFERENCES employees(employee_id);

ALTER TABLE departments
ADD CONSTRAINT dept_manager_fk
FOREIGN KEY (manager_id)
REFERENCES employees(employee_id);

CREATE TABLE job_history (
    employee_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    job_id VARCHAR(10),
    department_id INT,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    FOREIGN KEY (job_id) REFERENCES jobs(job_id),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

ALTER TABLE job_history
ADD CONSTRAINT job_hist_unique
UNIQUE (employee_id, start_date);

INSERT INTO regions VALUES (1, 'Europe');
INSERT INTO regions VALUES (2, 'Americas');
INSERT INTO regions VALUES (3, 'Asia');
INSERT INTO regions VALUES (4, 'Middle East & Africa');



INSERT INTO countries VALUES ('IT', 'Italy', 1);
INSERT INTO countries VALUES ('FR', 'France', 1);
INSERT INTO countries VALUES ('DE', 'Germany', 1);
INSERT INTO countries VALUES ('IN', 'India', 3);
INSERT INTO countries VALUES ('CN', 'China', 3);
INSERT INTO countries VALUES ('JP', 'Japan', 3);
INSERT INTO countries VALUES ('US', 'United States', 2);
INSERT INTO countries VALUES ('CA', 'Canada', 2);
INSERT INTO countries VALUES ('BR', 'Brazil', 2);
INSERT INTO countries VALUES ('MX', 'Mexico', 2);
INSERT INTO countries VALUES ('AU', 'Australia', 3);
INSERT INTO countries VALUES ('SG', 'Singapore', 3);
INSERT INTO countries VALUES ('AE', 'UAE', 4);
INSERT INTO countries VALUES ('SA', 'Saudi Arabia', 4);
INSERT INTO countries VALUES ('ZA', 'South Africa', 4);
INSERT INTO countries VALUES ('EG', 'Egypt', 4);
INSERT INTO countries VALUES ('NG', 'Nigeria', 4);
INSERT INTO countries VALUES ('ES', 'Spain', 1);
INSERT INTO countries VALUES ('NL', 'Netherlands', 1);
INSERT INTO countries VALUES ('SE', 'Sweden', 1);


INSERT INTO locations (street_address, postal_code, city, state_province, country_id)
VALUES ('123 Main St', '10001', 'New York', 'NY', 'US');

INSERT INTO locations (street_address, postal_code, city, state_province, country_id)
VALUES ('456 MG Road', '600001', 'Chennai', 'Tamil Nadu', 'IN');

INSERT INTO locations (street_address, postal_code, city, state_province, country_id)
VALUES ('789 King St', 'EC1A', 'London', 'England', 'FR');


INSERT INTO departments VALUES (10, 'Administration', NULL, 1);
INSERT INTO departments VALUES (20, 'Marketing', NULL, 1);
INSERT INTO departments VALUES (30, 'IT', NULL, 2);
INSERT INTO departments VALUES (40, 'Human Resources', NULL, 2);
INSERT INTO departments VALUES (50, 'Sales', NULL, 1);
INSERT INTO departments VALUES (60, 'Finance', NULL, 3);


INSERT INTO jobs VALUES ('PRES', 'President', 20000, 40000);
INSERT INTO jobs VALUES ('VP', 'Vice President', 15000, 30000);
INSERT INTO jobs VALUES ('MGR', 'Manager', 10000, 20000);
INSERT INTO jobs VALUES ('PRG', 'Programmer', 5000, 12000);
INSERT INTO jobs VALUES ('ACC', 'Accountant', 4000, 10000);
INSERT INTO jobs VALUES ('CLK', 'Clerk', 3000, 6000);

INSERT INTO employees VALUES (100, 'John', 'King', 'john@hr.com', '123456', '2000-01-01', 'PRES', 30000, NULL, NULL, 10);

INSERT INTO employees VALUES (101, 'Neena', 'Kochhar', 'neena@hr.com', '123456', '2005-01-01', 'VP', 20000, NULL, 100, 20);

INSERT INTO employees VALUES (102, 'Lex', 'De Haan', 'lex@hr.com', '123456', '2006-01-01', 'MGR', 15000, NULL, 101, 30);

INSERT INTO employees VALUES (103, 'Alexander', 'Hunold', 'alex@hr.com', '123456', '2007-01-01', 'PRG', 9000, NULL, 102, 30);



INSERT INTO job_history VALUES (103, '2018-01-01', '2020-01-01', 'CLK', 40);
INSERT INTO job_history VALUES (102, '2016-01-01', '2018-01-01', 'ACC', 60);
INSERT INTO job_history VALUES (101, '2010-01-01', '2015-01-01', 'MGR', 20);


