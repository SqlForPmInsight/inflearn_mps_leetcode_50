# Write your MySQL query statement below

SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016
    FROM Insurance
    WHERE 1=1
    # 1. have the same tiv_2015 value as one or more other policyholders, and
      AND pid NOT IN (
                        SELECT MAX(pid) AS pid
                            FROM Insurance
                            GROUP BY tiv_2015
                            HAVING COUNT(*) = 1
      )
    # 2. are not located in the same city as any other policyholder (i.e., the (lat, lon) attribute pairs must be unique).
      AND pid IN (
                    SELECT MIN(pid) AS pid
                        FROM Insurance
                        GROUP BY CONCAT(lat, lon)
                        HAVING COUNT(*) = 1
      )