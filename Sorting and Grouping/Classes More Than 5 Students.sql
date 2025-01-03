# Write your MySQL query statement below

SELECT class
    FROM Courses
    GROUP BY class
    HAVING COUNT(DISTINCT student) >= 5

-- SELECT DISTINCT class
--     FROM Courses