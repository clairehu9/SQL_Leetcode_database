SELECT  distinct s.id, s.name FROM Students s
WHERE s.department_id NOT IN (SELECT id FROM Departments)

/* record in one table but not in another

1. not in 
select distinct A.ID from  A where A.ID not in (select ID from B)

2. join
select A.ID from A left join B on A.ID=B.ID where B.ID is null

3. 
select * from  B 
where (select count(1) as num from A where A.ID = B.ID) = 0 

*/
