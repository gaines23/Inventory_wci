"""
Definition of forms.
"""
from django import forms
from django.forms import ModelForm
from django.contrib.auth.forms import AuthenticationForm
from .models import *
import json
from datetime import date
from django.forms.widgets import *
from django.utils.translation import ugettext_lazy as _

# Login Form
class BootstrapAuthenticationForm(AuthenticationForm):
    username = forms.CharField(max_length=200,
                               widget=forms.TextInput({
                                   'class': 'form-control',
                                   'placeholder': 'User name'}))
    password = forms.CharField(label=_("Password"),
                               widget=forms.PasswordInput({
                                   'class': 'form-control',
                                   'placeholder':'Password'}))

# Customer Support Form
IssueOptions=[
    ('rehomed', 'Conveyor needs to be Rehomed'),
    ('power', 'Power outage'),
    ('slots', 'Slot numbers are off'),
    ('info', 'Employee or Garment information cannot be found'),
    ('sql', 'Database is not updating'),
    ('keypad', 'Keypad is not working'),
    ('other', 'If reason is not listed, please explain below')
]

class CustomerServiceForm(forms.Form):
    name = forms.CharField(max_length=40)
    email = forms.EmailField()
    to = forms.EmailField()
    issue = forms.ChoiceField(choices=IssueOptions)
    comments = forms.CharField(required=False, widget=forms.Textarea)



##### INVENTORY TAB INFORMATION ######

# Garment Info Form
class GarmSortForm(forms.ModelForm):  
    # Can search by JOB to filter specific Garments related to Job
    dgarms = {}
    list_garmdef= []
    for garm in Garmdefaultvalues.objects.all():
        if garm.jobid.job in dgarms:
            dgarms[garm.jobid.job].append(garm.garmentdefaultdef)
        else:
            dgarms[garm.jobid.job] = [garm.garmentdefaultdef]
        list_garmdef.append((garm.garmentdefaultdef, garm.garmentdefaultdef))

    jobs = [str(job_name) for job_name in Jobdefinitions.objects.all()]

    jobs_select = forms.ChoiceField(choices=([(job_name, job_name) for job_name in jobs]))
    garmdef_select = forms.ChoiceField(choices=(list_garmdef))

    jobs = json.dumps(jobs)
    garms = json.dumps(dgarms)

    #EmployeeID filters specific Employee Name 

    loaned = forms.ChoiceField(choices=Garmentinvactivity.loanedChoice, required=False)
    missing = forms.DateField(widget=NumberInput(attrs={'type': 'date'}), initial=date.today, required=False)
    slotnumber = forms.IntegerField(required=False)
    pickupdate = forms.DateTimeField(widget=TextInput(attrs={'type': 'datetime-local'}), input_formats=['%m/%d/%y %H:%M'], initial=date.today, required=False)
    dropoffdate = forms.DateTimeField(widget=TextInput(attrs={'type': 'datetime-local', }), input_formats=['%m/%d/%y %H:%M'], initial=date.today, required=False)
    dateadded = forms.DateField(widget=NumberInput(attrs={'type': 'date'}), initial=date.today, required=False)


    class Meta:
        model = Garmentinvactivity
        fields = [ "jobs_select", "garmdef_select", "garmentnumber",
                 "slotnumber", "rfid_barcode", "conveyornumber", 
                 "garmlocation", "loaned", "missing", 
                 "altid", "employeeid", "jobid", "garmentdefaultid", "divdeptid",
                 "pickupdate", "dropoffdate", "dateadded", "alterations"]


# Inventory Search
class InvSearchForm(forms.ModelForm):
    class Meta:
        model = Inventorysearch
        fields = ["garmentnumber", "rfid", "job",
                  "description", "employeeid", "garmentdefaultid", ]
#"employeename",

# Inv Stats per Garment Number
class GarmInvStatsForm(forms.ModelForm):
    class Meta:
        model = Garminvstats
        fields = ["garmenttype", "totalperjob", "totalreservestock",
                    "maxamountinv", "totalinv", "totalassigned", 
                    "totalunassigned", "percentfull", "garmentdefaultid", "jobid",
                    "job", "garmentnumber", ]

class GarmActForm(forms.ModelForm):
    dateadded = forms.DateField(widget=NumberInput(attrs={'type': 'date'}), initial=date.today, required=False)
    loaned = forms.ChoiceField(choices=Garmentinvactivity.loanedChoice)
    assigned = forms.ChoiceField(choices=Garmentinvactivity.assignedChoice)

    class Meta:
        model = Garmentinvactivity
        fields = '__all__'




###### EMPLOYEE TAB INFORMATION ######

