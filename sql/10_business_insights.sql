
-- =====================================================
-- PURPOSE  : Consolidated Business Insights
-- =====================================================


-- =====================================================
-- 1. OVERALL BUSINESS PERFORMANCE
-- =====================================================

SELECT
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT customer_id) AS total_customers,
    COUNT(DISTINCT product_id) AS total_products,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
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
-- 2. BEST AND WORST PRODUCT SUBCATEGORY
-- =====================================================

SELECT
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(profit) / NULLIF(SUM(sales), 0) * 100,
        2
    ) AS profit_margin_percentage
FROM staging.stg_superstore
GROUP BY sub_category
ORDER BY total_profit DESC;


-- =====================================================
-- 3. CUSTOMER SEGMENT PERFORMANCE
-- =====================================================

SELECT
    segment,
    COUNT(DISTINCT customer_id) AS total_customers,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(profit) / NULLIF(SUM(sales), 0) * 100,
        2
    ) AS profit_margin_percentage
FROM staging.stg_superstore
GROUP BY segment
ORDER BY total_sales DESC;


-- =====================================================
-- 4. BEST AND WORST PERFORMING STATES
-- =====================================================

SELECT
    state,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(profit) / NULLIF(SUM(sales), 0) * 100,
        2
    ) AS profit_margin_percentage
FROM staging.stg_superstore
GROUP BY state
ORDER BY total_profit;


-- =====================================================
-- 5. DISCOUNT PROFITABILITY ANALYSIS
-- =====================================================

SELECT
    CASE
        WHEN discount = 0 THEN 'No Discount'
        WHEN discount <= 0.10 THEN '1-10%'
        WHEN discount <= 0.20 THEN '11-20%'
        WHEN discount <= 0.30 THEN '21-30%'
        WHEN discount <= 0.40 THEN '31-40%'
        ELSE 'Above 40%'
    END AS discount_group,
    COUNT(*) AS total_order_lines,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(profit) / NULLIF(SUM(sales), 0) * 100,
        2
    ) AS profit_margin_percentage
FROM staging.stg_superstore
GROUP BY
    CASE
        WHEN discount = 0 THEN 'No Discount'
        WHEN discount <= 0.10 THEN '1-10%'
        WHEN discount <= 0.20 THEN '11-20%'
        WHEN discount <= 0.30 THEN '21-30%'
        WHEN discount <= 0.40 THEN '31-40%'
        ELSE 'Above 40%'
    END
ORDER BY MIN(discount);


-- =====================================================
-- 6. SHIPPING MODE PERFORMANCE
-- =====================================================

SELECT
    ship_mode,
    COUNT(DISTINCT order_id) AS total_orders,
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
-- 7. REGION PERFORMANCE
-- =====================================================

SELECT
    region,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(profit) / NULLIF(SUM(sales), 0) * 100,
        2
    ) AS profit_margin_percentage
FROM staging.stg_superstore
GROUP BY region
ORDER BY total_profit DESC;


-- =====================================================
-- 8. CATEGORY PROFITABILITY
-- =====================================================

SELECT
    category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(profit) / NULLIF(SUM(sales), 0) * 100,
        2
    ) AS profit_margin_percentage
FROM staging.stg_superstore
GROUP BY category
ORDER BY total_profit DESC;


-- =====================================================
-- 9. MONTHLY BUSINESS PERFORMANCE
-- =====================================================

SELECT
    DATE_TRUNC('month', order_date)::DATE AS sales_month,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM staging.stg_superstore
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY sales_month;


-- =====================================================
-- 10. CUSTOMERS WITH HIGHEST REVENUE
-- =====================================================

SELECT
    customer_id,
    customer_name,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM staging.stg_superstore
GROUP BY customer_id, customer_name
ORDER BY total_sales DESC
LIMIT 10;


-- =====================================================
-- 11. LOSS-MAKING PRODUCT SUBCATEGORIES
-- =====================================================

SELECT
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(profit) / NULLIF(SUM(sales), 0) * 100,
        2
    ) AS profit_margin_percentage
FROM staging.stg_superstore
GROUP BY sub_category
HAVING SUM(profit) < 0
ORDER BY total_profit ASC;


-- =====================================================
-- 12. LOSS-MAKING STATES
-- =====================================================

SELECT
    state,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(profit) / NULLIF(SUM(sales), 0) * 100,
        2
    ) AS profit_margin_percentage
FROM staging.stg_superstore
GROUP BY state
HAVING SUM(profit) < 0
ORDER BY total_profit ASC;
