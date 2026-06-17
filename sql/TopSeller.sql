SELECT
    payment_type,
    COUNT(*) AS total_transactions,
    ROUND(SUM(payment_value)::numeric, 2) AS total_revenue,
    ROUND(AVG(payment_value)::numeric, 2) AS avg_transaction_value,
    ROUND(AVG(payment_installments)::numeric, 1) AS avg_installments
FROM order_payments
WHERE payment_value > 0
GROUP BY 1
ORDER BY total_revenue DESC;