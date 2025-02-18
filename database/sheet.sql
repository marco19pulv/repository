-- Database: Personal Finance Management

CREATE DATABASE personal_finance;
USE personal_finance;

-- Users table
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Accounts table
CREATE TABLE accounts (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    account_name VARCHAR(100) NOT NULL,
    balance DECIMAL(15,2) NOT NULL DEFAULT 0.00,
    currency VARCHAR(10) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- Categories table
CREATE TABLE categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100) NOT NULL UNIQUE
);

-- Transactions table
CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    account_id INT NOT NULL,
    category_id INT,
    amount DECIMAL(15,2) NOT NULL,
    transaction_type ENUM('income', 'expense') NOT NULL,
    description TEXT,
    transaction_date DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (account_id) REFERENCES accounts(account_id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES categories(category_id) ON DELETE SET NULL
);

-- Budget table
CREATE TABLE budgets (
    budget_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    category_id INT NOT NULL,
    amount DECIMAL(15,2) NOT NULL,
    period ENUM('daily', 'weekly', 'monthly', 'yearly') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES categories(category_id) ON DELETE CASCADE
);

-- Users CRUD
INSERT INTO users (username, email, password_hash) VALUES ('john_doe', 'john@example.com', 'hashed_password');
SELECT * FROM users;
UPDATE users SET email = 'new_email@example.com' WHERE user_id = 1;
DELETE FROM users WHERE user_id = 1;

-- Accounts CRUD
INSERT INTO accounts (user_id, account_name, balance, currency) VALUES (1, 'Checking Account', 1000.00, 'USD');
SELECT * FROM accounts;
UPDATE accounts SET balance = 950.00 WHERE account_id = 1;
DELETE FROM accounts WHERE account_id = 1;

-- Categories CRUD
INSERT INTO categories (category_name) VALUES ('Groceries');
SELECT * FROM categories;
UPDATE categories SET category_name = 'Food' WHERE category_id = 1;
DELETE FROM categories WHERE category_id = 1;

-- Transactions CRUD
INSERT INTO transactions (account_id, category_id, amount, transaction_type, description, transaction_date) 
VALUES (1, 1, 50.00, 'expense', 'Supermarket shopping', '2025-02-17');
SELECT * FROM transactions;
UPDATE transactions SET amount = 45.00 WHERE transaction_id = 1;
DELETE FROM transactions WHERE transaction_id = 1;

-- Budgets CRUD
INSERT INTO budgets (user_id, category_id, amount, period) VALUES (1, 1, 300.00, 'monthly');
SELECT * FROM budgets;
UPDATE budgets SET amount = 350.00 WHERE budget_id = 1;
DELETE FROM budgets WHERE budget_id = 1;