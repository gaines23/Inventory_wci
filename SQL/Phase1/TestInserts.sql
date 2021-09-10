--- TEST TRIGGERS ---

-- Division Department
INSERT INTO DivDept(Division, Department, YearlyBudget, YearToDate)
VALUES('Hotel', 'Kitchen', 30000.00, 1380.75)

INSERT INTO DivDept(Division, Department, YearlyBudget, YearToDate)
VALUES('Hotel', 'House Cleaning', 15000.00, 6971.75)

INSERT INTO DivDept(Division, Department, YearlyBudget, YearToDate)
VALUES('Hotel', 'Front Desk', 5000.00, 4541.25)

INSERT INTO DivDept(Division, Department, YearlyBudget, YearToDate)
VALUES('Hotel', 'Spa', 6500.00, 2155.25)

INSERT INTO DivDept(Division, Department, YearlyBudget, YearToDate)
VALUES('Hotel', 'Athletics', 6500.00, 2155.25)

-- Job Definitions
INSERT INTO JobDefinitions(Job, DesignatedSlots, DivDeptID)
VALUES('Chef', 20, 1)

INSERT INTO JobDefinitions(Job, DesignatedSlots, DivDeptID)
VALUES('Maid', 60, 2)

INSERT INTO JobDefinitions(Job, DesignatedSlots, DivDeptID)
VALUES('Greeter', 45, 3)

INSERT INTO JobDefinitions(Job, DesignatedSlots, DivDeptID)
VALUES('Massage Therapist', 10, 4)

INSERT INTO JobDefinitions(Job, DesignatedSlots, DivDeptID)
VALUES('Tennis Coach', 90, 5)

-- Company/Manufacturer
INSERT INTO CompanyManu(CompanyName, CompAddress, CompPhone, CompEmail, ServiceType, Products)
VALUES('Shirt Co', '1234 Main St', '800-222-5464', 'shirtco@email.com', 'Shirt Making', 'Clothing')

-- Garm Default Values
-- ('Chef', 20, 1)
-- Female 
INSERT INTO GarmDefaultValues(TotalGarmsPAR, TotalJobPAR, Gender, GarmType, GarmSize, GarmLength, GarmCost, 
GarmWeight, MultiUse, MaxNumOfCleanings, GarmDescription, CompanyID, JobID)
VALUES(10, 3, 'Female', 'TShirt', 'Large', ' ', 18.00, 1.00, 1, 25, 'Its a shirt', 1, 1)

INSERT INTO GarmDefaultValues(TotalGarmsPAR, TotalJobPAR, Gender, GarmType, GarmSize, GarmLength, GarmCost, 
GarmWeight, MultiUse, MaxNumOfCleanings, GarmDescription, CompanyID, JobID)
VALUES(10, 3, 'Female', 'TShirt', 'Small', ' ', 18.00, 1.00, 1, 25, 'Its a shirt', 1, 1)

INSERT INTO GarmDefaultValues(TotalGarmsPAR, TotalJobPAR, Gender, GarmType, GarmSize, GarmLength, GarmCost, 
GarmWeight, MultiUse, MaxNumOfCleanings, GarmDescription, CompanyID, JobID)
VALUES(10, 3, 'Female', 'TShirt', 'Medium', ' ', 18.00, 1.00, 1, 25, 'Its a shirt', 1, 1)

INSERT INTO GarmDefaultValues(TotalGarmsPAR, TotalJobPAR, Gender, GarmType, GarmSize, GarmLength, GarmCost, 
GarmWeight, MultiUse, MaxNumOfCleanings, GarmDescription, CompanyID, JobID)
VALUES(15, 2, 'Female', 'Sweatshirt', 'Medium', ' ', 18.00, 1.20, 1, 25, 'SweatShirt', 1, 1)

INSERT INTO GarmDefaultValues(TotalGarmsPAR, TotalJobPAR, Gender, GarmType, GarmSize, GarmLength, GarmCost, 
GarmWeight, MultiUse, MaxNumOfCleanings, GarmDescription, CompanyID, JobID)
VALUES(11, 2, 'Female', 'Pleaded Pants', '6', ' ', 18.00, 1.20, 1, 25, 'Pleaded Pants', 1, 1)

INSERT INTO GarmDefaultValues(TotalGarmsPAR, TotalJobPAR, Gender, GarmType, GarmSize, GarmLength, GarmCost, 
GarmWeight, MultiUse, MaxNumOfCleanings, GarmDescription, CompanyID, JobID)
VALUES(10, 2, 'Female', 'Vest', 'Small', ' ', 18.00, 1.20, 1, 25, 'Vest', 1, 1)

