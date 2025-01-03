# Write your MySQL query statement below

# DELETE
DELETE
    FROM Person
    WHERE # 중복된 이메일중 1번째보다 큰 id들을 필터링
            id IN (
                    # 중복된 이메일중 1번째보다 큰 id들
                    SELECT id
                        FROM
                        (
                            SELECT id, email, RANK() OVER (PARTITION BY email ORDER BY id ASC) AS RN
                                FROM Person
                        ) A
                        WHERE A.RN >= 2
            )
