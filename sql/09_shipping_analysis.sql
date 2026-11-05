
-- =====================================================
-- PURPOSE  : Analyze shipping performance
-- =====================================================


-- =====================================================
-- 1. OVERALL SHIPPING PERFORMANCE
-- =====================================================

SELECT
    COUNT(*) AS total_order_lines,
    ROUND(AVG(shipping_duration), 2) AS avg_shipping_duration,
    MIN(shipping_duration) AS min_shipping_duration,
    MAX(shipping_duration) AS max_shipping_duration,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM staging.stg_superstore;


-- =====================================================
-- 2. SHIPPING MODE PERFORMANCE
-- =====================================================

SELECT
    ship_mode,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(quantity) AS total_quantity,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(profit) / NULLIF(SUM(sales), 0) * 100,
        2
    ) AS profit_margin_percentage,
    ROUND(AVG(shipping_duration), 2) AS avg_shipping_duration
FROM staging.stg_superstore
GROUP BY ship_mode
ORDER BY total_sales DESC;


-- =====================================================
-- 3. SHIPPING DURATION DISTRIBUTION
-- =====================================================

SELECT
    shipping_duration,
    COUNT(*) AS total_order_lines,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM staging.stg_superstore
GROUP BY shipping_duration
ORDER BY shipping_duration;


-- =====================================================
-- 4. SHIPPING PERFORMANCE BY REGION
-- =====================================================

SELECT
    region,
    ship_mode,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(AVG(shipping_duration), 2) AS avg_shipping_duration
FROM staging.stg_superstore
GROUP BY region, ship_mode
ORDER BY region, total_sales DESC;


-- =====================================================
-- 5. SHIPPING PERFORMANCE BY CATEGORY
-- =====================================================

SELECT
    category,
    ship_mode,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(profit) / NULLIF(SUM(sales), 0) * 100,
        2
    ) AS profit_margin_percentage
FROM staging.stg_superstore
GROUP BY category, ship_mode
ORDER BY category, total_sales DESC;


-- =====================================================
-- 6. SHIPPING DURATION BY SHIPPING MODE
-- =====================================================

SELECT
    ship_mode,
    ROUND(AVG(shipping_duration), 2) AS avg_shipping_duration,
    MIN(shipping_duration) AS min_shipping_duration,
    MAX(shipping_duration) AS max_shipping_duration,
    COUNT(DISTINCT order_id) AS total_orders
FROM staging.stg_superstore
GROUP BY ship_mode
ORDER BY avg_shipping_duration;


-- =====================================================
-- 7. SHIPPING DURATION AND PROFITABILITY
-- =====================================================

SELECT
    shipping_duration,
    COUNT(*) AS total_order_lines,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(profit) / NULLIF(SUM(sales), 0) * 100,
        2
    ) AS profit_margin_percentage
FROM staging.stg_superstore
GROUP BY shipping_duration
ORDER BY shipping_duration;


-- =====================================================
-- 8. SHIPPING MODE CONTRIBUTION
-- =====================================================

SELECT
    ship_mode,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(
        SUM(sales) /
        NULLIF(
            (SELECT SUM(sales) FROM staging.stg_superstore),
            0
        ) * 100,
        2
    ) AS sales_contribution_percentage,
    ROUND(SUM(profit), 2) AS total_profit
FROM staging.stg_superstore
GROUP BY ship_mode
ORDER BY total_sales DESC;
