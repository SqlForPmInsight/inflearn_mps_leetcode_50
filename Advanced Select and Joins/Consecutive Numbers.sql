# Write your MySQL query statement below
# Approach 방향성
# --------------
# 필터링
# 1.WHERE
# 2.HAVING
# --------------

# 1. JOIN (HINT)
SELECT DISTINCT A.num AS ConsecutiveNums
    FROM
        Logs A
    INNER JOIN
        Logs B
    ON A.id = B.id - 1
    INNER JOIN
        Logs C
    ON A.id = C.id - 2
    WHERE A.num = B.num AND A.num = C.num


# 2. WINDOW FUNCTIONS 행과 행간의 관계를 정의하는 함수
-- lag, lead
SELECT DISTINCT A.num AS ConsecutiveNums
    FROM
    (
        SELECT *
            ,  LEAD(num, 1) OVER (ORDER BY id) AS lead1_num
            ,  LEAD(num, 2) OVER (ORDER BY id) AS lead2_num
            FROM Logs
    ) A
    WHERE A.num = A.lead1_num AND A.num = A.lead2_num

