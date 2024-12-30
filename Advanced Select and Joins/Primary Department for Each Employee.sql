# Write your MySQL query statement below

# 1. 부서가 2개 이상인 직원들만
(
    SELECT employee_id, department_id
        FROM Employee
        WHERE primary_flag = 'Y'
)
UNION ALL #
# 2. 부서가 1개인 직원들만
(
    SELECT employee_id, MIN(department_id) AS department_id
        FROM Employee
        GROUP BY employee_id
        HAVING COUNT(DISTINCT department_id) = 1
)