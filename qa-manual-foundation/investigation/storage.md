# Day 17: Browser Storage - Cookies, Local, & Session

## Overview
Websites need to remember things. If they didn't, you would have to log in again every time you refreshed the page. Browsers have three main places to store data: **Cookies**, **LocalStorage**, and **SessionStorage**.

You can view these in DevTools under the **Application** tab.

## The Three Storage Types

| Type | Lifespan | Capacity | Typical Use |
| :--- | :--- | :--- | :--- |
| **Cookies** | Set by server (expires when server says). | Small (4KB) | Authentication tokens, tracking IDs. |
| **LocalStorage** | **Forever** (until user deletes it). | Large (5MB+) | User preferences (Dark Mode), draft data. |
| **SessionStorage** | **Temporary** (dies when tab closes). | Large (5MB+) | Form data, shopping cart (sometimes). |

## Activity: The "Delete Cookie" Test
This is a classic QA test to verify security and session management.

### Steps:
1.  Log in to the application.
2.  Open **DevTools > Application**.
3.  Expand **Cookies** in the left sidebar and click your site URL.
4.  Look for a cookie named `session_id`, `token`, or `auth`.
5.  **Right-click > Delete**.
6.  Refresh the page.

### Expected Result:
*   You should be immediately logged out.
*   The application should redirect you to the Login screen.

### Why this matters:
If you delete the auth cookie and *stay* logged in, it means the frontend is not checking for the cookie correctly, or the session is being cached insecurely.

## Testing LocalStorage
1.  Change a setting (e.g., switch to "Dark Mode").
2.  Go to **Application > LocalStorage**.
3.  Find the key (e.g., `theme: "dark"`).
4.  Manually change the value to `"light"` in DevTools.
5.  Refresh the page.

**Result:** The site should now load in Light Mode. This confirms the site reads from LocalStorage on load.

## QA Checklist
- [ ] Does sensitive data (passwords, credit card numbers) appear in LocalStorage? **(It NEVER should).**
- [ ] Does clearing SessionStorage reset the current workflow?
- [ ] Does the site function if Cookies are disabled?

---
**Next Step:** Now that we know how data is stored, let's see what happens when the internet gets slow.