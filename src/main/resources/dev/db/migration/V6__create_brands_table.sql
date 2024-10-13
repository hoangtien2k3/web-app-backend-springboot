-- cập nhật thêm table branch (hãng - hàng hoá)

-- table branchs
CREATE TABLE brands
(
    brand_id           INT PRIMARY KEY AUTO_INCREMENT,
    brand_name         VARCHAR(100) NOT NULL,
    brand_email        VARCHAR(50),
    brand_phone_number VARCHAR(20),
    brand_address      VARCHAR(150)
);

-- them thuoc tinh brand_id vao table product
ALTER TABLE products
    ADD COLUMN brand_id INT,
    ADD CONSTRAINT fk_products_brands
        FOREIGN KEY (brand_id) REFERENCES brands (brand_id);
