CREATE TABLE user_audit (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    old_age INT,
    new_age INT,
    warning_message VARCHAR(255) NOT NULL,
    change_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //

CREATE TRIGGER tr_users_au
AFTER UPDATE ON users
FOR EACH ROW
BEGIN
    -- Check if age changed by more than 50 years
    IF ABS(NEW.age - OLD.age) > 50 THEN
        INSERT INTO user_audit (user_id, old_age, new_age, warning_message)
        VALUES (
            NEW.id,
            OLD.age,
            NEW.age,
            'Suspicious age change detected'
        );
    END IF;
END//

DELIMITER ;

INSERT INTO users (name, age, country_code, username, password, is_admin) VALUES ('John Doe', 30, 'US', 'johndoe', 'securehash', 0);

UPDATE users SET age = 85 WHERE name = 'John Doe';
UPDATE users SET age = 86 WHERE name = 'John Doe';

SELECT user_id, old_age, new_age, warning_message FROM user_audit;
