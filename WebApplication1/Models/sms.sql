use master
go
drop database sms
go
create database sms
go
use sms
go


create table PaymentMode(
Id int identity(0,1) primary key not null,
Name varchar(30))
insert into PaymentMode(Name) values('Default')
insert into PaymentMode(Name) values('Bank Transfer')
insert into PaymentMode(Name) values('Cheque')
insert into PaymentMode(Name) values('Cash')


create table CustomerCategory(
Id int identity(0,1) primary key not null,
Name varchar(30))
insert into CustomerCategory(Name) values('Default')
insert into CustomerCategory(Name) values('Super Class')


create table Customer(
Id int identity(1,1) primary key not null,
FirstName varchar(30),
LastName varchar(30),
Email varchar(30),
Password varchar(30),
Phone varchar(30),
Address varchar(30),
Company varchar(30),
Balance float,
FK_Customer_CustomerCategory int foreign key references CustomerCategory(Id))
insert into Customer(FirstName,Email,Password,Balance,FK_Customer_CustomerCategory) values('Atta','attarabta@outlook.com','123',0,1)



--1 for credit, 0 for debit
create table CustomerLedger(
Id int identity(1,1) primary key not null,
Amount float,
DatenTime DateTime,
Type bit,
Comment varchar(100),
FK_CustomerLedger_Customer int foreign key references Customer(Id),
FK_CustomerLedger_PaymentMode int foreign key references PaymentMode(Id))


--0 for admin, 1 for sale, 2 for account
create table StaffCategory(
Id int identity(0,1) primary key not null,
Name varchar(30))
insert into StaffCategory(Name) values('Admisintration')
INSERT INTO StaffCategory(Name) VALUES ('Sale');
INSERT INTO StaffCategory(Name) VALUES ('Account');


create table Staff(
Id int identity(1,1) primary key not null,
FirstName varchar(30),
LastName varchar(30),
Email varchar(30),
Password varchar(30),
Phone varchar(30),
Address varchar(30),
Salary float,
JoiningDate DateTime,
Designation varchar(30),
FK_Staff_StaffCategory int foreign key references StaffCategory(Id))
insert into Staff(FirstName,Email,Password,FK_Staff_StaffCategory) values('admin','admin@gmil.com','123',0)


CREATE TABLE Supplier(
	Id int IDENTITY(0,1) NOT NULL PRIMARY KEY,
	Name varchar(30),
	PhoneNo varchar(30),
	Email varchar(30),
	Address varchar(50),
	Balance float)
INSERT INTO Supplier(Name,Balance) VALUES ('default',0);


--Type, 0 for debit, 1 for credit
CREATE TABLE SupplierLedger(
	Id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Amount float,
	DatenTime DateTime,
	Type bit,
	Comment varchar(100),
	FK_SupplierLedger_Supplier int foreign key references Supplier(Id),
	FK_SupplierLedger_PaymentMode int foreign key references PaymentMode(Id))


CREATE TABLE DepositHead(
	Id int IDENTITY(0,1) NOT NULL PRIMARY KEY,
	[Name] varchar(30))
INSERT INTO DepositHead(Name) VALUES ('Default');



CREATE TABLE Deposit(
	Id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Amount float,
	Comment varchar(30),
	DatenTime DateTime, 
	FK_Deposit_DepositHead int foreign key references DepositHead(Id))



CREATE TABLE ExpenceHead(
	Id int IDENTITY(0,1) NOT NULL PRIMARY KEY,
	Name varchar(30))
INSERT INTO ExpenceHead(Name) VALUES ('Default');



CREATE TABLE ExpenceSubHead(
	Id int IDENTITY(0,1) NOT NULL PRIMARY KEY,
	Name varchar(50),
	FK_ExpenceHead_ExpenceSubHead int foreign key references ExpenceHead(Id),
)
INSERT INTO ExpenceSubHead(Name,FK_ExpenceHead_ExpenceSubHead) VALUES ('Default',0);



CREATE TABLE Expence(
	Id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Amount int,
	Comment varchar(50),
	DatenTime DateTime,
	FK_Expence_ExpenceHead int foreign key references ExpenceHead(Id),
	FK_Expence_ExpenceSubHead int foreign key references ExpenceSubHead(Id),
)


go
use master
go