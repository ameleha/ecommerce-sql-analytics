SELECT 
    seller_state,
    seller_city,
    COUNT(DISTINCT seller_id) AS total_sellers,
    ROUND(SUM(oi.price), 2) AS total_sales
FROM 
    order_items oi
JOIN 
    sellers s ON oi.seller_id = s.seller_id
GROUP BY 
    seller_state, seller_city
ORDER BY 
    total_sales DESC
LIMIT 10;
