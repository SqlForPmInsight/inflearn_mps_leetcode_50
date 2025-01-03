# Write your MySQL query statement below

# to find the percentage of the users registered in each contest

SELECT contest_id, ROUND(COUNT(DISTINCT user_id) / (SELECT COUNT(DISTINCT user_id) FROM Users) * 100, 2) AS percentage
#등록한 회원수 / 해당 컨테스트에 등록할 수 있는 회원수  AS percentage
    FROM Register
    GROUP BY contest_id
    ORDER BY percentage DESC, contest_id