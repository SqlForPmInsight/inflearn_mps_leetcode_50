# Write your MySQL query statement below
WITH daily_total AS (
    SELECT visited_on, SUM(amount) AS amount
        FROM Customer
        GROUP BY visited_on
)

SELECT visited_on_t AS visited_on, SUM(amount_t) AS amount, ROUND(AVG(amount_t), 2) AS average_amount
    FROM
    (
        SELECT C1.visited_on, C2.visited_on AS visited_on_t, C1.amount AS amount_t, C2.amount
            FROM
                daily_total C1
            INNER JOIN
                daily_total C2
            ON C1.visited_on BETWEEN DATE_ADD(C2.visited_on, INTERVAL -6 DAY) AND C2.visited_on
            ORDER BY C2.visited_on DESC, C1.visited_on
    ) A
    GROUP BY visited_on_t
    HAVING COUNT(DISTINCT visited_on) = 7