INSERT INTO GarmDefaultValues(TotalGarmsPAR, TotalJobPAR, Gender, GarmType, GarmSize, GarmLength, GarmCost, 
GarmWeight, MultiUse, MaxNumOfCleanings, GarmDescription, CompanyID, JobID)
VALUES(20, 2, 'Female', 'Vest', 'Medium', ' ', 18.00, 1.20, 1, 25, 'Vest', 1, 1)

INSERT INTO GarmDefaultValues(TotalGarmsPAR, TotalJobPAR, Gender, GarmType, GarmSize, GarmLength, GarmCost, 
GarmWeight, MultiUse, MaxNumOfCleanings, GarmDescription, CompanyID, JobID)
VALUES(20, 2, 'Female', 'Shoes', '9', ' ', 18.00, 1.20, 1, 25, 'Chef Shoes', 1, 1)

INSERT INTO GarmDefaultValues(TotalGarmsPAR, TotalJobPAR, Gender, GarmType, GarmSize, GarmLength, GarmCost, 
GarmWeight, MultiUse, MaxNumOfCleanings, GarmDescription, CompanyID, JobID)
VALUES(20, 2, 'Female', 'Shoes', '10', ' ', 18.00, 1.20, 1, 25, 'Chef Shoes', 1, 1)

-- Male
INSERT INTO GarmDefaultValues(TotalGarmsPAR, TotalJobPAR, Gender, GarmType, GarmSize, GarmLength, GarmCost, 
GarmWeight, MultiUse, MaxNumOfCleanings, GarmDescription, CompanyID, JobID)
VALUES(30, 2, 'Male', 'TShirt', 'Large', ' ', 18.00, 1.00, 1, 25, 'Its a shirt', 1, 1)
INSERT INTO GarmDefaultValues(TotalGarmsPAR, TotalJobPAR, Gender, GarmType, GarmSize, GarmLength, GarmCost, 
GarmWeight, MultiUse, MaxNumOfCleanings, GarmDescription, CompanyID, JobID)
VALUES(20, 2, 'Male', 'Hat', 'Med', ' ', 18.00, 1.20, 1, 25, 'Hat', 1, 1)
INSERT INTO GarmDefaultValues(TotalGarmsPAR, TotalJobPAR, Gender, GarmType, GarmSize, GarmLength, GarmCost, 
GarmWeight, MultiUse, MaxNumOfCleanings, GarmDescription, CompanyID, JobID)
VALUES(20, 2, 'Male', 'Blak Pants', 'Large', ' ', 18.00, 1.20, 1, 25, 'Black Pants', 1, 1)
INSERT INTO GarmDefaultValues(TotalGarmsPAR, TotalJobPAR, Gender, GarmType, GarmSize, GarmLength, GarmCost, 
GarmWeight, MultiUse, MaxNumOfCleanings, GarmDescription, CompanyID, JobID)
VALUES(20, 2, 'Male', 'Jacket', 'Small', ' ', 18.00, 1.20, 1, 25, 'Jacket', 1, 1)
INSERT INTO GarmDefaultValues(TotalGarmsPAR, TotalJobPAR, Gender, GarmType, GarmSize, GarmLength, GarmCost, 
GarmWeight, MultiUse, MaxNumOfCleanings, GarmDescription, CompanyID, JobID)
VALUES(20, 2, 'Male', 'Shoes', '10', ' ', 18.00, 1.20, 1, 25, 'Chef Shoes', 1, 1)

--('Maid', 60, 2)
-- Female
INSERT INTO GarmDefaultValues(TotalGarmsPAR, TotalJobPAR, Gender, GarmType, GarmSize, GarmLength, GarmCost, 
GarmWeight, MultiUse, MaxNumOfCleanings, GarmDescription, CompanyID, JobID)
VALUES(30, 2, 'Female', 'Pants', 'Medium', ' ', 28.00, 1.20, 1, 25, 'Its a pant', 1, 2)

INSERT INTO GarmDefaultValues(TotalGarmsPAR, TotalJobPAR, Gender, GarmType, GarmSize, GarmLength, GarmCost, 
GarmWeight, MultiUse, MaxNumOfCleanings, GarmDescription, CompanyID, JobID)
VALUES(30, 2, 'Female', 'Shoes', '9', ' ', 28.00, 1.20, 1, 25, 'Maid Shoes', 1, 2)

