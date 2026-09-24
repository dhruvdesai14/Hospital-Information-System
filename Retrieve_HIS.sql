-- Retrieve Patient Appointments
SELECT a.AppointmentID, p.FirstName AS PatientFirstName, p.LastName AS PatientLastName,
       e.FirstName AS EmployeeFirstName, e.LastName AS EmployeeLastName, 
       a.AppointmentDate, a.Reason, a.Status
FROM Appointment a
JOIN Patient p ON a.PatientID = p.PatientID
JOIN Employee e ON a.EmployeeID = e.EmployeeID;

-- Check Supplies with Low Stock
SELECT SupplyID, SupplyName, QuantityInStock, ReorderLevel
FROM MedicalSupplies
WHERE QuantityInStock <= ReorderLevel;


-- Get full Prescription Details
SELECT 
    p.PrescriptionID,
    pt.FirstName + ' ' + pt.LastName AS PatientName,
    e.FirstName + ' ' + e.LastName AS DoctorName,
    p.DateIssued,
    pd.Medication,
    pd.Dosage,
    pd.Instructions
FROM 
    Prescription p
JOIN 
    Patient pt ON p.PatientID = pt.PatientID
JOIN 
    Employee e ON p.EmployeeID = e.EmployeeID
JOIN 
    PrescriptionDetails pd ON p.PrescriptionID = pd.PrescriptionID
ORDER BY 
    p.PrescriptionID,pd.DetailID;

-- Get Specific Prescription
SELECT 
    p.PrescriptionID,
    pt.FirstName + ' ' + pt.LastName AS PatientName,
    e.FirstName + ' ' + e.LastName AS DoctorName,
    p.DateIssued,
    pd.Medication,
    pd.Dosage,
    pd.Instructions
FROM 
    Prescription p
JOIN 
    Patient pt ON p.PatientID = pt.PatientID
JOIN 
    Employee e ON p.EmployeeID = e.EmployeeID
JOIN 
    PrescriptionDetails pd ON p.PrescriptionID = pd.PrescriptionID
WHERE 
    p.PrescriptionID = 1;

-- Count Appointments by Status
SELECT Status, COUNT(*) AS TotalAppointments
FROM Appointment
GROUP BY Status;