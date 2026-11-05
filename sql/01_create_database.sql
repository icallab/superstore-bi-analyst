
CREATE DATABASE superstore_bi;

CREATE SCHEMA IF NOT EXISTS staging;

CREATE TABLE staging.stg_superstore (
    row_id          INTEGER,
    order_id        VARCHAR(20),
    order_date      DATE,
    ship_date       DATE,
    ship_mode       VARCHAR(30),
    customer_id     VARCHAR(20),
    customer_name   VARCHAR(100),
    segment         VARCHAR(30),
    country         VARCHAR(50),
    city            VARCHAR(100),
    state           VARCHAR(100),
    postal_code     VARCHAR(20),
    region          VARCHAR(30),
    product_id      VARCHAR(30),
    category        VARCHAR(50),
    sub_category    VARCHAR(50),
    product_name    TEXT,
    sales           NUMERIC(12,2),
    quantity        INTEGER,
    discount        NUMERIC(5,2),
    profit          NUMERIC(12,2),
    shipping_duration INTEGER
);

-- Check total rows
SELECT COUNT(*) AS total_rows
FROM staging.stg_superstore;

-- Preview imported data
SELECT *
FROM staging.stg_superstore
LIMIT 10;