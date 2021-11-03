from django.db import models
from django.db import connection


# Create your models here.
class Department(models.Model):
    departmentID = models.IntegerField(primary_key=True)
    departmentName = models.CharField(max_length=50)


class Role(models.Model):
    roleID = models.IntegerField(primary_key=True)
    roleName = models.CharField(max_length=50)
    base_salary = models.IntegerField()
    departmentID = models.ForeignKey(Department, on_delete=models.CASCADE)


class Overload(models.Model):
    overloadID = models.IntegerField(primary_key=True)
    AmountOfMoney = models.IntegerField()
    Reason = models.CharField(max_length=100)


class Employee(models.Model):
    ID = models.IntegerField(primary_key=True)
    employeeRole = models.ForeignKey(Role, on_delete=models.CASCADE)
    # departmentID = models.ForeignKey(Department, on_delete=models.CASCADE)
    phone = models.CharField(max_length=15)
    email = models.EmailField(max_length=50)
    name = models.CharField(max_length=50)


class Salary(models.Model):
    salaryID = models.IntegerField(primary_key=True)
    employeeID = models.ForeignKey(Employee, on_delete=models.CASCADE)
    TotalMoney = models.IntegerField()

    def get_employeeID(self):
        return self.employeeID


class Deduction(models.Model):
    deductionID = models.IntegerField(primary_key=True)
    AmountOfMoney = models.IntegerField()
    Reason = models.CharField(max_length=100)


class GetDeductionFine(models.Model):
    id = models.AutoField(primary_key=True)
    employeeID = models.ForeignKey(Employee, on_delete=models.CASCADE)
    deductionID = models.ForeignKey(Deduction, on_delete=models.CASCADE)
    Time = models.DateTimeField()


class GetOverloadPayment(models.Model):
    id = models.AutoField(primary_key=True)
    employeeID = models.ForeignKey(Employee, on_delete=models.CASCADE)
    overloadID = models.ForeignKey(Overload, on_delete=models.CASCADE)
    Time = models.DateTimeField()
# SQL code need to run separately --------------------------------------------------------------------------------

# CREATE TABLE "GET_DEDUCTION_FINE" (
#   "employeeID" int,
#   "deductionID" int,
#   "Time" TIMESTAMP,
#   PRIMARY KEY ("employeeID", "deductionID", "Time"),
#   CONSTRAINT "FK_GET_DEDUCTION_FINE_employeeID"
#     FOREIGN KEY ("employeeID")
#       REFERENCES "EMPLOYEE"("ID"),
#   CONSTRAINT "FK_GET_DEDUCTION_FINE_deductionID"
#     FOREIGN KEY ("deductionID")
#       REFERENCES "DEDUCTION"("deductionID")
# );
#
# CREATE TABLE "GET_OVERLOAD_PAYMENT" (
#   "employeeID" int,
#   "overloadID" int,
#   "Time" timestamp,
#   PRIMARY KEY ("employeeID", "overloadID", "Time"),
#   CONSTRAINT "FK_GET_OVERLOAD_PAYMENT_overloadID"
#     FOREIGN KEY ("overloadID")
#       REFERENCES "OVERLOAD"("overloadID"),
#   CONSTRAINT "FK_GET_OVERLOAD_PAYMENT_employeeID"
#     FOREIGN KEY ("employeeID")
#       REFERENCES "EMPLOYEE"("ID")
# );
