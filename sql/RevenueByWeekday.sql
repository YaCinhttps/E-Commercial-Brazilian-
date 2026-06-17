SELECT
    TO_CHAR(order_purchase_timestamp::timestamp, 'Day') AS weekday,
    EXTRACT(DOW FROM order_purchase_timestamp::timestamp) AS day_num,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(AVG(daily_revenue)::numeric, 2) AS avg_daily_revenue
FROM (
    SELECT
        order_id,
        order_purchase_timestamp,
        SUM(payment_value) OVER (PARTITION BY DATE_TRUNC('day', order_purchase_timestamp::timestamp)) AS daily_revenue
    FROM orders o
    JOIN order_payments p USING (order_id)
    WHERE order_status = 'delivered'
) t
GROUP BY 1, 2
ORDER BY day_num;