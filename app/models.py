from django.db import models
from datetime import date, datetime

class Companymanu(models.Model):
    companyid = models.AutoField(db_column='CompanyID', primary_key=True)   
    companyname = models.CharField(db_column='CompanyName', unique=True, max_length=255, blank=True, null=True)   
    compaddress = models.TextField(db_column='CompAddress', blank=True, null=True)   
    compphone = models.CharField(db_column='CompPhone', max_length=15, blank=True, null=True)   
    compemail = models.TextField(db_column='CompEmail', blank=True, null=True)   
    servicetype = models.TextField(db_column='ServiceType', blank=True, null=True)   
    products = models.TextField(db_column='Products', blank=True, null=True)   

    class Meta:
        managed = False
        db_table = 'CompanyManu'
        verbose_name_plural = 'Companies and Manufacturers'
    def __str__(self):
        return self.companyname

class Divdept(models.Model):
    divdeptid = models.AutoField(db_column='DivDeptID', primary_key=True)   
    division = models.CharField(db_column='Division', max_length=255, blank=True, null=True)   
    department = models.CharField(db_column='Department', max_length=255, blank=True, null=True)   
    yearlybudget = models.DecimalField(db_column='YearlyBudget', max_digits=10, decimal_places=2, blank=True, null=True)   
    yeartodate = models.DecimalField(db_column='YearToDate', max_digits=10, decimal_places=2, blank=True, null=True)   
    combineddef = models.TextField(db_column='CombinedDef', blank=True, null=True) 

    class Meta:
        managed = False
        db_table = 'DivDept'
        unique_together = (('division', 'department'),)
        verbose_name_plural = 'Divisions and Departments'
    
    def __str__(self):
        return self.division + ", " + self.department

class Jobdefinitions(models.Model):
    jobid = models.AutoField(db_column='JobID', primary_key=True)   
    job = models.CharField(db_column='Job', unique=True, max_length=255, blank=True, null=True)   
    designatedslots = models.IntegerField(db_column='DesignatedSlots', blank=True, null=True)   
    divdeptid = models.ForeignKey(Divdept, on_delete=models.CASCADE, db_column='DivDeptID', blank=True, null=True)   

    class Meta:
        managed = False
        db_table = 'JobDefinitions'
        verbose_name_plural = 'Job Definitions'
    
    def __str__(self):
        return self.job

    def divdept_name(self):
        return self.divdeptid.divdeptid

class Garmdefaultvalues(models.Model):
    genderChoices = (
        ('Male','Male'), ('Female','Female'), ('Other','Other')
     )

    garmSizeChoices = (
        ('XX-Small', 'XX-Small')
        ,('X-Small', 'X-Small')
        , ('Small', 'Small')
        , ('Medium', 'Medium')
        , ('Large', 'Large')
        , ('X-Large', 'X-Large')
        , ('XX-Large', 'XX-Large')
    )

    multiUseChoice = (
        (1, 'No')
       ,(0, 'Yes')
    )

    garmtypeChoices = (
        ('Shirt', 'Shirt')
        , ('Pants', 'Pants')
        , ('Shoes', 'Shoes')
        , ('Jacket', 'Jacket')
    )

    garmentdefaultid = models.AutoField(db_column='GarmentDefaultID', primary_key=True)  
    totalgarmspar = models.IntegerField(db_column='TotalGarmsPAR', blank=True, null=True)  
    totaljobpar = models.IntegerField(db_column='TotalJobPAR', blank=True, null=True)  
    totalgarmsstock = models.IntegerField(db_column='TotalGarmsStock', blank=True, null=True)  
    totalreservestock = models.IntegerField(db_column='TotalReserveStock', blank=True, null=True)  
    gender = models.CharField(db_column='Gender', max_length=10, blank=True, null=True, choices=genderChoices)  
    garmtype = models.CharField(db_column='GarmType', max_length=255, blank=True, null=True, choices=garmtypeChoices)  
    garmdescription = models.TextField(db_column='GarmDescription', blank=True, null=True)  
    garmsize = models.CharField(db_column='GarmSize', max_length=10, blank=True, null=True, choices=garmSizeChoices)  
    garmlength = models.CharField(db_column='GarmLength', max_length=200, blank=True, null=True)  
    garmcost = models.DecimalField(db_column='GarmCost', max_digits=18, decimal_places=0, blank=True, null=True)  
    garmweight = models.DecimalField(db_column='GarmWeight', max_digits=18, decimal_places=0, blank=True, null=True)  
    multiuse = models.BooleanField(db_column='MultiUse', blank=True, null=True, choices=multiUseChoice)  
    maxnumofcleanings = models.IntegerField(db_column='MaxNumOfCleanings', blank=True, null=True)  
    garmentdefaultdef = models.TextField(db_column='GarmentDefaultDef', blank=True, null=True)  
    jobid = models.ForeignKey('Jobdefinitions', on_delete=models.CASCADE, db_column='JobID', blank=True, null=True)  
    companyid = models.ForeignKey('Companymanu', on_delete=models.CASCADE, db_column='CompanyID', blank=True, null=True)  

    class Meta:
        managed = False
        db_table = 'GarmDefaultValues'
        unique_together = (('gender', 'garmtype', 'garmsize', 'garmlength', 'jobid'),)
        verbose_name_plural = 'Garment Default Values'

    def __str__(self):
        return self.garmentdefaultdef

    def job_name(self):
        return self.jobid.job

    def comp_name(self):
        return self.companyid.companyname

