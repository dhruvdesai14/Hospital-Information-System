# Hospital-Information-System

**Overview**

The **Hospital Information System** is a database solution designed to manage and streamline hospital operations. It provides structured tables and relationships for employee data, patient records, and inventory management for medical supplies.

**Features**

**Employee Management:** Store details such as names, roles, departments, contact information, and hire dates.

**Patient Records:** Maintain comprehensive patient information, including medical history, emergency contacts, and demographics.

**Medical Supplies Inventory:** Track supply details like stock quantity, category, and reorder levels.

**Database Schema**

**Tables Included:**

**1. Employee:**

* EmployeeID (Primary Key): Unique identifier for employees.

* Attributes: First name, last name, role, department, contact number, email, and hire date.

**2. Patient:**

* PatientID (Primary Key): Unique identifier for patients.

* Attributes: First name, last name, date of birth, gender, contact details, address, emergency contact, and medical history.

**3. MedicalSupplies:**

* SupplyID (Primary Key): Unique identifier for medical supplies.

* Attributes: Supply name, category, quantity in stock, and reorder level.

**4. Prerequisites**

* Database Software: Microsoft SQL Server or a compatible SQL database engine.

* SQL Client: Software to execute SQL scripts (e.g., SQL Server Management Studio).

**Installation**

1. Download or clone the repository.

2. Open the Hospital_Information_System.sql file in your SQL client.

3. Execute the script to create the database and tables.

4. Verify the database structure in your SQL client.

**Usage**

1. Populate the tables with initial data.

2. Use SQL queries to retrieve, update, or analyze data.

3. Integrate this database with a hospital management application for enhanced functionality.

**Contributing**

Contributions are welcome! Please follow these steps:

1. Fork the repository.

2. Create a new branch for your feature (git checkout -b feature-name).

3. Commit your changes (git commit -m 'Add feature').

4. Push to the branch (git push origin feature-name).

5. Submit a pull request.

**License**

This project is licensed under the MIT License. See the LICENSE file for details.
