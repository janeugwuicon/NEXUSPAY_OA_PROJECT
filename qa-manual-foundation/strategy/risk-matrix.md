# Risk-Based Testing (RBT) Strategy

## Why Risk-Based Testing?

I cannot test everything with equal depth. Attempting to test every UI element and edge case equally leads to:
*   Missed release deadlines.
*   Wasted automation effort.
*   Focus on low-impact problems.

I prioritize testing based on risk to ensure the most critical parts of the application are robust.

## The Risk Formula

**Risk = Impact x Likelihood**

*   **Impact:** How severe is the damage if this fails?
*   **Likelihood:** How often is this used or likely to break?

## 3x3 Risk Matrix

| Impact ↓ / Likelihood → | Low (Rare) | Medium (Possible) | High (Frequent) |
| :--- | :--- | :--- | :--- |
| **High (Catastrophic)** | Tier 2 (Medium) | Tier 1 (Critical) | Tier 1 (Critical) |
| **Medium (Significant)** | Tier 3 (Low) | Tier 2 (Medium) | Tier 1 (Critical) |
| **Low (Minor)** | Tier 3 (Low) | Tier 3 (Low) | Tier 2 (Medium) |

## Risk Tiers Explained

### Tier 1: Critical Risk
*   **Definition:** Direct money loss, legal issues, security breach, or major reputation damage.
*   **Strategy:** Full automation coverage, edge case testing, load/performance testing, and careful manual verification before release.

### Tier 2: Medium Risk
*   **Definition:** Causes user frustration or may affect trust, but does not directly lose money.
*   **Strategy:** Smoke automation tests, targeted manual testing, and periodic regression checks.

### Tier 3: Low Risk
*   **Definition:** Cosmetic issues or minor inconveniences with no financial impact.
*   **Strategy:** Quick manual check; no immediate automation.

## NexusPay Examples

### 1. "Send Money" Button Fails (Tier 1 - Critical)
*   **Impact:** High (Users lose money, trust destroyed, legal issues).
*   **Likelihood:** High (Most used feature).
*   **Strategy:** 100% manual verification, full API automation, negative testing, and stress testing.

### 2. "Change Theme" Fails (Tier 3 - Low)
*   **Impact:** Low (Annoying, but functionality works).
*   **Likelihood:** Low (Infrequent use).
*   **Strategy:** One manual check, no automation.

### 3. "Forgot Password" Email Delayed (Tier 2 - Medium)
*   **Impact:** Medium (User frustration).
*   **Likelihood:** Medium (Periodic occurrence).
*   **Strategy:** Automated smoke test, periodic manual verification, monitor response time.

## Quality Philosophy

In a fintech environment like NexusPay, I prioritize:
1.  Transactions
2.  Balances
3.  Authentication
4.  Security
5.  Data integrity

**Final Rule:** If a failure can lose money, leak data, or break trust, it is **Tier 1**. This is where automation and heavy testing focus belongs.