#!/bin/bash

echo "⏳ Rebuilding Docker containers..."
docker compose down -v
docker compose up -d
sleep 10

echo "📦 Copying schema and CSV files to the container..."
docker cp data/schema.sql ecommerce_postgres:/schema.sql
for f in data/*.csv; do docker cp "$f" ecommerce_postgres:/; done

echo "📂 Importing schema..."
docker exec -i ecommerce_postgres psql -U gitpod -d ecommerce_db -f /schema.sql

echo "📥 Importing CSVs..."
docker exec -it ecommerce_postgres bash -c "
psql -U gitpod -d ecommerce_db -c \"
\\copy orders FROM '/olist_orders_dataset.csv' DELIMITER ',' CSV HEADER;
\\copy customers FROM '/olist_customers_dataset.csv' DELIMITER ',' CSV HEADER;
\\copy order_items FROM '/olist_order_items_dataset.csv' DELIMITER ',' CSV HEADER;
\\copy payments FROM '/olist_order_payments_dataset.csv' DELIMITER ',' CSV HEADER;
\\copy order_reviews FROM '/olist_order_reviews_dataset.csv' DELIMITER ',' CSV HEADER;
\\copy products FROM '/olist_products_dataset.csv' DELIMITER ',' CSV HEADER;
\\copy sellers FROM '/olist_sellers_dataset.csv' DELIMITER ',' CSV HEADER;
\\copy geolocation FROM '/olist_geolocation_dataset.csv' DELIMITER ',' CSV HEADER;
\\copy product_category_translation FROM '/product_category_name_translation.csv' DELIMITER ',' CSV HEADER;
\"
"

echo "✅ All data loaded!"
echo "🌐 Metabase: https://3000-$(gp url 3000)"
