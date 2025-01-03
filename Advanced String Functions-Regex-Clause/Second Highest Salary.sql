SELECT MAX(salary) AS SecondHighestSalary
    FROM Employee
    WHERE salary < (SELECT MAX(salary) FROM Employee);


-- SELECT CASE WHEN COUNT(*) = 0 THEN NULL
--                                ELSE salary 
--        END AS SecondHighestSalary
--     FROM
--     (
--         SELECT DISTINCT salary
--             FROM Employee
--             ORDER BY salary DESC
--             LIMIT 1
--             OFFSET 1
--     ) A