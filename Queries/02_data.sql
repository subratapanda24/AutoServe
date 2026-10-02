-- AutoServe - Sample Data
-- DML: Data Insertion

INSERT INTO Customer VALUES
(1, 'Rahul Sharma', '9820011111', 'rahul@example.com', 'Andheri, Mumbai'),
(2, 'Priya Patel',  '9820022222', 'priya@example.com', 'Bandra, Mumbai'),
(3, 'Amit Verma',   '9820033333', 'amit@example.com',  'Thane'),
(4, 'Sneha Iyer',   '9820044444', 'sneha@example.com', 'Powai, Mumbai');

INSERT INTO Vehicle VALUES
(101, 'MH02AB1234', 'Maruti',   'Swift',   2019, 1),
(102, 'MH04CD5678', 'Hyundai',  'i20',     2021, 2),
(103, 'MH01EF9012', 'Honda',    'City',    2018, 1),
(104, 'MH12GH3456', 'Tata',     'Nexon',   2022, 3),
(105, 'MH03JK7890', 'Toyota',   'Innova',  2017, 4),
(106, 'MH02LM2345', 'Mahindra', 'XUV700',  2023, 2);

INSERT INTO Mechanic VALUES
(1, 'Ramesh Kulkarni', '9900011111', 'Engine'),
(2, 'Sunil Yadav',     '9900022222', 'Electrical'),
(3, 'Imran Shaikh',    '9900033333', 'Brakes & Suspension');

INSERT INTO SparePart VALUES
(1, 'Engine Oil 5W-30 (4L)', 1800.00, 40),
(2, 'Oil Filter',             350.00, 60),
(3, 'Air Filter',             450.00, 50),
(4, 'Brake Pad Set',         2200.00, 25),
(5, 'Spark Plug',             400.00, 100),
(6, 'Battery 12V',           5500.00, 10),
(7, 'Wiper Blade',            300.00, 45),
(8, 'Clutch Plate',          3500.00, 12);

INSERT INTO ServiceJob VALUES
(1001, 101, 1, '2026-09-01', 1200.00, 'Completed'),
(1002, 102, 2, '2026-09-03',  800.00, 'Completed'),
(1003, 103, 3, '2026-09-05', 1500.00, 'Completed'),
(1004, 104, 1, '2026-09-10', 1000.00, 'Completed'),
(1005, 105, 3, '2026-09-15', 2500.00, 'In Progress'),
(1006, 106, 2, '2026-09-18',  900.00, 'Pending'),
(1007, 101, 2, '2026-09-25',  700.00, 'In Progress'),
(1008, 102, 1, '2026-09-28',  600.00, 'Pending');

INSERT INTO JobParts VALUES
(1001, 1, 1),
(1001, 2, 1),
(1001, 3, 1),
(1002, 6, 1),
(1003, 4, 1),
(1003, 7, 2),
(1004, 1, 1),
(1004, 2, 1),
(1004, 5, 4),
(1005, 8, 1),
(1005, 4, 1),
(1006, 3, 1),
(1006, 7, 2),
(1007, 5, 4),
(1007, 2, 1);

-- Job 1008 intentionally has no spare parts.