INSERT INTO GarmDefaultValues(TotalGarmsPAR, TotalJobPAR, Gender, GarmType, GarmSize, GarmLength, GarmCost, 
GarmWeight, MultiUse, MaxNumOfCleanings, GarmDescription, CompanyID, JobID)
VALUES(30, 2, 'Female', 'Shoes', '10', ' ', 28.00, 1.20, 1, 25, 'Maid Shoes', 1, 2)

INSERT INTO GarmDefaultValues(TotalGarmsPAR, TotalJobPAR, Gender, GarmType, GarmSize, GarmLength, GarmCost, 
GarmWeight, MultiUse, MaxNumOfCleanings, GarmDescription, CompanyID, JobID)
VALUES(3, 2, 'Female', 'Pants', 'Large', ' ', 28.00, 1.20, 1, 25, 'Its a pant', 1, 2)

INSERT INTO GarmDefaultValues(TotalGarmsPAR, TotalJobPAR, Gender, GarmType, GarmSize, GarmLength, GarmCost, 
GarmWeight, MultiUse, MaxNumOfCleanings, GarmDescription, CompanyID, JobID)
VALUES(30, 2, 'Female', 'Shirt', 'Large', ' ', 28.00, 1.20, 1, 25, 'Maid Shirt', 1, 2)

INSERT INTO GarmDefaultValues(TotalGarmsPAR, TotalJobPAR, Gender, GarmType, GarmSize, GarmLength, GarmCost, 
GarmWeight, MultiUse, MaxNumOfCleanings, GarmDescription, CompanyID, JobID)
VALUES(30, 2, 'Female', 'Jacket', 'Small', ' ', 28.00, 1.20, 1, 25, 'Maid Jacket', 1, 2)

-- Male Maid
INSERT INTO GarmDefaultValues(TotalGarmsPAR, TotalJobPAR, Gender, GarmType, GarmSize, GarmLength, GarmCost, 
GarmWeight, MultiUse, MaxNumOfCleanings, GarmDescription, CompanyID, JobID)
VALUES(30, 2, 'Male', 'Pants', 'Medium', ' ', 28.00, 1.20, 1, 25, 'Its a pant', 1, 2)

INSERT INTO GarmDefaultValues(TotalGarmsPAR, TotalJobPAR, Gender, GarmType, GarmSize, GarmLength, GarmCost, 
GarmWeight, MultiUse, MaxNumOfCleanings, GarmDescription, CompanyID, JobID)
VALUES(30, 2, 'Male', 'Pants', 'Small', ' ', 28.00, 1.20, 1, 25, 'Its a pant', 1, 2)

INSERT INTO GarmDefaultValues(TotalGarmsPAR, TotalJobPAR, Gender, GarmType, GarmSize, GarmLength, GarmCost, 
GarmWeight, MultiUse, MaxNumOfCleanings, GarmDescription, CompanyID, JobID)
VALUES(30, 2, 'Male', 'Shoes', '10', ' ', 28.00, 1.20, 1, 25, 'Maid Shoes', 1, 2)

INSERT INTO GarmDefaultValues(TotalGarmsPAR, TotalJobPAR, Gender, GarmType, GarmSize, GarmLength, GarmCost, 
GarmWeight, MultiUse, MaxNumOfCleanings, GarmDescription, CompanyID, JobID)
VALUES(30, 2, 'Male', 'Button Up Shirt', 'Large', ' ', 28.00, 1.20, 1, 25, 'Button Up Shirt', 1, 2)

INSERT INTO GarmDefaultValues(TotalGarmsPAR, TotalJobPAR, Gender, GarmType, GarmSize, GarmLength, GarmCost, 
GarmWeight, MultiUse, MaxNumOfCleanings, GarmDescription, CompanyID, JobID)
VALUES(30, 2, 'Male', 'Jacket', 'Small', ' ', 28.00, 1.20, 1, 25, 'Small Jacket', 1, 2)

--('Greeter', 45, 3)
INSERT INTO GarmDefaultValues(TotalGarmsPAR, TotalJobPAR, Gender, GarmType, GarmSize, GarmLength, GarmCost, 
GarmWeight, MultiUse, MaxNumOfCleanings, GarmDescription, CompanyID, JobID)
VALUES(30, 2,'Male', 'Shoes', '10', ' ', 28.00, 1.20, 1, 25, 'Greeter Shoes', 1, 3)

INSERT INTO GarmDefaultValues(TotalGarmsPAR, TotalJobPAR, Gender, GarmType, GarmSize, GarmLength, GarmCost, 
GarmWeight, MultiUse, MaxNumOfCleanings, GarmDescription, CompanyID, JobID)
VALUES(30, 2,'Male', 'Vest', 'Small', ' ', 28.00, 1.20, 1, 25, 'Greeter Vest', 1, 3)

