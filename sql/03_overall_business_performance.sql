-- =====================================================
-- 1. OVERALL BUSINESS KPI
-- =====================================================
SELECT
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT customer_id) AS total_customers,
    COUNT(DISTINCT product_id) AS total_products,
    SUM(quantity) AS total_quantity,
    ROUND(
        SUM(profit) / NULLIF(SUM(sales), 0) * 100,
        2
    ) AS profit_margin_percentage,
    ROUND(
        SUM(sales) / NULLIF(COUNT(DISTINCT order_id), 0),
        2
    ) AS average_order_value
FROM staging.stg_superstore;


-- =====================================================
-- 2. YEARLY BUSINESS PERFORMANCE
-- =====================================================
SELECT
    EXTRACT(YEAR FROM order_date) AS sales_year,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT customer_id) AS total_customers,
    ROUND(
        SUM(profit) / NULLIF(SUM(sales), 0) * 100,
        2
    ) AS profit_margin_percentage
FROM staging.stg_superstore
GROUP BY EXTRACT(YEAR FROM order_date)
ORDER BY sales_year;


-- =====================================================
-- 3. MONTHLY BUSINESS PERFORMANCE
-- =====================================================
SELECT
    DATE_TRUNC('month', order_date)::DATE AS sales_month,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(quantity) AS total_quantity
FROM staging.stg_superstore
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY sales_month;


-- =====================================================
-- 4. AVERAGE ORDER VALUE BY YEAR
-- =====================================================
SELECT
    EXTRACT(YEAR FROM order_date) AS sales_year,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(
        SUM(sales) / NULLIF(COUNT(DISTINCT order_id), 0),
        2
    ) AS average_order_value
FROM staging.stg_superstore
GROUP BY EXTRACT(YEAR FROM order_date)
ORDER BY sales_year;
