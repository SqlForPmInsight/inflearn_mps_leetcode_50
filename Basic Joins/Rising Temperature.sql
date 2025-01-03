# Write your MySQL query statement below

SELECT W1.id
    FROM
        Weather W1
    INNER JOIN
    (
        SELECT temperature, DATE_ADD(recordDate, INTERVAL 1 DAY) AS recordDate2
            FROM Weather
    ) W2
    ON W1.recordDate = W2.recordDate2
    WHERE W1.temperature - W2.temperature > 0
