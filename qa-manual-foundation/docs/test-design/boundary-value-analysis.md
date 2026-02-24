# Test Design: Boundary Value Analysis (BVA) & Equivalence Partitioning

## 1. The Core Principle

Experience shows that a disproportionate number of defects occur at the boundaries of input domains rather than in the center. Boundary Value Analysis (BVA) is a test design technique that focuses testing effort on these "edges."

Instead of testing a large number of random values, I strategically select test cases at and around the boundaries to maximize defect detection with minimal effort.

## 2. BVA in Practice: A NexusPay Example

**Scenario:** The "Send Money" feature has a transaction limit.
*   **Minimum Allowed:** $1.00
*   **Maximum Allowed:** $10,000.00

Using BVA, I derive the following critical test cases:

| Test Case ID | Description | Input Value | Expected Outcome |
| :--- | :--- | :--- | :--- |
| BVA-TC-01 | Test value just below the minimum boundary | $0.99 | **Rejected:** "Amount must be at least $1.00" |
| BVA-TC-02 | Test the exact minimum boundary | $1.00 | **Accepted** |
| BVA-TC-03 | Test value just above the minimum boundary | $1.01 | **Accepted** |
| BVA-TC-04 | Test a nominal value within the valid range | $5,000.00 | **Accepted** |
| BVA-TC-05 | Test value just below the maximum boundary | $9,999.99 | **Accepted** |
| BVA-TC-06 | Test the exact maximum boundary | $10,000.00 | **Accepted** |
| BVA-TC-07 | Test value just above the maximum boundary | $10,001.00 | **Rejected:** "Amount cannot exceed $10,000.00" |
| BVA-TC-08 | Test the zero value, a common edge case | $0.00 | **Rejected:** "Amount must be at least $1.00" |

## 3. Combining with Equivalence Partitioning (EP)

BVA is most powerful when combined with Equivalence Partitioning. EP divides input data into partitions where all values are expected to be processed the same way.

For my scenario, I have three partitions:
1.  **Invalid Partition (Too Low):** All values `< $1.00`
2.  **Valid Partition:** All values from `$1.00` to `$10,000.00`
3.  **Invalid Partition (Too High):** All values `> $10,000.00`

*   **BVA** tests the *edges* of these partitions (e.g., $1.00, $10,000.00).
*   **EP** tests any single value from the *middle* of each partition (e.g., $5,000.00 from the valid partition).

This combined approach is highly efficient because it assumes that if $5,000 works, then $5,001 and $4,999 are also likely to work. I focus my effort on the high-risk boundaries.

## 4. The Fintech Imperative: Why Boundaries Are Critical

In a fintech application like NexusPay, boundary-related defects are not minor inconveniences; they represent **Tier 1 (Critical) Risks**.

A failure to correctly validate boundaries can lead to:
*   **Direct Financial Loss:** Allowing a negative or zero-value transfer could drain funds or create accounting impossibilities.
*   **Compliance Violations:** Exceeding maximum transaction limits can violate anti-money laundering (AML) and other financial regulations, leading to severe penalties.
*   **Security Vulnerabilities:** Integer overflow bugs or other boundary exploits can be a gateway for financial fraud.
*   **Loss of User Trust:** If users see that the system cannot be trusted to handle their money within defined, predictable rules, confidence in the platform is destroyed.

**Final Rule:** All financial boundaries must be validated on the **backend API**. Client-side (UI) validation is for user convenience only and is not a security measure.