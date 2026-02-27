# Week 3: Database & SQL Validation Testing

**Month 1 Week 3 – Data Integrity & Backend Validation**  
**Target Dates:** March 6–12, 2025  
**Estimated Effort:** 8–10 hours

---

## 🎯 Objective

Move beyond testing the UI. Query a real PostgreSQL database to validate that data flows correctly from the frontend through the backend and confirm critical business logic works at the data layer.

---

## 📋 What You'll Deliver

### 1. PostgreSQL Setup & Schema
- Local PostgreSQL instance (or Docker containerized)
- Test database with simulated NexusStream tables
- Sample data: users, products, orders, order_items, inventory

### 2. SQL Test Scripts (.sql files)
Write queries to validate:
- **User Registration** – Did the user who signed up on the frontend get saved in the database with encrypted password?
- **Order Creation** – When an order is placed, do all related records (order header, items, inventory) update correctly?
- **Inventory Management** – When an item is purchased, does the stock_quantity decrease?
- **Payment State** – Is the order payment_status and transaction_status synchronized?
- **Refund Processing** – When an order is refunded, do inventory levels revert?

### 3. Query Results & Screenshots
- Terminal output showing successful query execution
- Data snapshots proving integrity checks passed
- Documentation of each query's purpose and findings

### 4. README with Explanations
- Why each SQL test matters
- How it maps to previous UI test failures (e.g., TC-009 payment issue)
- What data should be there vs. what you found

---

## 🧬 Example Queries You'll Write

```sql
-- Validate user password is encrypted (not plain text)
SELECT user_id, email, password_hash 
FROM users 
WHERE email = 'test@example.com';

-- Check order state after payment decline
SELECT order_id, status, payment_status, total_amount 
FROM orders 
WHERE order_id = 12345;

-- Verify inventory decremented correctly
SELECT product_id, stock_quantity, reserved_quantity 
FROM inventory 
WHERE product_id = 'iPhone15';
```

---

## ✅ Definition of Done

- [ ] PostgreSQL running locally
- [ ] Test database created with sample data
- [ ] 8–10 SQL test scripts written and documented
- [ ] All queries executed successfully with results captured
- [ ] Screenshots added to the Week-03 folder
- [ ] README explaining each test and findings

---

## 📈 Why This Matters (For Recruiters)

When a hiring manager sees Week 3:
- ✅ You understand how data flows through an application
- ✅ You can write SQL (SELECT, WHERE, JOINs, aggregate functions)
- ✅ You validate that backend data matches frontend behavior
- ✅ You find bugs at the database layer (not just the UI)
- ✅ You can troubleshoot data integrity issues independently

---

## 🔗 Links to Previous Work

- **NXS-102 (Payment Issue)** – You'll verify this via SQL: does a declined payment create an order record?
- **NXS-103 (Quantity Issue)** – You'll check: do excessive quantities exist in order_items?
- **TC-001 (Login Bypass)** – You'll validate: is the password field encrypted?

---

**Target Start Date:** March 6, 2025  
**Estimated Duration:** 8–10 hours  
**Prerequisite:** Basic SQL knowledge (SELECT, WHERE, JOINs)  
**Status:** 🔄 NOT STARTED – Coming after Week 2 sign-off

