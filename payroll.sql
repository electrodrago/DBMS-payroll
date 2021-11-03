CREATE TABLE "DEPARTMENT" (
  "departmentID" int,
  "departmentName" varchar(50),
  PRIMARY KEY ("departmentID")
);


CREATE TABLE "ROLE" (
  "roleID" int,
  "roleName" varchar(50),
  "base_salary" int,
  "departmentID" int,
  PRIMARY KEY ("roleID"),
    constraint fk_employees_departmentID foreign key ("departmentID") 
      references DEPARTMENT("departmentID")
);

CREATE TABLE "OVERLOAD" (
  "overloadID" int,
  "AmountOfMoney" int,
  "Reason" varchar(100),
  PRIMARY KEY ("overloadID")
);


CREATE TABLE "EMPLOYEE" (
  "ID" int,
  "employeeRole" int,
  "phone" varchar(15),
  "email" varchar(50),
  "name" varchar(50),
  PRIMARY KEY ("ID"),
  CONSTRAINT "FK_EMPLOYEE_employeeRole"
    FOREIGN KEY ("employeeRole")
      REFERENCES "ROLE"("roleID")
);

CREATE TABLE "SALARY" (
  "salaryID" int,
  "employeeID" int,
  "TotalMoney" int,
  PRIMARY KEY ("salaryID"),
  CONSTRAINT "FK_SALARY_employeeID"
    FOREIGN KEY ("employeeID")
      REFERENCES "EMPLOYEE"("ID")
);

CREATE TABLE "DEDUCTION" (
  "deductionID" int,
  "AmountOfMoney" int,
  "Reason" varchar(100),
  PRIMARY KEY ("deductionID")
);

CREATE TABLE "GET_DEDUCTION_FINE" (
  "employeeID" int,
  "deductionID" int,
  "Time" TIMESTAMP,
  PRIMARY KEY ("employeeID", "deductionID", "Time"),
  CONSTRAINT "FK_GET_DEDUCTION_FINE_employeeID"
    FOREIGN KEY ("employeeID")
      REFERENCES "EMPLOYEE"("ID"),
  CONSTRAINT "FK_GET_DEDUCTION_FINE_deductionID"
    FOREIGN KEY ("deductionID")
      REFERENCES "DEDUCTION"("deductionID")
);

CREATE TABLE "GET_OVERLOAD_PAYMENT" (
  "employeeID" int,
  "overloadID" int,
  "Time" timestamp,
  PRIMARY KEY ("employeeID", "overloadID", "Time"),
  CONSTRAINT "FK_GET_OVERLOAD_PAYMENT_overloadID"
    FOREIGN KEY ("overloadID")
      REFERENCES "OVERLOAD"("overloadID"),
  CONSTRAINT "FK_GET_OVERLOAD_PAYMENT_employeeID"
    FOREIGN KEY ("employeeID")
      REFERENCES "EMPLOYEE"("ID")
);

INSERT INTO "DEPARTMENT" ("departmentID", "departmentName") VALUES (1, 'Sales');
INSERT INTO "DEPARTMENT" ("departmentID", "departmentName") VALUES (2, 'Develop');
INSERT INTO "DEPARTMENT" ("departmentID", "departmentName") VALUES (3, 'Security');

INSERT INTO "ROLE" ("roleID", "roleName", "base_salary", "departmentID") VALUES (1, 'sales', 4000, 1);
INSERT INTO "ROLE" ("roleID", "roleName", "base_salary", "departmentID") VALUES (2, 'manager', 7000, 1);
INSERT INTO "ROLE" ("roleID", "roleName", "base_salary", "departmentID") VALUES (3, 'developer', 4500, 2);
INSERT INTO "ROLE" ("roleID", "roleName", "base_salary", "departmentID") VALUES (4, 'secretary', 5000, 1);
INSERT INTO "ROLE" ("roleID", "roleName", "base_salary", "departmentID") VALUES (5, 'security', 2000, 3);

INSERT INTO "EMPLOYEE" ("ID", "employeeRole", "phone", "name", "email") VALUES (1, 1, '0914941797', 'Hữu Văn', 'huu.van@company.com');
INSERT INTO "EMPLOYEE" ("ID", "employeeRole", "phone", "name", "email") VALUES (2, 2, '0919643960', 'Tuyến Võ', 'tuyen.vo@company.com');
INSERT INTO "EMPLOYEE" ("ID", "employeeRole", "phone", "name", "email") VALUES (3, 3, '0913027894', 'Hồng Hoàng', 'hong.hoang@company.com');
INSERT INTO "EMPLOYEE" ("ID", "employeeRole", "phone", "name", "email") VALUES (4, 1, '0910057905', 'Lành Nguyen', 'lanh.nguyen@company.com');
INSERT INTO "EMPLOYEE" ("ID", "employeeRole", "phone", "name", "email") VALUES (5, 2, '0919416708', 'Nam Văn', 'nam.van@company.com');
INSERT INTO "EMPLOYEE" ("ID", "employeeRole", "phone", "name", "email") VALUES (6, 3, '0911566493', 'Trí Võ', 'tri.vo@company.com');
INSERT INTO "EMPLOYEE" ("ID", "employeeRole", "phone", "name", "email") VALUES (7, 1, '0916033994', 'Bình Lê', 'binh.le@company.com');
INSERT INTO "EMPLOYEE" ("ID", "employeeRole", "phone", "name", "email") VALUES (8, 4, '0919181769', 'Linh Nguyễn', 'linh.nguyen@company.com');
INSERT INTO "EMPLOYEE" ("ID", "employeeRole", "phone", "name", "email") VALUES (9, 5, '0918666157', 'Bình Võ', 'binh.vo@company.com');
INSERT INTO "EMPLOYEE" ("ID", "employeeRole", "phone", "name", "email") VALUES (10, 1, '0911942882', 'Cam Văn', 'cam.van@company.com');

