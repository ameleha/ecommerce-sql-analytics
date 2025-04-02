SELECT
    DATE_TRUNC('month', order_purchase_timestamp) AS month,
    SUM(payment_value) AS total_revenue
FROM
    orders
JOIN
    payments ON orders.order_id = payments.order_id
GROUP BY
    month
ORDER BY
    month;