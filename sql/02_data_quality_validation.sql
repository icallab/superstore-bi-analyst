
-- Check missing values in important columns
SELECT
    COUNT(*) FILTER (WHERE order_id IS NULL) AS null_order_id,
    COUNT(*) FILTER (WHERE order_date IS NULL) AS null_order_date,
    COUNT(*) FILTER (WHERE sales IS NULL) AS null_sales,
    COUNT(*) FILTER (WHERE profit IS NULL) AS null_profit
FROM staging.stg_superstore;

-- Check duplicate Row ID
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT row_id) AS unique_row_id
FROM staging.stg_superstore;

-- Check invalid date records
SELECT COUNT(*) AS invalid_date_records
FROM staging.stg_superstore
WHERE order_date IS NULL
   OR ship_date IS NULL
   OR ship_date < order_date;

-- Check invalid numerical values
SELECT
    COUNT(*) FILTER (WHERE sales < 0) AS negative_sales,
    COUNT(*) FILTER (WHERE quantity <= 0) AS invalid_quantity,
    COUNT(*) FILTER (WHERE discount < 0 OR discount > 1) AS invalid_discount
FROM staging.stg_superstore;

-- Check loss-making transactions
SELECT
    COUNT(*) AS negative_profit_rows,
    ROUND(SUM(profit), 2) AS total_negative_profit
FROM staging.stg_superstore
WHERE profit < 0;
