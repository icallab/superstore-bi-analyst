# Superstore Business Insights Report

## 1. Executive Summary

This project analyzes the Sample Superstore dataset to evaluate business performance across sales, profitability, products, customers, geographical regions, discount strategies, and shipping methods.

The analysis was conducted using Python for data cleaning and exploratory data analysis (EDA), PostgreSQL for structured business analysis, and Power BI for interactive business intelligence reporting.

The dataset contains 9,994 order-line records covering the period from 2014 to 2017.

### Key Performance Indicators

| Metric | Result |
|---|---:|
| Total Sales | $2,297,201.07 |
| Total Profit | $286,397.79 |
| Total Orders | 5,009 |
| Total Customers | 793 |
| Total Products | 1,862 |
| Total Quantity Sold | 37,873 |
| Profit Margin | 12.47% |
| Average Order Value | $458.61 |

Overall, the business generated approximately $2.30 million in sales with a profit margin of 12.47%. However, the analysis identified several profitability challenges, particularly in specific product subcategories, geographical markets, and high-discount transactions.

---

## 2. Sales and Profitability Analysis

### 2.1 Category Performance

| Category | Sales | Profit | Profit Margin |
|---|---:|---:|---:|
| Technology | $836,154.10 | $145,455.66 | 17.40% |
| Office Supplies | $719,046.99 | $122,490.88 | 17.04% |
| Furniture | $741,999.98 | $18,451.25 | 2.49% |

**Key Findings:**

- Technology generated the highest sales and profit among all product categories.
- Office Supplies achieved a profit margin of 17.04%, nearly matching Technology.
- Furniture generated substantial sales but had a significantly lower profit margin of only 2.49%.

**Business Implication:**

Furniture requires further profitability evaluation. High sales volume does not necessarily translate into strong profitability.

### 2.2 Regional Performance

| Region | Sales | Profit | Profit Margin |
|---|---:|---:|---:|
| West | $725,457.93 | $108,418.79 | 14.94% |
| East | $678,781.36 | $91,522.84 | 13.48% |
| South | $391,721.90 | $46,749.71 | 11.93% |
| Central | $501,239.88 | $39,706.45 | 7.92% |

**Key Findings:**

- West was the strongest region in terms of sales and profit.
- Central had the lowest profit margin at 7.92%.
- South recorded the lowest overall sales and profit.

**Business Implication:**

The Central region should be prioritized for profitability evaluation, particularly regarding discount policies, product mix, and operating costs.

---

## 3. Product Analysis

### 3.1 Most Profitable Subcategories

| Subcategory | Sales | Profit | Profit Margin |
|---|---:|---:|---:|
| Copiers | $149,528.01 | $55,617.90 | 37.20% |
| Phones | $330,007.10 | $44,516.25 | 13.49% |
| Accessories | $167,380.31 | $41,936.78 | 25.05% |
| Paper | $78,479.24 | $34,053.34 | 43.39% |
| Binders | $203,412.77 | $30,221.64 | 14.86% |

**Key Findings:**

- Copiers generated the highest total profit.
- Phones achieved the highest sales among all subcategories.
- Paper recorded the highest profit margin at 43.39%.

### 3.2 Loss-Making Subcategories

| Subcategory | Sales | Profit | Profit Margin |
|---|---:|---:|---:|
| Tables | $206,965.68 | -$17,725.59 | -8.56% |
| Bookcases | $114,880.05 | -$3,472.56 | -3.02% |
| Supplies | $46,673.52 | -$1,188.99 | -2.55% |

**Key Findings:**

Tables recorded the largest loss, despite generating more than $206,000 in sales.

**Business Implication:**

The company should investigate product-level pricing, discount allocation, and cost structures, particularly for Tables and Bookcases.

---

## 4. Customer Analysis

### 4.1 Customer Segment Performance

| Segment | Customers | Orders | Sales | Profit | Profit Margin |
|---|---:|---:|---:|---:|---:|
| Consumer | 409 | 2,586 | $1,161,401.34 | $134,119.33 | 11.55% |
| Corporate | 236 | 1,514 | $706,146.44 | $91,979.45 | 13.03% |
| Home Office | 148 | 909 | $429,653.29 | $60,299.01 | 14.03% |

