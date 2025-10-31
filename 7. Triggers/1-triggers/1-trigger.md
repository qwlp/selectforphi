### Lesson 1: What is a Trigger?

A trigger is a small, automatic program that the database runs for you when something happens to a table. Think of it as “if this happens, do that.”

At TheSeanApp, triggers help us:
- Keep a history of important changes (auditing)
- Enforce rules so our data stays clean and safe (data quality and protection)

What “something happens” means:
- INSERT: a new row is added
- UPDATE: a row is changed
- DELETE: a row is removed

When triggers run:
- BEFORE triggers run just before the change is saved
  - Great for checking or fixing the incoming data (you can modify NEW values)
- AFTER triggers run right after the change is saved
  - Great for logging what happened (you cannot modify data here)

What a trigger can “see”:
- INSERT: NEW values (what’s being added)
- UPDATE: OLD values (before) and NEW values (after)
- DELETE: OLD values (what’s being removed)

How we’ll use triggers in TheSeanApp:
- Auditing examples
  - Log new users or changes to users in the `users_audit` table
  - Log transaction changes in the `transaction_audit` table
- Data quality/protection examples
  - Make sure new users have a reasonable `age` before saving
  - Prevent deleting important records (like certain transactions or admin users)

Mental model:
- BEFORE = “check and fix” (change NEW data if needed)
- AFTER = “write it down” (record what happened for the audit trail)

Good things to remember:
- Keep trigger logic simple and fast
- Use clear, helpful messages in audit logs
- Prefer consistent names like `tr_users_ai` (“trigger, users, after insert”)

Example audit messages you might see:
- “New user registered with id 42. Name: Sam, Username: sam_w”
- “Updated transaction 18. Amount changed from 10.50 to 12.00”

Assignment
- In your own words, what’s the difference between a trigger used for auditing and a trigger used for data quality?
- Which kind of trigger (BEFORE or AFTER) would you use to:
  1) Fix an invalid `age` before saving a user?
  2) Record a note that a transaction was deleted?