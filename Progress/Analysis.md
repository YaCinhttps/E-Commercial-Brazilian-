# 🛒 Olist E-Commerce — SQL Analysis

This phase covers the business analysis of the cleaned Olist dataset using PostgreSQL. Queries were written to answer real business questions across sales performance, customer behavior, delivery operations, and seller analytics.

---

## 📁 Project Structure

```
sql/
├── 01_monthly_revenue.sql
├── 02_top_categories.sql
├── 03_delivery_by_state.sql
├── 04_late_delivery_impact.sql
├── 05_rfm_segmentation.sql
├── 06_seller_performance.sql
├── 07_payment_methods.sql
├── 08_basket_size.sql
├── 09_repeat_customers.sql
└── 10_revenue_by_weekday.sql


---

## 🗄️ Database

- **Engine:** PostgreSQL
- **Database:** olistDB
- **Tables:** 8 (orders, order_items, order_payments, order_reviews, customers, products, sellers, geolocation)
- **Total records loaded:** ~500K+ rows across all tables

---

## 📊 Business Questions & Key Findings

### 1. Monthly Revenue Trend
**Question:** How did sales and order volume evolve over time?

> Revenue and order volume were extracted per month for all delivered orders, providing a baseline trend line for the business.

---

### 2. Top 10 Product Categories by Revenue
**Question:** Which product categories drive the most revenue?

| Category | Total Orders | Total Revenue | Avg Price |
|----------|-------------|--------------|-----------|
| beleza_saude | 8,836 | $1,258,681 | $130.16 |
| relogios_presentes | 5,624 | $1,205,006 | $201.14 |
| cama_mesa_banho | 9,417 | $1,036,989 | $93.30 |
| esporte_lazer | 7,720 | $988,049 | $114.34 |
| informatica_acessorios | 6,689 | $911,954 | $116.51 |

**Insight:** Health & beauty leads in total revenue despite not having the highest average price,due  high order volume. Watches & gifts generate comparable revenue from fewer but higher-value orders.

---

### 3. Delivery Time & Late Rate by State
**Question:** Which states experience the worst delivery performance?

| State | Avg Delivery Days | Late Delivery % |
|-------|------------------|----------------|
| AL | 24.5 days | 23.9% |
| MA | 21.6 days | 19.7% |
| PI | 19.5 days | 16.0% |
| CE | 21.3 days | 15.3% |
| SP | 8.8 days | 5.9% |

**Insight:** Northern and northeastern states face significantly longer delivery times and higher late rates compared to São Paulo (SP), which benefits from proximity to major distribution centers. AL has a late delivery rate nearly 4x higher than SP.

---

### 4. Late Delivery Impact on Review Scores
**Question:** Does late delivery hurt customer satisfaction?

| Delivery Status | Total Orders | Avg Review Score |
|----------------|-------------|-----------------|
| On Time | 88,658 | 4.29 ⭐ |
| Late | 7,701 | 2.57 ⭐ |

**Insight:** Late deliveries result in an average review score 1.72 points lower than on-time deliveries. This is one of the strongest signals in the dataset — delivery reliability is the single biggest driver of customer satisfaction.

---

### 5. RFM Customer Segmentation
**Question:** Who are the most valuable customers and where is the risk?

| Segment | Customer Count | Avg Spend | Avg Orders |
|---------|---------------|-----------|------------|
| Champions | 87 | $894.25 | 3.80 |
| Loyal | 1,517 | $412.59 | 2.07 |
| Lost | 252 | $178.62 | 1.01 |
| Recent | 50,604 | $160.44 | 1.01 |
| At Risk | 40,897 | $160.27 | 1.01 |

**Insight:** Champions spend 5.6x more than the average customer but represent only 87 users — a high-value but tiny group worth protecting with retention campaigns. The vast majority of customers (91,501) are either Recent or At Risk, suggesting weak repeat purchase behavior overall.

---

### 6. Top Seller Performance
**Question:** Which sellers generate the most revenue, and do high earners maintain quality?

| Seller City | Total Orders | Total Revenue | Avg Rating |
|------------|-------------|--------------|-----------|
| Guariba, SP | 1,124 | $228,071 | 4.12 ⭐ |
| Lauro de Freitas, BA | 356 | $220,740 | 4.08 ⭐ |
| Ibitinga, SP | 1,785 | $200,561 | 3.80 ⭐ |

**Insight:** São Paulo dominates top seller rankings, consistent with its logistics advantage. Top revenue sellers generally maintain ratings above 4.0, suggesting quality and volume are not necessarily in conflict.

---

### 7. Payment Method Breakdown
**Question:** How do customers prefer to pay, and what is the revenue contribution of each method?

| Payment Type | Transactions | Total Revenue | Avg Value | Avg Installments |
|-------------|-------------|--------------|-----------|-----------------|
| Credit Card | 76,795 | $12,542,084 | $163.32 | 3.5 |
| Boleto | 19,784 | $2,869,361 | $145.03 | 1.0 |
| Voucher | 5,769 | $379,437 | $65.77 | 1.0 |
| Debit Card | 1,529 | $217,990 | $142.57 | 1.0 |

**Insight:** Credit card dominates at 74% of transactions and 78% of revenue. The average of 3.5 installments indicates customers heavily use Brazil's parcelamento (installment) culture. Vouchers have the lowest average value, likely used for discounts on smaller purchases.

---

### 8. Basket Size Distribution
**Question:** What does a typical order actually look like in value?

| Median Basket | Q1 | Q3 | Min | Max | Total Orders |
|--------------|----|----|-----|-----|-------------|
| $105.28 | $61.88 | $176.33 | $9.59 | $13,664.08 | 96,477 |

**Insight:** The median basket of $105.28 is the most representative order value. 50% of all orders fall between $61.88 and $176.33. The large gap between the median and maximum ($13,664) confirms outliers that would distort a simple average — validating the use of median over mean for this metric.

---

### 9. Repeat vs One-Time Customers
**Question:** What proportion of customers come back?

| Customer Type | Count | % of Total |
|--------------|-------|-----------|
| One-time | 90,557 | 97.0% |
| Returning | 2,573 | 2.8% |
| Loyal | 228 | 0.2% |

**Insight:** 97% of customers purchase only once — a critical retention problem for Olist. The marketplace model makes repeat purchase incentives difficult, but this data clearly shows customer acquisition far outpaces retention.

---

### 10. Revenue by Weekday
**Question:** Which days of the week drive the most orders and revenue?

| Weekday | Total Orders | Avg Daily Revenue |
|---------|-------------|------------------|
| Monday | 15,701 | $36,199 |
| Tuesday | 15,503 | $34,175 |
| Friday | 13,685 | $40,704 |
| Sunday | 11,635 | $25,776 |
| Saturday | 10,555 | $25,016 |

**Insight:** Weekdays consistently outperform weekends in both order volume and revenue. Friday shows the highest average daily revenue despite fewer orders than Monday/Tuesday, suggesting higher-value purchases on Fridays. Weekends are the weakest days — potentially an opportunity for targeted promotions.

---

## 🔑 Summary of Key Business Insights

1. **Delivery is the #1 driver of customer satisfaction** — late orders score 1.72 points lower on average
2. **Northern states need logistics investment** — AL, MA, and PI have late rates 3-4x higher than SP
3. **97% of customers never come back** — retention is Olist's biggest commercial challenge
4. **Health & beauty and watches dominate revenue** — two very different price point strategies both work
5. **Credit card installments are the dominant payment behavior** — reflecting Brazilian consumer culture
6. **Champions (87 customers) spend 5.6x the average** — a small but extremely valuable segment to protect
7. **Monday and Tuesday are peak trading days** — useful for marketing and operations planning

---

## 🛠️ Tools Used

| Tool | Purpose |
|------|---------|
| PostgreSQL | Database engine and query execution |
| Python / pandas / SQLAlchemy | Loading cleaned CSVs into PostgreSQL |

---


## Phase Timeline

| Phase | Status |
|-------|--------|
| Phase 1 — Dataset Setup | ✅ Done |
| Phase 2 — Data Cleaning | ✅ Done |
| ** Phase 3 — SQL Analysis ** |🔄 In Progress  |
| Phase 4A — Python EDA | ⬜ Pending |
| Phase 4B — Power BI Dashboard | ⬜ Pending |
| Phase 5 — README & Publishing | ⬜ Pending |
