
USE master
GO

IF DB_ID('InventoryPhase1') IS NOT NULL
	DROP DATABASE InventoryPhase1

CREATE DATABASE InventoryPhase1;
GO

USE InventoryPhase1;
GO


-- First User needs to Add Below Information 
CREATE TABLE DivDept(
	DivDeptID INT IDENTITY (1,1) NOT NULL PRIMARY KEY
	, Division VARCHAR(255)
	, Department VARCHAR(255)
	, YearlyBudget DECIMAL(10,2) -- accting
	, YearToDate DECIMAL(10,2) -- accting
	--, BudgetVariance DECIMAL(10,2) -- accting (view)
	, CombinedDef VARCHAR(MAX)
	, CONSTRAINT DivDept_un UNIQUE(Division, Department)
)

CREATE TABLE JobDefinitions(
	JobID INT IDENTITY(1,1) NOT NULL PRIMARY KEY
	, Job VARCHAR(255) UNIQUE
	, DesignatedSlots INT
	, DivDeptID INT
	, FOREIGN KEY(DivDeptID) REFERENCES DivDept(DivDeptID)
)

CREATE TABLE CompanyManu(
	CompanyID INT IDENTITY (1,1) NOT NULL PRIMARY KEY
	, CompanyName VARCHAR(255) UNIQUE
	, CompAddress VARCHAR(MAX)
	, CompPhone VARCHAR (15) NULL
	, CompEmail VARCHAR(MAX)
	, ServiceType VARCHAR(MAX) --are they a cleaner, manufacturer, or on-site
	, Products VARCHAR(MAX)
)

-- Rename to Garment Definitions
CREATE TABLE GarmDefaultValues(
	GarmentDefaultID INT IDENTITY (1,1) NOT NULL PRIMARY KEY
	, TotalGarmsPAR INT -- Total Garms needed in whole inventory
	, TotalJobPAR INT -- Total needed overall per job; person needs 3 total for job
	, TotalGarmsStock INT -- total garms as of right now in whole inventory
	, TotalReserveStock INT -- total in reserve per garment
	, ReserveStockLimit DECIMAL(2,2) -- Percentage set that auto orders new garms 
	, Gender VARCHAR(10)
	, GarmType VARCHAR(255) -- Shirt, pants, shoes etc
	, GarmDescription VARCHAR(MAX) -- Desc of specific garm type: white undershirt
	, GarmSize VARCHAR(10)
	, GarmLength VARCHAR(200)
	, GarmCost DECIMAL
	, GarmWeight DECIMAL
	, MultiUse BIT --   1=Yes, 0=No	, LifeExpectancy INT -- Years
	, MaxNumOfCleanings INT 
	, GarmentDefaultDef VARCHAR(MAX)
	, JobID INT
	, CompanyID INT -- What company produces garment
	, CONSTRAINT JobOutfit UNIQUE(Gender, GarmType, GarmSize, GarmLength, JobID)
	, FOREIGN KEY(JobID) REFERENCES JobDefinitions(JobID)
	, FOREIGN KEY(CompanyID) REFERENCES CompanyManu(CompanyID)
)

/*
	Future: want to choose employee, add all garms in one click based on job
	and garm description details 
*/





-- Employee Information
CREATE TABLE EmployeeCreate(
	EmployeeID INT NOT NULL PRIMARY KEY
	, EmpFirstName VARCHAR(20)
	, EmpLastName VARCHAR(20)
	, EmpMiddleInitial VARCHAR(2)
	, EmpEmail VARCHAR(50)
	, Gender VARCHAR(20)
	, ShirtSize VARCHAR(20)
	, JacketSize VARCHAR(20)
	, PantSize VARCHAR(20)
	, ShoeSize VARCHAR(20)
	, GarmLength VARCHAR(20) --what is this?
	, JobID INT
	, AltID INT	-- Is this for the Emp or the Garm??
	, AlterationInstructions VARCHAR(255)
	, HireDate DATE
	, EmpFullName VARCHAR(MAX)
	, DivDeptID INT
	, SlotAssignment INT
	, Conveyor INT
	, FOREIGN KEY(DivDeptID) REFERENCES DivDept(DivDeptID)
	, FOREIGN KEY(JobID) REFERENCES JobDefinitions(JobID)
)




