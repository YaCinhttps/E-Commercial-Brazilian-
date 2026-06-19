# Phase 4A — Exploratory Data Analysis (EDA) Progress

## Status: In Progress

---

## Overview

This phase translates the SQL analysis findings into visual charts using Python (matplotlib + seaborn).
The goal is to confirm insights visually and produce clean chart images that feed into the Power BI dashboard and GitHub README.

---

## Environment

| Item | Detail |
|------|--------|
| Tool | VS Code |
| Notebook | `03_eda.ipynb` |
| Python | Virtual environment (`.venv`) |
| Libraries | pandas, matplotlib, seaborn |
| Input data | `data/analysis/*.csv` (9 files from SQL phase) |
| Output | `images/*.png` |

---

## Chart Checklist

| # | Chart | SQL Source | Status |
|---|-------|-----------|--------|
| 1 | Top 10 categories by revenue | top_categories.csv | ✅ Done |
| 2 | Late delivery impact on review scores | late_delivery_impact.csv |✅ Done |
| 3 | Late delivery rate by state | delivery_by_state.csv | ✅ Done |
| 4 | RFM customer segmentation — count & spend | rfm_segmentation.csv | ✅ Done |
| 5 | Revenue by payment method | payment_methods.csv |✅ Done |
| 6 | Repeat vs one-time customers (pie) | repeat_customers.csv | ✅ Done |
| 7 | Average daily revenue by weekday | revenue_by_weekday.csv | ✅ Done |

---

## Key Insights to Validate Visually

These are the findings from the SQL phase that the EDA charts should confirm:

1. **Health & beauty** leads revenue despite not having the highest avg price — driven by volume
2. **Late deliveries score 1.72 points lower** than on-time deliveries (2.57 vs 4.29)
3. **AL, MA, PI** are the worst states for late deliveries (>15% late rate)
4. **Champions spend 5.6x more** than average but represent only 87 customers
5. **Credit card dominates** at 74% of transactions and 78% of revenue
6. **97% of customers purchase only once** — retention is the biggest commercial problem
7. **Monday and Tuesday** are peak order days; weekends are weakest

---

## Decisions Made

| Decision | Reason |
|----------|--------|
| Kept EDA to 7 focused charts | Avoid overlap with Power BI dashboard; each chart tells a distinct story |
| Skipped correlation matrix | Low storytelling value at this stage; better suited for statistical analysis project |
| Skipped cohort retention | Complex to build cleanly; reserved for dedicated customer analysis project |
| Used median for basket size | Resistant to outliers unlike mean; more representative of typical customer |
| Used orange highlights for underperforming states | Visual signal for states above 15% late delivery threshold |

---

## Skills Demonstrated in This Phase

| Skill | How |
|-------|-----|
| Python / pandas | Loading and preparing CSV data for visualization |
| matplotlib | Custom bar, horizontal bar, and pie charts |
| seaborn | Themed statistical charts with clean styling |
| Data storytelling | Chart titles, labels, and annotations that communicate findings clearly |
| Portfolio documentation | Saving charts as PNG files for GitHub and Power BI |

---

## Portfolio Mapping

This phase contributes to:

- **Portfolio Type 2 — Customer/User Analysis** (RFM segmentation, repeat customers)
- **Portfolio Type 1 — Business/Sales Dashboard** (revenue charts feed directly into Power BI)
- **Portfolio Type 3 — Logistics/Transportation** (delivery performance by state)

---


## Phase Timeline

| Phase | Status |
|-------|--------|
| Phase 1 — Dataset Setup | ✅ Done |
| Phase 2 — Data Cleaning | ✅ Done |
| Phase 3 — SQL Analysis | ✅ Done |
| **Phase 4A — Python EDA** | 🔄 In Progress |
| Phase 4B — Power BI Dashboard | ⬜ Pending |
| Phase 5 — README & Publishing | ⬜ Pending |