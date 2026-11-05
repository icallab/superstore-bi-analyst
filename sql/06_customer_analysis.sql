
-- =====================================================
-- 1. CUSTOMER PERFORMANCE OVERVIEW
-- =====================================================
SELECT
    COUNT(DISTINCT customer_id) AS total_customers,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(sales) / NULLIF(COUNT(DISTINCT customer_id), 0),
        2
    ) AS revenue_per_customer,
    ROUND(
        COUNT(DISTINCT order_id)::NUMERIC /
        NULLIF(COUNT(DISTINCT customer_id), 0),
        2
    ) AS orders_per_customer
FROM staging.stg_superstore;


-- =====================================================
-- 2. CUSTOMER SEGMENT PERFORMANCE
-- =====================================================
SELECT
    segment,
    COUNT(DISTINCT customer_id) AS total_customers,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(sales) /
        NULLIF(COUNT(DISTINCT customer_id), 0),
        2
    ) AS revenue_per_customer,
    ROUND(
        SUM(profit) /
        NULLIF(COUNT(DISTINCT customer_id), 0),
        2
    ) AS profit_per_customer
FROM staging.stg_superstore
GROUP BY segment
ORDER BY total_sales DESC;


-- =====================================================
-- 3. TOP 10 CUSTOMERS BY REVENUE
-- =====================================================

SELECT
    customer_id,
    customer_name,
    segment,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM staging.stg_superstore
GROUP BY customer_id, customer_name, segment
ORDER BY total_sales DESC
LIMIT 10;


-- =====================================================
-- 4. TOP 10 CUSTOMERS BY PROFIT
-- =====================================================

SELECT
    customer_id,
    customer_name,
    segment,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM staging.stg_superstore
GROUP BY customer_id, customer_name, segment
ORDER BY total_profit DESC
LIMIT 10;


-- =====================================================
-- 5. CUSTOMER ORDER FREQUENCY
-- =====================================================

WITH customer_orders AS (
    SELECT
        customer_id,
        COUNT(DISTINCT order_id) AS total_orders
    FROM staging.stg_superstore
    GROUP BY customer_id
)
SELECT
    total_orders,
    COUNT(*) AS total_customers,
    ROUND(
        COUNT(*)::NUMERIC /
        (SELECT COUNT(*) FROM customer_orders) * 100,
        2
    ) AS customer_percentage
FROM customer_orders
GROUP BY total_orders
ORDER BY total_orders;


-- =====================================================
-- 6. ONE-TIME VS REPEAT CUSTOMERS
-- =====================================================
WITH customer_orders AS (
    SELECT
        customer_id,
        COUNT(DISTINCT order_id) AS total_orders
    FROM staging.stg_superstore
    GROUP BY customer_id
)
SELECT
    CASE
        WHEN total_orders = 1 THEN 'One-Time Customer'
        ELSE 'Repeat Customer'
    END AS customer_type,
    COUNT(*) AS total_customers,
    ROUND(
        COUNT(*)::NUMERIC /
        (SELECT COUNT(*) FROM customer_orders) * 100,
        2
    ) AS customer_percentage
FROM customer_orders
GROUP BY
    CASE
        WHEN total_orders = 1 THEN 'One-Time Customer'
        ELSE 'Repeat Customer'
    END
ORDER BY total_customers DESC;


-- =====================================================
-- 7. CUSTOMER REVENUE DISTRIBUTION
-- =====================================================
WITH customer_revenue AS (
    SELECT
        customer_id,
        SUM(sales) AS total_revenue
    FROM staging.stg_superstore
    GROUP BY customer_id
)
SELECT
    CASE
        WHEN total_revenue < 100 THEN 'Below $100'
        WHEN total_revenue < 500 THEN '$100 - $499'
        WHEN total_revenue < 1000 THEN '$500 - $999'
        WHEN total_revenue < 5000 THEN '$1,000 - $4,999'
        ELSE '$5,000 and Above'
    END AS revenue_band,
    COUNT(*) AS total_customers,
    ROUND(SUM(total_revenue), 2) AS total_revenue
FROM customer_revenue
GROUP BY revenue_band
ORDER BY MIN(total_revenue);


-- =====================================================
-- 8. CUSTOMER MONTHLY PURCHASE ACTIVITY
-- =====================================================

SELECT
    DATE_TRUNC('month', order_date)::DATE AS purchase_month,
    COUNT(DISTINCT customer_id) AS active_customers,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(sales), 2) AS total_sales
FROM staging.stg_superstore
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY purchase_month;