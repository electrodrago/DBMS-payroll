# DBMS-payroll
This is application part of DBMS mini project

This project uses PostgresSQL, if you use other DBMS then you should make a change in settings.py file.

Run this Django project with terminal by python manage.py runserver

On the url of the browser,
* Add /pdf to get the report of the month.
* Add /search to go to the search page, with the search page, input the salary ID of the employee suppose 21090001 to get the Amount Of Money, Overload and Deduction.
* You should create a super user with python manage.py createsuper to enter /admin. In this page, you can input the database with the form that Django support.
