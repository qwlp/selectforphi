DELIMITER //

CREATE TRIGGER tr_users_bd
BEFORE DELETE ON users
FOR EACH ROW
BEGIN
    -- Check if the user being deleted is an administrator (is_admin = 1)
    IF OLD.is_admin = 1 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete admin users from TheSeanApp';
    END IF;
END//

DELIMITER ;

INSERT INTO users (name, age, country_code, username, password, is_admin) VALUES ('Admin User', 40, 'US', 'boss', 'admin_pw', 1);
INSERT INTO users (name, age, country_code, username, password, is_admin) VALUES ('Standard User', 25, 'CA', 'standard', 'user_pw', 0);
DELETE FROM users WHERE id = 1;
DELETE FROM users WHERE id = 2;
SELECT id, is_admin, name FROM users;
