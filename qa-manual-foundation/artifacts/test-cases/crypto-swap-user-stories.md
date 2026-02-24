# Crypto-Swap Feature – Bug User Stories

## Overview

The Crypto-Swap feature allows users to exchange cryptocurrencies within their wallet (e.g., BTC → USDT). Because this feature directly handles user funds, it is classified as **High-Risk (Tier 1)**.

The following bug user stories describe critical failure scenarios. Framing defects as user stories helps prioritize fixes based on user impact and business risk.

---

## Bug User Stories

### 1. Swap Fails with Sufficient Funds
*   **As a** user with a valid balance,
*   **I want** my swap to execute successfully without random errors,
*   **so that** I can trust the platform with my trades.
*   **Acceptance Criteria (for fix):**
    *   When a user has sufficient funds and the system is online, a swap completes successfully.
    *   The correct amounts are debited and credited.
    *   No generic "Swap Failed" error is shown on a valid transaction.

### 2. Negative Balance After Swap
*   **As a** system,
*   **I want to** strictly prevent any swap that would result in a negative balance,
*   **so that** user accounts remain solvent and the platform avoids financial loss.
*   **Acceptance Criteria (for fix):**
    *   If `swap_amount > available_balance`, the "Confirm Swap" button must be disabled.
    *   An API call with an insufficient balance must return a clear error code (e.g., `INSUFFICIENT_FUNDS`).
    *   No user balance should ever be negative after a failed or completed swap.

### 3. Stale Exchange Rate Causes Losses
*   **As a** user,
*   **I want** the exchange rate to be locked or re-verified upon confirmation,
*   **so that** I don't lose money due to a stale rate displayed on the UI.
*   **Acceptance Criteria (for fix):**
    *   The exchange rate on the confirmation screen must refresh if it is older than 15 seconds.
    *   If the rate changes significantly (e.g., >0.5%) before confirmation, the user must be prompted to accept the new rate.
    *   The final executed rate must match the rate the user agreed to.

### 4. Confirmation Screen Shows Misleading Data
*   **As a** user,
*   **I want** the confirmation screen to be 100% accurate,
*   **so that** I can confidently approve the transaction.
*   **Acceptance Criteria (for fix):**
    *   The "From Amount," "To Amount," "Exchange Rate," and "Fee" on the confirmation screen must exactly match the values used in the backend transaction.
    *   Data for this screen must be fetched directly from the server, not passed from a previous client-side state.

### 5. Completed Swap Missing from History
*   **As a** user,
*   **I want** every completed swap to be immediately visible in my transaction history,
*   **so that** I have a reliable record of my financial activity.
*   **Acceptance Criteria (for fix):**
    *   A successful swap transaction must be written to the `transactions` table atomically with the balance update.
    *   The transaction history API must reflect the completed swap within seconds of completion.
    *   The record must include status, amounts, rate, fee, and timestamp.

### 6. Hidden Fees Cause Incorrect Received Amount
*   **As a** user,
*   **I want** the final received amount to exactly match the estimate on the confirmation screen,
*   **so that** I am not charged unexpected fees.
*   **Acceptance Criteria (for fix):**
    *   The confirmation screen must display a "You will receive" amount that is net of all fees.
    *   The final credited balance must equal `(from_amount * rate) - total_fees`.
    *   No hidden or variable fees may be applied after the user confirms the transaction.

### 7. Vague Error Message on API Failure
*   **As a** user,
*   **I want** to see a clear, actionable error message if a swap fails,
*   **so that** I know whether to retry or contact support.
*   **Acceptance Criteria (for fix):**
    *   If a payment gateway times out, show: "Swap failed due to a network issue. Please try again. Your funds have not been charged."
    *   Balances must be rolled back, and no funds should be left in a pending state after a failure.

### 8. UI Freezes During Swap Processing
*   **As a** user,
*   **I want** the app to remain responsive while a swap is processing,
*   **so that** I don't think the app has crashed and try to restart it.
*   **Acceptance Criteria (for fix):**
    *   Upon confirming a swap, a non-blocking loading indicator is displayed.
    *   The "Confirm" button is disabled to prevent duplicate submissions.
    *   The user can navigate away while the swap processes in the background.

### 9. Swap Limits Can Be Bypassed
*   **As a** compliance officer,
*   **I want** the system to strictly enforce all swap limits on the backend,
*   **so that** the platform remains compliant with regulatory requirements.
*   **Acceptance Criteria (for fix):**
    *   Backend validation must reject any swap below the minimum amount or above the maximum daily limit.
    *   These checks must occur at the API level, not just on the client.

### 10. Incomplete Audit Trail for Swaps
*   **As an** auditor,
*   **I want** a complete, immutable audit log for every swap attempt,
*   **so that** I can reconstruct any event for financial investigation or dispute resolution.
*   **Acceptance Criteria (for fix):**
    *   The `swap_audit_log` must record user ID, IP address, device ID, all transaction details, and a unique transaction ID.
    *   Both successful and failed swap attempts must be logged.
    *   Logs must be write-only for the application service account to prevent tampering.

---

## Quality Assurance Strategy

Given the Tier 1 risk profile of the Crypto-Swap feature, it must be subjected to rigorous testing before every release.

*   **Automation:** Full API automation coverage for all scenarios, including boundary, negative, and concurrency testing.
*   **Data Integrity:** Backend database validation to confirm the atomicity of balance updates and transaction logging.
*   **Security:** Penetration testing to ensure API endpoints cannot be manipulated to bypass limits or create invalid states.
*   **Manual Verification:** Rigorous manual regression testing on a staging environment before each release.