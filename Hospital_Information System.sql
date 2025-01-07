CREATE DATABASE Hospital_Information_System_DAB203;
GO

USE Hospital_Information_System_DAB203;
GO



-- Create Employee Table
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Role NVARCHAR(50) NOT NULL,
    Department NVARCHAR(50) NOT NULL,
    ContactNumber NVARCHAR(15),
    Email NVARCHAR(100),
    HireDate DATE NOT NULL
);


-- Patient Table
CREATE TABLE Patient (
    PatientID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Gender NVARCHAR(10),
    ContactNumber NVARCHAR(15),
    Address NVARCHAR(200),
    EmergencyContact NVARCHAR(15),
    MedicalHistory NVARCHAR(MAX)
);


--Create Medical Supplies Table
CREATE TABLE MedicalSupplies (
    SupplyID INT PRIMARY KEY IDENTITY(1,1),
    SupplyName NVARCHAR(100) NOT NULL,
    Category NVARCHAR(50),
    QuantityInStock INT NOT NULL,
    ReorderLevel INT NOT NULL,
    SupplierID INT
);


-- Create Appointment Table
CREATE TABLE Appointment (
    AppointmentID INT PRIMARY KEY IDENTITY(1,1),
    PatientID INT NOT NULL,
    EmployeeID INT NOT NULL,
    AppointmentDate DATETIME NOT NULL,
    Reason NVARCHAR(200),
    Status NVARCHAR(50),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);


-- Create Prescription Table
CREATE TABLE Prescription (
    PrescriptionID INT PRIMARY KEY IDENTITY(1,1),
    PatientID INT NOT NULL,
    EmployeeID INT NOT NULL,
    DateIssued DATE NOT NULL,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);


CREATE TABLE PrescriptionDetails (
	DetailID INT PRIMARY KEY IDENTITY(1,1),
	PrescriptionID INT NOT NULL FOREIGN KEY REFERENCES Prescription(PrescriptionID),
	Medication NVARCHAR(100),
	Dosage NVARCHAR(50),
	Instructions NVARCHAR(100)
);


--Create Supplier Table
CREATE TABLE Supplier (
    SupplierID INT PRIMARY KEY IDENTITY(1,1),
    SupplierName NVARCHAR(100) NOT NULL,
    ContactNumber NVARCHAR(15),
    Email NVARCHAR(100),
    Address NVARCHAR(200)
);
GO

--Create Relationship between Supplies and suplier
ALTER TABLE MedicalSupplies
ADD FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID);


-- Insert into Employee
INSERT INTO Employee (FirstName, LastName, Role, Department, ContactNumber, Email, HireDate)
VALUES
('Dhruv', 'Desai', 'Doctor', 'Cardiology', '1234567890', 'dhruvdesai@reddifmail.com', '2023-01-15'),
('Prakash', 'Parmar', 'Doctor', 'Medicine', '1236549870', 'prakashparmar@reddifmail.com', '2020-01-15');

-- Insert into Patient
INSERT INTO Patient (FirstName, LastName, DateOfBirth, Gender, ContactNumber, Address, EmergencyContact, MedicalHistory)
VALUES
('Dhruv', 'Desai', '1990-05-20', 'Male', '9876543210', '123 Elm Street', '1122334455', 'Diabetes'),
('Jay', 'Kathwadia', '1999-05-20', 'Male', '9876543210', '123 York Mills', '1122334455', 'Migraine');


-- Insert into Supplier
INSERT INTO Supplier (SupplierName, ContactNumber, Email, Address)
VALUES ('MediSupplies Inc.', '1231231234', 'contact@medisupplies.com', '456 Oak Avenue'),
('PharmaCorp', '9879879876', 'sales@pharmacorp.com', '123 Birch Lane');

-- Insert into Medical Supplies
INSERT INTO MedicalSupplies (SupplyName, Category, QuantityInStock, ReorderLevel, SupplierID)
VALUES
('Stethoscope', 'Equipment', 50, 10, 1),
('Syringe', 'Equipment', 200, 50, 1),
('Aspirin', 'Medicine', 1000, 100, 2);

-- Insert into Appointment
INSERT INTO Appointment (PatientID, EmployeeID, AppointmentDate, Reason, Status)
VALUES
(1, 1, '2024-11-25 09:00:00', 'Routine Checkup', 'Scheduled'),
(2, 1, '2024-11-27 11:00:00', 'Diabetes Management', 'Scheduled');

-- Insert into Prescription
INSERT INTO Prescription (PatientID, EmployeeID, DateIssued)
VALUES
(1, 1, '2024-11-25'),
(2, 1, '2024-11-27');

--Insert into Prescription Details
INSERT INTO PrescriptionDetails (PrescriptionID, Medication, Dosage, Instructions)
VALUES
(1,'Lisinopril', '10mg', 'Take once a day'),
(1,'Metformin', '500mg', 'Take twice a day with food'),
(2,'Advill', '500mg', 'Take twice a day'),
(2,'Tylenol', '100mg', 'Take once a day');