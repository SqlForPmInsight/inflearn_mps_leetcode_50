# Write your MySQL query statement below

# 2 select the product id, year, quantity, and price
SELECT S.product_id, year AS first_year, quantity, price
    FROM
        Sales S
    INNER JOIN
    (
        # 1 the first year of every product sold.
        SELECT product_id, MIN(year) AS first_year
            FROM Sales
            GROUP BY product_id
    ) F
    ON S.product_id = F.product_id AND S.year = F.first_year