# CRUD -- Employee Information
class Employeecreate(models.Model):
    genderChoices = (
        ('Male','Male'), ('Female','Female'), ('Other','Other')
     )

    garmSizeChoices = (
        ('XX-Small', 'XX-Small')
        ,('X-Small', 'X-Small')
        , ('Small', 'Small')
        , ('Medium', 'Medium')
        , ('Large', 'Large')
        , ('X-Large', 'X-Large')
        , ('XX-Large', 'XX-Large')
    )

    employeeid = models.IntegerField(db_column='EmployeeID', primary_key=True) 
    empfirstname = models.CharField(db_column='EmpFirstName', max_length=20, blank=True, null=True)
    emplastname = models.CharField(db_column='EmpLastName', max_length=20, blank=True, null=True) 
    empmiddleinitial = models.CharField(db_column='EmpMiddleInitial', max_length=2, blank=True, null=True)  
    empemail = models.CharField(db_column='EmpEmail', max_length=50, blank=True, null=True) 
    gender = models.CharField(db_column='Gender', max_length=20, blank=True, null=True, choices=genderChoices) 
    shirtsize = models.CharField(db_column='ShirtSize', max_length=20, blank=True, null=True, choices=garmSizeChoices)
    jacketsize = models.CharField(db_column='JacketSize', max_length=20, blank=True, null=True, choices=garmSizeChoices)
    pantsize = models.CharField(db_column='PantSize', max_length=20, blank=True, null=True)
    shoesize = models.CharField(db_column='ShoeSize', max_length=20, blank=True, null=True) 
    garmlength = models.CharField(db_column='GarmLength', max_length=20, blank=True, null=True)   
    jobid = models.ForeignKey('Jobdefinitions', on_delete=models.CASCADE, db_column='JobID', blank=True, null=True) 
    altid = models.IntegerField(db_column='AltID', blank=True, null=True)  
    alterationinstructions = models.TextField(db_column='AlterationInstructions', max_length=200, blank=True, null=True)  
    hiredate = models.DateField(db_column='HireDate', blank=True, null=True) 
    empfullname = models.CharField(db_column='EmpFullName', max_length=100, blank=True, null=True) 
    divdeptid = models.ForeignKey('Divdept', on_delete=models.CASCADE, db_column='DivDeptID', blank=True, null=True)
    slotassignment = models.IntegerField(db_column='SlotAssignment', blank=True, null=True)
    conveyor = models.IntegerField(db_column='Conveyor', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'EmployeeCreate'
        unique_together = (('employeeid', 'empfullname'))
        verbose_name_plural = 'Employees'

    def emp_name(self):
        return self.employeeid.empfullname

    def job_name(self):
        return self.jobid.job

    def divdept_name(self):
        return self.divdeptid.combineddef


# Garment Activity Tracker 
#    - Summary Info to be Added, Edited, and Deleted (CRUD)
class Garmentinvactivity(models.Model):
    loanedChoice = (
        (1, 'No')
       ,(0, 'Yes')
    )

    assignedChoice = (
        (1, 'No')
       ,(0, 'Yes')
    )

    garmentnumber = models.IntegerField(db_column='GarmentNumber', primary_key=True)   
    employeeid = models.ForeignKey('Employeecreate', on_delete=models.CASCADE, db_column='EmployeeID', blank=True, null=True)
    slotnumber = models.IntegerField(db_column='SlotNumber', blank=True, null=True)   
    rfid_barcode = models.CharField(db_column='RFID_BARCODE', max_length=255, blank=True, null=True)   
    conveyornumber = models.IntegerField(db_column='ConveyorNumber', blank=True, null=True)   
    altid = models.IntegerField(db_column='AltID', blank=True, null=True)   
    pretaggedid = models.IntegerField(db_column='PretaggedID', blank=True, null=True)   
    nontaggedid = models.IntegerField(db_column='NonTaggedID', blank=True, null=True)   
    garmlocation = models.CharField(db_column='GarmLocation', max_length=255, blank=True, null=True)   
    pickupdate = models.CharField(db_column='PickupDate', max_length=255, blank=True, null=True)   
    dropoffdate = models.DateTimeField(db_column='DropoffDate', blank=True, null=True)   
    assigned = models.BooleanField(db_column='Assigned', blank=True, null=True, choices=assignedChoice)   
    loaned = models.BooleanField(db_column='Loaned', blank=True, null=True, choices=loanedChoice)   
    oneforone = models.BooleanField(db_column='OneForOne', blank=True, null=True)   
    missing = models.DateField(db_column='Missing', blank=True, null=True)   
    delinquentgarm = models.BooleanField(db_column='DelinquentGarm', blank=True, null=True)   
    alterations = models.TextField(db_column='Alterations', blank=True, null=True)
    jobid = models.ForeignKey('Jobdefinitions', on_delete=models.CASCADE, db_column='JobID', blank=True, null=True)   
    companyid = models.ForeignKey('Companymanu', on_delete=models.CASCADE, db_column='CompanyID', blank=True, null=True)   
    divdeptid = models.ForeignKey('Divdept', on_delete=models.CASCADE, db_column='DivDeptID', blank=True, null=True)   
    garmentdefaultid = models.ForeignKey('Garmdefaultvalues', on_delete=models.CASCADE, db_column='GarmentDefaultID', blank=True, null=True)   
    dateadded = models.DateField(db_column='DateAdded', blank=True, null=True) 

    class Meta:
        managed = False
        db_table = 'GarmentInvActivity'
        verbose_name_plural = 'Garment Activity'
    
    def job_name(self):
        return self.jobid.job

    def garmdef_id(self):
        return self.garmentdefaultid

    def emp_id(self):
        return self.employeeid.employeeid
   


class Garmentorders(models.Model):
    statusChoices = (
        ('----', '----')
        , ('Pending', 'Pending')
        , ('Received', 'Received')
        , ('Complete', 'Complete')
        , ('Shipped', 'Shipped')
    )

    loanedChoices = (
        (0, 'No')
        , (1, 'Yes')
    )

    #reasonChoices = (
    #    ('Lost Garm', 'Lost Garm')
    #    , ('PAR Level Low', 'PAR Level Low')
    #    , ('Personal Purchase', 'Personal Purchase')
    #    , ('Worn Out', 'Worn Out')
    #)

    garmentorderid = models.AutoField(db_column='GarmentOrderID', primary_key=True) 
    garmentdefaultid = models.ForeignKey('Garmdefaultvalues', on_delete=models.CASCADE, db_column='GarmentDefaultID', blank=True, null=True, related_name='ord', related_query_name='ord') 
    employeeid = models.ForeignKey('Employeecreate', on_delete=models.CASCADE, db_column='EmployeeID', blank=True, null=True)
    garmdescription = models.TextField(db_column='GarmDescription', blank=True, null=True)
    jobid = models.ForeignKey('Jobdefinitions', on_delete=models.CASCADE, db_column='JobID', blank=True, null=True)
    reason = models.CharField(db_column='Reason', max_length=250, blank=True, null=True, default=" ")
    loaned = models.BooleanField(db_column='Loaned', blank=True, null=False, choices=loanedChoices, default=" ")
    missing = models.DateField(db_column='Missing', blank=True, null=True, default=" ") 
    amount = models.IntegerField(db_column='Amount', blank=True, null=True, default=" ") 
    orderplaceddate = models.DateField(db_column='OrderPlacedDate', blank=True, null=True, default=date.today) 
    orderplacedby = models.CharField(db_column='OrderPlacedBy', max_length=100, blank=True, null=True, default=" ")
    orderstatus = models.CharField(db_column='OrderStatus', max_length=250, blank=True, null=True, choices=statusChoices, default=" ")

    class Meta:
        managed = False
        db_table = 'GarmentOrders'
        unique_together = (('garmentorderid', 'jobid', 'garmentdefaultid'),)
        verbose_name = 'Garment Orders'

    def job_name(self):
        return self.jobid.job

    def def_id(self):
        return self.garmentdefaultid

    def emp_id(self):
        return self.employeeid.employeeid
   

















#############     VIEWS:    ###############
# View - Inventory Landing Search
class Inventorysearch(models.Model):
    garmentnumber = models.IntegerField(db_column='Garment Number', primary_key=True)    
    garmentdefaultid = models.IntegerField(db_column='GarmentDefaultID', blank=True, null=True)
    rfid = models.TextField(db_column='RFID', blank=True, null=True)  
    job = models.CharField(db_column='Job', max_length=769)
    description = models.CharField(db_column='Description', max_length=277)  
    employeeid = models.CharField(db_column='EmployeeID', max_length=20, blank=True, null=True)  
    #employeename = models.CharField(db_column='Employee Name', blank=True, null=True)    
    altid = models.CharField(db_column='AltID', max_length=41, blank=True, null=True)  

    class Meta:
        managed = False
        db_table = 'InventorySearch'

    def emp_name(self):
        return self.employeeid.employeeid.empfullname

# Garment Information from Search
class Garmentactivitysummary(models.Model):
    garmentnumber = models.IntegerField(db_column='GarmentNumber', primary_key=True)  
    rfid_barcode = models.TextField(db_column='RFID_BARCODE', blank=True, null=True)  
    employeeid = models.CharField(db_column='EmployeeID', max_length=20, blank=True, null=True)    
    deptjob = models.CharField(db_column='DeptJob', max_length=512)
    slotnum = models.CharField(db_column='SlotNum', max_length=20, blank=True, null=True)  
    conveyor = models.CharField(db_column='Conveyor', max_length=20, blank=True, null=True)  
    garmlocation = models.CharField(db_column='GarmLocation', max_length=255, blank=True, null=True)  
    altid = models.CharField(db_column='AltID', max_length=41, blank=True, null=True)  
    lastpickedup = models.CharField(db_column='LastPickedUp', max_length=41, blank=True, null=True)  
    lastdroppedoff = models.CharField(db_column='LastDroppedOff', max_length=41, blank=True, null=True)  
    loaned = models.CharField(db_column='Loaned', max_length=3)  
    oneforone = models.CharField(db_column='OneForOne', max_length=20, blank=True, null=True)  
    missing = models.CharField(db_column='Missing', max_length=20, blank=True, null=True)  
    delinquentgarm = models.CharField(db_column='DelinquentGarm', max_length=20, blank=True, null=True)  
    garmentdefaultdef = models.TextField(db_column='GarmentDefaultDef', blank=True, null=True)  

    class Meta:
        managed = False 
        db_table = 'GarmentActivitySummary'





# Employee Landing Search
class Searchempinfo(models.Model):
    employeeid = models.IntegerField(db_column='EmployeeID', primary_key=True)    
    firstname = models.CharField(db_column='FirstName', max_length=20, blank=True, null=True)
    lastname = models.CharField(db_column='LastName', max_length=20, blank=True, null=True)
    job = models.CharField(db_column='Job', max_length=255, blank=True, null=True)  
    department = models.CharField(db_column='Department', max_length=255, blank=True, null=True)  

    class Meta:
        managed = False
        db_table = 'SearchEmpInfo'


# Custom Outfits for Each Job
class Joboutfits(models.Model):
    employeeid = models.IntegerField(db_column='EmployeeID', primary_key=True)  
    job = models.CharField(db_column='Job', max_length=255, blank=True, null=True)  
    garmenttype = models.CharField(db_column='GarmentType', max_length=255, blank=True, null=True)  
    garmdescription = models.TextField(db_column='GarmDescription', blank=True, null=True)  
    garmsize = models.CharField(db_column='GarmSize', max_length=20, blank=True, null=True)  
    multiuse = models.CharField(db_column='MultiUse', max_length=3)  
    totalperjob = models.IntegerField(db_column='TotalPerJob', blank=True, null=True)  
    reservestock = models.IntegerField(db_column='ReserveStock', blank=True, null=True)  
    garmentdefaultid = models.IntegerField(db_column='GarmentDefaultID')  
    jobid = models.IntegerField(db_column='JobID')  

    class Meta:
        managed = False
        db_table = 'JobOutfits'

# Employee's Garments Assigned to Them Per Job
class Employeegarmentinventory(models.Model):
    employeeid = models.IntegerField(db_column='EmployeeID', primary_key=True)    
    garmentid = models.IntegerField(db_column='GarmentID')    
    garmenttype = models.CharField(db_column='GarmentType', max_length=255, blank=True, null=True)    
    rfid = models.TextField(db_column='RFID', blank=True, null=True)  
    slotnumber = models.IntegerField(db_column='SlotNumber', blank=True, null=True)    
    lastpickedup = models.CharField(db_column='LastPickedUp', max_length=41, blank=True, null=True)  
    lastdroppedoff = models.CharField(db_column='LastDroppedOff', max_length=41, blank=True, null=True)  
    missing = models.CharField(db_column='Missing', max_length=20, blank=True, null=True)  
    empgarmpar = models.IntegerField(db_column='EmpGarmPAR', blank=True, null=True) 
    garmentdefaultid = models.IntegerField(db_column='GarmentDefaultID')  

    class Meta:
        managed = False 
        db_table = 'EmployeeGarmentInventory'

# Garments Assigned to Employees PAR
class Empgarmpar(models.Model):
    employeeid = models.IntegerField(db_column='EmployeeID', blank=True, null=True)  
    garmentdefaultid = models.IntegerField(db_column='GarmentDefaultID', blank=True, null=True)  
    empgarmpar = models.IntegerField(db_column='EmpGarmPAR', blank=True, null=True)  

    class Meta:
        managed = False 
        db_table = 'EmpGarmPAR'








# Total Garments in Inventory by ID
class Totalinstock(models.Model):
    garmentdefaultid = models.IntegerField(db_column='GarmentDefaultID', blank=True, null=True, )  
    totalinv = models.IntegerField(db_column='TotalInv', blank=True, null=True)  

    class Meta:
        managed = False
        db_table = 'TotalInStock'

# Total Garments in Reserve Stock (total assigned - total in stock)
class Totalreservestock(models.Model):
    garmentdefaultid = models.IntegerField(db_column='GarmentDefaultID', blank=True, null=True, )  
    totalreservestock = models.IntegerField(db_column='TotalReserveStock', blank=True, null=True)  

    class Meta:
        managed = False
        db_table = 'TotalReserveStock'





# Employee Garment Stats
class Employeegarmentorderstats(models.Model):
    employeeid = models.IntegerField(db_column='EmployeeID', primary_key=True)
    garmenttype = models.TextField(db_column='GarmentType', blank=True, null=True)
    empgarmpar = models.IntegerField(db_column='EmpGarmPAR', blank=True, null=True)
    totaljobpar = models.IntegerField(db_column='TotalJobPAR', blank=True, null=True)
    totalreservestock = models.IntegerField(db_column='TotalReserveStock', blank=True, null=True) 
    maxorder = models.IntegerField(db_column='Max Order', blank=True, null=True)
    totalunassigned = models.IntegerField(db_column='TotalUnassigned', blank=True, null=True)
    garmentdefaultid = models.IntegerField(db_column='GarmentDefaultID')

    class Meta:
        managed = False
        db_table = 'EmployeeGarmentOrderStats'

# Employee Orders Table
class Searchgarmorders(models.Model):
    garmentorderid = models.IntegerField(db_column='GarmentOrderID', primary_key=True)
    employeeid = models.IntegerField(db_column='EmployeeID')
    garmentdefaultid = models.IntegerField(db_column='GarmentDefaultID') 
    garmenttype = models.CharField(db_column='GarmentType', max_length=279)
    garmdescription = models.TextField(db_column='GarmDescription', blank=True, null=True)
    amount = models.IntegerField(db_column='Amount', blank=True, null=True)
    reason = models.CharField(db_column='Reason', max_length=250, blank=True, null=True)
    orderplaceddate = models.DateField(db_column='OrderPlacedDate', blank=True, null=True)
    orderplacedby = models.TextField(db_column='OrderPlacedBy', blank=True, null=True)
    orderstatus = models.TextField(db_column='OrderStatus', blank=True, null=True)
    #job = models.CharField(db_column='Job', max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'SearchGarmOrders'

# Garment Order Stats by GarmentOrderID
class Garminvstats(models.Model):
    garmenttype = models.CharField(db_column='GarmentType', max_length=200, blank=True, null=True) 
    totalperjob = models.IntegerField(db_column='TotalPerJob', blank=True, null=True)  
    totalreservestock = models.IntegerField(db_column='TotalReserveStock', blank=True, null=True)
    maxamountinv = models.IntegerField(db_column='MaxAmountInv', blank=True, null=True) 
    totalinv = models.IntegerField(db_column='TotalInv', blank=True, null=True) 
    totalassigned = models.IntegerField(db_column='TotalAssigned', blank=True, null=True)
    totalunassigned = models.IntegerField(db_column='TotalUnassigned', blank=True, null=True) 
    percentfull = models.IntegerField(db_column='PercentFull', blank=True, null=True) 
    garmentdefaultid = models.IntegerField(db_column='GarmentDefaultID', blank=True) 
    jobid = models.IntegerField(db_column='JobID', blank=True, null=True) 
    job = models.CharField(db_column='Job', max_length=255, blank=True, null=True) 
    garmentnumber = models.IntegerField(db_column='GarmentNumber', primary_key=True)

    class Meta:
        managed = False
        db_table = 'Garminvstats'
     

# Garment Order Stats by Order ID
class Garmorderidstats(models.Model):
    garmenttype = models.CharField(db_column='GarmentType', max_length=200, blank=True, null=True)  
    totalperjob = models.IntegerField(db_column='TotalPerJob', blank=True, null=True)  
    totalreservestock = models.IntegerField(db_column='TotalReserveStock', blank=True, null=True) 
    maxamountinv = models.IntegerField(db_column='MaxAmountInv', blank=True, null=True)  
    totalinv = models.IntegerField(db_column='TotalInv', blank=True, null=True)  
    totalassigned = models.IntegerField(db_column='TotalAssigned', blank=True, null=True)  
    totalunassigned = models.IntegerField(db_column='TotalUnassigned', blank=True, null=True)  
    percentfull = models.IntegerField(db_column='PercentFull', blank=True, null=True)  
    garmentorderid = models.IntegerField(db_column='GarmentOrderID', blank=True, primary_key=True) 

    class Meta:
        managed = False
        db_table = 'GarmOrderIDStats'


class Empgarmorders(models.Model):
    garmentorderid = models.IntegerField(db_column='GarmentOrderID', primary_key=True)
    employeeid = models.IntegerField(db_column='EmployeeID', blank=True, null=True)
    empfullname = models.TextField(db_column='EmpFullName', blank=True, null=True)
    garmentdefaultid = models.IntegerField(db_column='GarmentDefaultID', blank=True, null=True)
    garmenttype = models.TextField(db_column='GarmentType', blank=True, null=True)
    garmdescription = models.TextField(db_column='GarmDescription', blank=True, null=True)
    amount = models.IntegerField(db_column='Amount', blank=True, null=True)
    reason = models.TextField(db_column='Reason', blank=True, null=True)
    orderplaceddate = models.DateField(db_column='OrderPlacedDate', blank=True, null=True)
    orderplacedby = models.TextField(db_column='OrderPlacedBy', blank=True, null=True)
    orderstatus = models.TextField(db_column='OrderStatus', blank=True, null=True)
    job = models.CharField(db_column='Job', max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'EmpGarmOrders'















########   Admin Models   ############
class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.BooleanField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.BooleanField()
    is_active = models.BooleanField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.SmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class Sysdiagrams(models.Model):
    name = models.CharField(max_length=128)
    principal_id = models.IntegerField()
    diagram_id = models.AutoField(primary_key=True)
    version = models.IntegerField(blank=True, null=True)
    definition = models.BinaryField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'sysdiagrams'
        unique_together = (('principal_id', 'name'),)