**Key Findings:**

- Consumer was the largest contributor to sales and total profit.
- Home Office achieved the highest profit margin at 14.03%.
- Corporate generated a higher profit margin than Consumer.

### 4.2 Customer Purchase Behavior

The customer analysis identified:

- Total customers: 793
- Repeat customers: 781 (98.49%)
- One-time customers: 12 (1.51%)
- Average orders per customer: 6.32

Repeat customers are defined as customers with more than one distinct order during the dataset period.

**Business Implication:**

The company should maintain engagement with existing customers while identifying opportunities to improve customer acquisition and purchase frequency.

Note: This repeat-customer calculation is based on historical order frequency. It is not a cohort retention or customer lifetime value analysis.

---

## 5. Geographical Analysis

### 5.1 Top Performing States

| State | Sales | Profit |
|---|---:|---:|
| California | $457,687.68 | $76,381.60 |
| New York | $310,876.20 | $74,038.64 |
| Washington | $138,641.29 | $33,402.70 |
| Michigan | $76,269.61 | $24,463.15 |
| Virginia | $70,636.72 | $18,598.00 |

California generated the highest sales and profit, while New York achieved a higher profit margin than California.

### 5.2 Loss-Making States

| State | Sales | Profit | Profit Margin |
|---|---:|---:|---:|
| Texas | $170,187.98 | -$25,729.29 | -15.12% |
| Ohio | $78,258.21 | -$16,971.37 | -21.69% |
| Pennsylvania | $116,512.02 | -$15,560.04 | -13.35% |
| Illinois | $80,166.16 | -$12,607.89 | -15.73% |
| North Carolina | $55,603.09 | -$7,490.81 | -13.47% |

**Key Findings:**

- Texas recorded the largest geographical loss.
- Ohio had the lowest profit margin among the listed loss-making states.
- Several states generated considerable sales but still experienced negative profit.

**Business Implication:**

The company should evaluate regional pricing, discount practices, and operating costs, particularly in Texas, Ohio, Pennsylvania, and Illinois.

---

## 6. Discount Analysis

### 6.1 Profitability by Discount Group

| Discount Group | Orders | Sales | Profit | Profit Margin |
|---|---:|---:|---:|---:|
| No Discount | 2,644 | $1,087,908.47 | $320,987.88 | 29.51% |
| 1–10% | 89 | $54,369.30 | $9,029.21 | 16.61% |
| 11–20% | 2,436 | $792,152.87 | $91,757.14 | 11.58% |
| 21–30% | 211 | $103,226.76 | -$10,369.34 | -10.05% |
| 31–40% | 211 | $130,911.28 | -$25,448.24 | -19.44% |
| Above 40% | 737 | $128,632.39 | -$99,558.86 | -77.40% |

**Key Findings:**

- Transactions without discounts generated the highest profit margin.
- Discount groups up to 20% remained profitable in aggregate.
- Discount groups above 20% recorded negative aggregate profit.
- Discounts above 40% had the lowest profit margin at -77.40%.

**Business Implication:**

Discount policies should be reviewed, particularly for transactions with discounts exceeding 20%.

However, these results represent aggregated relationships and do not establish that discounts alone caused the losses. Further analysis by product, customer segment, and geographical region is recommended.

---

## 7. Shipping Analysis

### 7.1 Shipping Mode Performance

| Shipping Mode | Orders | Sales | Profit | Profit Margin | Avg. Processing Duration |
|---|---:|---:|---:|---:|---:|
| Standard Class | 2,994 | $1,358,216.08 | $164,089.45 | 12.08% | 5.01 days |
| Second Class | 964 | $459,193.44 | $57,446.49 | 12.51% | 3.24 days |
| First Class | 787 | $351,428.43 | $48,969.95 | 13.93% | 2.18 days |
| Same Day | 264 | $128,363.12 | $15,891.90 | 12.38% | 0.04 days |

**Key Findings:**

