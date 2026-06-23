# Olist E-Commerce Analysis

A full end-to-end data analytics project built on real Brazilian e-commerce data . The goal was simple — take raw, messy data and turn it into something a business team could actually use to make decisions.

This project covers the full pipeline: downloading and cleaning the data, writing SQL queries to answer real business questions, building EDA charts in Python, and finishing with an interactive Power BI dashboard.

---

## Why this project

I wanted to build something that reflected what a data analyst actually does day to day — not just a dashboard built on a pre-cleaned dataset, but the full process from raw data to business insight. Olist gave me that. Eight linked tables, real data quality issues, and enough business questions to work with across sales, operations, and customer behavior.

---

## What the data covers

The dataset comes from [Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce) on Kaggle — a Brazilian e-commerce marketplace. It covers 96,000+ orders placed between 2016 and 2018, across 8 tables:

- Orders, order items, order payments, order reviews
- Customers, sellers, products, geolocation

---

## Project structure

```
Olist E-Commerce/
├── data/
│   ├── raw/                  # Original Kaggle CSVs
│   ├── cleaned/              # Cleaned CSVs from Python
│   └── analysis/             # SQL query result CSVs
├── notebooks/
│   ├── 01_cleaning.ipynb     # Data cleaning
│   ├── 02_sql_analysis.ipynb # Loading data to PostgreSQL
│   └── 03_eda.ipynb          # EDA charts
├── sql/                      # All 10 SQL query files
├── images/                   # EDA charts and dashboard screenshots
├── dashboard/
│   └── olist_dashboard.pbix  # Power BI file
└── README.md
```

---

## Phase 1 — Dataset setup

Downloaded the dataset using kagglehub directly into the project folder. Nine CSV files covering all eight tables plus a category translation file.

```python
import kagglehub
path = kagglehub.dataset_download("olistbr/brazilian-ecommerce")
```

---

## Phase 2 — Data cleaning

Cleaned all nine datasets in Python using pandas. The main issues were date columns stored as text, nulls in delivery timestamps, missing product dimensions, and optional review comment fields.

**What was fixed per table:**

| Dataset | What was fixed |
|---------|---------------|
| Orders | Converted 5 date columns from text to datetime |
| Products | Dropped rows missing category or physical dimensions, merged English translations |
| Reviews | Filled missing comment fields with empty string, validated scores 1-5 |
| Customers | Removed duplicates, standardized city/state formatting |
| Sellers | Removed duplicates, standardized city/state formatting |
| Geolocation | Removed duplicates, filtered coordinates to Brazil bounds only |
| Order items | Validated price > 0 and freight >= 0 |
| Payments | Removed zero-value payments |
| Category translation | Removed duplicates and nulls |

All cleaned datasets saved to `data/cleaned/` and loaded into PostgreSQL for the analysis phase.

**Before and after:**

| Dataset | Raw rows | Clean rows |
|---------|---------|-----------|
| Orders | 99,441 | 99,441 |
| Products | 32,951 | 32,340 |
| Reviews | 99,224 | 99,224 |
| Customers | 99,441 | 99,441 |
| Geolocation | 1,000,163 | 27,910 |

---

## Phase 3 — SQL analysis

Loaded all cleaned tables into a PostgreSQL database and wrote 10 queries to answer real business questions. Results exported as CSVs to `data/analysis/`.

**Queries written:**

| # | File | Business question |
|---|------|------------------|
| 1 | 01_monthly_revenue.sql | How did sales grow over time? |
| 2 | 02_top_categories.sql | Which categories drive the most revenue? |
| 3 | 03_delivery_by_state.sql | Which states have the worst delivery performance? |
| 4 | 04_late_delivery_impact.sql | Does late delivery hurt review scores? |
| 5 | 05_rfm_segmentation.sql | Who are the most valuable customers? |
| 6 | 06_seller_performance.sql | Which sellers generate the most revenue and maintain quality? |
| 7 | 07_payment_methods.sql | How do customers prefer to pay? |
| 8 | 08_basket_size.sql | What does a typical order look like in value? |
| 9 | 09_repeat_customers.sql | What proportion of customers come back? |
| 10 | 10_revenue_by_weekday.sql | Which days of the week drive the most revenue? |

