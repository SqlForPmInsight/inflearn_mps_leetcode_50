# Write your MySQL query statement below

# 1. HAVING을 통해 모든 제품의 개수와 같은 제품을 구매한 고객을 필터링
SELECT customer_id
    FROM Customer
    GROUP BY customer_id
    HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(DISTINCT product_key) FROM Product)