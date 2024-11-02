CREATE TABLE order_item (
    order_id INT,
    product_id INT,
    price DECIMAL(10, 2),
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(id)
);
