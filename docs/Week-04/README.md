# Week 4: API Testing with Postman

**Month 1 Week 4 – Backend API Validation**  
**Target Dates:** March  13–19, 2025  
**Estimated Effort:** 6–8 hours

---

## 🎯 Objective

Transition from manual UI testing to **API testing**. You'll use Postman to validate that the backend APIs work correctly, respond with proper HTTP status codes, and return complete JSON data.

---

## 📋 What You'll Deliver

### 1. Postman Collection (JSON Export)
- 15+ API test requests covering core workflows
- Organized into folders: Auth, Products, Orders, Payments
- Each request includes assertions (tests) to validate responses

### 2. Postman Environment (JSON Export)
- Base URL: `https://staging.nexusstream.demo/api`
- Variables: auth tokens, product IDs, customer IDs
- Test data: valid/invalid credentials, product SKUs

### 3. Screenshots of Passing Tests
- Green checkmarks showing all API tests pass
- Response body and headers visible
- Test results summary (execution time, assertions)

### 4. Documentation (Postman-style + GitHub README)
- Explain each endpoint and what it tests
- Show examples of successful responses
- Document error scenarios (4xx, 5xx handling)

---

## 🔗 Example API Tests You'll Write

```
POST /auth/login
├─ Test 1: Login with valid credentials → 200 OK + Bearer token
├─ Test 2: Login with invalid password → 401 Unauthorized
└─ Test 3: Extract token & use it for subsequent requests

GET /products/:id
├─ Test 1: Get product by ID → 200 + complete JSON
├─ Test 2: Get non-existent product → 404 Not Found
└─ Test 3: Validate JSON schema matches expected shape

POST /orders
├─ Test 1: Create order with valid cart → 201 Created + order_id
├─ Test 2: Create order without auth token → 401 Unauthorized
├─ Test 3: Create order with invalid items → 400 Bad Request
└─ Test 4: Extract order_id from response for follow-up calls

GET /orders/:id
├─ Test 1: Retrieve order details → 200 + full order object
└─ Test 2: Validate order totals match database values

POST /payments
├─ Test 1: Process valid card → 200 + transaction_id
└─ Test 2: Process expired card → 402 Payment Required
```

---

## ✅ Definition of Done

- [ ] Postman installed and set up
- [ ] 15+ API requests created in a collection
- [ ] Postman environment with variables created
- [ ] All requests include at least 1 assertion each
- [ ] Collection and environment exported as JSON
- [ ] All tests passing (green checkmarks)
- [ ] Screenshots captured showing results
- [ ] README documenting each API and its tests

---

## 📈 Why This Matters (For Recruiters)

When a hiring manager sees Week 4:
- ✅ You understand REST APIs (GET, POST, PUT, DELETE)
- ✅ You know HTTP status codes (200, 201, 400, 401, 402, 404, 500)
- ✅ You can validate JSON responses and schemas
- ✅ You can extract data from responses for chained requests
- ✅ You test APIs faster than UI testing (no page load waits)
- ✅ You can identify backend issues independent of the UI

---

## 🔗 Connections to Previous Work

- **NXS-102 (Payment Failure)** – You'll test via API: what does POST /payments return for expired card?
- **TC-001 (Login Issue)** – You'll test: does POST /auth/login sanitize email input?
- **Database Validation** – You'll verify: does GET /orders/:id return data matching the database?

---

## Prerequisites

- Postman (free) installed
- Basic REST/API knowledge (HTTP methods, JSON)
- Access to a mock API endpoint or Postman Mock Server

---

**Target Start Date:** March 13, 2025  
**Estimated Duration:** 6–8 hours  
**Status:** 🔄 PENDING – Starts after Week 3 completion

