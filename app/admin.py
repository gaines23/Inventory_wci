from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from django.contrib.admin import AdminSite
from .models import *

#Register models here

#######   TABLES  ########
class CompanymanuAdmin(admin.ModelAdmin):
    list_dislpay = ("comapnyid", "companyname", "compaddress", "compphone", "servicetype", "products")
admin.site.register(Companymanu, CompanymanuAdmin)

class DivdeptAdmin(admin.ModelAdmin):
    list_display = ("divdeptid", "division", "department", "yearlybudget", "yeartodate", "combineddef", )
admin.site.register(Divdept, DivdeptAdmin)

class JobdefinitionsAdmin(admin.ModelAdmin):
    list_display = ("jobid", "job", "designatedslots", "divdeptid")
admin.site.register(Jobdefinitions, JobdefinitionsAdmin)

class GarmentdefaultvaluesAdmin(admin.ModelAdmin):
    list_display = ("garmentdefaultid", "totalgarmspar", "totaljobpar", "totalgarmsstock",
                    "totalreservestock", "gender", "garmtype", "garmdescription", "garmsize",
                    "garmlength", "garmcost", "garmweight", "multiuse", "maxnumofcleanings",
                    "jobid", "companyid", )
admin.site.register(Garmdefaultvalues, GarmentdefaultvaluesAdmin)

class GarminvAdmin(admin.ModelAdmin):
    list_display = ("garmentnumber", "employeeid", "slotnumber", "rfid_barcode", "conveyornumber",
                    "altid", "pretaggedid", "nontaggedid", "garmlocation", 
                    "pickupdate", "dropoffdate", "assigned", "loaned",
                    "oneforone", "missing", "delinquentgarm", "divdeptid", "jobid",
                    "garmentdefaultid","companyid",  "dateadded", "alterations")
admin.site.register(Garmentinvactivity, GarminvAdmin)

class EmployeecreateAdmin(admin.ModelAdmin):
    list_display = ("employeeid", "empfirstname", "emplastname", "empmiddleinitial", "empemail",
                    "gender", "shirtsize", "jacketsize", "pantsize", "garmlength", "jobid", "altid"
                    , "alterationinstructions", "hiredate", "empfullname", "divdeptid", 
                    "slotassignment", "conveyor", )
admin.site.register(Employeecreate, EmployeecreateAdmin)

class GarmentordersAdmin(admin.ModelAdmin):
    list_display = ("garmentorderid", "garmentdefaultid", "employeeid", "garmdescription",
                    "jobid", "reason", "amount", "orderplaceddate", "orderplacedby",
                    "orderstatus", )
admin.site.register(Garmentorders, GarmentordersAdmin)






########     VIEWS:     ###########
class GarminvsummaryAdmin(admin.ModelAdmin):
    list_display = ("garmentnumber", "rfid_barcode", "employeeid", "deptjob", 
                  "slotnum", "conveyor", "garmlocation", "altid",
                  "lastpickedup", "lastdroppedoff", "loaned",
                  "oneforone", "missing", "delinquentgarm", 
                  "garmentdefaultdef")
admin.site.register(Garmentactivitysummary, GarminvsummaryAdmin)

class InventorysearchAdmin(admin.ModelAdmin):
    list_display = ("garmentnumber", "rfid", "job", "description", 
                    "employeeid", "altid", "garmentdefaultid") #"employeename",
admin.site.register(Inventorysearch, InventorysearchAdmin)

class EmployeesearchAdmin(admin.ModelAdmin):
    list_display = ("employeeid", "firstname", "lastname", "job", "department")
admin.site.register(Searchempinfo, EmployeesearchAdmin)

class JoboutfitsAdmin(admin.ModelAdmin):
    list_display = ("employeeid", "job", "garmenttype", 
                    "garmdescription", "garmsize",
                    "multiuse",  "totalperjob", "reservestock", "garmentdefaultid", "jobid", )
admin.site.register(Joboutfits, JoboutfitsAdmin)

class EmployeegarmentinventoryAdmin(admin.ModelAdmin):
    list_display = ("employeeid", "garmentid", "garmenttype", "rfid", 
                    "slotnumber", "lastpickedup", "lastdroppedoff", 
                    "missing", "garmentdefaultid", "empgarmpar", )
admin.site.register(Employeegarmentinventory, EmployeegarmentinventoryAdmin)

class EmpgarmparAdmin(admin.ModelAdmin):
    list_display = ("employeeid", "garmentdefaultid", "empgarmpar", )
admin.site.register(Empgarmpar, EmpgarmparAdmin)

class TotalinstockAdmin(admin.ModelAdmin):
    list_display = ("garmentdefaultid", "totalinv")
admin.site.register(Totalinstock, TotalinstockAdmin)

class TotalreservestockAdmin(admin.ModelAdmin):
    list_display = ("garmentdefaultid", "totalreservestock")
admin.site.register(Totalreservestock, TotalreservestockAdmin)

class EmployeegarmstatsAdmin(admin.ModelAdmin):
    list_display = ("employeeid", "garmenttype", 
                    "empgarmpar", "totaljobpar", "totalreservestock",
                    "maxorder", "totalunassigned", "garmentdefaultid", )
admin.site.register(Employeegarmentorderstats, EmployeegarmstatsAdmin)

class SearchgarmordersAdmin(admin.ModelAdmin):
    list_display = ("employeeid", "garmentdefaultid", "garmenttype",
                    "garmdescription", "amount", "reason", "orderplaceddate", "orderplacedby", 
                    "orderstatus", "garmentorderid", )
admin.site.register(Searchgarmorders, SearchgarmordersAdmin)

class GarminvstatsAdmin(admin.ModelAdmin):
    list_display = ("garmenttype", "totalperjob", "totalreservestock",
                    "maxamountinv", "totalinv", "totalassigned", 
                    "totalunassigned", "percentfull", "garmentdefaultid", "jobid", 
                    "job", "garmentnumber", )
admin.site.register(Garminvstats, GarminvstatsAdmin)

class GarmorderIDstatsAdmin(admin.ModelAdmin):
    list_display = ("garmenttype", "totalperjob", "totalreservestock",
                    "maxamountinv", "totalinv", "totalassigned", 
                    "totalunassigned", "percentfull", "garmentorderid", )
admin.site.register(Garmorderidstats, GarmorderIDstatsAdmin)

class EmpordersAdmin(admin.ModelAdmin):
    list_display = ("garmentorderid", "employeeid", "empfullname", 
                    "garmentdefaultid", "garmenttype", "garmentdescription",
                    "amount", "reason", "orderplaceddate", "orderplacedby", 
                    "orderstatus", "job", )