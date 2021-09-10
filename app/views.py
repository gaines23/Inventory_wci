"""
Definition of views.
"""

from datetime import datetime
from django.shortcuts import render, get_object_or_404, redirect, HttpResponseRedirect, reverse
from django.template import loader, Context
from django.http import HttpRequest
from .models import *
from .forms import *
from django.db.models import Count
from django.forms import ModelForm, inlineformset_factory
from django.views.generic import View, CreateView, UpdateView, DeleteView
from django.http import HttpResponse
from .filters import *
from django.core.mail import send_mail


def home(request):
    assert isinstance(request, HttpRequest)
    
    if request.method == 'POST':
        form = CustomerServiceForm(request.POST)
        if form.is_valid():
            subject = "Customer Support"
            body = {
			'name': form.cleaned_data['name'], 
			'email': form.cleaned_data['email'],
            'issue': form.cleaned_data['issue'],
			'comments':form.cleaned_data['comments'], 
			}
            message = "\n".join(body.values())
            
            try:
                send_mail(subject, message, 'melissa.gaines@white-conveyors.com', ['melissa.gaines@white-conveyors.com']) 
            except BadHeaderError:
                return HttpResponse('Invalid header found.')
        return redirect ("main:home")
      
    form = CustomerServiceForm()
    return render(request, "app/index.html", {'form':form})


# GARMENT TABS               
# Garment Inventory Landing
def InventoryLanding(request):
    assert isinstance(request, HttpRequest)

    model = Inventorysearch
    invsearch = Inventorysearch.objects.all()

    context = {
        'invsearch': invsearch,
    }

    return render(request,
                  'app/inventory/InventoryLanding.html',
                  context,
    )


# Update Garment Info by Garment Number
def GarmentDetails(request, garmentnumber):
    assert isinstance(request, HttpRequest)
  

    # stats related to specific garm filtered by Garm #
    garmstats = Garminvstats.objects.filter(garmentnumber=garmentnumber)

    # fetches info related to garmentnumber or orderid from each table
    garminfo = Garmentinvactivity.objects.get(garmentnumber=garmentnumber)
    #gdefid = Garmentinvactivity.objects.get(garmentdefaultid=garmentdefaultid)
    ords = Garmentorders.objects.all()
    divdept = Divdept.objects.all()
    jobs = Jobdefinitions.objects.all()

    # Query to update Garment info on Form 
    if request.method == 'POST' and 'edit' in request.POST:
        updategarmform = GarmSortForm(request.POST, instance=garminfo)

        if updategarmform.is_valid():
            updategarmform.save()
            return HttpResponseRedirect("/GarmentDetails/"+garmentnumber)
        else:
            updategarmform = GarmSortForm(instance=garminfo)
    else:
        updategarmform = GarmSortForm(instance=garminfo)


    # Deletes Garment from database
    if request.method == 'POST' and 'delete' in request.POST:
        garminfo.delete()
        return HttpResponseRedirect("/InventoryLanding/")
        

    #Adds new order for Garment by Garm Default ID

    context = {'garmstats':garmstats,
               'garminfo':garminfo,
               'updategarmform':updategarmform,
               'ords':ords,
               'jobs':jobs,
               'divdept':divdept,
               #'gdefid':gdefid,
               #'formset':formset,
              }
    
    return render(request, 
                  'app/inventory/GarmentDetails.html',
                  context, 
    )


# CREATES NEW GARMENT IN DB
def GarmentCreate(request):
    assert isinstance(request, HttpRequest)

    if request.method == 'POST':
        add_garm_form = GarmSortForm(data=request.POST)

        if add_garm_form.is_valid():
            gdata = add_garm_form.cleaned_data.get
            garmdef_selected = Garmdefaultvalues.objects.filter(garmentdefaultdef=gdata('garmdef_select'))
            
            garm = Garmentinvactivity(garmentdefaultid_id=garmdef_selected[0].garmentdefaultid, 
                           garmentnumber=gdata('garmentnumber'), slotnumber=gdata('slotnumber'),
                           rfid_barcode=gdata('rfid_barcode'), conveyornumber=gdata('conveyornumber'),
                           garmlocation=gdata('garmlocation'), loaned=gdata('loaned'), 
                           missing=gdata('missing'), altid=gdata('altid'),
                           employeeid=gdata('employeeid'),)
            garm.save()
            return HttpResponseRedirect("/GarmentDetails/"+garmentnumber)
        else:
            print('FAILURE')
    else:
        add_garm_form = GarmSortForm()

    return render(request,
                  'app/inventory/AddGarment.html',
                  {'addgarm':add_garm_form},
    )











# EMPLOYEE TABS
def EmployeeLanding(request):
    assert isinstance(request, HttpRequest)

    model = Searchempinfo
    empsearch = Searchempinfo.objects.all()

    context = {
        'empsearch': empsearch,
    }

    return render(request,
                  'app/employee/EmployeeLanding.html',
                  context,
    )

