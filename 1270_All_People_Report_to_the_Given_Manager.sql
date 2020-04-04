select e1.employee_id 
from Employees e1
join Employees e2
  on e2.employee_id = e1.manager_id  
join Employees e3
  on e3.employee_id=e2.manager_id 
WHERE e3.manager_id = 1 AND e1.employee_id != 1

/*  题目问的不清楚，它问的是boss以下3个manager

1 is the boss
4 --> 2 --> 1,
7 --> 4 --> 2 --> 1


select *
from Employees e1
join Employees e2
  on e2.employee_id = e1.manager_id 

{"headers": ["employee_id", "employee_name", "manager_id", "employee_id", "employee_name", "manager_id"], "values": [
[1, "Boss", 1, 1, "Boss", 1], 
[2, "Bob", 1, 1, "Boss", 1], 
[77, "Robert", 1, 1, "Boss", 1], 
[3, "Alice", 3, 3, "Alice", 3], 
[8, "John", 3, 3, "Alice", 3], 
[4, "Daniel", 2, 2, "Bob", 1], 
[7, "Luis", 4, 4, "Daniel", 2], 
[9, "Angela", 8, 8, "John", 3]]}



select *
from Employees e1
join Employees e2
  on e2.employee_id = e1.manager_id 
join Employees e3
on e3.employee_id=e2.manager_id 

{"headers": ["employee_id", "employee_name", "manager_id", "employee_id", "employee_name", "manager_id", "employee_id", "employee_name", "manager_id"], "values": [
[1, "Boss", 1, 1, "Boss", 1, 1, "Boss", 1],           Boss 
[2, "Bob", 1, 1, "Boss", 1, 1, "Boss", 1],            2 -> 1
[77, "Robert", 1, 1, "Boss", 1, 1, "Boss", 1],        77-> 1
[4, "Daniel", 2, 2, "Bob", 1, 1, "Boss", 1],          4-> 2 ->1
[3, "Alice", 3, 3, "Alice", 3, 3, "Alice", 3], 
[8, "John", 3, 3, "Alice", 3, 3, "Alice", 3], 
[9, "Angela", 8, 8, "John", 3, 3, "Alice", 3],     
[7, "Luis", 4, 4, "Daniel", 2, 2, "Bob", 1]]}         7 -> 4 -> 2 -> 1

*/