- Standard Class dominated sales and order volume.
- First Class achieved the highest profit margin at 13.93%.
- Same Day had the shortest processing duration.
- Most orders were processed and shipped within 4–5 days.

**Business Implication:**

The company should maintain Standard Class as its primary shipping option while evaluating the profitability and operating costs of alternative shipping methods.

Important methodological note: Shipping duration represents the number of days between Order Date and Ship Date. It measures order processing time before shipment, not the actual delivery time to customers.

---

## 8. Monthly Sales Performance

The monthly analysis covers January 2014 through December 2017.

**Key Findings:**

- November 2017 recorded the highest monthly sales at $118,447.81.
- September and November frequently showed strong sales activity.
- Overall sales performance strengthened toward 2017.

**Business Implication:**

The company could use historical monthly patterns to support inventory planning, promotional scheduling, and resource allocation.

Monthly sales and profit should be evaluated together because higher sales do not always result in proportionally higher profit.

---

## 9. Customer-Level Profitability

The top customer by sales was Sean Miller, with $25,043.07 in sales. However, this customer generated a negative profit of $1,980.75.

Tamara Chand generated $19,052.22 in sales and $8,981.32 in profit, the highest profit among the ten customers with the highest sales.

**Business Implication:**

Customer performance should be evaluated using both revenue and profitability rather than sales alone.

---

## 10. Overall Business Recommendations

Based on the analysis, the following actions are recommended:

### 10.1 Improve Product Profitability

- Review pricing and cost structures for Tables, Bookcases, and Supplies.
- Prioritize profitable subcategories such as Copiers, Accessories, and Paper.
- Evaluate the product mix within the Furniture category.

### 10.2 Optimize Discount Strategies

- Review discount policies above 20%.
- Introduce profitability checks before applying large discounts.
- Evaluate discount performance by product category and customer segment.

### 10.3 Improve Regional Performance

- Prioritize profitability improvement in Texas, Ohio, and Pennsylvania.
- Investigate the causes of low profit margins in Central.
- Study the operational and commercial practices of stronger regions such as West.

### 10.4 Strengthen Customer Profitability

- Maintain engagement with existing customers.
- Identify high-value customers based on both sales and profit.
- Investigate customers with high revenue but negative profitability.

### 10.5 Optimize Shipping Operations

- Maintain Standard Class as the main shipping option.
- Evaluate the profitability of First Class.
- Monitor processing durations and identify orders with unusually long processing times.

---

## 11. Conclusion

The Superstore analysis demonstrates that the business generates substantial sales and positive overall profitability. However, performance varies significantly across product categories, customer segments, geographical markets, discount levels, and shipping methods.

The most important opportunities for improvement are:

1. Addressing loss-making products, especially Tables.
2. Reviewing high-discount transactions.
3. Improving profitability in underperforming states, particularly Texas.
4. Strengthening customer-level profitability analysis.
5. Optimizing shipping and operational performance.

These findings provide a foundation for data-driven business decisions and serve as the analytical basis for the Power BI dashboard.

---

## 12. Methodology and Data Notes

- Dataset: Sample Superstore.
- Dataset records: 9,994 order lines.
- Analysis period: 2014–2017.
- Python: data cleaning, data quality assessment, and exploratory data analysis.
- PostgreSQL: business queries and analytical aggregation.
- Power BI: interactive business intelligence visualization.

**Metric definitions:**

- Total Sales: sum of sales values.
- Total Profit: sum of profit values.
- Total Orders: distinct count of order IDs.
- Total Customers: distinct count of customer IDs.
- Profit Margin: total profit divided by total sales, multiplied by 100.
- Average Order Value: total sales divided by distinct order count.
- Repeat Customer: customer with more than one distinct order in the dataset period.
- Shipping Duration: difference between Ship Date and Order Date.

**Important analytical considerations:**

- The dataset is at order-line level. Sales and profit are aggregated from individual product lines.
- Order counts use distinct order IDs to avoid counting multiple product lines as separate orders.
- Shipping duration is measured until shipment, not customer delivery.
- Aggregated correlations and comparisons should not be interpreted as proof of causation.
- Repeat-customer percentage is not equivalent to cohort retention.