INSERT INTO GarmDefaultValues(TotalGarmsPAR, TotalJobPAR, Gender, GarmType, GarmSize, GarmLength, GarmCost, 
GarmWeight, MultiUse, MaxNumOfCleanings, GarmDescription, CompanyID, JobID)
VALUES(30, 2,'Male', 'Socks', '10', ' ', 28.00, 1.20, 1, 25, 'Greeter Socks', 1, 3)

INSERT INTO GarmDefaultValues(TotalGarmsPAR, TotalJobPAR, Gender, GarmType, GarmSize, GarmLength, GarmCost, 
GarmWeight, MultiUse, MaxNumOfCleanings, GarmDescription, CompanyID, JobID)
VALUES(30, 2,'Male', 'Jacket', 'Medium', ' ', 28.00, 1.20, 1, 25, 'Greeter Jacket', 1, 3)

INSERT INTO GarmDefaultValues(TotalGarmsPAR, TotalJobPAR, Gender, GarmType, GarmSize, GarmLength, GarmCost, 
GarmWeight, MultiUse, MaxNumOfCleanings, GarmDescription, CompanyID, JobID)
VALUES(30, 2,'Male', 'Pants', 'Medium', ' ', 28.00, 1.20, 1, 25, 'Greeter Pants', 1, 3)


-- ('Massage Therapist', 10, 4) Female
INSERT INTO GarmDefaultValues(TotalGarmsPAR, TotalJobPAR, Gender, GarmType, GarmSize, GarmLength, GarmCost, 
GarmWeight, MultiUse, MaxNumOfCleanings, GarmDescription, CompanyID, JobID)
VALUES(20, 2, 'Female', 'TShirt', 'Medium', ' ', 18.00, 1.20, 1, 25, 'Spa Shirt', 1, 4)

INSERT INTO GarmDefaultValues(TotalGarmsPAR, TotalJobPAR, Gender, GarmType, GarmSize, GarmLength, GarmCost, 
GarmWeight, MultiUse, MaxNumOfCleanings, GarmDescription, CompanyID, JobID)
VALUES(20, 2, 'Female', 'Pants', 'Large', ' ', 18.00, 1.20, 1, 25, 'Spa Pants', 1, 4)

INSERT INTO GarmDefaultValues(TotalGarmsPAR, TotalJobPAR, Gender, GarmType, GarmSize, GarmLength, GarmCost, 
GarmWeight, MultiUse, MaxNumOfCleanings, GarmDescription, CompanyID, JobID)
VALUES(20, 2, 'Female', 'Hat', 'Small', ' ', 18.00, 1.20, 1, 25, 'Spa Hat', 1, 4)

INSERT INTO GarmDefaultValues(TotalGarmsPAR, TotalJobPAR, Gender, GarmType, GarmSize, GarmLength, GarmCost, 
GarmWeight, MultiUse, MaxNumOfCleanings, GarmDescription, CompanyID, JobID)
VALUES(20, 2, 'Female', 'Shoes', '10', ' ', 18.00, 1.20, 1, 25, 'Spa Shoes', 1, 4)

-- Massage Therapist Male (10,4)
INSERT INTO GarmDefaultValues(TotalGarmsPAR, TotalJobPAR, Gender, GarmType, GarmSize, GarmLength, GarmCost, 
GarmWeight, MultiUse, MaxNumOfCleanings, GarmDescription, CompanyID, JobID)
VALUES(20, 2, 'Male', 'TShirt', 'Medium', ' ', 18.00, 1.20, 1, 25, 'Spa Shirt', 1, 4)

INSERT INTO GarmDefaultValues(TotalGarmsPAR, TotalJobPAR, Gender, GarmType, GarmSize, GarmLength, GarmCost, 
GarmWeight, MultiUse, MaxNumOfCleanings, GarmDescription, CompanyID, JobID)
VALUES(20, 2, 'Male', 'Pants', 'Large', ' ', 18.00, 1.20, 1, 25, 'Spa Pants', 1, 4)

INSERT INTO GarmDefaultValues(TotalGarmsPAR, TotalJobPAR, Gender, GarmType, GarmSize, GarmLength, GarmCost, 
GarmWeight, MultiUse, MaxNumOfCleanings, GarmDescription, CompanyID, JobID)
VALUES(20, 2, 'Male', 'Hat', 'Small', ' ', 18.00, 1.20, 1, 25, 'Spa Hat', 1, 4)

