-- Solution for Lesson 3: AFTER DELETE Trigger on users table

-- Create the AFTER DELETE trigger
DELIMITER //

CREATE TRIGGER tr_users_ad
AFTER DELETE ON users
FOR EACH ROW
BEGIN
    INSERT INTO users_audit
    (
        audit_datetime,
        audit_user,
        audit_change
    )
    VALUES
    (
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

-- Test the trigger by deleting a user
-- First, let's check which users exist
SELECT id, name, username FROM users WHERE is_admin = false LIMIT 5;

-- Delete a non-admin user for testing (adjust the id as needed)
-- DELETE FROM users WHERE id = 1;

-- Verify the audit log was created
SELECT * FROM users_audit WHERE audit_change LIKE 'Deleted user%';

-- Expected output: One audit record showing the deleted user information
