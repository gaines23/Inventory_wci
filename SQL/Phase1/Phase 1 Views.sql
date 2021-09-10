-- Views Listed Below

-- View search for inventory landing
CREATE VIEW InventorySearch
AS
SELECT
	gia.GarmentNumber AS 'Garment Number'
	, gia.GarmentDefaultID
	, gia.RFID_BARCODE AS 'RFID'
	, CONCAT(dd.Division, ' ,', dd.Department, ' ,', jd.Job) AS 'Job'
	, gd.GarmentDefaultDef AS 'Description'
	, CASE 
		WHEN gia.EmployeeID IS NOT NULL THEN CAST(gia.EmployeeID AS VARCHAR(20))
		ELSE 'Not Assigned'
		END AS 'EmployeeID'
	, CASE 
		WHEN gia.PretaggedID IS NOT NULL AND gia.NonTaggedID IS NULL THEN CAST(gia.PretaggedID AS VARCHAR(20))
		WHEN gia.NonTaggedID IS NOT NULL AND gia.PretaggedID IS NULL THEN CAST(gia.NonTaggedID AS VARCHAR(20))
		WHEN gia.PretaggedID IS NOT NULL AND gia.NonTaggedID IS NOT NULL THEN CONCAT(CAST(gia.PretaggedID AS VARCHAR(20)), ' ', CAST(gia.NonTaggedID AS VARCHAR(20)))
		ELSE 'NA'
		END AS 'AltID'
FROM
	GarmentInvActivity AS gia 
	JOIN GarmDefaultValues AS gd ON gd.GarmentDefaultID = gia.GarmentDefaultID
	JOIN JobDefinitions AS jd ON jd.JobID = gd.JobID
	JOIN DivDept AS dd ON dd.DivDeptID = jd.DivDeptID


-- View search for garment activity and summary info of garment
CREATE VIEW GarmentActivitySummary
AS
SELECT
	gia.GarmentNumber
	, gia.RFID_BARCODE
	, CASE 
		WHEN gia.EmployeeID IS NOT NULL THEN CAST(gia.EmployeeID AS VARCHAR(20))
		ELSE 'Not Assigned'
		END AS 'EmployeeID'
	, CONCAT(dd.Department, ', ', jd.Job) AS DeptJob
	, CASE 
		WHEN gia.SlotNumber IS NOT NULL THEN CAST(gia.SlotNumber AS VARCHAR(20))
		ELSE ISNULL(CAST(gia.SlotNumber AS VARCHAR(20)), 'Unassigned')
		END AS SlotNum
	, CASE
		WHEN gia.ConveyorNumber IS NOT NULL THEN CAST(gia.ConveyorNumber AS VARCHAR(20))
		ELSE ISNULL(CAST(gia.ConveyorNumber AS VARCHAR(20)), 'Unassigned')
		END AS Conveyor
	, gia.GarmLocation
	, CASE 
		WHEN gia.PretaggedID IS NOT NULL AND gia.NonTaggedID IS NULL THEN CAST(gia.PretaggedID AS VARCHAR(20))
		WHEN gia.NonTaggedID IS NOT NULL AND gia.PretaggedID IS NULL THEN CAST(gia.NonTaggedID AS VARCHAR(20))
		WHEN gia.PretaggedID IS NOT NULL AND gia.NonTaggedID IS NOT NULL THEN CONCAT(CAST(gia.PretaggedID AS VARCHAR(20)), ' ', CAST(gia.NonTaggedID AS VARCHAR(20)))
		ELSE 'NA'
		END AS AltID
	, CASE 
		--WHEN gia.PickupTime IS NOT NULL AND gia.PickupDate IS NULL THEN CAST(gia.PickupTime AS VARCHAR(20))
		WHEN gia.PickupDate IS NOT NULL THEN CAST(gia.PickupDate AS VARCHAR(20))
		WHEN gia.PickupDate IS NULL THEN CAST(gia.PickupDate AS VARCHAR(20))
		ELSE 'NA'
		END AS LastPickedUp
	, CASE 
		--WHEN gia.DropoffTime IS NOT NULL AND gia.DropoffDate IS NULL THEN CAST(gia.DropoffTime AS VARCHAR(20))
		WHEN gia.DropoffDate IS NOT NULL THEN CAST(gia.DropoffDate AS VARCHAR(20))
		WHEN gia.DropoffDate IS NOT NULL THEN CAST(gia.DropoffDate AS VARCHAR(20))
		ELSE 'NA'
		END AS LastDroppedOff
	, CASE WHEN gia.Loaned IS NULL THEN 'No'
		ELSE 'Yes'
		END AS Loaned
	, CASE 
		WHEN gia.OneForOne IS NOT NULL THEN CAST(gia.OneForOne AS VARCHAR(20))
		ELSE ISNULL(CAST(gia.OneForOne AS VARCHAR(20)), 'Unassigned')
		END AS OneForOne
	, CASE 
		WHEN gia.Missing IS NOT NULL THEN CAST(gia.Missing AS VARCHAR(20))
		ELSE ISNULL(CAST(gia.Missing AS VARCHAR(20)), 'NA')
		END AS Missing
	, CASE 
		WHEN gia.DelinquentGarm IS NOT NULL THEN CAST(gia.DelinquentGarm AS VARCHAR(20))
		ELSE ISNULL(CAST(gia.DelinquentGarm AS VARCHAR(20)), 'NA')
		END AS DelinquentGarm
	, gd.GarmentDefaultDef -- Size, Type, Gender