# Employee Information Tab
class EmpInfoForm(forms.ModelForm):
    #djobs = {}
    #list_jobs = []
    #for jd in Jobdefinitions.objects.all():
    #    if jd.divdeptid.combineddef in djobs:
    #        djobs[jd.divdeptid.combineddef].append(jd.job)
    #    else:
    #        djobs[jd.divdeptid.combineddef] = [jd.job]
    #    list_jobs.append((jd.job, jd.job))

    #divs = [str(divdept_name) for divdept_name in Divdept.objects.all()]

    #divdept_select = forms.ChoiceField(choices=([(divdept_name, divdept_name) for divdept_name in divs]))
    #jobdef_select = forms.ChoiceField(choices=(list_jobs))
    
    #divs = json.dumps(divs)
    #jobs = json.dumps(djobs)

    gender = forms.ChoiceField(choices=Employeecreate.genderChoices, required=False)
    garmsize = forms.ChoiceField(choices=Employeecreate.garmSizeChoices, required=False)
    hiredate = forms.DateField(widget=NumberInput(attrs={'type': 'date'}), initial=date.today, required=False)

    class Meta:
        model = Employeecreate
        fields = [ "employeeid", "empfirstname", "emplastname", 
                  "gender", "shirtsize", "pantsize", "shoesize", "garmlength", 
                  "hiredate", "alterationinstructions", "empmiddleinitial",
                  "empemail", "slotassignment", "conveyor", "jacketsize", "jobid", "divdeptid"]
#"divdept_select", "jobdef_select",
# Assigned Garments (To Specific Employee) Form 
class AssignedGarmsForm(forms.ModelForm):
    class Meta:
        model = Employeegarmentinventory
        fields = ["employeeid", "garmentid", "rfid", "garmenttype", 
                  "slotnumber", "lastpickedup", "lastdroppedoff", "missing",
                  "empgarmpar", "garmentdefaultid",]

# Garments Assigned to Specific Job Form
class JobGarmsForm(forms.ModelForm):
    class Meta:
        model = Joboutfits
        fields = ["employeeid", "job", "garmenttype", 
                  "garmdescription", "garmsize", "multiuse", "totalperjob",
                  "reservestock", "garmentdefaultid", "jobid", ]

# Employee Stats Regarding Garms Assigned to Employye
class EmpGarmStatsForm(forms.ModelForm):
    class Meta:
        model = Employeegarmentorderstats
        fields = ["employeeid", "garmenttype", "empgarmpar", "totaljobpar", 
                  "totalreservestock", "maxorder", ]







###### Garment Orders Tab ########

#Order Landing Table
class SearchOrders(forms.ModelForm):
    orderplaceddate = forms.DateField(widget=NumberInput(attrs={'type': 'date'}), initial=date.today, required=False)

    class Meta:
        model = Searchgarmorders
        fields = ["garmentorderid", "employeeid", "garmentdefaultid",  "garmenttype", "garmdescription",
                  "amount", "reason", "orderplaceddate", "orderplacedby", "orderstatus",  ]#"job",



# Garment Orders Search Form 
class GarmentOrdersForm(forms.ModelForm):
    missing = forms.DateField(widget=NumberInput(attrs={'type': 'date', 'class': 'missing'}), initial=date.today)
    orderplaceddate = forms.DateField(widget=NumberInput(attrs={'type': 'date', 'class': 'placedon'}), initial=date.today)
    reason = forms.CharField(widget=TextInput(attrs={'class':'reason'}))
    orderstatus = forms.ChoiceField(choices=Garmentorders.statusChoices)
    loaned = forms.ChoiceField(choices=Garmentorders.loanedChoices)
    amount = forms.CharField(widget=forms.TextInput(attrs={'class':'amt'}))
    orderplacedby = forms.CharField(widget=forms.TextInput(attrs={'class':'placedby'}))

    class Meta:
        model = Garmentorders
        fields =  ["employeeid", "reason", "amount",
                  "orderplaceddate", "orderplacedby", "orderstatus", 
                  "missing", "loaned",]



class GarmentOrderIDStats(forms.ModelForm):
    class Meta:
        model = Garmorderidstats
        fields = ["garmenttype", "totalperjob", "totalreservestock",
                    "maxamountinv", "totalinv", "totalassigned", 
                    "totalunassigned", "percentfull", "garmentorderid"]



    #ogarms = {}
    #list_garmdef= []
    #for garm in Garmdefaultvalues.objects.all():
    #    if garm.jobid.job in ogarms:
    #        ogarms[garm.jobid.job].append(garm.garmentdefaultdef)
    #    else:
    #        ogarms[garm.jobid.job] = [garm.garmentdefaultdef]
    #    list_garmdef.append((garm.garmentdefaultdef, garm.garmentdefaultdef))

    #jobchoices = [str(job_name) for job_name in Jobdefinitions.objects.all()]

    #select_job = forms.ChoiceField(choices=([(job_name, job_name) for job_name in jobchoices]))
    #select_garmdef = forms.ChoiceField(choices=(list_garmdef))

    #jobchoices = json.dumps(jobchoices)
    #garmchoices = json.dumps(ogarms)