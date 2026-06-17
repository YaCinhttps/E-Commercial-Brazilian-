SELECT 
        products.product_category_name AS category,
        COUNT(DISTINCT order_items.order_id) AS total_orders,
        ROUND(SUM(order_items.price)::numeric, 2) AS total_revenue,
        ROUND(AVG(order_items.price)::numeric, 2) AS avg_price
    FROM order_items
    JOIN products ON order_items.product_id = products.product_id
    GROUP BY 1
    ORDER BY total_revenue DESC
    LIMIT 10