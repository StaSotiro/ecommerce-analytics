{{ config(
    materialized='incremental',
    alias='fact_product',
    unique_key='product_id',
    order_by=['product_id', 'country', 'state', 'gender']
) }}

SELECT 
    items.product_id, loc.country, loc.state, customers.gender, sum(items.price * items.quantity) as gross_revenue, count(orders.id) as unique_baskets
FROM 
    develop.customer AS customers 
    JOIN develop.orders AS orders ON orders.customer_id = customers.id 
    JOIN develop.order_item AS items ON items.order_id = orders.id 
    JOIN develop.locations AS loc ON loc.id = customers.location_id 
GROUP BY items.product_id, loc.country, loc.state, customers.gender 