INSERT INTO "SALARY" ("salaryID", "employeeID", "TotalMoney") VALUES (21090001, 1, 4900);
INSERT INTO "SALARY" ("salaryID", "employeeID", "TotalMoney") VALUES (21090002, 2, 6200);
INSERT INTO "SALARY" ("salaryID", "employeeID", "TotalMoney") VALUES (21090003, 3, 4700);
INSERT INTO "SALARY" ("salaryID", "employeeID", "TotalMoney") VALUES (21090004, 4, 4200);
INSERT INTO "SALARY" ("salaryID", "employeeID", "TotalMoney") VALUES (21090005, 5, 6900);
INSERT INTO "SALARY" ("salaryID", "employeeID", "TotalMoney") VALUES (21090006, 6, 4700);
INSERT INTO "SALARY" ("salaryID", "employeeID", "TotalMoney") VALUES (21090007, 7, 3950);
INSERT INTO "SALARY" ("salaryID", "employeeID", "TotalMoney") VALUES (21090008, 8, 5000);
INSERT INTO "SALARY" ("salaryID", "employeeID", "TotalMoney") VALUES (21090009, 9, 1975);
INSERT INTO "SALARY" ("salaryID", "employeeID", "TotalMoney") VALUES (21090010, 10, 4000);

INSERT INTO "DEDUCTION" ("deductionID","AmountOfMoney", "Reason") VALUES(1, 25, 'Late(15min)');
INSERT INTO "DEDUCTION" ("deductionID","AmountOfMoney", "Reason") VALUES(2, 50, 'Late(30min)');
INSERT INTO "DEDUCTION" ("deductionID","AmountOfMoney", "Reason") VALUES(3, 100, 'absence');
INSERT INTO "DEDUCTION" ("deductionID","AmountOfMoney", "Reason") VALUES(4, 2000, 'Damage properties');


INSERT INTO "OVERLOAD" ("overloadID","AmountOfMoney", "Reason") VALUES(1, 200, 'overtime(2h)');
INSERT INTO "OVERLOAD" ("overloadID","AmountOfMoney", "Reason") VALUES(2, 500, 'Reward for Monthly Competition');
INSERT INTO "OVERLOAD" ("overloadID","AmountOfMoney", "Reason") VALUES(3, 500, 'overtime(4h)');
INSERT INTO "OVERLOAD" ("overloadID","AmountOfMoney", "Reason") VALUES(4, 1000, 'Reward for Employee of the Month');

INSERT INTO "GET_DEDUCTION_FINE" ("employeeID","deductionID", "Time") VALUES(5, 2, TO_TIMESTAMP('2021-09-14 07:45:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "GET_DEDUCTION_FINE" ("employeeID","deductionID", "Time") VALUES(9, 1, TO_TIMESTAMP('2021-09-18 07:45:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "GET_DEDUCTION_FINE" ("employeeID","deductionID", "Time") VALUES(7, 2, TO_TIMESTAMP('2021-09-22 10:45:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "GET_DEDUCTION_FINE" ("employeeID","deductionID", "Time") VALUES(2, 4, TO_TIMESTAMP('2021-09-23 22:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "GET_DEDUCTION_FINE" ("employeeID","deductionID", "Time") VALUES(5, 2, TO_TIMESTAMP('2021-09-24 07:45:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO "GET_OVERLOAD_PAYMENT" ("employeeID","overloadID", "Time") VALUES(1, 3, TO_TIMESTAMP('2021-09-14 07:45:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "GET_OVERLOAD_PAYMENT" ("employeeID","overloadID", "Time") VALUES(2, 1, TO_TIMESTAMP('2021-09-18 09:45:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "GET_OVERLOAD_PAYMENT" ("employeeID","overloadID", "Time") VALUES(1, 1, TO_TIMESTAMP('2021-09-22 10:45:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "GET_OVERLOAD_PAYMENT" ("employeeID","overloadID", "Time") VALUES(2, 4, TO_TIMESTAMP('2021-09-23 22:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "GET_OVERLOAD_PAYMENT" ("employeeID","overloadID", "Time") VALUES(3, 1, TO_TIMESTAMP('2021-09-24 07:45:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "GET_OVERLOAD_PAYMENT" ("employeeID","overloadID", "Time") VALUES(1, 1, TO_TIMESTAMP('2021-09-24 07:45:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "GET_OVERLOAD_PAYMENT" ("employeeID","overloadID", "Time") VALUES(6, 1, TO_TIMESTAMP('2021-09-24 07:45:00', 'YYYY-MM-DD HH24:MI:SS'));
