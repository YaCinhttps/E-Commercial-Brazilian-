SELECT
    CASE 
        WHEN order_count = 1 THEN 'One-time'
        WHEN order_count = 2 THEN 'Returning'
        ELSE 'Loyal'
    END AS customer_type,
    COUNT(*) AS customer_count,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER()::numeric, 1) AS pct_of_total
FROM (
    SELECT
        c.customer_unique_id,
        COUNT(DISTINCT o.order_id) AS order_count
    FROM orders o
    JOIN customers c ON o.customer_id = c.customer_id
    WHERE o.order_status = 'delivered'
    GROUP BY 1
) t
GROUP BY 1
ORDER BY customer_count DESC;