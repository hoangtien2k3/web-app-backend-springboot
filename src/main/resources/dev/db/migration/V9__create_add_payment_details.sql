-- Phương thức thanh toán
CREATE TABLE payments
(
    payment_id     INT PRIMARY KEY AUTO_INCREMENT,
    order_id       INT,
    user_id        INT,
    payment_method VARCHAR(50),
    payment_status INT,
    transaction_id INT,
    create_at      DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Cập nhật lại quan hệ giữa bảng payments và orders
ALTER TABLE payments
    ADD CONSTRAINT fk_payments_orders
        FOREIGN KEY (order_id) REFERENCES orders (id) ON DELETE CASCADE;

-- Quan hệ payments và users
ALTER TABLE payments
    ADD CONSTRAINT fk_payments_users
        FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE;

-- Bảng thông tin vận chuyển
CREATE TABLE shippings
(
    id              INT PRIMARY KEY AUTO_INCREMENT,
    order_id        INT,
    shipping_method VARCHAR(50),
    tracking_number VARCHAR(40),
    carrier         VARCHAR(20),
    FOREIGN KEY (order_id) REFERENCES orders (id) ON DELETE CASCADE
);

-- Bảng địa chỉ vận chuyển
CREATE TABLE shipping_address
(
    id               INT PRIMARY KEY AUTO_INCREMENT,
    shipping_id INT,
    street           VARCHAR(50),
    city             VARCHAR(50),
    district         VARCHAR(50),
    postal_code      VARCHAR(50),
    country          VARCHAR(50),
    CONSTRAINT fk_shipping_address_shippings
        FOREIGN KEY (shipping_id) REFERENCES shippings (id) ON DELETE CASCADE
);

-- column lưu trữ data đơn hàng
ALTER TABLE orders
    ADD COLUMN order_data JSON;
