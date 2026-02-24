-- Week 4: Data & Backend (SQL)
-- Day 22: Install PostgreSQL. Learn SELECT, FROM, WHERE.
-- (Assuming PostgreSQL is installed and running)

-- Day 23: Create the NexusPay Users and Transactions tables.

-- Create Users table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    balance DECIMAL(10,2) DEFAULT 0.00,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Transactions table
CREATE TABLE transactions (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    type VARCHAR(20) NOT NULL, -- 'deposit', 'withdraw', 'send', 'receive'
    amount DECIMAL(10,2) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert some sample data for testing
INSERT INTO users (name, email, balance) VALUES
('Jane Ugwu', 'jane@nexuspay.com', 15000.00),
('Test User 1', 'test1@nexuspay.com', 5000.00),
('Test User 2', 'test2@nexuspay.com', 2000.00);

INSERT INTO transactions (user_id, type, amount, description) VALUES
(1, 'deposit', 10000.00, 'Initial deposit'),
(1, 'send', 500.00, 'Sent to friend'),
(2, 'deposit', 5000.00, 'Salary'),
(3, 'withdraw', 1000.00, 'ATM withdrawal');