FROM
	GarmentInvActivity AS gia JOIN GarmDefaultValues AS gd ON gd.GarmentDefaultID = gia.GarmentDefaultID
	JOIN JobDefinitions AS jd ON jd.JobID = gd.JobID
	JOIN DivDept AS dd ON dd.DivDeptID = jd.DivDeptID


-- Employee Landing Search Categories
CREATE VIEW SearchEmpInfo
AS
SELECT
	ec.EmployeeID AS 'EmployeeID'
	, ec.EmpFirstName AS 'FirstName'
	, ec.EmpLastName AS 'LastName'
	, jd.Job AS 'Job'
	, dd.Department AS 'Department'
FROM
	EmployeeCreate AS ec JOIN JobDefinitions AS jd ON ec.JobID = jd.JobID 
	JOIN DivDept AS dd ON dd.DivDeptID = jd.DivDeptID


-- View of each garment per job
CREATE VIEW JobOutfits
AS
SELECT DISTINCT
	ec.EmployeeID
	, jd.Job AS 'Job'
	, gd.GarmType AS 'GarmentType'
	, gd.GarmDescription
	, CASE WHEN gd.GarmType LIKE 'N%shirt%' THEN (SELECT DISTINCT ec.ShirtSize FROM EmployeeCreate AS ec 
													JOIN JobDefinitions AS jd ON ec.JobID = jd.JobID
													JOIN GarmDefaultValues AS gd ON gd.JobID = jd.JobID	
													WHERE ec.ShirtSize = gd.GarmSize)
			WHEN gd.GarmType LIKE 'N%pant%' THEN (SELECT ec.PantSize FROM EmployeeCreate AS ec 
													JOIN JobDefinitions AS jd ON ec.JobID = jd.JobID
													JOIN GarmDefaultValues AS gd ON gd.JobID = jd.JobID	
													WHERE ec.PantSize = gd.GarmSize)
			WHEN gd.GarmType LIKE 'N%shoe%' THEN (SELECT ec.ShoeSize FROM EmployeeCreate AS ec 
													JOIN JobDefinitions AS jd ON ec.JobID = jd.JobID
													JOIN GarmDefaultValues AS gd ON gd.JobID = jd.JobID	
													WHERE ec.ShoeSize = gd.GarmSize)
			WHEN gd.GarmType LIKE 'N%jacket%' THEN (SELECT ec.JacketSize FROM EmployeeCreate AS ec
														JOIN JobDefinitions AS jd ON ec.JobID = jd.JobID
														JOIN GarmDefaultValues AS gd ON gd.JobID = jd.JobID
														WHERE ec.JacketSize = gd.GarmSize)
			ELSE
				gd.GarmSize
		END AS 'GarmSize'
	, CASE WHEN gd.MultiUse = 1 THEN 'No'
		ELSE 'Yes'
		END AS 'MultiUse'
	, gd.TotalJobPAR AS 'TotalPerJob'
	, CASE WHEN gd.TotalReserveStock IS NULL THEN 0
		ELSE gd.TotalReserveStock
		END AS 'ReserveStock'
	, gd.GarmentDefaultID
	, jd.JobID
