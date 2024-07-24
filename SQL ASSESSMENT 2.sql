create database pwioi;
use  pwioi;

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(45)
);

CREATE TABLE Department (
    Department_ID INT PRIMARY KEY,
    Department_Name VARCHAR(225),
    EmployeeID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

CREATE TABLE Project (
    ProjectId INT PRIMARY KEY,
    ProjectName VARCHAR(255),
    Department_ID INT,
    status ENUM('active', 'inactive'),
    FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID)
);

CREATE TABLE Assignment (
    Assignment_ID INT PRIMARY KEY,
    assigning_date DATETIME,
    Department_ID INT,
    Project_Id INT,
    FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID),
    FOREIGN KEY (Project_Id) REFERENCES Project(ProjectId)
);

CREATE TABLE Employee_Assignment (
    Employee_EmployeeID INT,
    Assignment_Assignment_ID INT,
    PRIMARY KEY (Employee_EmployeeID, Assignment_Assignment_ID),
    FOREIGN KEY (Employee_EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (Assignment_Assignment_ID) REFERENCES Assignment(Assignment_ID)
);

-- question queries

INSERT INTO Employee (EmployeeID, EmployeeName) VALUES (3, 'Alice Johnson');
select * from Employee;

INSERT INTO Assignment (Assignment_ID, assigning_date, Department_ID, Project_Id)
VALUES (3, '2024-07-23', (SELECT Department_ID FROM Department WHERE Department_Name = 'HR'), 
(SELECT ProjectId FROM Project WHERE ProjectName = 'Project Alpha'));
select * from Assignment;

ALTER TABLE Employee ADD COLUMN Email VARCHAR(100);
select * from Employee;

ALTER TABLE Department MODIFY COLUMN Department_Name VARCHAR(255);
select * from Department;

ALTER TABLE Employee ADD salary DECIMAL(10, 2);
-- Temp off safe update mode
SET SQL_SAFE_UPDATES = 0;

-- Update the salary for employees in the 'IT' department
UPDATE Employee 
SET salary = salary * 1.10 
WHERE EmployeeID IN (
    SELECT EmployeeID 
    FROM Department 
    WHERE Department_Name = 'IT'
);

SET SQL_SAFE_UPDATES = 1;
select * from Employee;

CREATE TABLE employees (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50),
department VARCHAR(50),
salary INT,
hire_date DATE
);

INSERT INTO employees (name, department, salary, hire_date) VALUES
('Alice', 'Sales', 60000, '2019-06-15'),
('Bob', 'HR', 45000, '2021-03-12'),
('Charlie', 'Engineering', 72000, '2018-01-10'),
('David', 'Marketing', 50000, '2020-07-20'),
('Eve', 'Sales', 55000, '2018-09-30'),
('Frank', 'HR', 35000, '2020-02-25'),
('Grace', 'Design', 65000, '2017-11-05'),
('Hank', 'Engineering', 68000, '2020-08-22'),
('Ivy', 'Design', 70000, '2021-05-18'),
('Jack', 'Finance', 80000, '2016-12-01'),
('Kate', 'Sales', 50000, '2019-10-10'),
('Leo', 'IT', 75000, '2019-01-15'),
('Mia', 'Sales', 62000, '2022-01-01'),
('Nina', 'HR', 40000, '2023-06-10'),
('Oscar', 'Marketing', 58000, '2021-07-15'),
('Paul', 'Engineering', 90000, '2017-03-18'),
('Quinn', 'Design', 75000, '2019-04-25'),
('Rita', 'IT', 60000, '2021-10-20'),
('Sam', 'HR', 62000, '2022-11-30'),
('Tina', 'Finance', 42000, '2018-08-18');

SELECT *
FROM employees
WHERE (department = 'Sales' AND salary > 50000)
   OR (department = 'HR' AND hire_date > '2020-01-01');
   
SELECT *
FROM employees
WHERE salary BETWEEN 40000 AND 60000
  AND department != 'Marketing'
ORDER BY hire_date DESC, salary ASC;

SELECT *
FROM employees
WHERE department != 'Finance' OR salary < 30000
ORDER BY department ASC, name DESC;

SELECT *
FROM employees
WHERE name LIKE 'A%' AND hire_date > '2015-01-01'
ORDER BY name ASC;

SELECT *
FROM employees
WHERE (department = 'Engineering' AND salary < 70000)
   OR (department = 'Design' AND salary > 60000)
ORDER BY salary DESC;

SELECT *
FROM projects
WHERE start_date < '2022-01-01' OR end_date > '2022-12-31'
ORDER BY project_name DESC;

SELECT *
FROM employees
WHERE name LIKE '%son' AND department != 'IT'
ORDER BY salary DESC, hire_date ASC;

SELECT *
FROM employees
WHERE YEAR(hire_date) = 2021
  AND salary > (SELECT AVG(salary) FROM employees)
ORDER BY name ASC;









