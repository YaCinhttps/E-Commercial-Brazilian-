SELECT
    CASE 
        WHEN o.order_delivered_customer_date::timestamp > o.order_estimated_delivery_date::timestamp
        THEN 'Late' ELSE 'On Time' 
    END AS delivery_status,
    COUNT(*) AS total_orders,
    ROUND(AVG(r.review_score)::numeric, 2) AS avg_review_score
FROM orders o
JOIN order_reviews r ON o.order_id = r.order_id
WHERE o.order_delivered_customer_date IS NOT NULL
AND o.order_delivered_customer_date != ''
GROUP BY 1
ORDER BY 1;