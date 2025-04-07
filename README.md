# 🛍️ Ecommerce SQL Analytics with Metabase

This project explores Olist's Brazilian ecommerce data using PostgreSQL and Metabase dashboards.

## 📦 Dataset

Data comes from the [Olist Kaggle Dataset](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce) and includes:
- Orders, Customers, Products
- Sellers, Reviews, Payments
- Delivery data, Product categories

## 🛠️ Technologies
- PostgreSQL (via Docker)
- Metabase (for dashboards)
- Gitpod (dev environment)
- Shell scripting for automation

---

## 📊 Dashboards & Visual Insights

This project includes interactive and exportable dashboards created using Metabase.

### 🧾 PDF Snapshots
Viewable even when Gitpod is offline:

- 📄 [Sales & Revenue Tab](exports/Tab_1_Sales_and_Revenue.pdf)
- 📄 [Product Preferences & Performance Tab](exports/Tab_2_Product_Preferences_and_Performance.pdf)



## 📂 Project Structure

```bash
ecommerce-sql-analytics/
├── data/                       # Raw CSV data files
├── queries/                   # SQL queries
├── exports/                   # Exported PDF snapshots
├── scripts/                   # Setup automation
├── docker-compose.yml         # Container setup
└── README.md
```
---


## 🚀 Setup Instructions

```bash
# Run the following from your Gitpod terminal to get everything up and running:

# 1. Make the setup script executable
chmod +x scripts/init_db.sh

# 2. Launch Metabase and PostgreSQL containers, import schema and CSVs
./scripts/init_db.sh

# 3. Access Metabase from:
# https://3000-<your-gitpod-workspace>.gitpod.io
# Use: gitpod / mypassword (if needed)
