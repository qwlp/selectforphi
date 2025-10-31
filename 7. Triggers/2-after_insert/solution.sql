-- Solution for Lesson 2: AFTER INSERT Trigger on users table

-- First, create the audit table if it doesn't exist
CREATE TABLE IF NOT EXISTS users_audit (
    audit_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    audit_datetime DATETIME NOT NULL,
    audit_user VARCHAR(100) NOT NULL,
    audit_change VARCHAR(500) NOT NULL
);

-- Create the AFTER INSERT trigger
DELIMITER //

CREATE TRIGGER tr_users_ai
AFTER INSERT ON users
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
            'New user registered with id ', NEW.id,
            '. Name: ', NEW.name,
            '. Username: ', NEW.username
        )
    );
END//

DELIMITER ;

-- Test the trigger by inserting a new user
INSERT INTO users(name, age, country_code, username, password, is_admin)
VALUES ('Sean', 25, 'US', 'SeanTheMan', 'myawesomeapp', false);

-- Verify the audit log was created
SELECT * FROM users_audit;

-- Expected output: One audit record showing the new user registration