INSERT INTO GarmDefaultValues(TotalGarmsPAR, TotalJobPAR, Gender, GarmType, GarmSize, GarmLength, GarmCost, 
GarmWeight, MultiUse, MaxNumOfCleanings, GarmDescription, CompanyID, JobID)
VALUES(20, 2, 'Male', 'Shoes', '10', ' ', 18.00, 1.20, 1, 25, 'Spa Shoes', 1, 4)

-- ('Tennis Coach', 90, 5) Male
INSERT INTO GarmDefaultValues(TotalGarmsPAR, TotalJobPAR, Gender, GarmType, GarmSize, GarmLength, GarmCost, 
GarmWeight, MultiUse, MaxNumOfCleanings, GarmDescription, CompanyID, JobID)
VALUES(30, 2,'Male', 'Long Sleeve', 'Medium', ' ', 28.00, 1.20, 1, 25, 'Its a long sleeve', 1, 4)

INSERT INTO GarmDefaultValues(TotalGarmsPAR, TotalJobPAR, Gender, GarmType, GarmSize, GarmLength, GarmCost, 
GarmWeight, MultiUse, MaxNumOfCleanings, GarmDescription, CompanyID, JobID)
VALUES(20, 2, 'Male', 'TShirt', 'Medium', ' ', 18.00, 1.20, 1, 25, 'Tennis Shirt', 1, 5)

INSERT INTO GarmDefaultValues(TotalGarmsPAR, TotalJobPAR, Gender, GarmType, GarmSize, GarmLength, GarmCost, 
GarmWeight, MultiUse, MaxNumOfCleanings, GarmDescription, CompanyID, JobID)
VALUES(20, 2, 'Male', 'Shorts', 'Large', ' ', 18.00, 1.20, 1, 25, 'Tennis Shorts', 1, 5)

INSERT INTO GarmDefaultValues(TotalGarmsPAR, TotalJobPAR, Gender, GarmType, GarmSize, GarmLength, GarmCost, 
GarmWeight, MultiUse, MaxNumOfCleanings, GarmDescription, CompanyID, JobID)
VALUES(20, 2, 'Male', 'Vizor', 'Small', ' ', 18.00, 1.20, 1, 25, 'Tennis Hat', 1, 5)

INSERT INTO GarmDefaultValues(TotalGarmsPAR, TotalJobPAR, Gender, GarmType, GarmSize, GarmLength, GarmCost, 
GarmWeight, MultiUse, MaxNumOfCleanings, GarmDescription, CompanyID, JobID)
VALUES(20, 2, 'Male', 'Shoes', '10', ' ', 18.00, 1.20, 1, 25, 'Tennis Shoes', 1, 5)

-- Tennis Coach Female
INSERT INTO GarmDefaultValues(TotalGarmsPAR, TotalJobPAR, Gender, GarmType, GarmSize, GarmLength, GarmCost, 
GarmWeight, MultiUse, MaxNumOfCleanings, GarmDescription, CompanyID, JobID)
VALUES(30, 2,'Female', 'Long Sleeve Shirt', 'Medium', ' ', 28.00, 1.20, 1, 25, 'long sleeve', 1, 4)

INSERT INTO GarmDefaultValues(TotalGarmsPAR, TotalJobPAR, Gender, GarmType, GarmSize, GarmLength, GarmCost, 
GarmWeight, MultiUse, MaxNumOfCleanings, GarmDescription, CompanyID, JobID)
VALUES(20, 2, 'Female', 'TShirt', 'Medium', ' ', 18.00, 1.20, 1, 25, 'Tennis Shirt', 1, 5)

INSERT INTO GarmDefaultValues(TotalGarmsPAR, TotalJobPAR, Gender, GarmType, GarmSize, GarmLength, GarmCost, 
GarmWeight, MultiUse, MaxNumOfCleanings, GarmDescription, CompanyID, JobID)
VALUES(20, 2, 'Female', 'Shorts', '8', ' ', 18.00, 1.20, 1, 25, 'Tennis Shorts', 1, 5)

INSERT INTO GarmDefaultValues(TotalGarmsPAR, TotalJobPAR, Gender, GarmType, GarmSize, GarmLength, GarmCost, 
GarmWeight, MultiUse, MaxNumOfCleanings, GarmDescription, CompanyID, JobID)
VALUES(20, 2, 'Female', 'Vizor', 'Small', ' ', 18.00, 1.20, 1, 25, 'Tennis Hat', 1, 5)

INSERT INTO GarmDefaultValues(TotalGarmsPAR, TotalJobPAR, Gender, GarmType, GarmSize, GarmLength, GarmCost, 
GarmWeight, MultiUse, MaxNumOfCleanings, GarmDescription, CompanyID, JobID)
VALUES(20, 2, 'Female', 'Shoes', '7', ' ', 18.00, 1.20, 1, 25, 'Tennis Shoes', 1, 5)








