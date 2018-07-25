-- ProblemSet00, july 2018
-- Submission by sai.akhila.potluri@accenture.com

1)select the employee with top 3 salaries


2)select the employee who have least salary
select name,salary from employee where salary=(select min(salary) from employee);
JOHN HELLEN 15380

3)Select the Employee who does not have a manager in the department table
select e_id,name from employee where manager_id not in(select e_id from employee);
A178 BRUCE WILLS
A120 TIM ARCHER
A187 ADAM JUSTIN
A187 ROBERT SWIFT
A165 NATASHA STEVENS

4)select the employees whose is also a manager
select dinstict e.name,emp.manager_id from employee e inner join employee emp where e.e_id=emp.manager_id;
A178 BRUCE WILLS
A120 TIM ARCHER
A187 ADAM JUSTIN
A187 ROBERT SWIFT
A165 NATASHA STEVENS


5)select the employee who is a manager and have least salary
select min(salary),name from employee e inner join dept d on e.dept_id=d.dept_id where e.name=d.manager_id; 
27700 ROBERT SWIFT

6)Select the total number of Employees in Communications departments
select count(*) from employee e inner join dept d on e.dept_id=d.dept_id where dept='COMMUNICATION';
6

7)Select the Employee in Finance Department who has the top salary
select max(salary),name from employee e inner join dept d on e.dept_id=d.dept_id where dept_name='FINANCE'; 
94324 ADAM WAYNE

8)Select the Employee in product depatment who has the least salary



9)Select the count of Empolyees in Health with maximum salary
select count(*),e.max(salary) from employee e inner join d on d.dept_id=e.dept_id where dept_name='HEALTH';
5 94791

10)Select the Employees who report to Natasha Stevens
select name,e_id from employee where manager_id in (select e_id from employee where name='NATASHA STEVENS');
A128 ADAM WAYNE
A129 JOSEPH ANGELIN


11)Display the Employee name,Employee count,Dep name,Dept manager in the Health department
select e.name,d.dept_name,d.manager_name from employee e inner join dept d on d.dept_id=e.dept_id where dept_name='HEALTH';
MARTIN TREDEAU|HEALTH|TIM ARCHER
PAUL VINCET|HEALTH|TIM ARCHER
BRAD MICHAEL|HEALTH|TIM ARCHER
EDWARD CANE|HEALTH|TIM ARCHER
JOHN HELLEN|HEALTH|TIM ARCHER

12)Display the Department id,Employee ids and Manager ids for the Communications department
select d.dept_id,e.emp_id,e.manager_id from employee e inner join dept d on d.dept_id=e.dept_id where dept_name='COMMUNICATIONS';
D02 A116 A187
D02 A198 A187
D02 A187 A187
D02 A121 A187
D02 A133 A187

13)Select the Average Expenses for Each dept with Dept id and Dept name
select d.dept_id,d.dept_name,e.avg(salary) from employee e inner join dept d on d.dept_id=e.dept_id group by dept_name; 
55666.d D01 HEALTH
48271.333 D02 COMMUNICATIONS
55289.6666 D03 PRODUCT
51913.33 D04 INSURANCE
56660.333 D05 FINANCE


14)Select the total expense for the department finance
select max(salary),d.dept_name from employee e inner join dept d on e.emp_id=d.dept_id where dept_name='FINANCE';
169981 FINANCE

15)Select the department which spends the least with Dept id and Dept manager name



16)select the count of employees in each department
select count(*),dept_id from employees group by dept_id;
5 D01
6 D02
3 D03
2 D04
2 D05


17.select the number of  employee in each dept having salary>10000
select count(*) from employee where salary>10000 group by dept_id;
no records

18.select  the total number of employees in deptid D04
select count(*) from employee where dept_id='D04' group by dept_id;
3

19)Select all department details of the Department with Maximum Employees


20)Select the Employees who has Tim cook as their manager
select e.e_id,e.name from employee e inner join d on d.dept_id=e.dept_id where manager_name='TIM ARCHER';
no records
