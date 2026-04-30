use Hospital2

--Department table

CREATE TABLE Department (
    Dept_id int PRIMARY KEY,
    Dept_name VARCHAR(100),
    Location VARCHAR(100),
    No_of_doctors INT,
    Contact_number VARCHAR(20),
    Head_doctor_id INT UNIQUE
);

--Doctor table
CREATE TABLE Doctor (
    Doctor_id int PRIMARY KEY,
    Name VARCHAR(100),
    Specialization VARCHAR(100),
    Phone_no VARCHAR(20),
    Email VARCHAR(100),
    License_no VARCHAR(50),
    Qualification VARCHAR(100),
    Years_of_experience INT,
    Dept_id INT,
    FOREIGN KEY (Dept_id) REFERENCES Department(Dept_id)
);

-- Add FK after both tables exist
ALTER TABLE Department
ADD CONSTRAINT fk_head_doctor
FOREIGN KEY (Head_doctor_id) REFERENCES Doctor(Doctor_id);

-- PATIENT table
CREATE TABLE Patient (
    Patient_id int PRIMARY KEY,
    F_name VARCHAR(50),
    L_name VARCHAR(50),
    Phone_no VARCHAR(20),
    Email VARCHAR(100),
    Address TEXT,
    DOB DATE,
    Blood_group VARCHAR(5),
    Gender VARCHAR(10)
);

-- SERVICE table
CREATE TABLE Service (
    Service_id int PRIMARY KEY,
    Service_name VARCHAR(100),
    Service_type VARCHAR(50),
    Unit_price DECIMAL(10,2),
    Description TEXT,
    Dept_id INT,
    FOREIGN KEY (Dept_id) REFERENCES Department(Dept_id)
);

-- APPOINTMENT table
CREATE TABLE Appointment (
    Appointment_id int PRIMARY KEY,
    Patient_id INT,
    Doctor_id INT,
    Date DATE,
    Time TIME,
    Status VARCHAR(50),
    Appointment_type VARCHAR(50),
    Reason TEXT,
    FOREIGN KEY (Patient_id) REFERENCES Patient(Patient_id),
    FOREIGN KEY (Doctor_id) REFERENCES Doctor(Doctor_id)
);

-- APPOINTMENT_SERVICE 
CREATE TABLE Appointment_Service (
    Appointment_id INT,
    Service_id INT,
    Quantity INT,
    PRIMARY KEY (Appointment_id, Service_id),
    FOREIGN KEY (Appointment_id) REFERENCES Appointment(Appointment_id),
    FOREIGN KEY (Service_id) REFERENCES Service(Service_id)
);


-- MEDICAL RECORD
CREATE TABLE Medical_Record (
    Record_id int PRIMARY KEY,
    Appointment_id INT UNIQUE,
    Patient_id INT,
    Doctor_id INT,
    Visit_date DATE,
    Diagnosis TEXT,
    Treatment_plan TEXT,
    Prescribed_medications TEXT,
    Doctor_notes TEXT,
    Follow_up_required TEXT,
    FOREIGN KEY (Appointment_id) REFERENCES Appointment(Appointment_id),
    FOREIGN KEY (Patient_id) REFERENCES Patient(Patient_id),
    FOREIGN KEY (Doctor_id) REFERENCES Doctor(Doctor_id)
);

-- BILLING
CREATE TABLE Billing (
    Bill_id int PRIMARY KEY,
    Appointment_id INT ,
    Patient_id INT,
    Bill_date DATE,
    Total_amount DECIMAL(10,2),
    Payment_status VARCHAR(50),
    Payment_method VARCHAR(50),
    Due_date DATE,
    FOREIGN KEY (Appointment_id) REFERENCES Appointment(Appointment_id),
    FOREIGN KEY (Patient_id) REFERENCES Patient(Patient_id)
);

drop table Billing

INSERT INTO Department (Dept_id, Dept_name, Location, No_of_doctors, Contact_number, Head_doctor_id)
VALUES
(1, 'Cardiology', 'First Floor', 2, '24560001', NULL),
(2, 'Neurology', 'Second Floor', 2, '24560002', NULL),
(3, 'Orthopedics', 'Third Floor', 2, '24560003', NULL),
(4, 'General Medicine', 'Ground Floor', 2, '24560004', NULL);

