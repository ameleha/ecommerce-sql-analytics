SELECT 
    c.customer_state,
    COUNT(*) AS total_orders,
    ROUND(
        AVG(EXTRACT(EPOCH FROM o.order_delivered_customer_date - o.order_purchase_timestamp) / 86400)::numeric, 2
    ) AS avg_delivery_days
FROM 
    orders o
JOIN 
    customers c ON o.customer_id = c.customer_id
WHERE 
    o.order_status = 'delivered'
GROUP BY 
    c.customer_state
ORDER BY 
    avg_delivery_days DESC;
