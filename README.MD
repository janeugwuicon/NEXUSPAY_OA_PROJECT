NexusPay – Fintech Quality Engineering Portfolio
Overview

NexusPay is a high-frequency global fintech wallet simulation I built to demonstrate end-to-end Quality Engineering across the full SDLC.

This repository reflects over four years of practical QA experience I applied to a transaction-heavy financial system. The focus is not simply feature testing, but risk prevention, transaction integrity, system reliability, and automation architecture.

In fintech systems, failure impacts real users and real money. This project demonstrates a prevention-first approach to quality, built around structured thinking, automation discipline, and business risk awareness.

This repository currently contains the Month 1 foundation (Manual & Risk Architecture). Additional automation, CI/CD, security, performance, and AI validation modules will be added progressively.

Engineering Objectives

Validate high-risk financial workflows

Prevent transaction integrity failures

Design structured risk-based test strategies

Establish strong traceability from requirements to coverage

Investigate frontend-to-backend data flow

Prepare foundation for scalable automation and CI/CD integration

Quality Domains Covered (Current Phase)
Quality Foundations

SDLC vs STLC documentation

System architecture overview (Frontend → API → Database)

Risk-based testing strategy

Impact vs Likelihood risk matrix

Test plan for first release

Definition of Ready and Definition of Done

Defect severity vs priority classification

Manual & Exploratory Testing

High-risk withdrawal scenarios

Boundary Value Analysis (BVA)

Equivalence Partitioning

Decision table validation

Transaction state validation

Negative and edge case testing

Structured bug reporting examples

Backend & Data Validation

PostgreSQL schema design for Users and Transactions

SQL joins and aggregate queries

Balance reconciliation checks

Orphaned transaction detection

Data integrity validation scripts

Browser Investigation

Network request inspection

Status code validation (200 vs 401 vs 500)

JSON payload analysis

JWT token structure inspection

LocalStorage and cookie behavior

Basic performance throttling analysis

Repository Structure (Phase 1 – Manual & Product Foundation)

qa-manual-foundation/

docs/
– sdlc-vs-stlc.md
– architecture-overview.md

strategy/
– quality-strategy.md
– risk-matrix.md
– test-plan-v1.md

process/
– working-agreements.md
– jira-workflow.png

artifacts/
– test-cases/
– bug-reports/
– traceability-matrix.md

db-validation/
– schema-setup.sql
– validation-queries.sql

investigation/
– browser-performance.md
– security-findings.md

This structure reflects real-world QA documentation I used in production environments.

Technology Stack (Current & Upcoming Phases)

Languages

Python

SQL

Automation (Upcoming Modules)

pytest

Playwright

DevOps

GitHub Actions

Docker

Security & Performance

OWASP ZAP

Locust

Methodologies

Agile / Scrum

Risk-Based Testing

Shift-Left QA

Continuous Testing

How to Run (For SQL Module)

Clone the repository:

git clone https://github.com/janeugwuicon/NEXUSPAY_OA_PROJECT.git

cd NEXUSPAY_OA_PROJECT

Set up PostgreSQL and execute:

schema-setup.sql
validation-queries.sql

Automation modules will include separate execution instructions as they are added.

Professional Context

This project represents structured quality engineering thinking I applied to a fintech-grade system.

It demonstrates:

Business risk awareness

Clear documentation standards

Structured test design

Backend validation capability

Cross-layer system understanding

Future phases will expand into:

API automation framework (Python + pytest)

UI automation framework (Playwright)

CI/CD pipeline integration

Security testing

Performance simulation

AI and LLM validation systems

About Me

QA Automation Engineer with four years of experience in manual testing, backend validation, automation frameworks, and AI system evaluation.

Specialized in building structured test strategies for transaction-heavy systems where reliability directly impacts financial trust.

GitHub: https://github.com/janeugwuicon

LinkedIn: https://www.linkedin.com/in/jane-ugwu-a007b2302/

##  Resume
[Download Resume](./Jane_Ugwu_QA_Automation_Engineer_Resume.pdf)

