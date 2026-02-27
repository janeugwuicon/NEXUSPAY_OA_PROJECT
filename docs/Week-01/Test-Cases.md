# Manual Test Cases – Week 1 ✅ EXECUTED

**Sprint 1 – Core Feature Validation**  
**Status:** ✅ All 10 cases executed  
**Date Range:** February 19–26, 2025  
**Tester:** Jane Ugwu

---

## Test Cases Executed

### **TC-001: Login with Valid Credentials**
- **Precondition:** User account exists (user@example.com / password123)
- **Steps:**
  1. Navigate to login page
  2. Enter email: `user@example.com`
  3. Enter password: `password123`
  4. Click "Sign In"
- **Expected:** Dashboard loads; session created
- **Actual:** ❌ Bypass found: Login succeeds with email `user@example.com  ` (trailing spaces)
- **Severity:** CRITICAL
- **Bug Ticket:** NXS-101

---

### **TC-002: Login with Invalid Password**
- **Precondition:** Valid user account exists
- **Steps:**
  1. Navigate to login page
  2. Enter email: `user@example.com`
  3. Enter password: `wrongpassword`
  4. Click "Sign In"
- **Expected:** Error message: "Invalid credentials" shown; user remains on login page
- **Actual:** ✅ PASS – Error displayed correctly
- **Severity:** — (Test Passed)

---

### **TC-003: Add 9,999 Items to Cart**
- **Precondition:** Product in stock; user on product detail page
- **Steps:**
  1. Navigate to product detail (iPhone 15, stock: 50)
  2. In quantity field, enter `9999`
  3. Click "Add to Cart"
  4. View cart
- **Expected:** Error message: "Maximum 99 per order" OR "Only 50 available" shown; not added
- **Actual:** ❌ FAIL – System accepts 9,999 units; cart shows qty=9,999, total=$1,246,950.99
- **Severity:** HIGH
- **Bug Ticket:** NXS-103

---

### **TC-004: Add Valid Quantity to Cart**
- **Precondition:** Product in stock; user on product detail page
- **Steps:**
  1. Navigate to iPhone 15 product detail
  2. Enter quantity: `2`
  3. Click "Add to Cart"
  4. View cart
- **Expected:** Cart displays: iPhone 15 × 2 = $3,998.00
- **Actual:** ✅ PASS – Correct quantity and price shown
- **Severity:** — (Test Passed)

---

### **TC-005: Search Products by Keyword**
- **Precondition:** User on products page
- **Steps:**
  1. Enter search term: `laptop`
  2. Click "Search"
  3. View results
- **Expected:** Results show 15 laptops; each product listed once
- **Actual:** ⚠️ PASS with note – Results correct but Dell XPS 13 appears twice (duplicate)
- **Severity:** MEDIUM (UX issue)
- **Bug Ticket:** NXS-104

---

### **TC-006: Remove Item from Cart**
- **Precondition:** Item in cart (iPhone 15 × 2)
- **Steps:**
  1. Click cart icon
  2. Click "Remove" button next to iPhone 15
  3. View updated cart
- **Expected:** Item removed; cart total updates
- **Actual:** ✅ PASS – Item removed successfully
- **Severity:** — (Test Passed)

---

### **TC-007: Update Item Quantity in Cart**
- **Precondition:** Item in cart
- **Steps:**
  1. Click cart icon
  2. Change iPhone 15 qty from 2 to 3
  3. Observe cart total
- **Expected:** Cart total recalculates to $5,998.00 (3 × $1,999)
- **Actual:** ❌ FAIL – Qty updates to 3, but total remains $3,998.00 (not recalculated)
- **Severity:** HIGH
- **Bug Ticket:** NXS-105

---

### **TC-008: Checkout with All Required Fields**
- **Precondition:** Item in cart; user at checkout page
- **Steps:**
  1. Enter name: `John Doe`
  2. Enter address: `123 Main St, Seattle, WA 98101`
  3. Enter phone: `206-555-0100`
  4. Click "Continue to Payment"
- **Expected:** Form validation passes; payment page loads
- **Actual:** ❌ FAIL – Form accepts submission with blank "Zip Code" field; order proceeds
- **Severity:** HIGH
- **Bug Ticket:** NXS-106

---

### **TC-009: Checkout with Expired Credit Card**
- **Precondition:** Item in cart; user at payment page
- **Steps:**
  1. Enter card: `4111 1111 1111 0069` (Visa test card, triggers decline)
  2. Enter expiry: `12/25`
  3. Enter CVV: `123`
  4. Click "Complete Purchase"
- **Expected:** Error message: "Card declined. Try another payment method." Order NOT created.
- **Actual:** ❌ FAIL – Payment gateway returns 402 (decline), but order created with status="Completed"; inventory decremented
- **Severity:** CRITICAL
- **Bug Ticket:** NXS-102

---

### **TC-010: Checkout with Missing Shipping Address**
- **Precondition:** Item in cart; user at checkout
- **Steps:**
  1. Leave "Address" field blank
  2. Enter other fields (name, phone, etc.)
  3. Click "Continue to Payment"
- **Expected:** Error message: "Address required" shown; form not submitted
- **Actual:** ❌ FAIL – Form allows submission; proceeds to payment with missing address
- **Severity:** HIGH
- **Bug Ticket:** NXS-106

---

## Summary

| Status | Count |
|--------|-------|
| ✅ PASSED | 4 |
| ❌ FAILED | 6 |

| Severity | Count |
|----------|-------|
| CRITICAL | 2 |
| HIGH | 4 |
| MEDIUM | 1 |

---

**Test Execution Complete**  
**Signed Off By:** Jane Ugwu  
**Date:** February 26, 2025
