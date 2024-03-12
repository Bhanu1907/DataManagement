library(readr)
library(RSQLite)

customer_dataset <- readr::read_csv("Ecommerce/hi_customer_dataset.csv")
delivery_dataset <- readr::read_csv("Ecommerce/hi_delivery_dataset.csv")
orders_dataset <- readr::read_csv("Ecommerce/hi_orders_dataset.csv")
product_dataset <- readr::read_csv("Ecommerce/hi_product_dataset.csv")
productcategory_dataset <- readr::read_csv("Ecommerce/hi_productcategory_dataset.csv")
promotion_dataset <- readr::read_csv("Ecommerce/hi_promotion_dataset.csv")
supplier_dataset <- readr::read_csv("Ecommerce/hi_supplier_dataset.csv")
transactions_dataset <- readr::read_csv("Ecommerce/hi_transactions_dataset.csv")

my_connection <- RSQLite::dbconnect(RSQLite::SQLite,"database/hi_import.db")
RSQLite::dbWriteTable(my_connection,'cutomer_id', 'customer_firstname', 'customer_lastname', 'customer_title', 'customer_phone', 'customer_email', 'customer_membership', 'delivery_fee', 'customer_building', 'customer_street', 'customer_city', 'customer_region', 'customer_postcode', 'promo_code', customer_dataset)
RSQLite::dbWriteTable(my_connection,'tracking_number', 'shipment_method', 'tracking_status', 'estimated_delivery_date', 'estimated_delivery_time', 'actual_delivery_date', 'actual_delivery_time', 'delivery_instructions', 'trans_id', delivery_dataset)
RSQLite::dbWriteTable(my_connection,'cutomer_id', 'order_id', 'product_id', 'product_qty', 'order_date', 'order_time', orders_dataset)
RSQLite::dbWriteTable(my_connection,'product_id', 'product_name', 'product_weight', 'product_length', 'product_height', 'product_width', 'product_price', 'supplier_id', 'category_name', product_dataset)
RSQLite::dbWriteTable(my_connection,'category_name', 'parent_category_id', productcategory_dataset)
RSQLite::dbWriteTable(my_connection,'promo_code', 'percentage_discount', promotion_dataset)
RSQLite::dbWriteTable(my_connection,'supplier_id', 'supplier_name', 'supplier_phone', 'supplier_email', 'supplier_building', 'supplier_street', 'supplier_city', 'supplier_region', 'supplier_postcode', supplier_dataset)
RSQLite::dbWriteTable(my_connection,'trans_id', 'order_id', 'trans_date', 'trans_time', transactions_dataset)


