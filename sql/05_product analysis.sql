
-- =====================================================
-- 1. SALES AND PROFIT BY SUB-CATEGORY
-- =====================================================
SELECT
    category,
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    SUM(quantity) AS total_quantity,
    ROUND(
        SUM(profit) / NULLIF(SUM(sales), 0) * 100,
        2
    ) AS profit_margin_percentage
FROM staging.stg_superstore
GROUP BY category, sub_category
ORDER BY total_sales DESC;


-- =====================================================
-- 2. TOP 10 SUB-CATEGORIES BY SALES
-- =====================================================
SELECT
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    SUM(quantity) AS total_quantity
FROM staging.stg_superstore
GROUP BY sub_category
ORDER BY total_sales DESC
LIMIT 10;


-- =====================================================
-- 3. TOP 10 SUB-CATEGORIES BY PROFIT
-- =====================================================
SELECT
    sub_category,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(sales), 2) AS total_sales,
    SUM(quantity) AS total_quantity
FROM staging.stg_superstore
GROUP BY sub_category
ORDER BY total_profit DESC
LIMIT 10;


-- =====================================================
-- 4. BOTTOM 10 SUB-CATEGORIES BY PROFIT
-- =====================================================
SELECT
    sub_category,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(sales), 2) AS total_sales,
    SUM(quantity) AS total_quantity
FROM staging.stg_superstore
GROUP BY sub_category
ORDER BY total_profit ASC
LIMIT 10;


-- =====================================================
-- 5. TOP 10 PRODUCTS BY SALES
-- =====================================================
SELECT
    product_id,
    product_name,
    category,
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    SUM(quantity) AS total_quantity,
    ROUND(SUM(profit), 2) AS total_profit
FROM staging.stg_superstore
GROUP BY
    product_id,
    product_name,
    category,
    sub_category
ORDER BY total_sales DESC
LIMIT 10;


-- =====================================================
-- 6. TOP 10 PRODUCTS BY PROFIT
-- =====================================================
SELECT
    product_id,
    product_name,
    category,
    sub_category,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(sales), 2) AS total_sales,
    SUM(quantity) AS total_quantity
FROM staging.stg_superstore
GROUP BY
    product_id,
    product_name,
    category,
    sub_category
ORDER BY total_profit DESC
LIMIT 10;


-- =====================================================
-- 7. BOTTOM 10 PRODUCTS BY PROFIT
-- =====================================================
SELECT
    product_id,
    product_name,
    category,
    sub_category,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(sales), 2) AS total_sales,
    SUM(quantity) AS total_quantity
FROM staging.stg_superstore
GROUP BY
    product_id,
    product_name,
    category,
    sub_category
ORDER BY total_profit ASC
LIMIT 10;


-- =====================================================
-- 8. PRODUCT QUANTITY AND AVERAGE SELLING PRICE
-- =====================================================
SELECT
    category,
    sub_category,
    SUM(quantity) AS total_quantity,
    ROUND(
        SUM(sales) / NULLIF(SUM(quantity), 0),
        2
    ) AS average_selling_price
FROM staging.stg_superstore
GROUP BY category, sub_category
ORDER BY average_selling_price DESC;
