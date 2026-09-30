CREATE DATABASE inventory_db;

USE inventory_db;

CREATE TABLE categories (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE
);

INSERT INTO categories (name)
VALUES ('electronics');

INSERT INTO categories (name)
VALUES ('accessories');


CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    price int NOT NULL,
    stock INT NOT NULL,
    category_id INT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES categories(id)
);



INSERT INTO products (title, price, stock, category_id)
VALUES ('Wireless Mouse', 25, 50, 1);

INSERT INTO products (title, price, stock, category_id)
VALUES ('Wireless Mouse', 25, 1, 1);



INSERT INTO products (title, price, stock, category_id)
VALUES ('', 25, 10, 1);

INSERT INTO products (title, price, stock, category_id)
VALUES ('Wireless Mouse', 25, -10, 1);

INSERT INTO products (title, price, stock, category_id)
VALUES ('Wireless Mouse', "twenty five", -10, 1);

INSERT INTO products (title, price, stock, category_id)
VALUES ('', 10, 40, 2);


INSERT INTO products (title, price, stock, category_id)
VALUES ('USB Cable', 10, 30, 2);



SELECT * FROM products;


-- Validate product and category relationship
SELECT
    p.id,
    p.title,
    p.price,
    p.stock,
    c.name AS category_name
FROM products p
JOIN categories c
    ON p.category_id = c.id
WHERE p.title = 'Wireless Mouse'
  AND c.name = 'electronics';