-- Summary of Garm Activity per Garm/Employee (ScanGarm)
-- ONE TO MANY RELATIONSHIP
-- CRUD for all Garment information; Includes employee ID for assigned garments
CREATE TABLE GarmentInvActivity( -- CRUD Garment actions 
	GarmentNumber INT PRIMARY KEY NOT NULL
	, EmployeeID INT
	, SlotNumber INT
	, RFID_BARCODE VARCHAR(MAX)
	, ConveyorNumber INT
	, AltID INT
	, PretaggedID INT -- FIGURE OUT LATER
	, NonTaggedID INT -- FIGURE LATER
	, GarmLocation VARCHAR(255)
	--, PickupTime TIME
	, PickupDate VARCHAR(MAX)
	--, DropoffTime TIME
	, DropoffDate DATETIME
	, Assigned BIT -- 0=yes 1=no; Checks EmpAssignedGarms (if empid not null then 1)
	, Loaned BIT
	, OneForOne BIT
	, Missing DATE 
	, DelinquentGarm BIT
	, Alterations VARCHAR(MAX)
	, JobID INT
	, CompanyID INT
	, DivDeptID INT
	, GarmentDefaultID INT
	, DateAdded DATE
	, FOREIGN KEY(EmployeeID) REFERENCES EmployeeCreate(EmployeeID)
	, FOREIGN KEY(JobID) REFERENCES JobDefinitions(JobID)
	, FOREIGN KEY(CompanyID) REFERENCES CompanyManu(CompanyID)
	, FOREIGN KEY(DivDeptID) REFERENCES DivDept(DivDeptID)
	, FOREIGN KEY (GarmentDefaultID) REFERENCES GarmDefaultValues(GarmentDefaultID)
)






-- Orders

-- Delete Every 12 Months?; Updates EmployeePastOrders
-- Are Order IDs automoatically assigned, entered, or just added increments
CREATE TABLE GarmentOrders(
	--GarmentOrderID UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID()
	GarmentOrderID INT IDENTITY(1,1) PRIMARY KEY NOT NULL
	, GarmentDefaultID INT
	, EmployeeID INT
	, GarmDescription VARCHAR(MAX)
	, JobID INT
	, Reason VARCHAR(MAX)
	, Loaned BIT -- No = 0; Yes = 1
	, Missing DATE
	, Amount INT
	, OrderPlacedDate DATE
	, OrderPlacedBy VARCHAR(MAX) --Emp Name or Emp ID?
	, OrderStatus VARCHAR(MAX)
	, CONSTRAINT OrderID_pk UNIQUE(GarmentOrderID, JobID, GarmentDefaultID)
	, FOREIGN KEY (GarmentDefaultID) REFERENCES GarmDefaultValues(GarmentDefaultID)
	, FOREIGN KEY(JobID) REFERENCES JobDefinitions(JobID)
	, FOREIGN KEY(EmployeeID) REFERENCES EmployeeCreate(EmployeeID)
)

-- DROP TABLE GarmentOrders






/* Need to work on this later
CREATE TABLE PreTaggedGarments(
	PreTaggedGarmID INT NOT NULL PRIMARY KEY
	, AccountingID INT
	, ItemsMissing INT
	, EmpID INT
	, GarmentInventoryInfo INT
	, Sold BIT
	, Loaned BIT
	, Assigned VARCHAR(100) -- BIT?
)


CREATE TABLE NonTagged(
	NonTaggedGarmID INT NOT NULL PRIMARY KEY
	, GarmentID INT
	, GarmentActivityID INT 
	, EmpID INT
	, Sold BIT
	, Loaned BIT
	, Assigned VARCHAR(100)
)
*/


