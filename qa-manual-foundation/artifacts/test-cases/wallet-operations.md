# Test Cases: Wallet Operations

## Overview
**Feature:** Wallet Management (Balance, Send, Deposit, Withdraw)
**Priority:** Critical (Tier 1)
**Preconditions:**
*   User is logged in.
*   User has a verified account.
*   Test data (bank/card details) is available.

## Test Case List

| ID | Test Scenario | Steps | Expected Result |
| :--- | :--- | :--- | :--- |
| **TC-WALLET-01** | **View Balance** | 1. Open Dashboard.<br>2. Check balance widget. | Balance is displayed correctly with currency symbol. |
| **TC-WALLET-02** | **Hide/Show Balance** | 1. Click "Eye" icon next to balance. | Balance is masked (`****`) or revealed. |
| **TC-WALLET-03** | **Deposit Funds (Success)** | 1. Click Deposit.<br>2. Enter valid amount & card.<br>3. Confirm. | Balance increases by deposit amount immediately. |
| **TC-WALLET-04** | **Deposit - Invalid Card** | 1. Enter invalid card number.<br>2. Click Deposit. | Error: "Invalid card details." No balance change. |
| **TC-WALLET-05** | **Deposit - Below Minimum** | 1. Enter amount < $10.<br>2. Click Deposit. | Error: "Minimum deposit is $10." |
| **TC-WALLET-06** | **Deposit - Above Maximum** | 1. Enter amount > $10,000.<br>2. Click Deposit. | Error: "Maximum daily deposit is $10,000." |
| **TC-WALLET-07** | **Send Money (Success)** | 1. Click Send.<br>2. Enter valid user & amount.<br>3. Confirm. | Sender balance decreases. Recipient receives funds. |
| **TC-WALLET-08** | **Send Money - Insufficient Funds** | 1. Enter amount > balance.<br>2. Click Send. | Error: "Insufficient funds." Button disabled. |
| **TC-WALLET-09** | **Send Money - User Not Found** | 1. Enter non-existent username.<br>2. Click Send. | Error: "User not found." |
| **TC-WALLET-10** | **Send Money - Self Transfer** | 1. Enter own username as recipient.<br>2. Click Send. | Error: "Cannot send money to yourself." |
| **TC-WALLET-11** | **Send Money - Zero Amount** | 1. Enter 0.00 as amount.<br>2. Click Send. | Error: "Amount must be greater than 0." |
| **TC-WALLET-12** | **Send Money - Negative Amount** | 1. Enter -50.00 as amount.<br>2. Click Send. | Error: "Invalid amount." |
| **TC-WALLET-13** | **Withdraw Funds (Success)** | 1. Click Withdraw.<br>2. Enter valid IBAN & amount.<br>3. Confirm. | Balance decreases. Transaction status: "Pending". |
| **TC-WALLET-14** | **Withdraw - Exceeds Balance** | 1. Enter amount > balance.<br>2. Click Withdraw. | Error: "Insufficient funds." |
| **TC-WALLET-15** | **Withdraw - Invalid IBAN** | 1. Enter short/invalid IBAN.<br>2. Click Withdraw. | Error: "Invalid bank account format." |
| **TC-WALLET-16** | **Transaction History - Load** | 1. Click "Transactions" tab. | List of recent transactions loads successfully. |
| **TC-WALLET-17** | **Transaction Details** | 1. Click on a specific transaction. | Details (ID, Date, Amount, Fee) are displayed. |
| **TC-WALLET-18** | **Filter Transactions** | 1. Filter by "Deposits". | Only deposit transactions are shown. |
| **TC-WALLET-19** | **Download Statement** | 1. Click "Download PDF". | PDF statement is downloaded successfully. |
| **TC-WALLET-20** | **Session Timeout During Action** | 1. Idle for 15 mins on Send screen.<br>2. Click Confirm. | Redirect to Login. Transaction NOT executed. |
