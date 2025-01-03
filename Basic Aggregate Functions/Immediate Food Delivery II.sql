# Write your MySQL query statement below

# 1 immediate; otherwise, it is called scheduled.

SELECT ROUND(SUM(CASE WHEN kind_of_delivery = 'immediate' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS immediate_percentage
    FROM
    (
        SELECT CASE WHEN order_date = customer_pref_delivery_date THEN 'immediate'
                                                                  ELSE 'scheduled'
                                                                  END AS kind_of_delivery
            ,  customer_id
            ,  order_date
            FROM  Delivery
    ) A
    INNER JOIN
    (
        # 2 The first order of a customer
        SELECT customer_id
            ,  MIN(order_date) AS first_order_date
            FROM Delivery
            GROUP BY customer_id
    ) B
    ON A.customer_id = B.customer_id AND A.order_date = B.first_order_date



