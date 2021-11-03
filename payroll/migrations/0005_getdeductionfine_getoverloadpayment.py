# Generated by Django 3.2.8 on 2021-11-01 10:59

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('payroll', '0004_auto_20211101_1757'),
    ]

    operations = [
        migrations.CreateModel(
            name='GetOverloadPayment',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('Time', models.DateTimeField()),
                ('employeeID', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='payroll.employee')),
                ('overloadID', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='payroll.overload')),
            ],
        ),
        migrations.CreateModel(
            name='GetDeductionFine',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('Time', models.DateTimeField()),
                ('deductionID', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='payroll.deduction')),
                ('employeeID', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='payroll.employee')),
            ],
        ),
    ]
