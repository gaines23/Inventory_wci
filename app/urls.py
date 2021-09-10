from datetime import datetime
from django.urls import path, include
from django.contrib import admin
from django.contrib.auth.views import LoginView, LogoutView
from app import forms, views


urlpatterns = [
    path('', views.home, name='home'),
    path('InventoryLanding/', views.InventoryLanding, name='InventoryLanding'),
    path('AddGarment/', views.GarmentCreate, name='AddGarment'),    
    path('GarmentDetails/<garmentnumber>', views.GarmentDetails, name='GarmentDetails'),
    path('EmployeeLanding/', views.EmployeeLanding, name='EmployeeLanding'),    
    path('EmployeeCreate/', views.EmployeeCreate, name='EmployeeCreate'),
    path('EmployeeDetails/<employeeid>', views.EmployeeDetails, name='EmployeeDetails'),
    path('GarmentActivityLanding/', views.GarmentActivityLanding, name='GarmentActivityLanding'),
    path('GarmentOrdersLanding/', views.GarmentOrdersLanding, name='GarmentOrdersLanding'),
    path('CreateGarmentOrder/', views.CreateGarmentOrder, name='CreateGarmentOrder'),
    path('OrderDetails/<garmentorderid>', views.OrderDetails, name='OrderDetails'),
]
