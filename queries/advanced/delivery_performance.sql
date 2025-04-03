SELECT 
    order_status,
    COUNT(*) AS total_orders,
    ROUND(AVG(order_delivered_customer_date - order_purchase_timestamp), 2) AS avg_delivery_days
FROM 
    orders
WHERE 
    order_status = 'delivered'
GROUP BY 
    order_status;
