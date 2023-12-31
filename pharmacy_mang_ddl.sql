drop database pharmacy_mang;
create database pharmacy_mang;

use pharmacy_mang;
-- ALTER USER 'user'@'localhost' IDENTIFIED BY 'new_password';



CREATE TABLE PHARMACY
(
  Store_ID INT NOT NULL,
  StoreName VARCHAR (30) NOT NULL,
  Address VARCHAR (40) NOT NULL,
  City VARCHAR (20) NOT NULL,
  State VARCHAR (20) NOT NULL,
  Pincode VARCHAR (10) NOT NULL,
  PRIMARY KEY (Store_ID)
);

CREATE TABLE DOCTOR
(
  Doc_ID INT NOT NULL,
  Doc_name VARCHAR (20) NOT NULL,
  D_address VARCHAR (40),
  D_Contact VARCHAR (10) NOT NULL,
  Hospital VARCHAR (20),
  PRIMARY KEY (Doc_ID)
);

CREATE TABLE EMPLOYEE
(
  EID INT NOT NULL,
  EmpName VARCHAR (20) NOT NULL,
  E_address VARCHAR (40) NOT NULL,
  E_Sex VARCHAR (6) NOT NULL,
  Salary REAL NOT NULL,
  E_Contact VARCHAR (10) NOT NULL,
  Store_ID INT NOT NULL,
  PRIMARY KEY (EID),
  FOREIGN KEY (Store_ID) REFERENCES PHARMACY(Store_ID)
);

CREATE TABLE MEDICINE
(
  Drug_ID INT NOT NULL,
  Drug_name VARCHAR (20) NOT NULL,
  MfgDate VARCHAR (10) NOT NULL,
  ExpDate VARCHAR (10) NOT NULL,
  Price REAL NOT NULL,
  Manufacturer VARCHAR (20) NOT NULL,
  PRIMARY KEY (Drug_ID)
);

CREATE TABLE PATIENT
(
  PID INT NOT NULL,
  Pname VARCHAR (20) NOT NULL,
  P_address VARCHAR (40) NOT NULL,
  P_sex VARCHAR (6) NOT NULL,
  P_Contact VARCHAR (10) NOT NULL,
  Doc_ID INT NOT NULL,
  Store_ID INT,
  PRIMARY KEY (PID),
  FOREIGN KEY (Store_ID) REFERENCES PHARMACY(Store_ID),
  FOREIGN KEY (Doc_ID) REFERENCES DOCTOR(Doc_ID)
);

CREATE TABLE BILL
(
  Bill_ID INT NOT NULL,
  PID INT NOT NULL,
  Doc_ID INT NOT NULL,
  Drug_ID INT NOT NULL,
  Quantity INT NOT NULL,
  Amt REAL NOT NULL,
  Store_ID INT NOT NULL,
  PRIMARY KEY (Bill_ID),
  FOREIGN KEY (Store_ID) REFERENCES PHARMACY(Store_ID)
);

CREATE TABLE contains
(
  Drug_ID INT NOT NULL,
  Store_ID INT NOT NULL,
  Quantity INT,
  PRIMARY KEY (Drug_ID, Store_ID),
  FOREIGN KEY (Drug_ID) REFERENCES MEDICINE(Drug_ID),
  FOREIGN KEY (Store_ID) REFERENCES PHARMACY(Store_ID)
);

CREATE TABLE Associated_With
(
  Doc_ID INT NOT NULL,
  Store_ID INT NOT NULL,
  PRIMARY KEY (Doc_ID, Store_ID),
  FOREIGN KEY (Doc_ID) REFERENCES DOCTOR(Doc_ID),
  FOREIGN KEY (Store_ID) REFERENCES PHARMACY(Store_ID)
);

-- Create a new MySQL user
CREATE USER 'userR'@'localhost' IDENTIFIED BY 'RutujaBS#2103';
ALTER USER 'userR'@'localhost' IDENTIFIED WITH 'caching_sha2_password' BY 'RutujaBS#2103';

-- Grant privileges to the new user on the database (assuming 'pharmacy_mang' is your database name)
GRANT ALL PRIVILEGES ON pharmacy_mang.* TO 'userR'@'localhost';

-- Flush privileges to apply the changes
FLUSH PRIVILEGES;


SHOW GRANTS FOR 'userR'@'localhost';

SELECT user, host FROM mysql.user;
