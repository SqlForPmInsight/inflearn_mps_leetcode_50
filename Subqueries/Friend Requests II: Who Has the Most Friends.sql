# Write your MySQL query statement below

WITH TOTAL_USER AS (
    SELECT requester_id AS user_id, accepter_id AS user_id_2
        FROM RequestAccepted
    UNION ALL
    SELECT accepter_id AS user_id, requester_id  AS user_id_2
        FROM RequestAccepted
)
,
TOTAL_USER_CNT AS (
    SELECT user_id, COUNT(DISTINCT user_id_2) AS cnt
        FROM TOTAL_USER
        GROUP BY user_id
)

SELECT user_id AS id, cnt AS num
    FROM TOTAL_USER_CNT
    WHERE cnt = (SELECT MAX(cnt) FROM TOTAL_USER_CNT)
