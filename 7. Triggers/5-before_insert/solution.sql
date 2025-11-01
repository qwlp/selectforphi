DELIMITER //

CREATE TRIGGER tr_users_bi
BEFORE INSERT ON users
FOR EACH ROW
BEGIN
    -- Check if age is less than 13
    IF NEW.age < 13 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'ERROR: User age must be at least 13 years old.';
    END IF;

    -- Check if age is greater than 120
    IF NEW.age > 120 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'ERROR: User age cannot exceed 120 years.';
    END IF;
END//

DELIMITER ;

INSERT INTO users (name, age, country_code, username, password, is_admin) VALUES ('Child User', 5, 'FR', 'child5', 'pw1', 0);
INSERT INTO users (name, age, country_code, username, password, is_admin) VALUES ('Oldest User', 200, 'JP', 'old200', 'pw2', 0);
INSERT INTO users (name, age, country_code, username, password, is_admin) VALUES ('Minimum Age', 13, 'CA', 'min13', 'pw3', 0);
INSERT INTO users (name, age, country_code, username, password, is_admin) VALUES ('Standard Age', 45, 'DE', 'standard45', 'pw4', 0);

SELECT id, name, age FROM users;
