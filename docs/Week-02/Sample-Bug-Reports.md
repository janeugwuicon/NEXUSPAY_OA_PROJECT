# Sample Bug Reports – Week 2, Sprint 1

This file contains examples of professional bug reports logged during Sprint 1 testing. Each bug follows the standard Jira format and severity classification.

---

## CRITICAL BUG #1: Login Bypass with Whitespace Padding

**Ticket ID:** NXS-101  
**Title:** User can bypass login validation by adding spaces to email field  
**Severity:** 🔴 CRITICAL  
**Priority:** P1 (Immediate)  
**Environment:** Staging (Chrome 120)  
**Assigned to:** Dev Team  
**Status:** Open

### Steps to Reproduce
1. Navigate to `https://staging.nexusstream.demo/login`
2. Enter email as `validuser@example.com  ` (add 5 spaces at the end)
3. Enter any password
4. Click **Sign In**
5. Observe result

### Expected Behavior
- System should reject the login with error: "Invalid credentials"
- User should remain on login page
- Session should NOT be created

### Actual Behavior
- Application strips the spaces server-side
- User is logged in successfully
- Dashboard loads and session is valid
- This bypasses email validation logic

### Root Cause
- Email validation does not trim whitespace before comparison
- Backend does not sanitize input on the authentication endpoint

### Impact
- **Security risk**: Valid user account can be accessed with malformed input
- **User experience**: Legitimate users with typos (trailing spaces) may accidentally access accounts they don't own

### Attachments
- Screenshot: Dashboard loaded after login with padded email
- Network log: POST /api/auth/login payload with trailing spaces

### Related Test Case
- TC-001: Login with valid credentials
- TC-002: Login with invalid credentials

---

## CRITICAL BUG #2: Payment Rejected but Order Status Shows Completed

**Ticket ID:** NXS-102  
**Title:** Failed payment transaction results in "Completed" order status  
**Severity:** 🔴 CRITICAL  
**Priority:** P1 (Immediate)  
**Environment:** Staging (All browsers)  
**Assigned to:** Dev Team + Payment Integrations Lead  
**Status:** Open

### Steps to Reproduce
1. Add 1 item to cart (price: $99.99)
2. Proceed to checkout
3. Fill in all required fields (name, address, phone)
4. Enter expired credit card: `4111 1111 1111 0069` (Visa test card that triggers decline)
5. Click **Complete Purchase**
6. Observe payment response and order status

### Expected Behavior
- Payment gateway returns 402 Payment Required
- User sees error message: "Card declined. Please try another payment method."
- Order is NOT created
- User remains on checkout page with cart intact

### Actual Behavior
- Payment gateway correctly rejects the card (API response: 402)
- But order is still created in database with status = "Completed"
- User is redirected to Order Confirmation page showing order #12345
- Inventory has been decremented despite payment failure
- User sees no error message

### Impact
- **Critical business risk**: Inventory loss on failed payments
- **Customer service impact**: Customers receive order confirmations for payments that failed
- **Revenue risk**: Refund requests spike when customers' cards decline but they see "order complete"

### Root Cause
- Order creation logic executes before payment confirmation is fully validated
- Payment callback error handling is incomplete

### Attachments
- Screenshot: Order confirmation page after failed payment
- Database query output: Order record with payment_status="completed" and gateway_response="402"
- API logs: Complete transaction flow

### Related Test Case
- TC-009: Checkout with expired credit card

---

## HIGH BUG #3: Checkout Allows Excessive Quantity Without Error

**Ticket ID:** NXS-103  
**Title:** System accepts 9,999 items per product in checkout when max should be 99  
**Severity:** 🟠 HIGH  
**Priority:** P2 (Next sprint)  
**Environment:** Staging  
**Assigned to:** Dev Team  
**Status:** Open

### Steps to Reproduce
1. Search for product: iPhone 15 (Stock: 50 units)
2. Click product details
3. In quantity field, enter `9999`
4. Click **Add to Cart**
5. View cart

### Expected Behavior
- System should cap quantity at 99 (or show error: "Maximum 99 per order")
- OR show error: "Insufficient stock (only 50 available)"
- Add to Cart button should be disabled if qty exceeds limits

### Actual Behavior
- System accepts 9,999 units
- Cart displays: iPhone 15 × 9,999 = $1,246,950.99
- Inventory shows: 50 units remaining (not decremented)
- User can proceed to checkout with invalid qty

### Impact
- **User experience**: Confusing interface allows unrealistic order entry
- **Data integrity**: Cart quantity doesn't match inventory
- **Business logic**: System doesn't enforce reasonable purchase limits

### Root Cause
- Frontend only validates numeric format, not upper bounds
- Backend doesn't validate quantity against max purchase limit or current stock

### Attachments
- Screenshot: Cart with 9,999 qty listed

### Related Test Case
- TC-003: Add items to cart with valid quantity

---

## MEDIUM BUG #4: Search Results Show Duplicate Products

**Ticket ID:** NXS-104  
**Title:** Product search displays the same item twice in results  
**Severity:** 🟡 MEDIUM  
**Priority:** P3 (Backlog)  
**Environment:** Staging  
**Assigned to:** Backend Team  
**Status:** Open

### Steps to Reproduce
1. Navigate to Products page
2. Search for: `laptop`
3. View search results

### Expected Behavior
- Search results show each unique product once
- Results include relevant filters (price, brand, rating)

### Actual Behavior
- Product "Dell XPS 13" appears twice in the results list
- Both listings are identical
- Clicking either one navigates to the same product detail page

### Impact
- **UX issue**: Confusing to see duplicates; users may think they're different variants
- **Minor data quality issue**: Database query or product aggregation has a bug

### Root Cause
- Likely caused by a JOIN without DISTINCT in the search query
- OR duplicate product records in database

### Attachments
- Screenshot: Search results with duplicate entry

### Related Test Case
- TC-005: Search for products by keyword

---

## LOW BUG #5: Typo in Checkout Button Label

**Ticket ID:** NXS-105  
**Title:** Checkout button shows "procced to payment" instead of "proceed to payment"  
**Severity:** 🔵 LOW  
**Priority:** P4 (Nice to have)  
**Environment:** Staging  
**Assigned to:** Frontend Team  
**Status:** Open

### Steps to Reproduce
1. Navigate to checkout page
2. Observe button text at bottom of cart

### Expected Behavior
- Button text reads: "Proceed to Payment"

### Actual Behavior
- Button text reads: "Procced to Payment" (missing 'e')

### Impact
- **Cosmetic only**: Spelling error reduces professionalism
- No functional impact on user transactions

### Root Cause
- Hardcoded string in frontend contains typo

### Attachments
- Screenshot: Checkout page with button typo

---

## Summary Table

| ID | Title | Severity | Status |
|-----|-------|----------|--------|
| NXS-101 | Login bypass with whitespace padding | CRITICAL | Open |
| NXS-102 | Failed payment shows as completed | CRITICAL | Open |
| NXS-103 | Excessive quantity in checkout | HIGH | Open |
| NXS-104 | Duplicate products in search | MEDIUM | Open |
| NXS-105 | Typo in checkout button | LOW | Open |

---


