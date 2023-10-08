--1
-- Create a table named ‘Staff’ with the following descriptions (create table, like, or)
CREATE TABLE Staff (
	StaffId	CHAR (5) Primary key CHECK (StaffID LIKE 'ST[0-9][0-9][0-9]'),
	StaffName VARCHAR (100)	NOT NULL,
	StaffGender	VARCHAR	(20) NOT NULL CHECK (StaffGender LIKE 'MALE' OR StaffGender LIKE 'FEMALE'),
	StaffSalary	INT NOT NULL
)

--2
-- Add a new column on Exchange table named ExchangeWebsite with varchar(75) data type. Then add a constraint on Exchange table to validate that ExchangeWebsite length must between 10 and 75. (alter table, add, add constraint, len, between)
ALTER TABLE EXCHANGE
ADD ExchangeWebsite varchar(75)

ALTER TABLE EXCHANGE 
ADD CONSTRAINT CheckWebsite CHECK (LEN (ExchangeWebsite) BETWEEN 10 AND 75)

--3
--Insert these data into Customer table: (Insert)
INSERT INTO Customer VALUES ('CU006','Elon Musk','Jl Raya Serpong No. 3, Serpong','Male','	08181183333')
SELECT * FROM Customer

--4
--Display CustomerId, CryptoId, Amount, and Price for every transaction that occurs on odd months.(Month)
SELECT CustomerId, CryptoId, Amount, Price
FROM HeaderTransaction
WHERE MONTH(TransactionDate) % 2 = 1

SELECT * FROM HeaderTransaction

--5
--Update CustomerPhone from Customer table for every customer who has done transaction on 4th day into ‘08185313713’.(Update, Day)
BEGIN TRAN
UPDATE Customer
SET CustomerPhone = '08185313713'
FROM Customer C, HeaderTransaction HT
WHERE C.CustomerId = HT.CustomerId AND DAY(TransactionDate)=4
ROLLBACK
COMMIT
SELECT*FROM Customer C, HeaderTransaction HT WHERE C.CustomerId = HT.CustomerId AND DAY(TransactionDate)=4






