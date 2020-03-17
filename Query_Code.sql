-- Patient Table

CREATE TABLE Patient(
ID int PRIMARY KEY not null,
Name char(50) not null,
Age int not null,
Address varchar(60),
City char(20),
Email_ID varchar(30) not null,
Phone_No int not null,
);

-- Department Table
CREATE TABLE Department(
ID int PRIMARY KEY not null,
Name char(50) not null,
Department_Head char(30),
Email_ID varchar(30) not null,
Phone_No int not null
);

--Medicine Table
CREATE TABLE Medicine(
ID int PRIMARY KEY not null,
Name char(50) not null,
Quantity int not null,
Medicine_Type varchar(10) not null check(Medicine_Type in ('Liquid','Tablet','Capsule'))
);

-- Doctor Table
CREATE TABLE Doctor (
ID int not null,
Name char(30) not null,
Experience int not null,
Designation char(50) not null,
Department int not null,
Email_ID varchar(30) not null,
Phone_No int,
CONSTRAINT Doc_ID PRIMARY KEY (ID,Email_ID),
CONSTRAINT DepID FOREIGN KEY (Department) References Department(ID)
);


-- Clinic Table
CREATE TABLE Clinic(
ID int PRIMARY KEY not null,
City char(20) not null,
URL varchar(50) not null,
Name char(30) not null,
);

-- Clinic Location Table
CREATE TABLE Clinic_Loc(
ID int PRIMARY KEY not null,
Zip int not null,
CONSTRAINT ClinicID FOREIGN KEY (ID) References Clinic(ID)
);

-- Medicine Department Table
CREATE TABLE Medicine_dept(
ID int not null,
Med_Dept int not null,
PRIMARY KEY("ID","Med_Dept"),
CONSTRAINT MedicineID FOREIGN KEY (ID) References Medicine(ID),
CONSTRAINT Med_dept_ID FOREIGN KEY (Med_Dept) References Department(ID)
);

-- Appointment Table 
CREATE TABLE Appointment(
ID int PRIMARY KEY not null,
Doc_ID int not null,
Doc_Email varchar(30) not null,
Doc_Name char(30) not null,
Patient_ID int not null,
Patient_Name char(30) not null,
Patient_issue varchar(50) not null,
Appointment_Time datetime not null,
CONSTRAINT Doctor_ID FOREIGN KEY (Doc_ID,Doc_Email) References Doctor(ID,Email_ID),
CONSTRAINT PatientID FOREIGN KEY (Patient_ID) References Patient(ID)
);

-- Prescription Table
CREATE TABLE Prescription(
ID int PRIMARY KEY not null,
Doc_ID int not null,
Doc_Email varchar(30) not null,
Doc_Name char(30) not null,
Patient_ID int not null,
Patient_Name char(30) not null,
Patient_issue varchar(50) not null,
Appointment_Time datetime not null,
Medicine_ID int not null,
Medicine_Name char(20) not null,
CONSTRAINT DoctorID FOREIGN KEY (Doc_ID,Doc_Email) References Doctor(ID,Email_ID),
CONSTRAINT Patient_ID FOREIGN KEY (Patient_ID) References Patient(ID),
CONSTRAINT Medicine_ID FOREIGN KEY (Medicine_ID) References Medicine(ID)
);

