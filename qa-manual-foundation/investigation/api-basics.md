# Day 16: API Basics & JSON Payloads

## Overview
Yesterday we looked at *status codes*. Today, we look at the *data* itself. Modern web applications talk to servers using **APIs** (Application Programming Interfaces). The language they use to speak is usually **JSON** (JavaScript Object Notation).

## What is a Payload?
The **Payload** (or Request Body) is the actual information you are sending to the server. Think of the Request as the envelope, and the Payload as the letter inside.

## Understanding JSON
JSON is a simple format for storing data. It looks like a list of `Key: Value` pairs.

### Example: Login Payload
When you click "Login", your browser sends this JSON to the server:

```json
{
  "username": "qa_user@nexuspay.com",
  "password": "securePassword123",
  "device_id": "windows_chrome_v121"
}
```

### Example: Server Response
If the login is successful, the server replies with JSON:

```json
{
  "success": true,
  "user_id": 1054,
  "account_type": "verified",
  "token": "abc-123-xyz-secure-token"
}
```

## Activity: Inspecting Payloads

1.  Open **DevTools > Network**.
2.  Perform an action (e.g., "Send Money").
3.  Click the request in the list.
4.  Click the **Payload** tab (sometimes called "Request" or "Body").

## QA Scenarios to Watch For

### 1. Data Mismatch
*   **Scenario:** You typed `$50.00` in the UI.
*   **Check:** Does the payload say `"amount": 50.00`? If it says `5000` or `5.0`, that’s a bug.

### 2. Sensitive Data Exposure
*   **Scenario:** You are updating your profile.
*   **Check:** Is the password sent as plain text in a standard request? (It should be encrypted or handled securely).

### 3. Unnecessary Data
*   **Scenario:** Loading the dashboard.
*   **Check:** Is the server sending back huge amounts of data you don't need? (e.g., a list of *every* transaction from 10 years ago). This slows down the app.

---
**Next Step:** Where does the browser store this data? We'll find out tomorrow.