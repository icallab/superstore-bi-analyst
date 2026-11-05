# Business Recommendations – Superstore Business Analysis

## 1. Executive Summary

Based on the analysis of the Superstore dataset, several opportunities have been identified to improve profitability, optimize discount strategies, strengthen product performance, and improve regional business performance.

The recommendations below are based on historical sales and profit patterns from 2014 to 2017. They should be treated as business proposals for further evaluation rather than proof of direct causation.

## 2. Business Recommendations

### 2.1 Optimize Discount Strategy

**Finding:**
- Products sold with discounts above 20% recorded negative aggregate profit.
- The discount group above 40% generated a loss of approximately **$99,558.86**.
- Transactions without discounts generated the highest aggregate profit of approximately **$320,987.88**.
- The correlation between discount and profit was approximately **-0.2195**.

**Recommendations:**
- Review discount policies, particularly discounts above 20%.
- Establish discount limits based on product category and profit margin.
- Evaluate whether high discounts generate sufficient additional sales to justify reduced profitability.
- Monitor discounted transactions to identify products that consistently generate losses.

**Suggested KPIs:**
- Profit Margin by Discount Level
- Sales by Discount Level
- Profit by Discount Level
- Discount-to-Sales Ratio

### 2.2 Improve Product Profitability

**Finding:**
- Technology generated the highest category sales and profit.
- Furniture recorded a relatively low profit margin of approximately **2.49%**.
- Tables generated the largest subcategory loss of approximately **-$17,725.59**.
- Bookcases and Supplies also recorded negative profit.

**Recommendations:**
- Prioritize profitable subcategories such as Copiers, Phones, Accessories, and Paper.
- Review pricing, discount allocation, and operating costs for loss-making subcategories.
- Evaluate the profitability of Tables, Bookcases, and Supplies before expanding promotions.
- Monitor Furniture performance because its revenue is substantial but its profit margin is relatively low.

**Suggested KPIs:**
- Sales by Product Category
- Profit by Subcategory
- Profit Margin by Subcategory
- Loss-Making Product Count

### 2.3 Improve Regional Profitability

**Finding:**
- California generated the highest sales and profit.
- Texas recorded the largest state-level loss of approximately **-$25,729.29**, despite being the third-highest state by sales.
- Ohio, Pennsylvania, and Illinois also recorded substantial losses.
- The Central region had the lowest regional profit margin at approximately **7.92%**.

**Recommendations:**
- Investigate the factors contributing to losses in Texas, Ohio, Pennsylvania, and Illinois.
- Review product mix, discount levels, and order profitability in underperforming states.
- Use California and New York as reference points for evaluating regional performance.
- Develop region-specific pricing and promotional strategies instead of applying identical policies across all states.

**Suggested KPIs:**
- Sales by State
- Profit by State
- Profit Margin by State
- Regional Profitability

### 2.4 Strengthen Customer Profitability Management

**Finding:**
- Consumer was the largest customer segment by sales and total profit.
- Home Office recorded the highest segment profit margin at approximately **14.03%**.
- Corporate had the highest revenue per customer at approximately **$2,992.15**.
- One-time customers represented approximately **1.51%** of customers, based on the dataset's order-count definition.

**Recommendations:**
- Maintain engagement with the Consumer segment because of its contribution to total revenue.
- Explore opportunities to increase customer value in the Home Office segment.
- Evaluate customer profitability rather than relying only on sales volume.
- Review high-revenue customers who generate negative profit. For example, Sean Miller generated approximately **$25,043.07** in sales but recorded a loss of **-$1,980.75**.
- Develop customer retention initiatives and monitor repeat purchasing behavior over time.

**Suggested KPIs:**
- Revenue per Customer
- Profit per Customer
- Customer Segment Profit Margin
- Repeat Customer Rate
- Customer Lifetime Value (with suitable longitudinal data)

### 2.5 Evaluate Shipping Performance

**Finding:**
- Standard Class contributed the largest sales and profit due to its transaction volume.
- First Class recorded the highest profit margin at approximately **13.93%**.
- Same Day had the shortest average order-to-ship duration.
- The overall average order-to-ship duration was approximately **3.96 days**.

**Recommendations:**
- Maintain Standard Class as an important shipping option because of its contribution to sales and profit.
- Evaluate the cost and profitability of each shipping mode before changing shipping policies.
- Investigate regional and product-level differences in shipping performance.
- Monitor order processing and dispatch duration to identify potential operational delays.

**Suggested KPIs:**
- Sales by Ship Mode
- Profit Margin by Ship Mode
- Average Order-to-Ship Duration
- Order Volume by Ship Mode

**Measurement note:** Shipping duration in this analysis is calculated from Order Date to Ship Date. It measures the time before an order is shipped, not the time required for delivery to the customer.

### 2.6 Prepare for Seasonal Sales Opportunities

**Finding:**
- November 2017 recorded the highest monthly sales in the analyzed period, approximately **$118,447.81**.
- September and November also appeared as strong sales months in several periods.

**Recommendations:**
- Review historical monthly sales patterns when preparing inventory and promotional plans.
- Evaluate product demand ahead of historically strong sales periods.
- Coordinate inventory availability and operational capacity before peak periods.
- Compare sales growth with profit growth to ensure that higher revenue also contributes to profitability.

**Suggested KPIs:**
- Monthly Sales
- Monthly Profit
- Monthly Profit Margin
- Year-over-Year Sales Growth
- Sales by Product Category and Month

## 3. Recommended Action Priorities

| Priority | Area | Recommended Action |
|---|---|---|
| High | Discount Strategy | Review discounts above 20% and their profitability |
| High | Product Profitability | Investigate Tables, Bookcases, and Supplies |
| High | Regional Performance | Investigate loss-making states, especially Texas |
| Medium | Customer Management | Monitor customer-level profit, not sales alone |
| Medium | Shipping Performance | Evaluate profitability and operational duration by ship mode |
| Medium | Seasonal Planning | Prepare inventory and capacity for high-sales periods |

## 4. Monitoring Framework

The business recommendations should be evaluated periodically using the following metrics:

- Total Sales
- Total Profit
- Profit Margin
- Average Order Value (AOV)
- Sales and Profit by Category
- Profit by Discount Level
- Profit by State and Region
- Revenue and Profit per Customer
- Average Order-to-Ship Duration
- Monthly Sales and Profit Growth

A monthly review can help identify whether business performance is improving and whether proposed actions require adjustment.

## 5. Analytical Limitations

The recommendations are based on historical transactional data from the Superstore dataset.

Several limitations should be considered:

1. The analysis identifies patterns and associations, not necessarily causal relationships.
2. Negative profit does not automatically mean that a product or region should be discontinued.
3. Discount analysis should consider product mix, order size, and other factors before changing discount policies.
4. Customer repeat rate is calculated using the number of distinct orders per customer. It is not a cohort-based retention metric.
5. Shipping duration measures Order Date to Ship Date, not actual delivery time.
6. The dataset covers a historical period from 2014 to 2017, so current business decisions would require more recent data.

## 6. Conclusion

The analysis indicates that Superstore has opportunities to improve profitability through more disciplined discount management, better product-level profitability monitoring, and targeted regional strategies.

Rather than focusing exclusively on revenue growth, the business should evaluate profit margins, customer profitability, and operational performance together.

These recommendations provide a starting point for data-driven decision-making and can be monitored through an interactive Power BI dashboard.