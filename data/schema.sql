DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
    order_id VARCHAR PRIMARY KEY,
    customer_id VARCHAR,
    order_status VARCHAR,
    order_purchase_timestamp TIMESTAMP,
    order_approved_at TIMESTAMP,
    order_delivered_carrier_date TIMESTAMP,
    order_delivered_customer_date TIMESTAMP,
    order_estimated_delivery_date TIMESTAMP
);

DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
    customer_id VARCHAR PRIMARY KEY,
    customer_unique_id VARCHAR,
    customer_zip_code_prefix INTEGER,
    customer_city VARCHAR,
    customer_state VARCHAR
);

DROP TABLE IF EXISTS order_items;
CREATE TABLE order_items (
    order_id VARCHAR,
    order_item_id INTEGER,
    product_id VARCHAR,
    seller_id VARCHAR,
    shipping_limit_date TIMESTAMP,
    price NUMERIC,
    freight_value NUMERIC
);

DROP TABLE IF EXISTS payments;
CREATE TABLE payments (
    order_id VARCHAR,
    payment_sequential INTEGER,
    payment_type VARCHAR,
    payment_installments INTEGER,
    payment_value NUMERIC
);

DROP TABLE IF EXISTS order_reviews;
CREATE TABLE order_reviews (
    review_id VARCHAR,
    order_id VARCHAR,
    review_score INTEGER,
    review_comment_title TEXT,
    review_comment_message TEXT,
    review_creation_date TIMESTAMP,
    review_answer_timestamp TIMESTAMP
);

DROP TABLE IF EXISTS products;
CREATE TABLE products (
    product_id VARCHAR PRIMARY KEY,
    product_category_name VARCHAR,
    product_name_length INTEGER,
    product_description_length INTEGER,
    product_photos_qty INTEGER,
    product_weight_g NUMERIC,
    product_length_cm NUMERIC,
    product_height_cm NUMERIC,
    product_width_cm NUMERIC
);

DROP TABLE IF EXISTS sellers;
CREATE TABLE sellers (
    seller_id VARCHAR PRIMARY KEY,
    seller_zip_code_prefix INTEGER,
    seller_city VARCHAR,
    seller_state VARCHAR
);

DROP TABLE IF EXISTS geolocation;
CREATE TABLE geolocation (
    geolocation_zip_code_prefix INTEGER,
    geolocation_lat NUMERIC,
    geolocation_lng NUMERIC,
    geolocation_city VARCHAR,
    geolocation_state VARCHAR
);

DROP TABLE IF EXISTS product_category_translation;
CREATE TABLE product_category_translation (
    product_category_name VARCHAR,
    product_category_name_english VARCHAR
);
