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

## 📊 Dashboards

| Dashboard | Image | Live URL |
|----------|-------|----------|
| Delivery Performance | ![delivery](dashboards/delivery_dashboard.png) | [View](https://link-to-shared-metabase-dashboard) |
| Product Category Performance | ![category](dashboards/category_performance.png) | [View](https://link-to-shared-metabase-dashboard) |
| Seller City Comparisons | ![seller](dashboards/seller_dashboard.png) | [View](https://link-to-shared-metabase-dashboard) |
| Review Score Distribution | ![reviews](dashboards/reviews.png) | [View](https://link-to-shared-metabase-dashboard) |

## 📂 Project Structure

ecommerce-sql-analytics/ ├── data/ ├── queries/ ├── dashboards/ ├── scripts/ ├── docker-compose.yml ├── README.md


## 🚀 Setup Instructions

```bash
chmod +x scripts/init_db.sh
./scripts/init_db.sh
