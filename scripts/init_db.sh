#!/bin/bash

# ─────────────────────────────────────────────
# Flags to control behavior
# RESET=true         → Destroys volumes (Metabase + DB data)
# RESET_SCHEMA=true  → Rebuilds schema from schema.sql
# ─────────────────────────────────────────────

if [ "$RESET" = "true" ]; then
  echo "🧨 Wiping all containers and volumes..."
  docker compose down -v
else
  echo "🔁 Skipping volume reset to preserve Metabase and DB data"
fi

echo "🚀 Starting containers..."
docker compose up -d
sleep 10

echo "📦 Copying schema and CSV files to the container..."
docker cp data/schema.sql ecommerce_postgres:/schema.sql
for f in data/*.csv; do
  docker cp "$f" ecommerce_postgres:/
done

if [ "$RESET_SCHEMA" = "true" ]; then
  echo "📂 Rebuilding schema from /schema.sql..."
  docker exec -i ecommerce_postgres psql -U gitpod -d ecommerce_db -f /schema.sql
else
  echo "✅ Skipping schema rebuild to preserve tables"
fi

echo "📥 Importing CSVs into existing tables..."

# Table to CSV mapping
declare -A mapping
mapping[orders]="olist_orders_dataset.csv"
mapping[customers]="olist_customers_dataset.csv"
mapping[order_items]="olist_order_items_dataset.csv"
mapping[payments]="olist_order_payments_dataset.csv"
mapping[order_reviews]="olist_order_reviews_dataset.csv"
mapping[products]="olist_products_dataset.csv"
mapping[sellers]="olist_sellers_dataset.csv"
mapping[geolocation]="olist_geolocation_dataset.csv"
mapping[product_category_translation]="product_category_name_translation.csv"

for table in "${!mapping[@]}"; do
  file="/${mapping[$table]}"
  echo "📊 Loading ${table} from ${file}..."
  docker exec ecommerce_postgres psql -U gitpod -d ecommerce_db -c "\\copy ${table} FROM '${file}' DELIMITER ',' CSV HEADER"
done

echo "✅ All data loaded!"
echo "🌐 Metabase is ready → $(gp url 3000)"
