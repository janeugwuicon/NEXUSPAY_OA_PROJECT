# NexusStream Bug Triage Process

## Purpose

Provide a fast, repeatable process for validating, prioritizing, and tracking defects so the team can deliver a stable product with clear accountability.

---

## Roles

- **QA Reporter** — Files the bug with steps, environment, and evidence.
- **QA Lead** — Validates the report and recommends severity/priority.
- **Developer** — Investigates and implements fixes.
- **Product Owner** — Confirms business impact and approves priority.

---

## Workflow

### 1. Bug Identification
QA Reporter creates a ticket with:
- **Title**: Clear, concise description of the issue
- **Environment**: Browser, OS, build version
- **Steps to Reproduce**: Numbered, minimal steps
- **Expected vs Actual**: What should happen vs what does happen
- **Screenshots/Logs**: Visual evidence and system logs
- **Test Case Reference**: Link to the test case that found the bug

### 2. Triage and Validation
QA Lead and Developer validate:
- Can we reproduce the issue?
- Is the report complete (all required fields filled)?
- Is there a workaround for users?
- When was this first observed?

### 3. Severity & Priority Assignment

Use the following guidance:

| Severity | Criteria | Example |
|----------|----------|---------|
| **CRITICAL** | Blocks production or core workflows; immediate attention required | Payment fails but order shows completed |
| **HIGH** | Major functionality broken with significant user impact | User can bypass login validation |
| **MEDIUM** | Partial loss of functionality or frequent edge cases | Search results show duplicates; UX confusion |
| **LOW** | Cosmetic or minor issues with no immediate user impact | Button text typo; color mismatch |

### 4. Triage Meeting Cadence
- **Weekly scheduled triage** (or ad-hoc for Critical defects)
- **Attendees**: QA Lead, Dev Lead, Product Owner
- **Agenda**: Validate tickets, agree on priority, assign ownership, set ETA

### 5. Fix, Verify, and Close
- Developer fixes the issue and adds unit/regression tests
- QA verifies the fix in staging environment
- QA updates the ticket with test evidence
- Product Owner approves closure

---

## SLAs and Communication

| Item | SLA |
|------|-----|
| **Validation on new ticket** | 24 business hours |
| **Critical bug response** | Immediate acknowledgment; target fix within same sprint or hotfix window |
| **High bug assignment** | 48 business hours |
| **Medium/Low assignment** | Next business day |

**Communication Channels:**
- Use `#qa-triage` Slack channel for notifications
- Use ticketing system (Jira) for formal tracking and audit trail

---

## Best Practices

1. **Minimal reproducible steps** — Don't include unnecessary details; be concise
2. **Attach evidence** — Screenshots, logs, network traces, database queries
3. **Link related items** — Connect to test cases, requirements, and related bugs
4. **Avoid bundling** — One ticket = one issue; don't mix unrelated bugs
5. **Environment clarity** — Always specify browser, OS, and app version
6. **Tone** — Be professional; focus on facts, not blame

---

## Example: Well-Written Bug Report

**Title:** Login page crashes when email field contains special characters

**Environment:** Chrome 120, Staging, Build v2.1.0

**Steps to Reproduce:**
1. Navigate to login page
2. Enter email: `user+test@example.com`
3. Click submit
4. Observe browser console

**Expected:** Login validation message or successful authentication

**Actual:** Page throws JavaScript exception; console shows `TypeError: Cannot read property 'split' of undefined`

**Severity:** HIGH (impairs user authentication)

**Attachments:** 
- Browser console screenshot
- Network log (POST request to /api/login)

**Linked Test Case:** TC-002 (Login with various email formats)

---

This process ensures quality feedback reaches the dev team quickly and clearly, reducing back-and-forth and speeding up resolution.
