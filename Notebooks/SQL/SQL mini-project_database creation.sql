CREATE DATABASE coffee_shop;
USE coffee_shop;


CREATE TABLE stores (
						store_id INT PRIMARY KEY,
						store_location VARCHAR(50)
);
                

CREATE TABLE products (
						product_id INT PRIMARY KEY,
						product_category VARCHAR(50),
						product_type VARCHAR(50),
						product_detail VARCHAR(100),
						size VARCHAR(10),
						unit_price DECIMAL(5,2)
);
      
CREATE TABLE transactions (
							transaction_id INT PRIMARY KEY,
							transaction_date DATE,
							transaction_time TIME,
							store_id INT,
							product_id INT,
							transaction_qty INT,
							total_bill DECIMAL(7,2),
							hour INT,
							day_name VARCHAR(10),
							month INT,
							month_name VARCHAR(10),
							day_of_week INT,
							FOREIGN KEY (store_id) REFERENCES stores(store_id),
							FOREIGN KEY (product_id) REFERENCES products(product_id)
);
                            

CREATE INDEX idx_transactions_store
ON transactions(store_id);

CREATE INDEX idx_transactions_product
ON transactions(product_id);

SHOW VARIABLES LIKE 'local_infile';


SELECT COUNT(*) FROM stores;
SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM transactions;

-- csv files to populate the tables were imported usinng import wizard