--Employee Test
INSERT INTO EmployeeCreate(EmployeeID, EmpFirstName, EmpLastName, EmpEmail, Gender, 
ShirtSize, PantSize, ShoeSize, GarmLength, JobID, AltID, HireDate, DivDeptID, SlotAssignment, Conveyor)
VALUES(42515, 'Melissa', 'Gaines', 'gaines@gmail.com', 'Female', 'Medium', '6', '9', ' ', 1, ' ', '7/30/2020', 1, 12, 1)

INSERT INTO EmployeeCreate(EmployeeID, EmpFirstName, EmpLastName, EmpEmail, Gender, 
ShirtSize, PantSize, ShoeSize, GarmLength, JobID, AltID, HireDate, DivDeptID, SlotAssignment, Conveyor)
VALUES(562114, 'Jeff', 'Benson', 'benson@gmail.com', 'Male', 'Large', 'Large', '10', ' ', 4, ' ', '3/23/2020', 4, 55, 2)

INSERT INTO EmployeeCreate(EmployeeID, EmpFirstName, EmpLastName, EmpEmail, Gender, 
ShirtSize, PantSize, ShoeSize, GarmLength, JobID, AltID, HireDate, DivDeptID, SlotAssignment, Conveyor)
VALUES(393751, 'Michael', 'Diplan', 'diplan@gmail.com', 'Male', 'Medium', 'Medium', '10', ' ', 3, ' ', '11/19/2019', 3, 43, 1)

INSERT INTO EmployeeCreate(EmployeeID, EmpFirstName, EmpLastName, EmpEmail, Gender, 
ShirtSize, PantSize, ShoeSize, GarmLength, JobID, AltID, HireDate, DivDeptID, SlotAssignment, Conveyor)
VALUES(785836, 'Becca', 'Geertsema', 'becca@gmail.com', 'Female', 'Medium', '8', '7', ' ', 5 , ' ', '7/2/2020', 5, 23, 1)



-- Test Assigning Emp to Garm
INSERT INTO GarmentInvActivity(GarmentNumber, SlotNumber, RFID_BARCODE, ConveyorNumber, GarmentDefaultID)
VALUES(335465, 12, 65461, 1, 1)
INSERT INTO GarmentInvActivity(GarmentNumber, SlotNumber, RFID_BARCODE, ConveyorNumber, GarmentDefaultID)
VALUES(542654, 12, 54646, 1, 1)
INSERT INTO GarmentInvActivity(GarmentNumber, SlotNumber, RFID_BARCODE, ConveyorNumber, GarmentDefaultID)
VALUES(123433, 12, 77741, 1, 1)
INSERT INTO GarmentInvActivity(GarmentNumber, SlotNumber, RFID_BARCODE, ConveyorNumber, GarmentDefaultID)
VALUES(127634, 12, 347973, 1, 1)
INSERT INTO GarmentInvActivity(GarmentNumber, SlotNumber, RFID_BARCODE, ConveyorNumber, GarmentDefaultID)
VALUES(881234, 12, 543795, 1, 1)
INSERT INTO GarmentInvActivity(GarmentNumber, SlotNumber, RFID_BARCODE, ConveyorNumber, GarmentDefaultID)
VALUES(155234, 12, 3467971, 1, 1)
INSERT INTO GarmentInvActivity(GarmentNumber, SlotNumber, RFID_BARCODE, ConveyorNumber, GarmentDefaultID)
VALUES(123494, 12, 176375, 1, 1)

INSERT INTO GarmentInvActivity(GarmentNumber, EmployeeID, SlotNumber, RFID_BARCODE, ConveyorNumber, GarmentDefaultID)
VALUES(81571, 42515, 12, 236156, 1, 4)
INSERT INTO GarmentInvActivity(GarmentNumber, EmployeeID, SlotNumber, RFID_BARCODE, ConveyorNumber, GarmentDefaultID)
VALUES(57154, 42515, 12, 125876, 1, 4)
INSERT INTO GarmentInvActivity(GarmentNumber, EmployeeID, SlotNumber, RFID_BARCODE, ConveyorNumber, GarmentDefaultID)
VALUES(91755, 42515, 12, 8765324, 1, 5)
INSERT INTO GarmentInvActivity(GarmentNumber, EmployeeID, SlotNumber, RFID_BARCODE, ConveyorNumber, GarmentDefaultID)
VALUES(87868, 42515, 12, 637966, 1, 5)
INSERT INTO GarmentInvActivity(GarmentNumber, EmployeeID, SlotNumber, RFID_BARCODE, ConveyorNumber, GarmentDefaultID)
VALUES(824000, 42515, 12, 025752, 1, 6)

