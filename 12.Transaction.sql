USE temp;

CREATE TABLE accounts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(10),
    balance INT
);

SELECT * FROM accounts;

INSERT INTO accounts (name, balance)
VALUES ('kim', 100000);
INSERT INTO accounts (name, balance)
VALUES ('lee', 200000);


START TRANSACTION;
UPDATE accounts SET balance = balance + 10000
WHERE id = 1;
UPDATE accounts SET balance = balance - 10000
WHERE id = 2;

COMMIT;
ROLLBACK;

SELECT * FROM accounts;

