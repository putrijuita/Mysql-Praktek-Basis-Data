-- Nama: Seravina Nuryanti Juita
-- Program Studi: Teknologi Rekayasa Internet

-- Create categories table
CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(255)
);

-- Create products table with auto-incrementing product_id and adjusted price range
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255),
    category_id INT,
    price DECIMAL(10, 2),
    stock_quantity INT,
    description TEXT,
    manufacturer VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Insert category
INSERT INTO categories (category_id, category_name) VALUES (1, 'Your Category');

-- Insert product with adjusted price value
INSERT INTO products (product_name, category_id, price, stock_quantity, description, manufacturer)
VALUES ('Laptop Asus', 1, 1200000.00, 50, 'Powerful laptop with high performance', 'Your Manufacturer');

SELECT * FROM products
WHERE price > (SELECT AVG(price) FROM products);
UPDATE products
SET stock_quantity = 75
WHERE product_id = 'p003';

SELECT categories.category_name, COUNT(products.product_id) AS total_products
FROM categories
JOIN products ON categories.category_id = products.category_id
GROUP BY categories.category_id, categories.category_name;

SELECT *
FROM products
WHERE stock_quantity > 20 AND price < 15000000;

SELECT *
FROM products
ORDER BY price ASC;

DELETE FROM products WHERE stock_quantity < 10;
SELECT
    product_id,
    product_name,
    SUM(price * stock_quantity) AS total_stock_value
FROM
    products
GROUP BY
    product_id, product_name;

ALTER TABLE products
ADD COLUMN discount DECIMAL(5,2);