-- Patient Location Table
CREATE TABLE Patient_Loc(
ID int not null,
Zip int not null,
CONSTRAINT PatientLocation_ID FOREIGN KEY (ID) References Patient(ID)
);

 
 -- Insert into DEPARTMENT 
 INSERT INTO Department
 VALUES
 (1,'Cardiology','Abhishek Brewster','abp@ch.com',343254546),
 (2,'Radiology','Matthew John','mj@ch.com',343251543),
 (3,'Neurology','Rohit Patil','rp@ch.com',347854562),
 (4,'Psychology','Sonam Sherpa','ss@ch.com',545432167),
 (5,'Paediatrician','Peter George','pg@ch.com',343423445)

 -- Insert into PATIENT
 INSERT INTO Patient
 VALUES
 (1,'Sachin Tendulkar',40,'1524 E Genesee Str','Syracuse','st@gmail.com',347864256),
 (2,'Ronaldo',35,'234 Lanchaster Str','Syracuse','rn07@gmail.com',347864527),
 (3,'Andrew Lawson',65,'431 University Str','Syracuse','al@gmail.com',347879468),
 (4,'Mohammed Hussien',48,'1234 Columbus Avenue','Syracuse','mh@gmail.com',347859879),
 (5,'Richard Parker',58,'465 Kings Road Pk','Seattle','rip@gmail.com',347844561),
 (6,'Jill Simpsons',35,'5 Prince Road Pk','Seattle','js@gmail.com',347834652),
 (7,'Harmeet Singh',47,'10 Vaziers Road Pk','Seattle','hs@gmail.com',347868253),
 (8,'Sarrah Conners',26,'477 Destiny Road Pk','Seattle','sc@gmail.com',347587984),
 (9,'Jnow Snow',67,'Richy Street Avenue','Binghamton','jos@gmail.com',347441475),
 (10,'Abhishek Patil ',67,'Villanova Street Avenue','Binghamton','ap@gmail.com',347846556),
 (11,'Patil Rohit',67,'Franklin Street Avenue','Binghamton','paro@gmail.com',347833267),
 (12,'Sonam Patil',67,'James Street Avenue','Binghamton','sop@gmail.com',347879318)

 -- Insert into DOCTOR
 INSERT INTO Doctor
 VALUES
 (1,'Harry Putter',12,'Senior Doctor',2,'hpu@2.cu.com',568749125),
 (2,'Gabriel Adam',3,'Junior Doctor',3,'ga@3.cu.com',568743221),
 (3,'Eve Adams',15,'Senior Doctor',5,'ea@5.cu.com',568747893),
 (4,'Mikhael Saint',24,'Senior Doctor',3,'msa@6.cu.com',568747123),
 (5,'Angelica Arnold',8,'Associate Doctor',1,'aa@1.cu.com',568753137),
 (6,'Jessy James',11,'Associate Doctor',4,'jj@4.cu.com',568741953),
 (7,'Lucifer Demon',18,'Senior Doctor',2,'ld@2.cu.com',568744651),
 (8,'Caly Jack',6,'Junior Doctor',5,'cj@5.cu.com',568748794),
 (9,'Edwards Desmond',17,'Senior Doctor',3,'edw@3.cu.com',568747986),
 (10,'Victoria Virginia',21,'Senior Doctor',5,'vv@6.cu.com',568747256),
 (11,'Julie Michaels',10,'Associate Doctor',4,'jum@4.cu.com',568755555),
 (12,'Hi Jon Moon',9,'Associate Doctor',1,'hjm@1.cu.com',568749448)

-- Insert into CLINIC
INSERT INTO Clinic
VALUES
(1,'Syracuse','https:/www.cu.syr.com','St.Peters'),
(2,'Seattle','https:/www.cu.sea.com','St.Michaels'),
(3,'Binghamton','https:/www.cu.bin.com','St.George')

-- Insert into Clinic_Loc
INSERT INTO  Clinic_Loc
VALUES
(1,12345),
(2,23489),
(3,34599)

-- Insert into Medicines
INSERT INTO Medicine
VALUES
(1,'warfarin',50,'Tablet'),
(2,'heparin',50,'Capsule'),
(3,'epinephrine',50,'Capsule'),
(4,'diphenhydramine',50,'Capsule'),
(5,'Phenytoin',50,'Tablet'),
(6,'Eslicarbazepine ',50,'Tablet'),
(7,'Zoloft',50,'Liquid'),
(8,'Xanax',50,'Tablet'),
(9,'Amoxicillin',50,'Capsule'),
(10,'Albuterol',50,'Liquid')


-- Insert into MEDICINE_DEPT
Insert Into Medicine_dept
Values
(1,1),
(2,1),
(3,2),
(4,2),
(5,3),
(6,3),
(7,4),
(8,4),
(9,5),
(10,5)

-- Insert into Patient Loc
INSERT INTO Patient_Loc
VALUES
(1,12378),
(2,12334),
(3,12374),
(4,12309),
(5,23412),
(6,23432),
(7,23465),
(8,23474),
(9,34545),
(10,34590),
(11,34562),
(12,34573)



-- Stored Procedure to extract doctors according to departments
CREATE PROCEDURE doctor_in_department 
AS
BEGIN

SELECT dep.Name,doc.Name
FROM department dep 
inner join doctor doc 
on dep.ID = doc.Department
END;

EXEC doctor_in_department



