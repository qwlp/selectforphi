# What is a Trigger?

A **trigger** is code that runs automatically when something happens to a table.

## When Do Triggers Run?

Triggers fire on these events:
- **INSERT** - when a new row is added
- **UPDATE** - when a row is changed
- **DELETE** - when a row is removed

## Timing: BEFORE vs AFTER

**BEFORE triggers** run before the change is saved
- Can modify incoming data
- Good for validation and fixing values

**AFTER triggers** run after the change is saved
- Cannot modify data
- Good for logging and auditing

## What Can Triggers See?

| Event  | OLD (before) | NEW (after) |
|--------|--------------|-------------|
| INSERT | ❌           | ✅          |
| UPDATE | ✅           | ✅          |
| DELETE | ✅           | ❌          |

## How We Use Triggers at TheSeanApp

**Auditing** - Track changes
- Log new users in `users_audit`
- Log transaction changes in `transaction_audit`

**Data Quality** - Enforce rules
- Keep ages between 13-120
- Keep transaction amounts between $0.01-$10,000
- Prevent deleting admin users or important transactions

## Mental Model

Think of triggers as automatic "if-then" rules:
- **BEFORE** = "check and fix" (modify NEW values)
- **AFTER** = "write it down" (record to audit log)

## Naming Convention

Use this pattern: `tr_<table>_<timing><action>`

Examples:
- `tr_users_ai` = trigger on users, after insert
- `tr_transactions_bu` = trigger on transactions, before update
- `tr_users_bd` = trigger on users, before delete

## Assignment

1. In your own words, what's the difference between a BEFORE trigger and an AFTER trigger?

2. Which trigger type would you use for:
   - Fixing an invalid age before saving? ___________
   - Recording that a transaction was deleted? ___________

3. If you want to see both the old and new values in a trigger, which event must you use?
   - ☐ INSERT
   - ☐ UPDATE
   - ☐ DELETE