/* If pretagged or nontagged, will be given IDs entered under PretaggedID
or NontaggedID then inserted into GarmActivity, that will then update Inventory

Look into linking both tables with GarmentActivity table
*/


/*
Once garment is scanned, its information is first inserted into GarmentActivity
Then added to Inventory
When assigned, Inventory updates with Employee, EmpJob, and Garment Activity

BIT --> 1 = NO; 0 = YES 

*/

-- Updates DivDept to combine Div and Dept for choice dropdowns in Django (for now)
CREATE TRIGGER CombinesDivDept
ON DivDept
AFTER INSERT
AS
BEGIN
	UPDATE DivDept
	SET
		CombinedDef = CONCAT(i.Division, ', ', i.Department)
	FROM
		INSERTED AS I JOIN DivDept AS dd ON dd.DivDeptID = i.DivDeptID
WHERE
		i.DivDeptID = dd.DivDeptID
END


-- Updates GarmDefaultValues with DefaultDefinition
CREATE TRIGGER CombinedGarmDefaultDef
ON GarmDefaultValues
AFTER INSERT
AS
BEGIN
	UPDATE GarmDefaultValues
	SET
		GarmentDefaultDef = CONCAT(i.Gender , ', ' , i.GarmType , ', ' , i.GarmSize)
	FROM
		INSERTED AS i JOIN GarmDefaultValues AS gd ON gd.GarmentDefaultID = i.GarmentDefaultID
	WHERE
		i.GarmentDefaultID = gd.GarmentDefaultID
END

CREATE TRIGGER ZeroTotalsGD
ON GarmDefaultValues
AFTER INSERT
AS
BEGIN
	UPDATE GarmDefaultValues
	SET
		TotalGarmsStock = CASE WHEN gd.TotalGarmsStock IS NULL THEN 0 END
	FROM
		GarmDefaultValues AS gd
	WHERE
		gd.TotalGarmsStock IS NULL

	UPDATE GarmDefaultValues
		SET
			TotalReserveStock = CASE WHEN gd.TotalReserveStock IS NULL THEN 0 END
		FROM
			GarmDefaultValues AS gd
		WHERE
			gd.TotalReserveStock IS NULL
END


CREATE TRIGGER UpdateTotalPARsInsert
ON GarmentInvActivity
AFTER INSERT
AS
BEGIN
	UPDATE GarmDefaultValues
	SET
		TotalGarmsStock =  tis.TotalInv 
	FROM
		GarmDefaultValues AS gd 
		JOIN TotalInStock AS tis ON tis.GarmentDefaultID = gd.GarmentDefaultID
	WHERE
		tis.GarmentDefaultID = gd.GarmentDefaultID

	UPDATE GarmDefaultValues
		SET
			TotalReserveStock =  trs.TotalReserveStock
		FROM
			GarmDefaultValues AS gd 
			JOIN TotalReserveStock AS trs ON trs.GarmentDefaultID = gd.GarmentDefaultID
		WHERE
			trs.GarmentDefaultID = gd.GarmentDefaultID
END


-- Updates GarmentInvActivity by adding FKs
CREATE TRIGGER UpdateGarmInvIDs
ON GarmentInvActivity
AFTER INSERT
AS
BEGIN
	UPDATE GarmentInvActivity
	SET
		JobID = jd.JobID
		, CompanyID = c.CompanyID
		, DivDeptID = dd.DivDeptID
		--, Assigned = CASE WHEN gia.EmployeeID IS NOT NULL THEN 0 ELSE 1 END
		--, DateAdded = CONVERT(DATE, GETDATE())
	FROM
		INSERTED AS i JOIN GarmentInvActivity AS gia ON gia.GarmentNumber = i.GarmentNumber
		JOIN GarmDefaultValues AS gd on gd.GarmentDefaultID = gia.GarmentDefaultID
		JOIN JobDefinitions AS jd ON jd.JobID = gd.JobID
		JOIN DivDept AS dd ON dd.divdeptID = jd.DivdeptID
		JOIN CompanyManu AS c ON gd.CompanyID = c.CompanyID
	WHERE
		gia.GarmentDefaultID = gd.GarmentDefaultID
END


CREATE TRIGGER GarmAssignedTrigger
ON GarmentInvActivity
AFTER INSERT
AS
BEGIN
	UPDATE GarmentInvActivity
	SET
		Assigned = CASE WHEN gia.Assigned IS NULL THEN 1 ELSE 0 END
		, Loaned = CASE	WHEN gia.Loaned IS NULL THEN 1 ELSE gia.Loaned END
		, OneForOne = CASE WHEN gia.OneForOne IS NULL THEN 1 ELSE gia.OneForOne END
		, DelinquentGarm = CASE WHEN gia.DelinquentGarm IS NULL THEN 1 ELSE gia.DelinquentGarm END
		, GarmLocation = CASE WHEN gia.GarmLocation IS NULL THEN 'NA' END
	FROM
		INSERTED AS i JOIN GarmentInvActivity AS gia ON gia.GarmentNumber = i.GarmentNumber
	WHERE
		i.GarmentNumber = gia.GarmentNumber
END


CREATE TRIGGER EmployeeFullName
ON EmployeeCreate
AFTER INSERT
AS
BEGIN
	UPDATE EmployeeCreate
	SET
		EmpFullName = CONCAT(i.EmpFirstName, ' ', i.EmpMiddleInitial, ' ', i.EmpLastName)
	FROM
		INSERTED AS i JOIN EmployeeCreate AS ec ON ec.EmployeeID = i.EmployeeID
	WHERE
		i.EmployeeID = ec.EmployeeID
END



CREATE TRIGGER UpdateTotalPARs
ON GarmentInvActivity
AFTER UPDATE
AS
BEGIN
	UPDATE GarmDefaultValues
	SET
		TotalGarmsStock =  tis.TotalInv 
	FROM
		GarmDefaultValues AS gd 
		JOIN TotalInStock AS tis ON tis.GarmentDefaultID = gd.GarmentDefaultID
	WHERE
		tis.GarmentDefaultID = gd.GarmentDefaultID

	UPDATE GarmDefaultValues
		SET
			TotalReserveStock =  trs.TotalReserveStock
		FROM
			GarmDefaultValues AS gd 
			JOIN TotalReserveStock AS trs ON trs.GarmentDefaultID = gd.GarmentDefaultID
		WHERE
			trs.GarmentDefaultID = gd.GarmentDefaultID
END



CREATE TRIGGER UpdateDateTimeFormat
ON GarmentInvActivity





