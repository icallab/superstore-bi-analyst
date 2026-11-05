
-- =====================================================
-- PURPOSE  : Analyze discount and its relationship
--            with sales and profitability
-- =====================================================


-- =====================================================
-- 1. OVERALL DISCOUNT PERFORMANCE
-- =====================================================

SELECT
    ROUND(AVG(discount) * 100, 2) AS average_discount_percentage,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(
        SUM(profit) / NULLIF(SUM(sales), 0) * 100,
        2
    ) AS profit_margin_percentage
FROM staging.stg_superstore;


-- =====================================================
-- 2. SALES AND PROFIT BY DISCOUNT LEVEL
-- =====================================================

SELECT
    discount,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    SUM(quantity) AS total_quantity,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(
        SUM(profit) / NULLIF(SUM(sales), 0) * 100,
        2
    ) AS profit_margin_percentage
FROM staging.stg_superstore
GROUP BY discount
ORDER BY discount;


-- =====================================================
-- 3. PROFITABILITY BY DISCOUNT GROUP
-- =====================================================

SELECT
    CASE
        WHEN discount = 0 THEN 'No Discount'
        WHEN discount <= 0.10 THEN '1% - 10%'
        WHEN discount <= 0.20 THEN '11% - 20%'
        WHEN discount <= 0.30 THEN '21% - 30%'
        WHEN discount <= 0.40 THEN '31% - 40%'
        ELSE 'Above 40%'
    END AS discount_group,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    SUM(quantity) AS total_quantity,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(
        SUM(profit) / NULLIF(SUM(sales), 0) * 100,
        2
    ) AS profit_margin_percentage
FROM staging.stg_superstore
GROUP BY discount_group
ORDER BY MIN(discount);


-- =====================================================
-- 4. DISCOUNT PERFORMANCE BY CATEGORY
-- =====================================================

SELECT
    category,
    discount,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    SUM(quantity) AS total_quantity,
    ROUND(
        SUM(profit) / NULLIF(SUM(sales), 0) * 100,
        2
    ) AS profit_margin_percentage
FROM staging.stg_superstore
GROUP BY category, discount
ORDER BY category, discount;


-- =====================================================
-- 5. HIGH DISCOUNT TRANSACTIONS WITH NEGATIVE PROFIT
-- =====================================================

SELECT
    category,
    sub_category,
    discount,
    COUNT(*) AS total_order_lines,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM staging.stg_superstore
WHERE discount >= 0.30
  AND profit < 0
GROUP BY category, sub_category, discount
ORDER BY total_profit ASC;


-- =====================================================
-- 6. DISCOUNT AND PROFIT CORRELATION
-- =====================================================

SELECT
    ROUND(
        CORR(discount::DOUBLE PRECISION, profit::DOUBLE PRECISION)::NUMERIC,
        4
    ) AS discount_profit_correlation,
    ROUND(
        CORR(discount::DOUBLE PRECISION, sales::DOUBLE PRECISION)::NUMERIC,
        4
    ) AS discount_sales_correlation
FROM staging.stg_superstore;


-- =====================================================
-- 7. DISCOUNT DISTRIBUTION
-- =====================================================

SELECT
    discount,
    COUNT(*) AS total_order_lines,
    ROUND(
        COUNT(*)::NUMERIC /
        (SELECT COUNT(*) FROM staging.stg_superstore) * 100,
        2
    ) AS percentage_of_order_lines
FROM staging.stg_superstore
GROUP BY discount
ORDER BY discount;
