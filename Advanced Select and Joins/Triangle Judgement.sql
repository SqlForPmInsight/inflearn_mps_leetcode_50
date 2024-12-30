# Write your MySQL query statement below

# 두 변의 길이의 합이 나머지 한 변의 길이보다 커야 한다는 것
# x + y > z and z + y > x ...


SELECT x
    ,  y
    ,  z
    ,  CASE WHEN  x + y > z AND x + z > y AND y + z > x THEN 'Yes'
                                                        ELSE 'No'
       END AS triangle
    FROM Triangle
