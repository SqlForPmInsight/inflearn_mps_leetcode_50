SELECT 
    E.name
FROM 
    Employee E
WHERE 
    E.id IN (
        SELECT 
            managerId
        FROM Employee
        WHERE managerId IS NOT NULL
        GROUP BY managerId
        HAVING COUNT(*) >= 5
    );