INSERT INTO GarmentInvActivity(GarmentNumber, SlotNumber, RFID_BARCODE, ConveyorNumber, GarmentDefaultID)
VALUES(1333, 12, 10002, 1, 3)
INSERT INTO GarmentInvActivity(GarmentNumber, SlotNumber, RFID_BARCODE, ConveyorNumber, GarmentDefaultID)
VALUES(15502, 12, 410007, 1, 3)


INSERT INTO GarmentInvActivity(GarmentNumber, EmployeeID, SlotNumber, RFID_BARCODE, ConveyorNumber, GarmentDefaultID)
VALUES(649731, 393751, 43, 753951, 1, 26)
INSERT INTO GarmentInvActivity(GarmentNumber, EmployeeID, SlotNumber, RFID_BARCODE, ConveyorNumber, GarmentDefaultID)
VALUES(791349, 393751, 43, 963456, 1, 28)
INSERT INTO GarmentInvActivity(GarmentNumber, EmployeeID, SlotNumber, RFID_BARCODE, ConveyorNumber, GarmentDefaultID)
VALUES(649782, 393751, 43, 753951, 1, 30)

INSERT INTO GarmentInvActivity(GarmentNumber, EmployeeID, SlotNumber, RFID_BARCODE, ConveyorNumber, GarmentDefaultID)
VALUES(159486, 785836, 23, 379128, 1, 45)
INSERT INTO GarmentInvActivity(GarmentNumber, EmployeeID, SlotNumber, RFID_BARCODE, ConveyorNumber, GarmentDefaultID)
VALUES(75866, 785836, 23, 379128, 1, 48)

INSERT INTO GarmentInvActivity(GarmentNumber, EmployeeID, SlotNumber, RFID_BARCODE, ConveyorNumber, GarmentDefaultID)
VALUES(12003, 42515, 12, 11222, 1, 3)
INSERT INTO GarmentInvActivity(GarmentNumber, EmployeeID, SlotNumber, RFID_BARCODE, ConveyorNumber, GarmentDefaultID)
VALUES(12002, 42515, 12, 41117, 1, 3)



INSERT INTO GarmentInvActivity(GarmentNumber, SlotNumber, RFID_BARCODE, ConveyorNumber, GarmentDefaultID)
VALUES(32265, 12, 58888, 1, 1)


INSERT INTO GarmentInvActivity(GarmentNumber, RFID_BARCODE, ConveyorNumber, GarmentDefaultID)
VALUES(860422, 874316, 1, 4)
INSERT INTO GarmentInvActivity(GarmentNumber, RFID_BARCODE, ConveyorNumber, GarmentDefaultID)
VALUES(25589, 451420., 1, 4)
INSERT INTO GarmentInvActivity(GarmentNumber, RFID_BARCODE, ConveyorNumber, GarmentDefaultID)
VALUES(78445, 349167, 1, 5)
INSERT INTO GarmentInvActivity(GarmentNumber, RFID_BARCODE, ConveyorNumber, GarmentDefaultID)
VALUES(63497, 684248, 1, 5)
INSERT INTO GarmentInvActivity(GarmentNumber, RFID_BARCODE, ConveyorNumber, GarmentDefaultID)
VALUES(96484, 316497, 1, 6)


INSERT INTO GarmentInvActivity(GarmentNumber, RFID_BARCODE, ConveyorNumber, GarmentDefaultID)
VALUES(555111, 3784444, 1, 6)


-- 0=YES 1=NO

SELECT * FROM DivDept --WHERE Division = 'Hotel'
SELECT * FROM JobDefinitions
SELECT * FROM GarmDefaultValues WHERE JobID =4

SELECT * FROM GarmentInvActivity 
WHERE GarmentNumber = 1234

SELECT * FROM CompanyManu


SELECT * FROM EmployeeCreate

DELETE FROM JobDefinitions
DELETE FROM DivDept
DELETE FROM CompanyManu
DELETE FROM GarmDefaultValues
DELETE FROM GarmentInvActivity
DELETE FROM EmployeeCreate


SELECT * FROM GarmentActivitySummary --view
SELECT * FROM InventorySearch --view

DROP VIEW InventorySearch


SELECT * FROM SearchEmpInfo

SELECT * FROM GarmDefaultValues  where jobid = 3

SELECT * FROM GarmentInvActivity
WHERE JobID = 3

