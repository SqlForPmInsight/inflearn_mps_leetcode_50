# Write your MySQL query statement below

SELECT employee_id
    FROM Employees
    # 1 30000 미만
    WHERE salary < 30000
    # 2 매니저가 퇴사한 사람
      AND manager_id NOT IN (
                                SELECT employee_id
                                    FROM Employees
      )
    ORDER BY 1 # employee_id

