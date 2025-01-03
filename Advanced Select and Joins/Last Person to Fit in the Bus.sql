# Write your MySQL query statement below

# WINDOW FUNCTIONS
# SUM() OVER ()

SELECT person_name
    FROM
    (
        SELECT *, SUM(weight) OVER (ORDER BY turn) AS SUM_ACCUM
            FROM Queue
            ORDER BY turn
    ) A
    WHERE A.SUM_ACCUM <= 1000
    ORDER BY turn DESC
    LIMIT 1
