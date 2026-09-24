# Hospital-Information-System

**Overview**

The **Hospital Information System** is a Microsoft SQL Server database designed to manage and streamline hospital operations. It provides structured tables and relationships for staff, patients, appointments, prescriptions, medical supplies and suppliers.

**Features**

**Employee Management:** Store details such as names, roles, departments, contact information, and hire dates.

**Patient Records:** Maintain patient information, including medical history, emergency contacts, and demographics.

**Appointments:** Schedule patient visits with a doctor and track their status.

**Prescriptions:** Record prescriptions issued by doctors, with one or more medications per prescription.

**Medical Supplies Inventory:** Track stock quantity, category, reorder levels and the supplier of each item.

**Repository Contents**

* `Hospital_Information_System.sql`: Creates the `Hospital_Information_System_DAB203` database and its tables, then inserts sample data.

* `Retrieve_HIS.sql`: Example queries for retrieving and reporting on the data.

**Database Schema**

**Tables Included:**

**1. Employee:**

* EmployeeID (Primary Key): Unique identifier for employees.

* Attributes: First name, last name, role, department, contact number, email, and hire date.

**2. Patient:**

* PatientID (Primary Key): Unique identifier for patients.

* Attributes: First name, last name, date of birth, gender, contact number, address, emergency contact, and medical history.

**3. Appointment:**

* AppointmentID (Primary Key): Unique identifier for appointments.

* PatientID (Foreign Key → Patient), EmployeeID (Foreign Key → Employee).

* Attributes: Appointment date and time, reason, and status.

**4. Prescription:**

* PrescriptionID (Primary Key): Unique identifier for prescriptions.

* PatientID (Foreign Key → Patient), EmployeeID (Foreign Key → Employee, the prescribing doctor).

* Attributes: Date issued.

**5. PrescriptionDetails:**

* DetailID (Primary Key): Unique identifier for each prescribed medication.

* PrescriptionID (Foreign Key → Prescription).

* Attributes: Medication, dosage, and instructions.

**6. Supplier:**

* SupplierID (Primary Key): Unique identifier for suppliers.

* Attributes: Supplier name, contact number, email, and address.

**7. MedicalSupplies:**

* SupplyID (Primary Key): Unique identifier for medical supplies.

* SupplierID (Foreign Key → Supplier).

* Attributes: Supply name, category, quantity in stock, and reorder level.

**Relationships**

```
Supplier     1 ─── * MedicalSupplies
Patient      1 ─── * Appointment  * ─── 1 Employee
Patient      1 ─── * Prescription * ─── 1 Employee
Prescription 1 ─── * PrescriptionDetails
```

**Example Queries** (`Retrieve_HIS.sql`)

* Patient appointments with patient and doctor names.

* Supplies at or below their reorder level.

* Full prescription details (patient, doctor, medications).

* A single prescription by ID.

* Appointment counts grouped by status.

**Prerequisites**

* Database Software: Microsoft SQL Server (the scripts use T-SQL features such as `IDENTITY`, `NVARCHAR(MAX)` and `GO`).

* SQL Client: Software to execute SQL scripts (e.g., SQL Server Management Studio or Azure Data Studio).

**Installation**

1. Download or clone the repository.

2. Open the `Hospital_Information_System.sql` file in your SQL client.

3. Execute the script to create the database and tables and load the sample data.

4. Verify the database structure in your SQL client.

**Usage**

1. Run `Retrieve_HIS.sql` against the `Hospital_Information_System_DAB203` database to try the example queries.

2. Add your own data, or write queries to retrieve, update, or analyze it.

3. Integrate this database with a hospital management application for enhanced functionality.

**Contributing**

Contributions are welcome! Please follow these steps:

1. Fork the repository.

2. Create a new branch for your feature (git checkout -b feature-name).

3. Commit your changes (git commit -m 'Add feature').

4. Push to the branch (git push origin feature-name).

5. Submit a pull request.
