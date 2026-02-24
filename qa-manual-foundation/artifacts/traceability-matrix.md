# Requirement Traceability Matrix (RTM)

## Project: NexusPay
**Version:** 1.2
**Date:** 2023-10-27

## 1. Authentication & Security
| Req ID | Requirement Description | Test Case ID | Status |
| :--- | :--- | :--- | :--- |
| **REQ-AUTH-01** | User can log in with valid credentials. | TC-LOGIN-01 | ✅ Passed |
| **REQ-AUTH-02** | System rejects invalid passwords. | TC-LOGIN-02 | ✅ Passed |
| **REQ-AUTH-03** | Account locks after 5 failed attempts. | TC-LOGIN-07 | ⚠️ Pending |
| **REQ-AUTH-04** | Prevent SQL Injection attacks. | TC-LOGIN-11 | ✅ Passed |
| **REQ-AUTH-05** | Prevent XSS Script Injection. | TC-LOGIN-12 | ✅ Passed |
| **REQ-AUTH-06** | Session timeout after inactivity. | TC-LOGIN-20 | ✅ Passed |

## 2. Wallet Operations
| Req ID | Requirement Description | Test Case ID | Status |
| :--- | :--- | :--- | :--- |
| **REQ-WALL-01** | User can view current balance. | TC-WALLET-01 | ✅ Passed |
| **REQ-WALL-02** | User can deposit funds successfully. | TC-WALLET-03 | ✅ Passed |
| **REQ-WALL-03** | Prevent deposits above daily limit ($10k). | TC-WALLET-06 | ✅ Passed |
| **REQ-WALL-04** | User can send money to another user. | TC-WALLET-07 | ✅ Passed |
| **REQ-WALL-05** | Prevent sending more than available balance. | TC-WALLET-08 | ✅ Passed |
| **REQ-WALL-06** | User can withdraw funds to bank. | TC-WALLET-13 | ❌ Failed (See BUG-001) |
| **REQ-WALL-07** | Transaction history loads correctly. | TC-WALLET-16 | ✅ Passed |

## 3. Crypto-Swap Feature (Tier 1 Risk)
*Mapped to Bug User Stories*

| Req ID | Requirement Description | Test Case ID | Status |
| :--- | :--- | :--- | :--- |
| **REQ-CRYP-01** | Swap executes successfully with valid funds. | BUG-STORY-01 | ⚠️ In Progress |
| **REQ-CRYP-02** | Prevent negative balance after swap. | BUG-STORY-02 | ✅ Passed |
| **REQ-CRYP-03** | Exchange rate refreshes every 15s. | BUG-STORY-03 | ⚠️ Pending |
| **REQ-CRYP-04** | Confirmation screen matches backend values. | BUG-STORY-04 | ✅ Passed |
| **REQ-CRYP-05** | Swap recorded in transaction history. | BUG-STORY-05 | ✅ Passed |
| **REQ-CRYP-06** | Backend enforces swap limits (API level). | BUG-STORY-09 | ✅ Passed |

## 4. Compliance & Logic Rules
| Req ID | Requirement Description | Test Case ID | Status |
| :--- | :--- | :--- | :--- |
| **REQ-COMP-01** | Instant Withdrawal Eligibility Logic. | DT-01 to DT-08 | ✅ Passed |
| **REQ-COMP-02** | Transaction Limit Boundaries ($1 - $10k). | BVA-TC-01 to BVA-TC-08 | ✅ Passed |

## Defect Linkage
| Bug ID | Description | Related Requirement | Priority |
| :--- | :--- | :--- | :--- |
| **BUG-001** | Crash on max withdrawal ($10,000). | REQ-WALL-06 | High |

---

## Why RTM Matters
1.  **Ensures Full Coverage:** I know exactly which test case covers which requirement.
2.  **Prevents Missing Requirements:** If a requirement has no test case, it is a gap.
3.  **Audit Readiness:** Essential for fintech compliance (KYC/AML audits).