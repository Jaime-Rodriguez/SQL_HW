-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/JvuwG9
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "Employees" (
"emp_no" INT   NOT NULL,
"birth_date" DATE   NOT NULL,
"first_name" VARCHAR(20)   NOT NULL,
"last_name" VARCHAR(20)   NOT NULL,
"gender" VARCHAR(1)   NOT NULL,
"hire_date" DATE   NOT NULL,
CONSTRAINT "pk_Employees" PRIMARY KEY (
"emp_no"
)
);

CREATE TABLE "Salaries" (
"emp_no" INT   NOT NULL,
"salary" INT   NOT NULL,
"from_date" DATE   NOT NULL,
"to_date" DATE   NOT NULL,
CONSTRAINT "pk_Salaries" PRIMARY KEY (
"emp_no","from_date"
)
);

CREATE TABLE "Departments" (
"dept_no" VARCHAR(4)   NOT NULL,
"dept_name" VARCHAR(20)   NOT NULL,
CONSTRAINT "pk_Departments" PRIMARY KEY (
"dept_no"
)
);

CREATE TABLE "Dept_Emp" (
"emp_no" INT   NOT NULL,
"dept_no" VARCHAR(4)   NOT NULL,
"from_date" DATE   NOT NULL,
"to_date" DATE   NOT NULL,
CONSTRAINT "pk_Dept_Emp" PRIMARY KEY (
"emp_no","dept_no"
)
);

CREATE TABLE "Dept_Manager" (
"dept_no" VARCHAR(4)   NOT NULL,
"emp_no" INT   NOT NULL,
"from_date" DATE   NOT NULL,
"to_date" DATE   NOT NULL,
CONSTRAINT "pk_Dept_Manager" PRIMARY KEY (
"dept_no","emp_no"
)
);

CREATE TABLE "Titles" (
"emp_no" INT   NOT NULL,
"title" VARCHAR(20)   NOT NULL,
"from_date" DATE   NOT NULL,
"to_date" DATE   NOT NULL,
CONSTRAINT "pk_Titles" PRIMARY KEY (
"emp_no","title","from_date"
)
);

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Dept_Emp" ADD CONSTRAINT "fk_Dept_Emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Dept_Emp" ADD CONSTRAINT "fk_Dept_Emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Titles" ADD CONSTRAINT "fk_Titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");
