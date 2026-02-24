# Severity vs. Priority Strategy

## Why the Distinction Matters

Not all bugs are equal. Some bugs break the system technically, while others damage the business reputation. Understanding the difference between technical severity and business priority is crucial for effective defect management.

*   **Severity** is a technical assessment.
*   **Priority** is a business decision.

## Definitions

### Severity (Technical Impact)
**Definition:** How badly is the system broken?
*   Does the application crash?
*   Is data lost or corrupted?
*   Is security compromised?
*   Is a feature non-functional?

### Priority (Business Urgency)
**Definition:** How fast must this be fixed?
*   Is revenue blocked?
*   Is there a legal or compliance risk?
*   Will this affect investor confidence or brand reputation?
*   Is there a workaround available?

## NexusPay Bug Scenarios

| Scenario | Severity | Priority | Rationale |
| :--- | :--- | :--- | :--- |
| **1. App crashes when clicking "Send"** | Critical | High | Core money flow is broken. Revenue is blocked. Immediate fix required. |
| **2. Spelling mistake in CEO’s name** | Trivial | High | Code works, but brand reputation and investor trust are at risk. |
| **3. App crashes on iPhone 6 (Legacy)** | Critical | Low | Technically severe (crash), but affects <0.1% of users. Low business impact. |
| **4. User withdraws > balance** | Critical | High | Direct financial loss. Compliance and legal risk. Blocker. |
| **5. "Terms of Service" link is 404** | Major | High | High legal and compliance risk, especially for regulated markets. |
| **6. Profile picture blurry on 4K** | Minor | Low | Cosmetic issue. No financial or functional impact. |
| **7. History loads in 30s** | Major | Medium | Very poor UX, but data is correct. Fix soon, but not an emergency. |
| **8. Logout requires 2 clicks** | Minor | Medium | Usability annoyance. No security or financial impact. |
| **9. AI Bot speaks wrong language** | Major | Medium | Feature is broken for those users. Bad UX, but no direct money loss. |
| **10. Email uses wrong font** | Trivial | Low | Purely cosmetic. Lowest priority in backlog. |

## Key Principles

### 1. Critical Severity ≠ Always High Priority
A bug can be technically catastrophic (e.g., a crash) but have low priority if it affects a negligible number of users (e.g., legacy devices I no longer officially support).

### 2. Trivial Severity Can Be High Priority
A bug can have zero technical impact (e.g., a typo) but be High Priority if it damages the brand, violates compliance, or embarrasses the company before stakeholders.

### 3. The Fintech Rule
In the NexusPay environment, specific categories are automatically **High Priority**:
*   Transfers and Payments
*   Withdrawals
*   Balance Calculations
*   Authentication
*   Data Security

## Decision Framework

When evaluating a defect, I ask two distinct questions:

1.  **Technical:** "How broken is the code?" (Severity)
2.  **Business:** "What happens to revenue, trust, and compliance?" (Priority)

In fintech, trust is our currency. I prioritize defects that threaten that trust.