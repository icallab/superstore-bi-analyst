
-- =====================================================
-- PURPOSE  : Analyze geographical business performance
-- =====================================================


-- =====================================================
-- 1. OVERALL PERFORMANCE BY REGION
-- =====================================================

SELECT
    region,
    COUNT(DISTINCT customer_id) AS total_customers,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(profit) / NULLIF(SUM(sales), 0) * 100,
        2
    ) AS profit_margin_percentage
FROM staging.stg_superstore
GROUP BY region
ORDER BY total_sales DESC;


-- =====================================================
-- 2. SALES AND PROFIT BY STATE
-- =====================================================

SELECT
    state,
    region,
    COUNT(DISTINCT customer_id) AS total_customers,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(profit) / NULLIF(SUM(sales), 0) * 100,
        2
    ) AS profit_margin_percentage
FROM staging.stg_superstore
GROUP BY state, region
ORDER BY total_sales DESC;


-- =====================================================
-- 3. TOP 10 STATES BY SALES
-- =====================================================

SELECT
    state,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders
FROM staging.stg_superstore
GROUP BY state
ORDER BY total_sales DESC
LIMIT 10;


-- =====================================================
-- 4. TOP 10 STATES BY PROFIT
-- =====================================================

SELECT
    state,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(
        SUM(profit) / NULLIF(SUM(sales), 0) * 100,
        2
    ) AS profit_margin_percentage
FROM staging.stg_superstore
GROUP BY state
ORDER BY total_profit DESC
LIMIT 10;


-- =====================================================
-- 5. BOTTOM 10 STATES BY PROFIT
-- =====================================================

SELECT
    state,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(
        SUM(profit) / NULLIF(SUM(sales), 0) * 100,
        2
    ) AS profit_margin_percentage
FROM staging.stg_superstore
GROUP BY state
ORDER BY total_profit ASC
LIMIT 10;


-- =====================================================
-- 6. TOP 10 CITIES BY SALES
-- =====================================================

SELECT
    city,
    state,
    region,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders
FROM staging.stg_superstore
GROUP BY city, state, region
ORDER BY total_sales DESC
LIMIT 10;


-- =====================================================
-- 7. STATE CONTRIBUTION TO TOTAL SALES
-- =====================================================

SELECT
    state,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(
        SUM(sales) /
        NULLIF((SELECT SUM(sales) FROM staging.stg_superstore), 0)
        * 100,
        2
    ) AS sales_contribution_percentage
FROM staging.stg_superstore
GROUP BY state
ORDER BY total_sales DESC;


-- =====================================================
-- 8. STATE PERFORMANCE BY CATEGORY
-- =====================================================

SELECT
    state,
    category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(profit) / NULLIF(SUM(sales), 0) * 100,
        2
    ) AS profit_margin_percentage
FROM staging.stg_superstore
GROUP BY state, category
ORDER BY state, total_sales DESC;
