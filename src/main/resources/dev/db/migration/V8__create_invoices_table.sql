-- tao table invoices (quan ly viec ton kho don hang)
CREATE TABLE invoices
(
    invoice_id   INT PRIMARY KEY AUTO_INCREMENT,
    order_id     INT,
    invoice_date DATETIME
);

-- them thuoc tinh brand_id vao table product
ALTER TABLE invoices
    ADD CONSTRAINT fk_invoices_orders
        FOREIGN KEY (order_id) REFERENCES orders (id);

-- cap nhat table user, them cac truong sau
ALTER TABLE users
    ADD COLUMN email  VARCHAR(50),
    ADD COLUMN gender VARCHAR(20);

-- cap nhat table order_details, them truong so luong order
ALTER TABLE order_details
    ADD COLUMN order_quantity INT;