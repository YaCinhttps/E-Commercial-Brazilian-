WITH rfm AS (
    SELECT
        c.customer_unique_id,
        MAX(o.order_purchase_timestamp::timestamp) AS last_purchase,
        COUNT(DISTINCT o.order_id) AS frequency,
        ROUND(SUM(p.payment_value)::numeric, 2) AS monetary
    FROM orders o
    JOIN customers c ON o.customer_id = c.customer_id
    JOIN order_payments p ON o.order_id = p.order_id
    WHERE o.order_status = 'delivered'
    GROUP BY 1
)
SELECT
    CASE 
        WHEN frequency >= 3 AND monetary >= 500 THEN 'Champions'
        WHEN frequency >= 2 AND monetary >= 200 THEN 'Loyal'
        WHEN last_purchase >= '2018-01-01'::timestamp THEN 'Recent'
        WHEN last_purchase < '2017-01-01'::timestamp THEN 'Lost'
        ELSE 'At Risk'
    END AS segment,
    COUNT(*) AS customer_count,
    ROUND(AVG(monetary)::numeric, 2) AS avg_spend,
    ROUND(AVG(frequency)::numeric, 2) AS avg_orders
FROM rfm
GROUP BY 1
ORDER BY avg_spend DESC;