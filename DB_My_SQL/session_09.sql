-- SESSION 9: Transactions, Error Handling, and Trigger
CREATE DATABASE IF NOT EXISTS dbsql_session_09;
USE dbsql_session_09;

CREATE TABLE Orders (order_id INT PRIMARY KEY, user_id INT, order_total DECIMAL(10,2));
CREATE TABLE OrderItems (item_id INT PRIMARY KEY, order_id INT, item_name VARCHAR(100));
CREATE TABLE Cart (cart_id INT PRIMARY KEY, user_id INT, product_name VARCHAR(100));
CREATE TABLE Wallet (user_id INT PRIMARY KEY, balance DECIMAL(10,2));
CREATE TABLE Transactions (transaction_id INT PRIMARY KEY, user_id INT, amount DECIMAL(10,2));
INSERT INTO Wallet VALUES (1, 1000.00);

INSERT INTO Orders VALUES (1001, 1, 799.00); COMMIT;
START TRANSACTION;
INSERT INTO OrderItems VALUES (1, 1001, 'Pizza'), (2, 1001, 'Drink');
ROLLBACK;

START TRANSACTION;
INSERT INTO Cart VALUES (1, 1, 'Headphones');
SAVEPOINT after_first_product;
INSERT INTO Cart VALUES (2, 1, 'Phone Case');
ROLLBACK TO after_first_product;
COMMIT;

DELIMITER //
CREATE TRIGGER deduct_wallet_balance AFTER INSERT ON Transactions FOR EACH ROW
BEGIN
  UPDATE Wallet SET balance = balance - NEW.amount WHERE user_id = NEW.user_id;
END//
DELIMITER ;
INSERT INTO Transactions VALUES (1, 1, 250.00);
SELECT balance AS expected_750 FROM Wallet WHERE user_id = 1;
