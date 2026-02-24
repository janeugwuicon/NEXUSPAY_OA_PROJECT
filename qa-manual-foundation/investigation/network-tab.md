# Day 15: Chrome DevTools - The Network Tab

## Overview
As a QA engineer, the UI (User Interface) can sometimes lie to you. A button might look like it worked, but the backend might have failed. The **Network Tab** in Chrome DevTools is the "source of truth." It shows you exactly what data is leaving the browser and what is coming back from the server.

## Key Concept: The Request/Response Cycle
Every time you click a link or submit a form, the browser sends a **Request** to the server. The server processes it and sends back a **Response**.

## Activity: Analyzing the Login Flow

### 1. Open DevTools
*   Right-click anywhere on the page and select **Inspect**.
*   Click on the **Network** tab.
*   Ensure the "Record" button (red circle) is active.

### 2. Perform the Action
*   Enter a valid username and password.
*   Click "Login."

### 3. Inspect the Traffic
Look for a request named `login` or `auth` in the list. Click on it to see details.

## Understanding HTTP Status Codes
The most important part of the response is the **Status Code**. It tells you the outcome immediately.

### ✅ 200 OK
*   **Meaning:** Success! The server accepted the request.
*   **Context:** If you login successfully, you should see a `200` status.

### ⛔ 401 Unauthorized
*   **Meaning:** "I don't know who you are" or "Wrong password."
*   **Context:** If you enter the wrong password, the server *must* return a 401.
*   **QA Note:** If the UI says "Wrong Password" but the Network tab shows `200 OK`, that is a bug! It means the server thinks the login worked, but the UI is confused.

### ⚠️ 500 Internal Server Error
*   **Meaning:** The server crashed.
*   **Context:** This is always a critical bug. The user might see a generic "Something went wrong" message.

## QA Checklist for Network Testing
- [ ] Did the request go to the correct URL?
- [ ] Did the server respond within a reasonable time (e.g., < 500ms)?
- [ ] Is the status code correct for the scenario (200 for success, 4xx for user errors)?

---
**Next Step:** Tomorrow, we will look inside these requests to understand the data being sent.