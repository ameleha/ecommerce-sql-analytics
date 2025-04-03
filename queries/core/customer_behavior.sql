SELECT
    customer_id,
    COUNT(DISTINCT orders.order_id) AS total_orders,
    SUM(payment_value) AS total_spent,
    AVG(payment_value) AS avg_order_value
FROM
    orders
JOIN
    payments ON orders.order_id = payments.order_id
GROUP BY
    customer_id
ORDER BY
    total_spent DESC
LIMIT 10;
