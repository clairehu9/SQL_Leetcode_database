SELECT 
    p.firstname, p.lastname, a.city, a.state
FROM
    Person p
LEFT JOIN
    Address a
ON 
    a.personid = p.personid;
