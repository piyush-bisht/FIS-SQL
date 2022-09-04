# 1. Retrieve a list of MANAGERS.
select * from emp where job='MANAGER';

# 2. Find out the names and salaries of all employees earning more than 1000 per month.
select ename,sal from emp where sal>1000;


# 3. Display the names and salaries of all employees except JAMES.
select ename,sal from emp where ename not in ('JAMES');

# 4. Find out the details of employees whose names begin with ‘S’.
select * from emp where ename like 'S%';

# 5. Find out the names of all employees that have ‘A’ anywhere in their name.
select ename from emp where ename like '%A%';

# 6. Find out the names of all employees that have ‘L’ as their third character in their name.
select ename from emp where ename like '__L%';

# 7. Compute daily salary of JONES.
select ename, sal/30 DailySal from emp where ename='JONES';

# 8. Calculate the total monthly salary of all employees.
select sum(sal) TotalMonthlySal from emp;

# 9. Print the average annual salary .
select (sum(sal*12))/count(empno) AverageAnnualSal from emp;

# 10. Select the name, job, salary, department number of all employees except SALESMAN from department number 30.
select ename,job,sal,deptno from emp where job !='SALESMAN' and deptno !=30;

# 11. List unique departments of the EMP table.
select distinct e.deptno, d.dname from emp e inner join dept d on e.deptno=d.deptno ;

# 12. List the name and salary of employees who earn more than 1500 and are in department 10 or 30. Label the columns Employee and Monthly Salary respectively.
select ename Employee,sal MonthlySalary from emp where sal>1500 and deptno in (10,30);

# 13. Display the name, job, and salary of all the employees whose job is MANAGER or ANALYST and their salary is not equal to 1000, 3000, or 5000.
select ename,job,sal from emp where job in ('MANAGER','ANALYST') and sal !=1000;

# 14. Display the name, salary and commission for all employees whose commission amount is greater than their salary increased by 10%.
select ename,sal,comm from emp where comm is not null and comm>(sal*1.1);

# 15. Display the name of all employees who have two Ls in their name and are in department 30 or their manager is 7782.
select ename from emp where ename like '%L%L%' and (deptno =30 or mgr_id=7782);

# 16. Display the names of employees with experience of over 10 years and under 20 yrs.Count the total number of employees.
select ename ,TIMESTAMPDIFF(YEAR ,hiredate,CURRENT_DATE) ,hiredate from emp where TIMESTAMPDIFF(YEAR ,hiredate,CURRENT_DATE) between 10 and 20;

# 17. Retrieve the names of departments in ascending order and their employees in descending order.
select d.dname,e.deptno,count(e.empno) TotalEmployees from emp e right outer join dept d on e.deptno=d.deptno group by e.deptno,dname order by d.dname asc, TotalEmployees desc;

# 18. Find out experience of MILLER.
select ename, TIMESTAMPDIFF(YEAR,hiredate,CURRENT_DATE) ExpirienceInYears from emp where ename='MILLER';