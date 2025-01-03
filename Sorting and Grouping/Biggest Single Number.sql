# Write your MySQL query statement below

# 2. (1번만 나온 숫자들을 대상으로) - 1번의 결과를 대상으로, 가장 큰 숫자를 추출
SELECT MAX(num) AS num
    FROM
    (
        # 1. 1번만 나온 숫자들을 필터링
        SELECT num
            FROM MyNumbers
            GROUP BY num
            HAVING COUNT(*) = 1
    ) A