FROM
	EmployeeCreate AS ec JOIN JobDefinitions AS jd ON ec.JobID = jd.JobID
	JOIN GarmDefaultValues AS gd ON gd.JobID = jd.JobID	
	JOIN DivDept AS dd ON dd.DivDeptID = jd.DivDeptID
WHERE
	ec.JobID = jd.JobID 
	AND ec.Gender = gd.Gender
	AND ec.ShirtSize = gd.GarmSize
	OR ec.PantSize = gd.GarmSize
	OR ec.ShoeSize = gd.GarmSize
	OR ec.JacketSize = gd.GarmSize

	
-- View of Total Garments In Stock per Garment Def ID
CREATE VIEW TotalInStock
AS
	SELECT
		gia.GarmentDefaultID
		, COUNT(gia.GarmentNumber) AS 'TotalInv'
	FROM
		GarmentInvActivity AS gia 
	GROUP BY
		gia.GarmentDefaultID

-- Total in Reserve Stock (Garment NOT Assigned)
CREATE VIEW TotalReserveStock
AS
	SELECT
		gia.GarmentDefaultID
		, COUNT(gia.GarmentDefaultID) AS 'TotalReserveStock'
	FROM
		GarmentInvActivity AS gia
	WHERE 
		EmployeeID IS NULL
	GROUP BY
		gia.GarmentDefaultID

-- Total of Each Garment, Each Employee is Assigned
CREATE VIEW EmpGarmPAR
AS
	SELECT
		gia.EmployeeID
		, gia.GarmentDefaultID
		, COUNT(gia.GarmentDefaultID) AS 'EmpGarmPAR'
	FROM
		GarmentInvActivity AS gia
	WHERE
		gia.EmployeeID IS NOT NULL
	GROUP BY
		gia.EmployeeID, gia.GarmentDefaultID


-- SUM of all Assigned per GarmDefaultID
CREATE VIEW TotalAssigned
AS
SELECT DISTINCT
	gd.GarmentDefaultID
	, COUNT(gia.Assigned) 'TotalAssigned'
FROM
	GarmDefaultValues AS gd 
	JOIN GarmentInvActivity AS gia ON gia.GarmentDefaultID = GD.GarmentDefaultID
GROUP BY
	gd.GarmentDefaultID


-- Percentage of Inventory per GarmDefaultID 
CREATE VIEW InvFullPercentage
AS
SELECT DISTINCT
	gd.GarmentDefaultID
	, ROUND(SUM(gd.TotalGarmsStock) * 100/ SUM(gd.TotalGarmsPAR), 1) AS 'PercentFull'
FROM
	GarmDefaultValues AS gd
GROUP BY
	gd.GarmentDefaultID



