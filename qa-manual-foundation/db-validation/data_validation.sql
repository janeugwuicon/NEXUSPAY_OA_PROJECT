-- NexusPay Data Validation SQL
-- This is my final manual project for Week 4: Data & Backend (SQL)
-- I created this to validate the database integrity for NexusPay.

-- First, run schema-setup.sql to create tables and insert sample data

-- Then run these validation queries:

-- 1. Find all transactions for a specific user (Day 24)
SELECT t.id, t.type, t.amount, t.description, t.created_at
FROM transactions t
JOIN users u ON t.user_id = u.id
WHERE u.id = 1;  -- Replace with actual user ID

-- 2. Calculate total balance of all users (Day 25)
SELECT SUM(balance) AS total_balance_all_users
FROM users;

-- 3. Find orphaned transactions (Day 26)
SELECT t.id, t.user_id, t.type, t.amount
FROM transactions t
LEFT JOIN users u ON t.user_id = u.id
WHERE u.id IS NULL;

-- 4. Top 5 users by transaction volume (Day 27)
SELECT u.id, u.name, SUM(t.amount) AS total_volume
FROM users u
JOIN transactions t ON u.id = t.user_id
GROUP BY u.id, u.name
ORDER BY total_volume DESC
LIMIT 5;

-- 5. Balance reconciliation check
SELECT u.id, u.name, u.balance,
       COALESCE(SUM(CASE WHEN t.type = 'deposit' THEN t.amount ELSE 0 END), 0) -
       COALESCE(SUM(CASE WHEN t.type IN ('withdraw', 'send') THEN t.amount ELSE 0 END), 0) AS calculated_balance
FROM users u
LEFT JOIN transactions t ON u.id = t.user_id
GROUP BY u.id, u.name, u.balance
HAVING u.balance != (COALESCE(SUM(CASE WHEN t.type = 'deposit' THEN t.amount ELSE 0 END), 0) -
                     COALESCE(SUM(CASE WHEN t.type IN ('withdraw', 'send') THEN t.amount ELSE 0 END), 0));

-- This ensures data integrity in my NexusPay system.