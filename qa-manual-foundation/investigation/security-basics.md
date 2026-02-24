# Day 20: Security Basics - Auth & JWT

## Overview
The web is "stateless." This means the server forgets who you are immediately after sending you a page. To stay logged in, your browser must show a digital ID card with *every single request*.

This ID card is usually a **JWT (JSON Web Token)** sent in the **Authorization Header**.

## The Authorization Header
1.  Open **DevTools > Network**.
2.  Click on a request that requires login (e.g., `get_balance`).
3.  Look at the **Headers** tab (next to Payload).
4.  Scroll down to **Request Headers**.

You should see something like:
`Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...`

*   **Bearer:** Means "Give access to the bearer (holder) of this token."
*   **The String:** This is the JWT. It contains your user ID and permissions.

## What is a JWT?
A JWT is a secure string that contains data. You can actually read it!

### Activity: Decode a Token
*(Note: Never paste real production tokens into public websites. This is for educational understanding.)*

A JWT has three parts, separated by dots (`.`):
1.  **Header:** The algorithm used.
2.  **Payload:** The data (User ID, Expiry Date).
3.  **Signature:** The security seal (verifies the token hasn't been tampered with).

## QA Security Checks

### 1. Token Expiry
*   Wait for the session to expire (or manually modify the token if you can).
*   Does the app handle it gracefully (redirect to login)?
*   Or does it crash/show raw error messages?

### 2. No Tokens in URL
*   **Bad:** `https://nexuspay.com/dashboard?token=xyz123`
*   **Why:** URLs are saved in history and server logs. Tokens should NEVER be in the URL. They must be in the Header.

### 3. Secure Flags
*   Go to **Application > Cookies**.
*   Check the `Secure` and `HttpOnly` columns for the auth cookie.
*   **Secure:** Cookie only sent over HTTPS.
*   **HttpOnly:** JavaScript cannot read the cookie (prevents XSS attacks). Both should be checked.

---
**Next Step:** Tomorrow, we put it all together into a professional report.