SELECT 
    pct.product_category_name_english AS category,
    COUNT(*) AS total_orders,
    ROUND(
        AVG(EXTRACT(EPOCH FROM o.order_delivered_customer_date - o.order_purchase_timestamp) / 86400)::numeric, 2
    ) AS avg_delivery_days
FROM 
    orders o
JOIN 
    order_items oi ON o.order_id = oi.order_id
JOIN 
    products p ON oi.product_id = p.product_id
JOIN 
    product_category_translation pct ON p.product_category_name = pct.product_category_name
WHERE 
    o.order_status = 'delivered'
GROUP BY 
    pct.product_category_name_english
ORDER BY 
    avg_delivery_days DESC;
