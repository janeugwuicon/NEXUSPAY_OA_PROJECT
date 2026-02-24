# Test Design: Decision Table Testing

## 1. The Core Principle

Decision Tables are a systematic method for capturing system logic where the output depends on a combination of multiple inputs. They ensure that no logical combination is overlooked.

## 2. NexusPay Scenario: Instant Withdrawal

**Feature:** Instant Withdrawal Eligibility

**Business Rules:**
A user can only perform an "Instant Withdrawal" if **all** of the following conditions are met:
1.  **Location:** User is registered in the **UK**.
2.  **Status:** User account is **Verified** (KYC complete).
3.  **Balance:** Withdrawal amount is **> £50.00**.

If *any* condition is false, the request is rejected (Standard Withdrawal only).

## 3. The Decision Table (Truth Table)

| Rule ID | Condition 1: From UK? | Condition 2: Verified? | Condition 3: Balance > £50? | **Action: Allow Instant?** |
| :--- | :--- | :--- | :--- | :--- |
| **DT-01** | Yes | Yes | Yes | **YES** |
| **DT-02** | Yes | Yes | No | **NO** |
| **DT-03** | Yes | No | Yes | **NO** |
| **DT-04** | Yes | No | No | **NO** |
| **DT-05** | No | Yes | Yes | **NO** |
| **DT-06** | No | Yes | No | **NO** |
| **DT-07** | No | No | Yes | **NO** |
| **DT-08** | No | No | No | **NO** |

## 4. Strategic Analysis

*   **Rule DT-01** is the only "Happy Path" where the feature works.
*   **Rules DT-02 through DT-08** represent negative test scenarios.
*   Without a decision table, testers often test DT-01 (All Yes) and DT-08 (All No), but miss subtle edge cases like **DT-03** (UK user with money, but unverified).

## 5. Why This Matters in Fintech

Complex business logic drives financial compliance.
*   **Prevent Logic Gaps:** Ensures I don't accidentally allow a non-verified user to withdraw funds just because they are in the UK.
*   **Audit Trail:** Provides a clear map of logic for auditors.
*   **Reduce Production Incidents:** Catches conflicting requirements early in the design phase.

**Final Rule:** Whenever requirements contain words like "IF", "AND", "OR", or "UNLESS", a Decision Table is mandatory.