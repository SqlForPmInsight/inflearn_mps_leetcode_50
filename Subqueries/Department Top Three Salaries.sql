# Write your MySQL query statement below

# TOP 3 salary BY department
WITH TEMP AS (
    SELECT id
        -- ,  RANK () OVER (PARTITION BY departmentId ORDER BY salary DESC) AS RNK
        -- ,  ROW_NUMBER () OVER (PARTITION BY departmentId ORDER BY salary DESC) AS RN
        ,  DENSE_RANK () OVER (PARTITION BY departmentId ORDER BY salary DESC) AS DS_RNK
        FROM  Employee
)

SELECT D.name AS Department, E.name AS Employee, salary AS Salary
    FROM
        Employee E
    LEFT JOIN
        Department D
    ON E.departmentId = D.id
    WHERE E.id IN (
                    SELECT id
                        FROM TEMP
                        WHERE DS_RNK <= 3
    )