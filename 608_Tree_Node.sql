/*
Root: p_id is null
Inner: id in both id and p_id
Leaf: id in id, not in p_id */

-- WRONG Answer: 
SELECT 
    id,
CASE WHEN p_id IS null THEN 'Root'
     WHEN id NOT IN (SELECT p_id FROM tree) THEN 'Leaf'   -- cannot use NOT IN when null value in da column
     ELSE 'Inner' END AS Type
FROM Tree
ORDER BY id

/* 1	Inner
   2	Inner
   3	Inner
   5	Root
   6	Inner
   8	Inner
   9	Inner

The reason why it is wrong is because when n not in (select t.p from bst t) then 'Leaf' failed all the times. But why?
Because the NULL value in p column failed all the comparation according to:
x NOT IN (...) is defined as a series of comparisons between x and each of the values returned by the subquery. 
SQL uses three-value logic, for which the three possible values of a logical expression are true, false or unknown. 
Comparison of a value to a NULL is unknown and if any one of those NOT IN comparisons is unknown 
then the result is also deemed to be unknown.

-- Lesson Learnt: Do not use NOT IN (collection) if there is NULL value in this collection. Instead, try to use IN! */

-- right solution after correction:
SELECT 
    id,
CASE WHEN p_id IS null THEN 'Root'
     WHEN id not in (SELECT p_id FROM tree WHERE p_id IS NOT NULL) THEN 'Leaf'    -- add "WHERE p_id IS NOT NULL"
     ELSE 'Inner' END AS Type
FROM Tree
ORDER BY id;

-- better solution:
SELECT 
    id,
CASE WHEN p_id IS null THEN 'Root'
     WHEN id in (SELECT p_id FROM tree) THEN 'Inner'
     ELSE 'Leaf' END AS Type
FROM Tree
ORDER BY id
;


-- solution 3: use left join
-- https://leetcode.com/problems/tree-node/discuss/104112/Solution-with-explanation%3A-CASE-%2B-LEFT-JOIN

SELECT
  t1.Id,
  CASE
   WHEN COUNT(t1.p_id) = 0 THEN "Root"
   WHEN COUNT(t2.id) = 0 THEN "Leaf"
   ELSE "Inner"
  END AS Type
FROM tree t1
LEFT JOIN tree t2
ON t1.Id = t2.p_id
GROUP BY t1.Id
ORDER BY t1.Id;




