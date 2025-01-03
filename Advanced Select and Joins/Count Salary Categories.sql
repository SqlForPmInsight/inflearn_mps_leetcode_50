# Write your MySQL query statement below

# CASE

SELECT A.category, COUNT(B.account_id) AS accounts_count
    FROM
    # MAPPING
    (
        SELECT "Low Salary" AS category
        UNION ALL
        SELECT "Average Salary" AS category
        UNION ALL
        SELECT "High Salary" AS category
    ) A
    LEFT JOIN
    (
        SELECT *
            ,  CASE WHEN income < 20000                      THEN "Low Salary"
                    WHEN income >= 20000 AND income <= 50000 THEN "Average Salary"
                    WHEN income > 50000                      THEN "High Salary"
            ELSE "NA" END AS category
            FROM Accounts
    ) B
    ON A.category = B.category
    GROUP BY category
