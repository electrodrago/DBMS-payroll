from django.contrib import admin
from .models import Department, Deduction, Overload, Role, Salary, Employee, GetDeductionFine, GetOverloadPayment

# Register your models here.
admin.site.register(Department)
admin.site.register(Deduction)
admin.site.register(Overload)
admin.site.register(Role)
admin.site.register(Employee)
admin.site.register(Salary)
admin.site.register(GetOverloadPayment)
admin.site.register(GetDeductionFine)