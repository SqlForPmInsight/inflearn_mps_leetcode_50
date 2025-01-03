# Write your MySQL query statement below

SELECT user_id
    ,  CONCAT(UPPER(SUBSTR(name, 1, 1)), LOWER(SUBSTR(name, 2, LENGTH(name)))) AS name
    -- ,  UPPER(SUBSTR(name, 1, 1))
    -- ,  LOWER(SUBSTR(name, 2, LENGTH(name)))
    FROM Users
    ORDER BY user_id