# Day 18: Performance & Throttling

## Overview
As developers and testers, we often work on high-speed Wi-Fi and powerful computers. Our users don't. They might be on a train, in a basement, or using an old phone with a spotty 3G connection.

**Network Throttling** allows you to simulate these poor conditions directly in Chrome.

## Why Test Performance?
*   **UX (User Experience):** Does the user know something is happening, or does the screen just freeze?
*   **Race Conditions:** Slow networks can reveal bugs where data arrives in the wrong order.
*   **Timeouts:** Does the app handle it gracefully if a request takes 30 seconds?

## Activity: Simulating "Slow 3G"

### Steps:
1.  Open **DevTools > Network**.
2.  Look for the dropdown that says **"No throttling"** (usually near the top right of the DevTools pane).
3.  Select **"Slow 3G"**.
4.  Reload the page or perform a transaction.

### What to Observe:

#### 1. Loading States
*   **Good:** A spinner or skeleton loader appears immediately. The buttons are disabled so you can't click twice.
*   **Bad:** The screen looks frozen. The user might click "Pay" five times because they think nothing is happening.

#### 2. Timeout Handling
*   If the request takes too long, does the app show a friendly error? ("Connection timed out, please try again").
*   Or does it crash/hang indefinitely?

#### 3. Image Loading
*   Do images load progressively, or does the layout jump around (Layout Shift) as images pop in?

## Documenting the Lag
When reporting performance bugs, be specific:

> **Bug Title:** Payment button remains active during slow network processing.
> **Environment:** Network Throttling: Slow 3G.
> **Observation:** User clicked "Pay". Request took 5 seconds. During this time, the "Pay" button remained clickable.
> **Impact:** User clicked 3 times, resulting in 3 separate charges.

---
**Next Step:** We've looked at the network. Now let's look at the browser's internal error log.