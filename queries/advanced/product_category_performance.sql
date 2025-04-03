SELECT 
    pct.product_category_name_english AS category,
    COUNT(DISTINCT oi.product_id) AS total_products,
    ROUND(SUM(oi.price), 2) AS total_sales
FROM 
    order_items oi
JOIN 
    products p ON oi.product_id = p.product_id
JOIN 
    product_category_translation pct ON p.product_category_name = pct.product_category_name
GROUP BY 
    pct.product_category_name_english
ORDER BY 
    total_sales DESC
LIMIT 10;