SELECT DISTINCT GarmentDefaultID FROM GarmentInvActivity

SELECT  * FROM GarmDefaultValues WHERE GarmentDefaultID = 40 AND Gender='Female'

SELECT * FROM EmployeeCreate WHERE EmployeeID = 42515


SELECT * FROM EmployeeGarmentInventory WHERE EmployeeID = 42515
SELECT * FROM JobOutfits WHERE EmployeeID = 42515

INSERT INTO GarmentOrders("employeeid", "garmentdefaultid", "amount", "jobid", "reason", "orderplacedby", "OrderPlacedDate", "orderstatus")
VALUES(42515, 4, 1, 1, 'Lost Garm', 'Melissa', '1/2/2021', 'Pending')

INSERT INTO GarmentOrders("employeeid", "garmentdefaultid", "amount", "jobid", "reason", "orderplacedby", "OrderPlacedDate", "orderstatus")
VALUES(42515, 4, 1, 1, 'Worn Out', 'Jeff', '1/2/2021', 'Pending')

INSERT INTO GarmentOrders("employeeid", "garmentdefaultid", "amount", "jobid", "reason", "orderplacedby", "OrderPlacedDate", "orderstatus")
VALUES(42515, 5, 1, 1, 'PAR Level Low', 'Melissa', '1/2/2021', 'Received')

INSERT INTO GarmentOrders("employeeid", "garmentdefaultid", "amount", "jobid", "reason", "orderplacedby", "OrderPlacedDate", "orderstatus")
VALUES(42515, 5, 1, 1, 'Personal Purchase', 'Melissa', '1/2/2021', 'Shipped')

INSERT INTO GarmentOrders("employeeid", "garmentdefaultid", "amount", "jobid", "reason", "orderplacedby", "OrderPlacedDate", "orderstatus")
VALUES( 42515, 6, 2, 1, 'Lost Garm', 'Michael', '1/2/2021', 'Complete')


INSERT INTO GarmentOrders("employeeid", "garmentdefaultid", "amount", "jobid", "reason", "orderplacedby", "OrderPlacedDate", "orderstatus")
VALUES(785836, 48,1, 5, 'Lost Garm', 'Jeff', '12/4/2020', 'Pending')
INSERT INTO GarmentOrders("employeeid", "garmentdefaultid", "amount", "jobid", "reason", "orderplacedby", "OrderPlacedDate", "orderstatus")
VALUES(785836, 45, 2, 5, 'Worn Out', 'Jeff', '12/4/2020', 'Pending')


INSERT INTO GarmentOrders("employeeid", "garmentdefaultid", "amount", "jobid", "reason", "orderplacedby", "OrderPlacedDate", "orderstatus")
VALUES(393751, 30, 2, 3, 'Worn Out', 'Becca', '12/15/2020', 'Complete')
INSERT INTO GarmentOrders("employeeid", "garmentdefaultid", "amount", "jobid", "reason", "orderplacedby", "OrderPlacedDate", "orderstatus")
VALUES(393751, 29, 2, 3, 'PAR Level Low', 'Becca', '12/15/2020', 'Received')


INSERT INTO GarmentOrders("employeeid", "garmentdefaultid", "amount", "jobid", "reason", "orderplacedby", "OrderPlacedDate", "orderstatus")
VALUES(42515, 3, 2, 3, 'Worn Out', 'Becca', '12/15/2020', 'Complete')
INSERT INTO GarmentOrders("employeeid", "garmentdefaultid", "amount", "jobid", "reason", "orderplacedby", "OrderPlacedDate", "orderstatus")
VALUES(42515, 2, 2, 3, 'PAR Level Low', 'Becca', '12/15/2020', 'Received')


DELETE GarmentOrders


SELECT * FROM JobOutfits WHERE EmployeeID = 42515
SELECT * FROM EmployeeGarmentOrderStats

SELECT * FROM GarmentOrders
SELECT * FROM SearchGarmOrders

INSERT INTO GarmentOrders("garmentdefaultid", "amount", "jobid", "reason", "orderplacedby", "OrderPlacedDate", "orderstatus")
VALUES(29, 2, 3, 'PAR Level Low', 'Jason', '12/15/2020', 'Received')


SELECT * FROM GarmentInvActivity WHERE GarmentNumber = 729271

DELETE FROM GarmentInvActivity WHERE GarmentNumber = 729271

INSERT INTO GarmentInvActivity(GarmentNumber, SlotNumber, RFID_BARCODE, ConveyorNumber, GarmentDefaultID, PickupDate)
VALUES(729271, 13, 2, 2, 6, '2021/12/02 12:12:00')