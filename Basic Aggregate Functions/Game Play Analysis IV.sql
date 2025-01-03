# Write your MySQL query statement below

# 방향성
# 1. 첫 로그인 시점(date)
# 2. 첫 로그인 바로 그 다음날 로그인여부 (date+1)

# 1
SELECT ROUND(COUNT(DISTINCT B.player_id) / COUNT(DISTINCT A.player_id), 2)  AS fraction
    FROM
    (
        SELECT player_id, MIN(DATE_ADD(event_date, INTERVAL 1 DAY)) AS lag_event_date
            FROM Activity
            GROUP BY player_id
    ) A
    LEFT JOIN Activity B
    ON A.player_id = B.player_id AND A.lag_event_date = B.event_date
