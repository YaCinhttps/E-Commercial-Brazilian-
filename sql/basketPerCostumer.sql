SELECT
    ROUND(PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY order_value)::numeric, 2) AS median_basket,
    ROUND(PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY order_value)::numeric, 2) AS q1_basket,
    ROUND(PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY order_value)::numeric, 2) AS q3_basket,
    ROUND(MIN(order_value)::numeric, 2) AS min_basket,
    ROUND(MAX(order_value)::numeric, 2) AS max_basket,
    COUNT(*) AS total_orders
FROM (
    SELECT
        o.order_id,
        SUM(p.payment_value) AS order_value
    FROM orders o
    JOIN order_payments p ON o.order_id = p.order_id
    WHERE o.order_status = 'delivered'
    GROUP BY 1
) basket;