-- View will hold all inventory assigned to each Employee
CREATE VIEW EmployeeGarmentInventory
AS
SELECT DISTINCT
	ec.EmployeeID AS 'EmployeeID'
	, gia.GarmentNumber AS 'GarmentID'
	, gd.GarmType as 'GarmentType'
	, gia.RFID_BARCODE AS 'RFID'
	, gia.SlotNumber AS 'SlotNumber'
	, CASE 
		WHEN gia.PretaggedID IS NOT NULL AND gia.NonTaggedID IS NULL THEN CAST(gia.PretaggedID AS VARCHAR(20))
		WHEN gia.NonTaggedID IS NOT NULL AND gia.PretaggedID IS NULL THEN CAST(gia.NonTaggedID AS VARCHAR(20))
		WHEN gia.PretaggedID IS NOT NULL AND gia.NonTaggedID IS NOT NULL THEN CONCAT(CAST(gia.PretaggedID AS VARCHAR(20)), ' ', CAST(gia.NonTaggedID AS VARCHAR(20)))
		ELSE 'NA'
		END AS AltID
	, CASE 
		--WHEN gia.PickupTime IS NOT NULL AND gia.PickupDate IS NULL THEN CAST(gia.PickupTime AS VARCHAR(20))
		WHEN gia.PickupDate IS NOT NULL THEN CAST(gia.PickupDate AS VARCHAR(20))
		WHEN gia.PickupDate IS NULL THEN CAST(gia.PickupDate AS VARCHAR(20))
		ELSE 'NA'
		END AS LastPickedUp
	, CASE 
		--WHEN gia.DropoffTime IS NOT NULL AND gia.DropoffDate IS NULL THEN CAST(gia.DropoffTime AS VARCHAR(20))
		WHEN gia.DropoffDate IS NOT NULL THEN CAST(gia.DropoffDate AS VARCHAR(20))
		WHEN gia.DropoffDate IS NOT NULL THEN CAST(gia.DropoffDate AS VARCHAR(20))
		ELSE 'NA'
		END AS LastDroppedOff
	, CASE 
		WHEN gia.Missing IS NOT NULL THEN CAST(gia.Missing AS VARCHAR(20))
		ELSE ISNULL(CAST(gia.Missing AS VARCHAR(20)), 'NA')
		END AS Missing
	, egp.EmpGarmPAR
	, gd.GarmentDefaultID
	, gd.TotalJobPAR - egp.EmpGarmPAR AS 'Max Order' -- RENAME TO SOMETHING SMARTER
FROM
	GarmentInvActivity AS gia 
	JOIN GarmDefaultValues AS gd ON gd.GarmentDefaultID = gia.GarmentDefaultID
	JOIN EmployeeCreate AS ec ON gia.EmployeeID = ec.EmployeeID
	JOIN EmpGarmPAR AS egp ON egp.GarmentDefaultID = gd.GarmentDefaultID




-- Employee Garments Stats Specific for EACH Employee
CREATE VIEW EmployeeGarmentOrderStats
AS
SELECT DISTINCT
	ec.EmployeeID AS 'EmployeeID'
	, gd.GarmentDefaultDef AS 'GarmentType'
	, egp.EmpGarmPAR  AS 'EmpGarmPAR'
	, gd.TotalJobPAR
	, gd.TotalReserveStock
	, gd.TotalJobPAR - egp.EmpGarmPAR AS 'Max Order' -- RENAME TO SOMETHING SMARTER
	, gd.TotalReserveStock AS 'TotalUnassigned' 
	, gd.GarmentDefaultID
FROM
	GarmentInvActivity AS gia 
	JOIN GarmDefaultValues AS gd ON gd.GarmentDefaultID = gia.GarmentDefaultID
	JOIN EmployeeCreate AS ec ON gia.EmployeeID = ec.EmployeeID
	JOIN EmpGarmPAR AS egp ON egp.GarmentDefaultID = gd.GarmentDefaultID
WHERE ec.EmployeeID = gia.EmployeeID



-- Seacrches Through All Orders for EmployeeID
CREATE VIEW EmpGarmOrders
AS
SELECT DISTINCT
	gos.GarmentOrderID
	, gos.EmployeeID
	, ec.EmpFullName
	, gos.GarmentDefaultID
	, gd.GarmentDefaultDef AS 'GarmentType'
	, gos.GarmDescription
	, gos.Amount
	, gos.Reason
	, gos.OrderPlacedDate
	, gos.OrderPlacedBy
	, gos.OrderStatus
	, jd.Job
