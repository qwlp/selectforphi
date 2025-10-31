### Lesson 3: AFTER DELETE — Log what was removed

What it does
- An AFTER DELETE trigger runs automatically after a row is deleted.
- It’s perfect for keeping an audit trail of what was removed, by whom, and when.
- In an AFTER DELETE trigger, you can read the deleted row’s values with OLD, but you cannot change anything.

What you can access in this trigger
- DELETE: OLD.column (the values that were just removed)

When to use it at TheSeanApp
- Record “Deleted user” entries in a users audit table
- Record “Deleted transaction” entries in a transaction audit table

Quick pattern
1) Make sure you have an audit table (timestamp, user, message)
2) Create the AFTER DELETE trigger on the source table
3) Inside the trigger, INSERT one row into the audit table using OLD values

Example: Audit deleted users
- Tables involved: users (source), users_audit (audit log)
- Goal: Every time a user is deleted, log a clear message



```sql

-- 1) Create the audit table (run once)

CREATE TABLE IF NOT EXISTS users_audit (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    audit_datetime DATETIME NOT NULL,
    audit_user VARCHAR(100) NOT NULL,
    audit_change VARCHAR(500) NOT NULL
);


DELIMITER //
DROP TRIGGER IF EXISTS tr_users_ad//
CREATE TRIGGER tr_users_ad
AFTER DELETE ON users

FOR EACH ROW
BEGIN
    INSERT INTO users_audit (
        audit_datetime,
        audit_user,
        audit_change
    )
    VALUES (
        NOW(),
        USER(),
        CONCAT(
            'Deleted user with id ', OLD.id,
            '. Name: ', OLD.name,
            '. Username: ', OLD.username
        )
    );
END//
DELIMITER ;
```

(Optional) Quick test flow
- Pick a non-admin user to delete
- Delete the user
- Verify the audit message



```sql

-- See a few users (choose a non-admin to test with)

SELECT id, name, username, is_admin
FROM users
ORDER BY id
LIMIT 5;

-- Delete one non-admin user (adjust the id as needed)
-- DELETE FROM users WHERE id = 1;

-- Verify the audit entry was written
SELECT *
FROM users_audit
WHERE audit_change LIKE 'Deleted user%'
ORDER BY audit_id DESC
LIMIT 3;
```

Why this is useful
- AFTER DELETE triggers give you a reliable history of what was removed, which helps with audits, compliance, and debugging.
- They’re simple and fast—just write a log entry.

Common gotchas
- AFTER triggers can’t stop the deletion (use a BEFORE DELETE trigger with SIGNAL to prevent deletes).
- Be careful with NULLs in messages (use IFNULL/COALESCE if needed).
- Keep messages short but clear (include the id and a couple key fields).

Assignment
- Using the TheSeanApp database:
  - Ensure a users_audit table exists with columns:
    - audit_datetime (DATETIME)
    - audit_user (VARCHAR(100))
    - audit_change (VARCHAR(500))
  - Write an AFTER DELETE trigger named tr_users_ad that logs:
    - “Deleted user” plus the user’s id, name, and username

Stretch goal
- Do the same for transactions:
  - Create tr_transactions_ad that logs the deleted transaction’s id, user_id, and amount into a transaction_audit table.