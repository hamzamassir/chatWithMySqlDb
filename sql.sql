-- Creating the Departments table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(255) NOT NULL
);

-- Inserting data into the Departments table
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'IT'),
(4, 'Marketing'),
(5, 'Sales'),
(6, 'Engineering');

-- Creating the Employees table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    DepartmentID INT,
    Name VARCHAR(255) NOT NULL,
    Salary DECIMAL(10,2) NOT NULL,
    Address VARCHAR(255) NOT NULL,
    HoursWorked INT NOT NULL,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Inserting data into the Employees table
INSERT INTO Employees (EmployeeID, DepartmentID, Name, Salary, Address, HoursWorked) VALUES
(1, 1, 'John Doe', 50000.00, '123 Main St', 40),
(2, 1, 'Jane Smith', 60000.00, '456 Oak St', 35),
(3, 2, 'Bob Johnson', 70000.00, '789 Pine St', 38),
(4, 2, 'Emily White', 55000.00, '101 Elm St', 37),
(5, 3, 'Alex Brown', 80000.00, '222 Birch St', 42),
(6, 3, 'Chris Evans', 90000.00, '333 Cedar St', 45),
(7, 1, 'Sophia Lee', 48000.00, '444 Dogwood St', 32),
(8, 2, 'Michael Taylor', 62000.00, '555 Fir St', 36),
(9, 3, 'Olivia Martinez', 75000.00, '666 Ginkgo St', 40),
(10, 1, 'Daniel Anderson', 51000.00, '777 Hickory St', 34),
(11, 4, 'Ethan Wilson', 58000.00, '888 Juniper St', 38),
(12, 5, 'Ava Garcia', 70000.00, '999 Kelp St', 39),
(13, 5, 'Mason Miller', 75000.00, '123 Lime St', 41),
(14, 6, 'Emma Davis', 85000.00, '234 Maple St', 43),
(15, 4, 'Liam Thomas', 60000.00, '345 Oak St', 37),
(16, 5, 'Isabella Rodriguez', 72000.00, '456 Pine St', 40),
(17, 6, 'Noah Hernandez', 80000.00, '567 Quince St', 42),
(18, 4, 'Oliver Smith', 62000.00, '678 Redwood St', 35),
(19, 5, 'Amelia Johnson', 68000.00, '789 Spruce St', 38),
(20, 6, 'Lucas Lee', 78000.00, '890 Tamarind St', 41);

-- Commit changes
COMMIT;
