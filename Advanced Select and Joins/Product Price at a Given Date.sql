# Write your MySQL query statement below

# 필터링: 날짜기준
# group --> MAX(change_date)

SELECT P.product_id, P.new_price AS price
    FROM
        Products P
    INNER JOIN
    (
        SELECT product_id, MAX(change_date) AS change_date
            FROM Products
            WHERE change_date <= "2019-08-16"
            GROUP BY product_id
    ) A
    ON P.product_id = A.product_id AND P.change_date = A.change_date
UNION ALL
SELECT DISTINCT product_id, 10 AS price
    FROM Products
    WHERE product_id NOT IN (
                                SELECT product_id
                                    FROM Products
                                    WHERE change_date <= "2019-08-16"
    )

