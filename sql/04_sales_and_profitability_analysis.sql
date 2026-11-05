-- =====================================================
-- 1. SALES AND PROFIT BY CATEGORY
-- =====================================================
SELECT
    category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    SUM(quantity) AS total_quantity,
    ROUND(
        SUM(profit) / NULLIF(SUM(sales), 0) * 100,
        2
    ) AS profit_margin_percentage
FROM staging.stg_superstore
GROUP BY category
ORDER BY total_sales DESC;


-- =====================================================
-- 2. SALES AND PROFIT BY REGION
-- =====================================================
SELECT
    region,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(
        SUM(profit) / NULLIF(SUM(sales), 0) * 100,
        2
    ) AS profit_margin_percentage
FROM staging.stg_superstore
GROUP BY region
ORDER BY total_sales DESC;


-- =====================================================
-- 3. SALES AND PROFIT BY CUSTOMER SEGMENT
-- =====================================================
SELECT
    segment,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT customer_id) AS total_customers,
    ROUND(
        SUM(profit) / NULLIF(SUM(sales), 0) * 100,
        2
    ) AS profit_margin_percentage
FROM staging.stg_superstore
GROUP BY segment
ORDER BY total_sales DESC;


-- =====================================================
-- 4. YEAR-OVER-YEAR SALES AND PROFIT GROWTH
-- =====================================================
WITH yearly_performance AS (
    SELECT
        EXTRACT(YEAR FROM order_date)::INTEGER AS sales_year,
        SUM(sales) AS total_sales,
        SUM(profit) AS total_profit
    FROM staging.stg_superstore
    GROUP BY EXTRACT(YEAR FROM order_date)
)
SELECT
    sales_year,
    ROUND(total_sales, 2) AS total_sales,
    ROUND(total_profit, 2) AS total_profit,
    ROUND(
        (
            total_sales - LAG(total_sales) OVER (ORDER BY sales_year)
        ) / NULLIF(
            LAG(total_sales) OVER (ORDER BY sales_year), 0
        ) * 100,
        2
    ) AS sales_growth_percentage,
    ROUND(
        (
            total_profit - LAG(total_profit) OVER (ORDER BY sales_year)
        ) / NULLIF(
            LAG(total_profit) OVER (ORDER BY sales_year), 0
        ) * 100,
        2
    ) AS profit_growth_percentage
FROM yearly_performance
ORDER BY sales_year;


-- =====================================================
-- 5. MONTHLY SALES AND PROFIT TREND
-- =====================================================
SELECT
    DATE_TRUNC('month', order_date)::DATE AS sales_month,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(profit) / NULLIF(SUM(sales), 0) * 100,
        2
    ) AS profit_margin_percentage
FROM staging.stg_superstore
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY sales_month;


-- =====================================================
-- 6. TOP 10 STATES BY SALES
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
-- 7. TOP 10 STATES BY PROFIT
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