# Employee Details 
def EmployeeDetails(request, employeeid):
    assert isinstance(request, HttpRequest)

    model = Employeecreate
    empinfo = Employeecreate.objects.get(employeeid=employeeid)

    model = Employeegarmentinventory
    empgarms = Employeegarmentinventory.objects.filter(employeeid=employeeid)

    model = Joboutfits
    jobgarms = Joboutfits.objects.filter(employeeid=employeeid)

    model = Garmentorders
    allemporders = Garmentorders.objects.filter(employeeid=employeeid)

    model = Employeegarmentorderstats
    empgarmstats = Employeegarmentorderstats.objects.filter(employeeid=employeeid)

    model = Divdept
    divdepts = Employeecreate.objects.all()

    model = Jobdefinitions
    jobs = Jobdefinitions.objects.all()


     # Query to update Employee info on Form 
    if request.method == 'POST' and 'edit' in request.POST:
        empinfoform = EmpInfoForm(request.POST, instance=empinfo)

        if empinfoform.is_valid():
            empinfoform.save()
            return HttpResponseRedirect("/EmployeeDetails/"+employeeid)
        else:
            empinfoform = EmpInfoForm(instance=empinfo)
    else:
        empinfoform = EmpInfoForm(instance=empinfo)


    # Deletes Employee from database
    if request.method == 'POST' and 'delete' in request.POST:
        empinfo.delete()
        return HttpResponseRedirect("/EmployeeLanding/")


    
    # Adds New Garment Order for Employee


    context = {'empgarms': empgarms,
               'jobgarms':jobgarms,
               'empgarmstats':empgarmstats,
               'empinfo':empinfo,
               'allemporders':allemporders,
               'empinfoform':empinfoform,
               #'order':neworderform,
               'jobs':jobs,
               'divdepts':divdepts,
              }

    return render(request, 
                  'app/employee/EmployeeDetails.html',
                  context,
    )


# Creates new Employee
def EmployeeCreate(request):
    assert isinstance(request, HttpRequest)

    if request.method == 'POST':
        addempform = EmpInfoForm(data=request.POST)

        if addempform.is_valid():
            jdata = addempform.cleaned_data.get
            jobdef_selected = Jobdefinitions.objects.filter(job=jdata('jobdef_select'))

            ec1 = Employeecreate(jobid_id=jobdef_selected[0].jobid, empfirstname=jdata('empfirstname'), 
                                  emplastname=jdata('emplastname'), gender=jdata('gender'), 
                                  shirtsize=jdata('shirtsize'), pantsize=jdata('pantsize'), 
                                  shoesize=jdata('shoesize'), garmlength=jdata('garmlength'),
                                  hiredate=jdata('hiredate'), alterationinstructions=jdata('alterationinstructions'),
                                  slotassignment=jdata('slotassignment'),
                                  conveyor=jdata('conveyor'), jacketsize=jdata('jacketsize'), 
                                  employeeid=jdata('employeeid'), )
            ec1.save()
            return HttpResponseRedirect("/EmployeeLanding/")
    else:
        addempform = EmpInfoForm()


    return render(request,
                  'app/employee/EmployeeCreate.html',
                  {'addempform':addempform},
    )










#  Garment Activity Search Only
def GarmentActivityLanding(request):
    assert isinstance(request, HttpRequest)

    garmactivity_search = Garmentactivitysummary.objects.all()
    garmactivity_filter = GarmentActivityFilter(request.GET, queryset=garmactivity_search)

    context = {'gafilter': garmactivity_filter, }

    return render(request,
                  'app/garmactivity/GarmentActivityLanding.html',  
                  context
    )









#Garment Orders Landing
def GarmentOrdersLanding(request):
    assert isinstance(request, HttpRequest)

    ordersearch = Searchgarmorders.objects.all()
    ordersearch_filter = GarmOrdersFilter(request.GET, queryset=ordersearch)

    context = {'ordfilter':ordersearch_filter}

    return render(request,
                  'app/garmentorders/GarmentOrdersLanding.html',
                  context,
    )

# Orders Landing Page
def OrderDetails(request, garmentorderid):
    assert isinstance(request, HttpRequest)
    
    model = Garmorderidstats
    orderstats = Garmorderidstats.objects.filter(garmentorderid=garmentorderid)

    model = Garmentorders
    orderdets = Garmentorders.objects.get(garmentorderid=garmentorderid)

    if request.method == 'POST':
        orderdetailform = GarmentOrdersForm(request.POST, instance=orderdets)

        if orderdetailform.is_valid():
            orderdetailform.save()
        else:
            orderdetailform = GarmentOrdersForm(instance=orderdets)
    else:
        orderdetailform = GarmentOrdersForm(instance=orderdets)

    context = {'orderdets': orderdets,
               'orderstats':orderstats,
               'orderdetailform':orderdetailform,
              }

    return render(request, 
                  'app/garmentorders/GarmOrderDetails.html',
                  context, 
     )

def CreateGarmentOrder(request):
    assert isinstance(request, HttpRequest)

    #gdsearch = Garmorderbygdidstats.objects.all()
    #gdsearch_filter = GarmOrderStats(request.GET, queryset=gdsearch)

    if request.method == 'POST':
        neworderform = GarmentOrdersForm(data=request.POST)

        if neworderform.is_valid():
            odata = neworderform.cleaned_data.get
            garmdef_selected = Garmdefaultvalues.objects.filter(garmentdefaultdef=odata('select_garmdef'))
            
            ord = Garmentorders(garmentdefaultid_id=garmdef_selected[0].garmentdefaultid, 
                           garmentorderid=odata('garmentorderid'), employeeid=odata('employeeid'),
                           garmdescription=odata('garmdescription'), reason=odata('reason'), 
                           orderplaceddate=odata('orderplaceddate'), orderplacedby=odata('orderplacedby'), 
                           orderstatus=odata('orderstatus'), amount=odata('amount'), )
            ord.save()
        else:
            print('There has been a issue. Please try again')

    else:
        neworderform = GarmentOrdersForm() 

    return render(request,
                  'app/garmentorders/NewOrder.html',
                  {'order':neworderform,}
    )