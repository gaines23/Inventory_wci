import django_filters
from .models import *
#from django.db.models import Q

# INVENOTRY LANDING
# Filters table search for Inventory Landing page
class InvSearchFilter(django_filters.FilterSet):
    class Meta:
        model = Inventorysearch
        fields = ['garmentnumber', 'rfid', 'altid', 'job', 'employeeid',]


# GARMENT ACTIVITY
# Table search for Garment Activity info
class GarmentActivityFilter(django_filters.FilterSet):
    class Meta:
        model = Garmentactivitysummary
        fields = ['garmentnumber', 'rfid_barcode', 'conveyor', 'deptjob', ]



# Garment Orders Landing Search
class GarmOrdersFilter(django_filters.FilterSet):
    class Meta:
        model = Searchgarmorders
        fields = ["garmentorderid", "employeeid", "orderstatus",  ]#"job",

