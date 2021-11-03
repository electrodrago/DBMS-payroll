from django.shortcuts import render
from .models import Salary, Overload, Deduction, Employee, GetDeductionFine, GetOverloadPayment, Role
from django.http import HttpResponse
from django.views.generic import View
from .utils import render_to_pdf
from django.template.loader import get_template
import datetime


# Create your views here.
def home(request):
    all_salary = Salary.objects.all()
    return render(request, 'home.html', {'all': all_salary})


def search(request):
    if request.method == "POST":
        searched = request.POST['searched']
        totalSalary = Salary.objects.filter(salaryID=searched)
        empName = Employee.objects.filter(salary__salaryID__exact=searched).values('name')
        empName = empName.get()
        base_salary = Role.objects.filter(employee__name=empName['name']).values('base_salary')
        base_salary = base_salary.get()
        overload = Overload.objects.filter(getoverloadpayment__employeeID__name=empName['name'])
        deduction = Deduction.objects.filter(getdeductionfine__employeeID__name=empName['name'])
        return render(request, 'search.html', {
            'searched': searched,
            'totalSalary': totalSalary,
            'empName': empName,
            'overload': overload,
            'deduction': deduction,
            'baseSalary': base_salary
        })
    else:
        return render(request, 'search.html', {})


class GeneratePdf(View):
    def get(self, request, *args, **kwargs):
        employee = Employee.objects.all()
        salary = Salary.objects.all()
        list = zip(employee, salary)
        data = {
            'today': datetime.date.today(),
            'employee': employee,
            'salary': salary,
            'list': list
        }
        pdf = render_to_pdf('pdf/invoice.html', data)
        return HttpResponse(pdf, content_type='application/pdf')