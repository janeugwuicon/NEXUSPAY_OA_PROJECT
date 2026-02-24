# Day 19: Console Logs - The Browser's Diary

## Overview
The **Console** tab is where the browser and the website code talk to you. It logs information, warnings, and most importantly, **JavaScript Errors**.

A webpage might *look* fine to the user, but the Console might be screaming red errors in the background. As a QA, checking the console is your "X-Ray vision."

## Types of Logs

### ⚪ Info / Log
*   **Color:** White or Black text.
*   **Meaning:** General information. "Page loaded," "User clicked button."
*   **Action:** Usually ignore, unless debugging specific flow.

### 🟡 Warning
*   **Color:** Yellow background.
*   **Meaning:** Something is not ideal, but it didn't break the app. Deprecated code or minor network issues.
*   **Action:** Note it, but usually low priority.

### 🔴 Error
*   **Color:** Red text/background.
*   **Meaning:** Something broke. A script failed to run, or a resource failed to load.
*   **Action:** **Investigate immediately.**

## Activity: Spotting the Error

1.  Open **DevTools > Console**.
2.  Navigate through the application.
3.  Keep an eye on the "Red" count in the top right corner of DevTools.

### Common Errors to Report

#### 1. `404 Not Found`
*   **Meaning:** The code tried to load an image or script that doesn't exist.
*   **Impact:** Missing icons, broken functionality.

#### 2. `Uncaught TypeError: Cannot read property of undefined`
*   **Meaning:** The code tried to access data that wasn't there (e.g., trying to read `user.name` when `user` is empty).
*   **Impact:** Usually causes a feature to stop working entirely.

#### 3. `CORS Policy Blocked`
*   **Meaning:** Security restriction. The browser blocked a request to a different server.
*   **Impact:** API calls fail.

---
**Next Step:** We've seen errors. Now let's look at how the app secures your identity.