FROM
	GarmentOrders AS gos 
	JOIN GarmDefaultValues AS gd ON gd.GarmentDefaultID = gos.GarmentDefaultID
	JOIN JobDefinitions AS jd ON gos.JobID = jd.JobID
	JOIN EmployeeCreate AS ec ON ec.EmployeeID = gos.EmployeeID
WHERE
	ec.EmployeeID = gos.EmployeeID	





-- Garment Stats in Inv Details Page
-- Sorted by GarmentNumber Only to fit ID Match in Inventory 
-- tab
CREATE VIEW GarmInvStats
AS
SELECT DISTINCT
	gd.GarmentDefaultDef AS 'GarmentType'
	, gd.TotalJobPAR AS 'TotalPerJob'
	, gd.TotalReserveStock
	, gd.TotalGarmsPAR 'MaxAmountInv'
	, gd.TotalGarmsStock AS 'TotalInv' -- in inventory
	, ta.TotalAssigned AS 'TotalAssigned'
	, gd.TotalReserveStock AS 'TotalUnassigned' 
	, ifp.PercentFull AS 'PercentFull'
	, gd.GarmentDefaultID
	, gd.JobID
	, jd.Job
	, gia.GarmentNumber
FROM
	GarmDefaultValues AS gd
	JOIN GarmentInvActivity AS gia ON gia.GarmentDefaultID = gd.GarmentDefaultID
	JOIN TotalAssigned AS ta ON gd.GarmentDefaultID = ta.GarmentDefaultID
	JOIN InvFullPercentage AS ifp ON ifp.GarmentDefaultID = gd.GarmentDefaultID
	JOIN JobDefinitions AS jd ON jd.JobID = gd.JobID

-- Searches by OrderID
CREATE VIEW GarmOrderIDStats
AS
SELECT DISTINCT
	gd.GarmentDefaultDef AS 'GarmentType'
	, gd.TotalJobPAR AS 'TotalPerJob'
	, gd.TotalReserveStock
	, gd.TotalGarmsPAR 'MaxAmountInv'
	, gd.TotalGarmsStock AS 'TotalInv' -- in inventory
	, ta.TotalAssigned AS 'TotalAssigned'
	, gd.TotalReserveStock AS 'TotalUnassigned' 
	, ifp.PercentFull AS 'PercentFull'
	, gos.GarmentOrderID
FROM
	GarmentOrders AS gos 
	right JOIN GarmDefaultValues AS gd ON gd.GarmentDefaultID = gos.GarmentDefaultID
	right JOIN GarmentInvActivity AS gia ON gia.GarmentDefaultID = gos.GarmentDefaultID
	JOIN TotalAssigned AS ta ON gd.GarmentDefaultID = ta.GarmentDefaultID
	JOIN InvFullPercentage as ifp ON ifp.GarmentDefaultID = gd.GarmentDefaultID

	
-- Seacrches Through All Orders For Orders Landing
CREATE VIEW SearchGarmOrders
AS
SELECT
	gos.GarmentOrderID
	, CASE 
		WHEN gos.EmployeeID IS NOT NULL THEN CAST(gos.EmployeeID AS VARCHAR(20))
		ELSE 'Not Assigned'
		END AS 'EmployeeID'	
	, gos.GarmentDefaultID
	, gd.GarmentDefaultDef AS 'GarmentType'
	, gos.GarmDescription
	, gos.Amount
	, gos.Reason
	, gos.OrderPlacedDate
	, gos.OrderPlacedBy
	, gos.OrderStatus
	, jd.Job
FROM
	GarmentOrders AS gos 
	JOIN GarmDefaultValues AS gd ON gd.GarmentDefaultID = gos.GarmentDefaultID
	JOIN JobDefinitions AS jd ON gos.JobID = jd.JobID


