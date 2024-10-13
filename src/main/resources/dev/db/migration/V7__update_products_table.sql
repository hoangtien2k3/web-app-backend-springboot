-- update filer table products
ALTER TABLE products
    ADD COLUMN product_original_price DECIMAL(10, 2),
    ADD COLUMN product_img VARCHAR(200) DEFAULT '',
    ADD COLUMN product_stock INT DEFAULT 1;
