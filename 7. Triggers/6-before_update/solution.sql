-- Solution for Lesson 6: BEFORE UPDATE Trigger on users table

-- Create the BEFORE UPDATE trigger
DELIMITER //

CREATE TRIGGER tr_users_bu
BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
    -- Ensure minimum age is 13 (COPPA compliance)
    IF (NEW.age < 13) THEN
        SET NEW.age = 13;
    END IF;

    -- Ensure maximum age is 120 (data quality)
    IF (NEW.age > 120) THEN
        SET NEW.age = 120;
    END IF;
END//

DELIMITER ;

-- Test the trigger with various scenarios

-- Test 1: Update a user's age to below 13 (should be corrected to 13)
UPDATE users
SET age = 8
WHERE id = 1;

-- Test 2: Update a user's age to above 120 (should be corrected to 120)
UPDATE users
SET age = 150
WHERE id = 2;

-- Test 3: Update a user's age to a valid value (should not be modified)
UPDATE users
SET age = 35
WHERE id = 3;

-- Test 4: Update age to exactly the boundary values
UPDATE users
SET age = 13
WHERE id = 4;

UPDATE users
SET age = 120
WHERE id = 5;

-- Verify the results
SELECT id, name, age
FROM users
WHERE id IN (1, 2, 3, 4, 5)
ORDER BY id;

-- Expected output:
-- User 1 should have age = 13 (not 8)
-- User 2 should have age = 120 (not 150)
-- User 3 should have age = 35 (unchanged)
-- User 4 should have age = 13 (unchanged)
-- User 5 should have age = 120 (unchanged)
