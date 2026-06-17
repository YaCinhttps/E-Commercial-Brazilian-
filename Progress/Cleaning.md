# Olist E-Commerce Data Analysis

## What is This?
This project cleans and analyzes Brazilian e-commerce data from Olist, one of Brazil's largest online marketplaces.

## Quick Start

### 1. Setup
```bash
pip install pandas kagglehub jupyter
```

### 2. Run the Cleaning Notebook
Open `notebooks/01Cleaning.ipynb` and run all cells. This will:
- Download data from Kaggle automatically
- Clean all 9 datasets
- Remove bad data, fix formats, standardize text

### 3. What Gets Cleaned?

| Dataset | What We Fix |
|---------|-----------|
| **Orders** | Fix dates, remove incomplete orders |
| **Products** | Remove duplicates, fix missing sizes/weights |
| **Reviews** | Validate ratings (1-5 stars), fix dates |
| **Payments** | Remove invalid amounts, check installments |
| **Customers** | Remove duplicates, standardize city/state names |
| **Sellers** | Remove duplicates, standardize locations |
| **Order Items** | Validate prices & shipping costs |
| **Geolocation** | Fix coordinates to Brazil only |
| **Categories** | Clean translation names |

## Data Flow

```
Raw Data (CSV)
    ↓
Cleaning (01Cleaning.ipynb)
    ↓
Clean DataFrames (Pandas)
    ↓
Ready for Analysis
```

## Key Files
- `notebooks/01Cleaning.ipynb` - Main cleaning script
- `data/` - Raw data files (auto-downloaded)
- `README.md` - This file

## Output
After running the notebook, you have 9 clean datasets ready:
```python
orders_clean
products_clean
reviews_clean
order_items_clean
payments_clean
customers_clean
sellers_clean
geolocation_clean
category_clean
```

## Before & After Example

**Orders**: 99,441 rows → 99,441 rows ✓
- Fixed 5 timestamp columns
- Removed 0 incomplete orders

**Products**: 32,951 rows → 32,951 rows ✓
- Filled missing dimensions with 0
- Removed 0 duplicates

**Reviews**: 99,224 rows → 99,224 rows ✓
- Validated all ratings are 1-5 stars
- Filled missing comment text



 ## Phase Timeline


| Phase | Status |
|-------|--------|
| **Phase 1 — Dataset Setup** | 🔄 In Progress |
| **Phase 2 — Data Cleaning** | 🔄 In Progress |
| Phase 3 — SQL Analysis |   ⬜ Pending 
| Phase 4 - Python EDA |  ⬜ Pending |
| Phase 4B — Power BI Dashboard | ⬜ Pending |
| Phase 5 — README & Publishing | ⬜ Pending |