select * from Department

INSERT INTO Doctor VALUES
(1, 'Dr. Ahmed', 'Cardiologist', '91234567', 'ahmed@hospital.com', 'LIC1001', 'MD
Cardiology', 10, 1),
(2, 'Dr. Sara', 'Cardiologist', '91234568', 'sara@hospital.com', 'LIC1002', 'MD Cardiology', 7,
1),
(3, 'Dr. Khalid', 'Neurologist', '91234569', 'khalid@hospital.com', 'LIC1003', 'MD Neurology',
9, 2),
(4, 'Dr. Noor', 'Neurologist', '91234570', 'noor@hospital.com', 'LIC1004', 'MD Neurology', 6,
2),
(5, 'Dr. Ali', 'Orthopedic', '91234571', 'ali@hospital.com', 'LIC1005', 'MD Orthopedics', 8, 3),
(6, 'Dr. Mona', 'Orthopedic', '91234572', 'mona@hospital.com', 'LIC1006', 'MD Orthopedics',
5, 3),
(7, 'Dr. Hassan', 'General Physician', '91234573', 'hassan@hospital.com', 'LIC1007', 'MBBS',
12, 4),
(8, 'Dr. Fatma', 'General Physician', '91234574', 'fatma@hospital.com', 'LIC1008', 'MBBS', 4,
4);

select * from Doctor

INSERT INTO Patient VALUES
(1, 'Salim', 'Al-Harthi', '92345671', 'salim@email.com', 'Muscat', '1995-05-10', 'O+', 'Male'),
(2, 'Aisha', 'Al-Balushi', '92345672', 'aisha@email.com', 'Seeb', '1998-07-15', 'A+', 'Female'),
(3, 'Khalfan', 'Al-Rawahi', '92345673', 'khalfan@email.com', 'Barka', '1990-03-22', 'B+',
'Male'),
(4, 'Noor', 'Al-Mamari', '92345674', 'noor@email.com', 'Muscat', '2000-11-01', 'AB+',
'Female'),
(5, 'Huda', 'Al-Saadi', '92345675', 'huda@email.com', 'Nizwa', '1993-02-14', 'O-', 'Female'),
(6, 'Saeed', 'Al-Kindi', '92345676', 'saeed@email.com', 'Sohar', '1988-09-09', 'A-', 'Male'),
(7, 'Maryam', 'Al-Hinai', '92345677', 'maryam@email.com', 'Muscat', '1996-12-30', 'B-',
'Female'),
(8, 'Ali', 'Al-Abri', '92345678', 'ali@email.com', 'Ibri', '1992-06-18', 'O+', 'Male');

select * from Patient

INSERT INTO Service VALUES
(1, 'Consultation', 'Consultation', 15.000, 'General doctor consultation', 4),
(2, 'ECG', 'Lab Test', 20.000, 'Heart test', 1),
(3, 'MRI', 'X-Ray', 50.000, 'Brain scan', 2),
(4, 'X-Ray', 'X-Ray', 25.000, 'Bone scan', 3),
(5, 'Blood Test', 'Lab Test', 10.000, 'Basic blood test', 4),
(6, 'Physiotherapy', 'Treatment', 30.000, 'Physical therapy session', 3),
(7, 'Minor Surgery', 'Surgery', 200.000, 'Small surgical procedure', 3),
(8, 'Follow-up Visit', 'Consultation', 10.000, 'Follow-up appointment', 4);

select * from Service

INSERT INTO Appointment (
    Appointment_id,
    Date,
    Time,
    Status,
    Appointment_type,
    Reason,
    Patient_id,
    Doctor_id
)
VALUES
(1, '2026-04-01', '09:00', 'Completed', 'Consultation', 'Chest pain', 1, 1),
(2, '2026-04-02', '10:00', 'Completed', 'Emergency', 'Headache', 2, 3),
(3, '2026-04-03', '11:00', 'Scheduled', 'Follow-up', 'Knee pain', 3, 5),
(4, '2026-04-04', '12:00', 'Completed', 'Consultation', 'Fever', 4, 7),
(5, '2026-04-05', '09:30', 'Cancelled', 'Consultation', 'Back pain', 5, 6),
(6, '2026-04-06', '10:30', 'Completed', 'Emergency', 'Heart check', 6, 2),
(7, '2026-04-07', '11:30', 'Completed', 'Consultation', 'Bone injury', 7, 5),
(8, '2026-04-08', '12:30', 'Scheduled', 'Consultation', 'General checkup', 8, 8),
(9, '2026-04-09', '09:15', 'Completed', 'Follow-up', 'Follow-up heart test', 1, 1),
(10, '2026-04-10', '10:15', 'Completed', 'Consultation', 'Migraine', 2, 4);

select * from Appointment

INSERT INTO Appointment_Service VALUES
(1, 1, 1),
(1, 2, 1),
(2, 3, 1),
(2, 5, 2),
(3, 4, 1),
(4, 1, 1),
(4, 5, 1),
(5, 6, 2),
(6, 2, 1),
(6, 1, 1),
(7, 4, 1),
(7, 6, 1),
(8, 1, 1),
(9, 2, 1),
(9, 8, 1),
(10, 3, 1),
(10, 1, 1);

select * from Billing

INSERT INTO Medical_Record VALUES
(1, 1, 1, 1, '2026-04-01', 'Mild chest pain', 'Medication and rest', 'Painkiller', 'Patient stable', 1),
(2, 2, 2, 3, '2026-04-02', 'Migraine symptoms', 'MRI and medication', 'Migraine medicine', 'Needs follow-up', 1),
(3, 4, 4, 7, '2026-04-04', 'Fever infection', 'Antibiotics', 'Antibiotic', 'Monitor temperature', 0),
(4, 6, 6, 2, '2026-04-06', 'Heart rhythm issue', 'ECG follow-up', 'Heart medication', 'Needs monitoring', 1),
(5, 7, 7, 5, '2026-04-07', 'Minor bone injury', 'Physiotherapy', 'Pain relief', 'Improving', 1),
(6, 1, 1, 1, '2026-04-09', 'Heart follow-up', 'Continue treatment', 'Same medication', 'Better condition', 0),
(7, 2, 2, 4, '2026-04-10', 'Headache issue', 'MRI review', 'Painkiller', 'Check scan result', 1);

drop table Medical_Record3
DELETE FROM Medical_Record;


CREATE TABLE Medical_Record (
    Record_id INT PRIMARY KEY,
    Appointment_id INT ,
    Patient_id INT,
    Doctor_id INT,
    Visit_date DATE,
    Diagnosis VARCHAR(MAX),
    Treatment_plan VARCHAR(MAX),
    Prescribed_medications VARCHAR(MAX),
    Doctor_notes VARCHAR(MAX),
    Follow_up_required BIT,
    FOREIGN KEY (Appointment_id) REFERENCES Appointment(Appointment_id),
    FOREIGN KEY (Patient_id) REFERENCES Patient(Patient_id),
    FOREIGN KEY (Doctor_id) REFERENCES Doctor(Doctor_id)
);

INSERT INTO Billing (
    Bill_id,
    Appointment_id,
    Bill_date,
    Total_amount,
    Payment_status,
    Payment_method,
    Due_date,
    Patient_id
)
VALUES
(1, 1, '2026-04-01', 35.000, 'Paid', 'Card', '2026-04-05', 1),
(2, 2, '2026-04-02', 70.000, 'Partial', 'Insurance', '2026-04-06', 2),
(3, 4, '2026-04-04', 25.000, 'Paid', 'Cash', '2026-04-08', 4),
(4, 6, '2026-04-06', 35.000, 'Paid', 'Card', '2026-04-10', 6),
(5, 7, '2026-04-07', 55.000, 'Pending', 'Cash', '2026-04-11', 7),
(6, 1, '2026-04-09', 30.000, 'Paid', 'Card', '2026-04-13', 1),
(7, 2, '2026-04-10', 65.000, 'Partial', 'Insurance', '2026-04-14', 2);

select * from billing

use Hospital2

CREATE TABLE Billing (
    Bill_id INT PRIMARY KEY,
    Appointment_id INT UNIQUE,
    Patient_id INT,
    Bill_date DATE,
    Total_amount DECIMAL(10,2),
    Payment_status VARCHAR(20),
    Payment_method VARCHAR(20),
    Due_date DATE,

    FOREIGN KEY (Appointment_id) REFERENCES Appointment(Appointment_id),
    FOREIGN KEY (Patient_id) REFERENCES Patient(Patient_id)
);


update Appointment
set Status = 'completed'
where status = 'Scheduled'

update Billing
set Payment_status = 'Paid'
where Payment_status = 'Pending '

update Service
set Unit_price = Unit_price * 1.10

update Patient
set Phone_no = '77777777'
where Phone_no = '1'

UPDATE Doctor
SET Dept_id = 2
WHERE Doctor_id = 1;

select * from Appointment

DELETE FROM Appointment_Service
WHERE Appointment_id = 5;

DELETE FROM Medical_Record
WHERE Appointment_id = 5;

DELETE FROM Billing
WHERE Appointment_id = 5;

DELETE FROM Appointment
WHERE Appointment_id = 5 AND Status = 'Cancelled';

select * from Service

DELETE FROM Appointment_Service
WHERE Service_id = 3;

DELETE FROM Service
WHERE Service_id = 3;

select * from Billing

DELETE FROM Billing
WHERE Bill_id = 3;

select * from Patient

DELETE FROM Billing
WHERE Patient_id = 1;

DELETE FROM Medical_Record
WHERE Patient_id = 1;

DELETE FROM Appointment_Service
WHERE Appointment_id IN (
    SELECT Appointment_id FROM Appointment WHERE Patient_id = 1
);

DELETE FROM Appointment
WHERE Patient_id = 1;

DELETE FROM Patient
WHERE Patient_id = 1;

-- count patient

select COUNT (*) as total_patients
from Patient

select COUNT (*) as Doc_total
from Doctor

select COUNT (*) as appointment_total
from Appointment

select avg(Unit_price) as Total_Billing_Amount
from Service

SELECT 
    MAX(Unit_price) AS Highest_Service_Price,
    MIN(Unit_price) AS Lowest_Service_Price
FROM Service;

SELECT Dept_id, COUNT(*) AS Total_Doctors
FROM Doctor
GROUP BY Dept_id;

SELECT Doctor_id, COUNT(*) AS Total_Appointment
FROM Appointment
GROUP BY Doctor_id;

select* from Appointment

SELECT status, COUNT(*) AS Total_Appointment
FROM Appointment
GROUP BY status;

SELECT 
    Payment_status,
    SUM(Total_amount) AS Total_Billing_Amount
FROM Billing
GROUP BY Payment_status;

SELECT 
    Service_type,
    AVG(Unit_price) AS Average_Price
FROM Service
GROUP BY Service_type;

SELECT 
    Service_id,
    SUM(Quantity) AS Total_Quantity_Used
FROM Appointment_Service
GROUP BY Service_id;


SELECT doc.[Name],
       COUNT(a.Appointment_id) AS Appointment_Count
FROM Doctor doc
JOIN Appointment a ON doc.Doctor_id = a.Doctor_id
GROUP BY doc.[Name]
HAVING COUNT(a.Appointment_id) > 1;



SELECT s.Service_name,
       SUM(a_s.Quantity) AS Total_Used
FROM Service s
JOIN Appointment_Service a_s ON s.Service_id = a_s.Service_id
GROUP BY s.Service_name
HAVING SUM(a_s.Quantity) > 2;



SELECT d.Dept_name,
       COUNT(doc.Doctor_id) AS Doctor_Count
FROM Department d
JOIN Doctor doc ON d.Dept_id = doc.Dept_id
GROUP BY d.Dept_name
HAVING COUNT(doc.Doctor_id) > 1;



SELECT Payment_status,
       SUM(Total_amount) AS Total
FROM Billing
GROUP BY Payment_status
HAVING SUM(Total_amount) > 50;



SELECT TOP 1
       s.Service_name,
       SUM(a_s.Quantity) AS Total_Used
FROM Service s
JOIN Appointment_Service a_s ON s.Service_id = a_s.Service_id
GROUP BY s.Service_name
ORDER BY Total_Used DESC;



SELECT TOP 1
       s.Service_name,
       SUM(a_s.Quantity * s.Unit_price) AS Total_Revenue
FROM Service s
JOIN Appointment_Service a_s ON s.Service_id = a_s.Service_id
GROUP BY s.Service_name
ORDER BY Total_Revenue DESC;