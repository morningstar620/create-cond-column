show databases;
create database data_base;

use data_base;

CREATE TABLE table1 (
    ship_mode VARCHAR(50),
    sales DECIMAL(10, 2),
    profit DECIMAL(10, 2),
    surcharge DECIMAL(5, 2),
    total_cost DECIMAL(10, 2)
);

INSERT INTO table1 (ship_mode, sales, profit)
VALUES
    ('Same Day', 100.00, 50.00),
    ('First Class', 150.00, 60.00),
    ('Standard Class', 200.00, 80.00),
    ('Other', 50.00, 20.00);

UPDATE table1
SET
    surcharge = 
        CASE
            WHEN ship_mode = 'Same Day' THEN 0.2
            WHEN ship_mode = 'First Class' THEN 0.1
            WHEN ship_mode = 'Standard Class' THEN 0.05
            ELSE 0
        END,
    total_cost = (sales - profit) * (1 + 
        CASE
            WHEN ship_mode = 'Same Day' THEN 0.2
            WHEN ship_mode = 'First Class' THEN 0.1
            WHEN ship_mode = 'Standard Class' THEN 0.05
            ELSE 0
        END);
        
Select * from table1;