**Key findings from SQL:**

- Late deliveries score **1.72 points lower** on average (2.57 vs 4.29) — the single strongest signal in the dataset
- **AL, MA and PI** have late delivery rates 3-4x higher than São Paulo
- **97% of customers purchase only once** — retention is the biggest commercial challenge
- **Champions (87 customers) spend 5.6x more** than the average customer
- Credit card dominates at **74% of transactions** with an average of 3.5 installments
- **Monday and Tuesday** are peak trading days — weekends consistently underperform
- Median basket size is **$105.28** — the mean would be misleading due to outliers up to $13,664

---

## Phase 4A — Python EDA

Translated the SQL findings into seven focused charts using matplotlib and seaborn. The goal was to confirm insights visually and produce clean images for the dashboard and README.

**Charts produced:**

| # | Chart | Key insight confirmed |
|---|-------|-----------------------|
| 1 | Top 10 categories by revenue | Health & beauty leads by volume not price |
| 2 | Late delivery impact on review scores | 1.72 point drop confirmed visually |
| 3 | Late delivery rate by state | AL, MA, PI clearly above 15% threshold |
| 4 | RFM customer segmentation | Champions tiny but spend far more |
| 5 | Revenue by payment method | Credit card dominates at 74% |
| 6 | Repeat vs one-time customers | 97% one-time buyer rate confirmed |
| 7 | Average daily revenue by weekday | Monday/Tuesday peak confirmed |

Charts saved as PNGs to `images/` and used directly in the Power BI dashboard.

---

## Phase 4B — Power BI dashboard

Built a three-page interactive dashboard in Power BI Desktop connected directly to the PostgreSQL database. DAX measures written for all KPIs, time intelligence, and RFM segmentation.


## Key business insights

1. **Delivery reliability is everything** — a single late delivery drops the review score by 1.72 points on average. No other variable comes close to this impact.

2. **The north needs logistics investment** — states like AL, MA and PI have late rates nearly 4x higher than São Paulo. The gap is too large to ignore.

3. **97% of customers never come back** — Olist has a serious retention problem. The marketplace model makes this harder to solve, but the data makes the scale of the problem very clear.

4. **A tiny group drives outsized value** — 87 Champions spend 5.6x the average. These customers deserve dedicated retention effort.

5. **Credit cards and installments dominate** — 74% of transactions use credit cards, averaging 3.5 installments. This reflects Brazilian parcelamento culture and has implications for cash flow and payment processing strategy.

6. **São Paulo dominates everything** — sales volume, delivery speed, and top seller concentration all skew heavily toward SP. Every operational improvement starts there.

7. **Weekends are a missed opportunity** — Saturday and Sunday consistently underperform. Targeted promotions on those days could smooth the weekly revenue curve.

---

## Tools used

| Tool | Purpose |
|------|---------|
| Python / pandas | Data cleaning and EDA |
| kagglehub | Dataset download |
| PostgreSQL | Database and SQL analysis |
| SQLTools (VS Code) | Query execution and result export |
| matplotlib / seaborn | EDA charts |
| Power BI Desktop | Dashboard development |
| DAX | Calculated measures and time intelligence |
| GitHub | Version control and portfolio publishing |

---

## How to run this project

1. Clone the repository
2. Install dependencies: `pip install pandas kagglehub sqlalchemy psycopg2-binary matplotlib seaborn`
3. Run `01_cleaning.ipynb` to download and clean all datasets
4. Load cleaned CSVs into a PostgreSQL database named `olistDB`
5. Run SQL files in `sql/` folder against the database
6. Run `03_eda.ipynb` to generate EDA charts
7. Open `dashboard/olist_dashboard.pbix` in Power BI Desktop and refresh the data connection

---
