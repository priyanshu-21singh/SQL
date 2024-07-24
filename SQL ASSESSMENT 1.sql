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











