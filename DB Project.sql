CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    name VARCHAR(255),
    phone_number VARCHAR(20),
    email VARCHAR(255),
    address VARCHAR(255),
    DOB DATE,
    gender VARCHAR(10),
    loyalty_points INT,
	city VARCHAR(200),
    membership_status VARCHAR(50)
   
);

CREATE TABLE Orders(
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_price DECIMAL(10, 2),
    payment_method VARCHAR(50),
    payment_status VARCHAR(50),
    delivery_address VARCHAR(255),
    delivery_instructions TEXT,
    order_status VARCHAR(50),
    delivery_charges DECIMAL(10, 2),
    delivery_time TIME,
    special_requests TEXT,
    discount_applied DECIMAL(10, 2),
    tax_amount DECIMAL(10, 2),
    subtotal DECIMAL(10, 2),
    deliveryboy_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

CREATE TABLE Supplier (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(255),
    phone_number VARCHAR(20),
    email VARCHAR(255),
    address VARCHAR(255),
    payment_terms VARCHAR(100),
    is_active Boolean,
    is_preferred_supplier Boolean,
    delivery_lead_time INT,
    delivery_schedule VARCHAR(100)
);

CREATE TABLE Inventory_Item (
    item_id INT PRIMARY KEY,
    item_name VARCHAR(255),
    category VARCHAR(100),
    description TEXT,
    quantity_available INT,
    unit_price DECIMAL(10, 2),
    supplier_id INT,
    purchase_date DATE,
    expiration_date DATE,
    storage_location VARCHAR(255),
    is_available Boolean,
    is_perishable Boolean,
    manufacturer VARCHAR(255),
    country_of_origin VARCHAR(100),
    FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id)
);


CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    name VARCHAR(255),
    phone_number VARCHAR(20),
    email VARCHAR(255),
    address VARCHAR(255),
    DOB DATE,
    gender VARCHAR(10),
    hire_date DATE,
    job_title VARCHAR(100),
    department VARCHAR(100),
    salary DECIMAL(10, 2),
    is_active Boolean,
    manager_id INT,
    supervisor_id INT,
    emergency_contact_name VARCHAR(255),
    emergency_contact_phone VARCHAR(20),
    emergency_contact_relationship VARCHAR(100),
    FOREIGN KEY (manager_id) REFERENCES Employee(employee_id),
    FOREIGN KEY (supervisor_id) REFERENCES Employee(employee_id)
);

CREATE TABLE Delivery_Boy (
    deliveryboy_id INT PRIMARY KEY,
    employee_id INT,
    vehicle_number VARCHAR(20),
    availability_status VARCHAR(50),
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);


CREATE TABLE Waiter (
    waiter_id INT PRIMARY KEY,
    employee_id INT,
    shift VARCHAR(50),
    experience_years INT,
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);


CREATE TABLE Payment (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_method VARCHAR(50),
    payment_date DATE,
    payment_amount DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);


CREATE TABLE Menu_Item (
    item_id INT PRIMARY KEY,
    item_name VARCHAR(255),
    category VARCHAR(100),
    description TEXT,
    price DECIMAL(10, 2),
	img TEXT
);


CREATE TABLE Reservation (
    reservation_id INT PRIMARY KEY,
    customer_id INT,
    reservation_date DATE,
    reservation_time TIME,
    table_number INT,
    party_size INT,
    special_requests TEXT,
    is_confirmed Boolean,
    confirmation_code VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);


CREATE TABLE Restaurant_Table (
    table_number INT PRIMARY KEY,
    capacity INT,
    is_reserved Boolean,
    table_type VARCHAR(50),
    is_outdoor Boolean,
    reservation_status VARCHAR(50),
    seating_preference VARCHAR(50),
    is_active Boolean,
    is_private Boolean,
    is_fixed_seating Boolean,
    has_high_chair Boolean,
    is_round_table Boolean,
    is_window_seat Boolean,
    is_bar_table Boolean
);


CREATE TABLE Feedback (
    feedback_id INT PRIMARY KEY,
    customer_id INT,
    date DATE,
    rating INT,
    comments TEXT,
    feedback_type VARCHAR(50),
    review_platform VARCHAR(100),
    is_anonymous Boolean,
    response_text TEXT,
    response_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

CREATE TABLE Promotion (
    promotion_id INT PRIMARY KEY,
    promotion_name VARCHAR(255),
    start_date DATE,
    end_date DATE,
    description TEXT,
    promotion_type VARCHAR(50),
    is_active Boolean,
    applicable_items TEXT,
    applicable_menu_items TEXT,
    applicable_categories TEXT,
    minimum_purchase_amount DECIMAL(10, 2),
    discount_amount DECIMAL(10, 2),
    discount_percentage DECIMAL(5, 2)
    
);




CREATE TABLE Shift (
    shift_id INT PRIMARY KEY,
    shift_name VARCHAR(50),
    start_time TIME,
    end_time TIME,
    shift_duration INT,
    is_active Boolean,
    shift_type VARCHAR(50),
    is_weekend Boolean
);

CREATE TABLE Expense (
    expense_id INT PRIMARY KEY,
    expense_date DATE,
    category VARCHAR(100),
    amount DECIMAL(10, 2),
    description TEXT,
    payment_method VARCHAR(50)
    
);

CREATE TABLE Revenue (
    revenue_id INT PRIMARY KEY,
    revenue_date DATE,
    amount DECIMAL(10, 2),
    description TEXT
    
);


CREATE TABLE Discount (
    discount_id INT PRIMARY KEY,
    discount_name VARCHAR(255),
    discount_type VARCHAR(50),
    amount DECIMAL(10, 2),
    start_date DATE,
    end_date DATE,
    applicable_items TEXT,
    applicable_categories TEXT,
    applicable_menu_items TEXT,
    minimum_purchase_amount DECIMAL(10, 2),
    is_active Boolean
    
);


CREATE TABLE Event (
    event_id INT PRIMARY KEY,
	customer_id INT,
    event_name VARCHAR(255),
    event_date DATE,
    event_time TIME,
    description TEXT,
    
	FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
    
);

CREATE TABLE userinfo (
id INT PRIMARY KEY,
name VARCHAR(100),
email VARCHAR(100),
password VARCHAR(100),
deliveryaddress TEXT);





CREATE TABLE Waste_Management (
    waste_id INT PRIMARY KEY,
    item_id INT,
    quantity INT,
    disposal_date DATE,
    disposal_method VARCHAR(100),
    reason_for_disposal TEXT,
    disposal_cost DECIMAL(10, 2),
    FOREIGN KEY (item_id) REFERENCES Inventory_Item(item_id)
);



INSERT INTO Customer (customer_id, name, phone_number, email, address, DOB, gender, loyalty_points, city, membership_status) 
VALUES 
(1, 'John Doe', '123-456-7890', 'john@example.com', '123 Main St', '1990-05-15', 'Male', 100, 'New York', 'Gold'),
(2, 'Alice Smith', '987-654-3210', 'alice@example.com', '456 Oak Ave', '1985-08-21', 'Female', 50, 'Los Angeles', 'Silver'),
(3, 'Bob Johnson', '555-123-4567', 'bob@example.com', '789 Elm St', '1982-03-10', 'Male', 75, 'Chicago', 'Bronze'),
(4, 'Emily Brown', '333-555-7777', 'emily@example.com', '101 Pine St', '1995-11-30', 'Female', 120, 'Houston', 'Platinum'),
(5, 'Michael Wilson', '222-888-9999', 'michael@example.com', '202 Maple Ave', '1978-07-25', 'Male', 90, 'Miami', 'Gold'),
(6, 'Sophia Garcia', '111-444-3333', 'sophia@example.com', '303 Cedar St', '1989-12-18', 'Female', 80, 'San Francisco', 'Silver'),
(7, 'David Rodriguez', '444-222-1111', 'david@example.com', '404 Walnut Ave', '1980-09-05', 'Male', 60, 'Seattle', 'Bronze'),
(8, 'Emma Martinez', '666-999-8888', 'emma@example.com', '505 Birch St', '1993-02-28', 'Female', 110, 'Boston', 'Platinum'),
(9, 'James Hernandez', '777-333-5555', 'james@example.com', '606 Pineapple Ave', '1987-06-12', 'Male', 70, 'Atlanta', 'Gold'),
(10, 'Olivia Lopez', '999-777-3333', 'olivia@example.com', '707 Cherry St', '1991-04-03', 'Female', 85, 'Dallas', 'Silver');



INSERT INTO Orders (order_id, customer_id, order_date, total_price, payment_method, payment_status, delivery_address, delivery_instructions, order_status, delivery_charges, delivery_time, special_requests, discount_applied, tax_amount, subtotal, deliveryboy_id) 
VALUES 
(1, 1, '2024-05-01', 50.00, 'Credit Card', 'Paid', '123 Main St', 'Leave at the door', 'Delivered', 5.00, '2024-05-01 12:00:00', 'None', 0.00, 2.50, 47.50, 1),
(2, 2, '2024-05-02', 75.00, 'Cash', 'Pending', '456 Oak Ave', 'Ring the bell', 'Processing', 7.50, NULL, 'Extra napkins', 10.00, 5.00, 60.00, 2),
(3, 3, '2024-05-03', 100.00, 'DeBoolean Card', 'Paid', '789 Elm St', 'Call upon arrival', 'Completed', 10.00, '2024-05-03 18:00:00', 'No ice', 15.00, 8.00, 77.00, 3),
(4, 4, '2024-05-04', 120.00, 'Credit Card', 'Paid', '101 Pine St', 'Hand over to reception', 'Delivered', 12.00, '2024-05-04 14:00:00', 'Gift wrap', 20.00, 10.00, 90.00, 1),
(5, 5, '2024-05-05', 80.00, 'Cash', 'Pending', '202 Maple Ave', 'Leave at the back door', 'Processing', 8.00, NULL, 'No onions', 5.00, 4.00, 71.00, 3),
(6, 6, '2024-05-06', 60.00, 'DeBoolean Card', 'Paid', '303 Cedar St', 'Text upon arrival', 'Completed', 6.00, '2024-05-06 20:00:00', 'Extra sauce', 0.00, 3.00, 57.00, 2),
(7, 7, '2024-05-07', 90.00, 'Credit Card', 'Paid', '404 Walnut Ave', 'Leave on the porch', 'Delivered', 9.00, '2024-05-07 16:00:00', 'No cheese', 10.00, 6.00, 75.00, 1),
(8, 8, '2024-05-08', 110.00, 'Cash', 'Pending', '505 Birch St', 'Hand over to security', 'Processing', 11.00, NULL, 'Extra ketchup', 15.00, 7.00, 88.00, 3),
(9, 9, '2024-05-09', 70.00, 'Credit Card', 'Paid', '606 Pineapple Ave', 'Call upon arrival', 'Completed', 7.00, '2024-05-09 12:00:00', 'No pickles', 5.00, 4.00, 61.00, 2),
(10, 10, '2024-05-10', 95.00, 'DeBoolean Card', 'Paid', '707 Cherry St', 'Text upon arrival', 'Delivered', 9.50, '2024-05-10 19:00:00', 'Extra mustard', 10.00, 6.00, 78.50, 1);



INSERT INTO Supplier (supplier_id, supplier_name, phone_number, email, address, payment_terms, is_active, is_preferred_supplier, delivery_lead_time, delivery_schedule)
VALUES
  (1, 'Farm Fresh Inc.', '111-222-3333', 'info@farmfresh.com', '123 Farm Rd', 'Net 30', TRUE, TRUE, 2, 'Weekly'),
  (2, 'Farmers Poultry', '222-333-4444', 'info@farmerspoultry.com', '456 Poultry Ave', 'Net 30', TRUE, FALSE, 3, 'Bi-weekly'),
  (3, 'Rice Farms Ltd.', '333-444-5555', 'info@ricefarms.com', '789 Rice Ln', 'Net 45', TRUE, TRUE, 4, 'Monthly'),
  (4, 'Miller Mills', '444-555-6666', 'info@miller.com', '101 Flour Blvd', 'Net 30', TRUE, FALSE, 5, 'Bi-weekly'),
  (5, 'Dairy Farms Inc.', '555-666-7777', 'info@dairyfarms.com', '202 Dairy Dr', 'Net 30', TRUE, TRUE, 2, 'Weekly'),
  (6, 'Ocean Harvest', '666-777-8888', 'info@oceanharvest.com', '303 Ocean Ave', 'Net 30', TRUE, FALSE, 3, 'Bi-weekly'),
  (7, 'Pasta Producers Ltd.', '777-888-9999', 'info@pastaproducers.com', '404 Pasta St', 'Net 45', TRUE, TRUE, 4, 'Monthly'),
  (8, 'Grassland Farms', '888-999-0000', 'info@grasslandfarms.com', '505 Grassland Dr', 'Net 30', TRUE, FALSE, 5, 'Bi-weekly'),
  (9, 'Eggcellent Farms', '999-000-1111', 'info@eggcellent.com', '606 Egg Rd', 'Net 30', TRUE, TRUE, 2, 'Weekly'),
  (10, 'Produce Paradise', '000-111-2222', 'info@produceparadise.com', '707 Produce Ln', 'Net 45', TRUE, FALSE, 3, 'Bi-weekly');




INSERT INTO Inventory_Item (item_id, item_name, category, description, quantity_available, unit_price, supplier_id, purchase_date, expiration_date, storage_location, is_available, is_perishable, manufacturer, country_of_origin) 
VALUES 
(1, 'Tomato', 'Vegetable', 'Fresh tomatoes', 100, 1.50, 1, '2024-05-01', '2024-05-10', 'Refrigerator', TRUE, TRUE, 'Farm Fresh Inc.', 'USA'),
(2, 'Chicken Breast', 'Meat', 'Skinless chicken breast', 50, 3.00, 2, '2024-05-02', '2024-05-12', 'Freezer', TRUE, FALSE, 'Farmers Poultry', 'USA'),
(3, 'Rice', 'Grains', 'Basmati rice', 200, 2.50, 3, '2024-05-03', '2024-06-01', 'Pantry', TRUE, FALSE, 'Rice Farms Ltd.', 'India'),
(4, 'Flour', 'Baking', 'All-purpose flour', 150, 2.00, 4, '2024-05-04', '2024-07-01', 'Pantry', TRUE, FALSE, 'Miller Mills', 'USA'),
(5, 'Milk', 'Dairy', 'Whole milk', 50, 1.75, 5, '2024-05-05', '2024-05-15', 'Refrigerator', TRUE, TRUE, 'Dairy Farms Inc.', 'USA'),
(6, 'Lettuce', 'Vegetable', 'Fresh iceberg lettuce', 75, 1.25, 1, '2024-05-06', '2024-05-12', 'Refrigerator', TRUE, TRUE, 'Farm Fresh Inc.', 'USA'),
(7, 'Salmon', 'Seafood', 'Fresh salmon fillet', 30, 7.00, 6, '2024-05-07', '2024-05-10', 'Freezer', TRUE, FALSE, 'Ocean Harvest', 'Norway'),
(8, 'Eggs', 'Dairy', 'Farm fresh eggs', 100, 2.00, 5, '2024-05-08', '2024-05-20', 'Refrigerator', TRUE, TRUE, 'Eggcellent Farms', 'USA'),
(9, 'Pasta', 'Grains', 'Spaghetti pasta', 80, 1.75, 7, '2024-05-09', '2024-06-01', 'Pantry', TRUE, FALSE, 'Pasta Producers Ltd.', 'Italy'),
(10, 'Beef', 'Meat', 'Grass-fed beef steak', 40, 8.00, 8, '2024-05-10', '2024-05-15', 'Freezer', TRUE, FALSE, 'Grassland Farms', 'USA');





INSERT INTO Employee (employee_id, name, phone_number, email, address, DOB, gender, hire_date, job_title, department, salary, is_active, manager_id, supervisor_id, emergency_contact_name, emergency_contact_phone, emergency_contact_relationship) 
VALUES 
(1, 'Michael Smith', '111-222-3333', 'michael@example.com', '123 Elm St', '1980-01-15', 'Male', '2020-05-01', 'Manager', 'Operations', 50000.00, TRUE, NULL, NULL, 'Emma Smith', '111-222-4444', 'Spouse'),
(2, 'Jennifer Johnson', '222-333-4444', 'jennifer@example.com', '456 Oak Ave', '1985-03-20', 'Female', '2021-06-15', 'Chef', 'Kitchen', 45000.00, TRUE, 1, NULL, 'John Johnson', '222-333-5555', 'Parent'),
(3, 'David Brown', '333-444-5555', 'david@example.com', '789 Maple St', '1990-08-10', 'Male', '2022-01-10', 'Waiter', 'Service', 30000.00, TRUE, 1, 2, 'Sarah Brown', '333-444-6666', 'Sibling'),
(4, 'Jessica Lee', '444-555-6666', 'jessica@example.com', '101 Pine St', '1995-05-25', 'Female', '2023-03-05', 'Delivery Driver', 'Delivery', 28000.00, TRUE, 1, NULL, 'Andrew Lee', '444-555-7777', 'Friend'),
(5, 'Christopher Garcia', '555-666-7777', 'christopher@example.com', '202 Cedar St', '1988-11-30', 'Male', '2020-09-20', 'Chef de Partie', 'Kitchen', 40000.00, TRUE, 1, 2, 'Maria Garcia', '555-666-8888', 'Spouse'),
(6, 'Amanda Martinez', '666-777-8888', 'amanda@example.com', '303 Walnut St', '1993-04-12', 'Female', '2021-12-01', 'Waitress', 'Service', 28000.00, TRUE, 1, 3, 'Jose Martinez', '666-777-9999', 'Parent'),
(7, 'Daniel Rodriguez', '777-888-9999', 'daniel@example.com', '404 Pine St', '1986-07-18', 'Male', '2022-05-15', 'Delivery Driver', 'Delivery', 30000.00, TRUE, 1, NULL, 'Sophia Rodriguez', '777-888-0000', 'Spouse'),
(8, 'Sarah Taylor', '888-999-0000', 'sarah@example.com', '505 Elm St', '1998-10-05', 'Female', '2023-08-20', 'Bartender', 'Bar', 32000.00, TRUE, 1, 3, 'David Taylor', '888-999-1111', 'Sibling'),
(9, 'Matthew Hernandez', '999-000-1111', 'matthew@example.com', '606 Oak St', '1983-12-28', 'Male', '2020-03-10', 'Server', 'Service', 27000.00, TRUE, 1, 3, 'Laura Hernandez', '999-000-2222', 'Spouse'),
(10, 'Emily Gonzalez', '000-111-2222', 'emily@example.com', '707 Maple St', '1991-09-15', 'Female', '2021-02-05', 'Host/Hostess', 'Service', 26000.00, TRUE, 1, 3, 'Victor Gonzalez', '000-111-3333', 'Parent');





INSERT INTO Delivery_Boy (deliveryboy_id, employee_id, vehicle_number, availability_status) 
VALUES 
(1, 4, 'ABC123', 'Available'),
(2, 7, 'XYZ456', 'Available'),
(3, 10, 'PQR789', 'Unavailable'),
(4, 8, 'DEF321', 'Available'),
(5, 6, 'GHI654', 'Unavailable'),
(6, 3, 'JKL987', 'Available'),
(7, 1, 'MNO654', 'Available'),
(8, 2, 'RST987', 'Unavailable'),
(9, 5, 'UVW321', 'Available'),
(10, 9, 'ZYZ654', 'Unavailable');





INSERT INTO Waiter (waiter_id, employee_id, shift, experience_years) 
VALUES 
(1, 3, 'Morning', 2),
(2, 6, 'Evening', 3),
(3, 9, 'Night', 1),
(4, 1, 'Morning', 4),
(5, 5, 'Evening', 2),
(6, 8, 'Night', 3),
(7, 2, 'Morning', 1),
(8, 4, 'Evening', 4),
(9, 7, 'Night', 2),
(10, 3, 'Morning', 3);





INSERT INTO Payment (payment_id, order_id, payment_method, payment_date, payment_amount) 
VALUES 
(1, 1, 'Credit Card', '2024-05-01', 50.00),
(2, 2, 'Cash', '2024-05-02', 75.00),
(3, 3, 'DeBoolean Card', '2024-05-03', 100.00),
(4, 4, 'Credit Card', '2024-05-04', 120.00),
(5, 5, 'Cash', '2024-05-05', 80.00),
(6, 6, 'DeBoolean Card', '2024-05-06', 60.00),
(7, 7, 'Credit Card', '2024-05-07', 90.00),
(8, 8, 'Cash', '2024-05-08', 110.00),
(9, 9, 'Credit Card', '2024-05-09', 70.00),
(10, 10, 'DeBoolean Card', '2024-05-10', 95.00);








INSERT INTO Reservation (reservation_id, customer_id, reservation_date, reservation_time, table_number, party_size, special_requests, is_confirmed, confirmation_code) 
VALUES 
(1, 1, '2024-05-01', '12:00:00', 1, 4, 'Window seat', TRUE, 'ABC123'),
(2, 2, '2024-05-02', '18:00:00', 3, 6, 'No peanuts', FALSE, NULL),
(3, 3, '2024-05-03', '20:00:00', 2, 2, 'Extra napkins', TRUE, 'DEF456'),
(4, 4, '2024-05-04', '19:00:00', 5, 8, 'Birthday celebration', TRUE, 'GHI789'),
(5, 5, '2024-05-05', '14:00:00', 4, 3, 'No onions', TRUE, 'JKL012'),
(6, 6, '2024-05-06', '17:30:00', 6, 5, 'Vegetarian options', FALSE, NULL),
(7, 7, '2024-05-07', '13:00:00', 7, 2, 'Near the fireplace', TRUE, 'MNO345'),
(8, 8, '2024-05-08', '16:00:00', 8, 4, 'High chair needed',TRUE, 'PQR678'),
(9, 9, '2024-05-09', '18:30:00', 9, 3, 'Extra plates', FALSE, NULL),
(10, 10, '2024-05-10', '21:00:00', 10, 2, 'Anniversary dinner', TRUE, 'STU901');





INSERT INTO Restaurant_Table (table_number, capacity, is_reserved, table_type, is_outdoor, reservation_status, seating_preference,  is_active, is_private, is_fixed_seating, has_high_chair, is_round_table, is_window_seat, is_bar_table) 
VALUES 
(1, 4, TRUE, 'Standard',  '1', 'Any', '2024-05-01 09:00:00', TRUE, FALSE, TRUE, TRUE, FALSE, TRUE, FALSE),
(2, 6, TRUE, 'Standard',  '1', 'Any', '2024-05-01 09:00:00', TRUE, FALSE, TRUE, TRUE, FALSE, TRUE, FALSE),
(3, 4, TRUE, 'Standard',  '0', 'Window', '2024-05-02 09:00:00',TRUE, FALSE, TRUE, TRUE, FALSE, TRUE, FALSE),
(4, 8, TRUE, 'Standard',  '0', 'Booth', '2024-05-03 09:00:00', TRUE, FALSE, TRUE, TRUE, FALSE, TRUE, FALSE),
(5, 10, TRUE, 'Standard', '1', 'Any', '2024-05-01 09:00:00', TRUE, FALSE, TRUE, TRUE, FALSE, TRUE, FALSE),
(6, 6, TRUE, 'Standard',  '0', 'High-top', '2024-05-04 09:00:00', TRUE, FALSE, TRUE, TRUE, FALSE, TRUE, FALSE),
(7, 4, TRUE, 'Standard',  '1', 'Any', '2024-05-01 09:00:00', TRUE,FALSE, TRUE, TRUE, FALSE, TRUE, FALSE),
(8, 8, TRUE, 'Standard',  '0', 'Round', '2024-05-05 09:00:00', TRUE, FALSE, TRUE, TRUE, FALSE, TRUE, FALSE),
(9, 6, TRUE, 'Standard',  '1', 'Any', '2024-05-01 09:00:00', TRUE, FALSE, TRUE, TRUE, FALSE, TRUE, FALSE),
(10, 4, TRUE, 'Standard', '1', 'Any', '2024-05-01 09:00:00', TRUE, FALSE, TRUE, TRUE, FALSE, TRUE, FALSE);





INSERT INTO Feedback (feedback_id, customer_id, date, rating, comments, feedback_type, review_platform, is_anonymous, response_text, response_date) 
VALUES 
(1, 1, '2024-05-01', 5, 'Great food and service!', 'Positive', 'Yelp', FALSE, 'Thank you for your feedback!', '2024-05-02'),
(2, 2, '2024-05-02', 4, 'The pasta was delicious but the service was a bit slow.', 'Neutral', 'Google', FALSE, 'We apologize for the inconvenience. We will work on improving our service.', '2024-05-03'),
(3, 3, '2024-05-03', 3, 'The food was okay but the portions were small for the price.', 'Negative', 'TripAdvisor', FALSE, 'We appreciate your feedback and will take it into consideration for future improvements.', '2024-05-04'),
(4, 4, '2024-05-04', 5, 'Excellent experience overall. Will definitely visit again!', 'Positive', 'Zomato', FALSE, 'Thank you for your ki nd words! We look forward to serving you again.', '2024-05-05'),
(5, 5, '2024-05-05', 2, 'Disappointed with the quality of food. Not worth the price.', 'Negative', 'Yelp', FALSE, 'We apologize for the experience. Please contact us directly so we can make it right.', '2024-05-06'),
(6, 6, '2024-05-06', 4, 'Good ambiance and friendly staff.', 'Positive', 'Google', FALSE, 'Thank you for your feedback! We are glad you enjoyed your visit.', '2024-05-07'),
(7, 7, '2024-05-07', 5, 'Best pizza in town!', 'Positive', 'TripAdvisor', FALSE, 'We appreciate your recommendation!', '2024-05-08'),
(8, 8, '2024-05-08', 3, 'The drinks were good but the appetizers were mediocre.', 'Neutral', 'Zomato', FALSE, 'Thank you for your feedback. We will work on improving our appetizers.', '2024-05-09'),
(9, 9, '2024-05-09', 4, 'Great service and ambiance. The dessert was delicious!', 'Positive', 'Yelp', FALSE, 'We are thrilled to hear that you enjoyed your experience with us!', '2024-05-10'),
(10, 10, '2024-05-10', 5, 'Wonderful experience celebrating our anniversary here.', 'Positive', 'Google', FALSE, 'Happy anniversary! Weare honored to have been a part of your special day.', '2024-05-11');





INSERT INTO Promotion (promotion_id, promotion_name, start_date, end_date, description, promotion_type, is_active, applicable_items, applicable_menu_items, applicable_categories, minimum_purchase_amount, discount_amount, discount_percentage) 
VALUES 
(1, 'Spring Special', '2024-04-01', '2024-04-30', 'Enjoy special discounts on select items this spring!', 'Seasonal', TRUE, 'All', NULL, NULL, 50.00, 5.00, 10.00),
(2, 'Loyalty Reward', '2024-05-01', '2024-05-31', 'Exclusive discounts for loyal customers!', 'Customer Loyalty', TRUE, NULL, NULL, NULL, 100.00, 10.00, NULL),
(3, 'Weekend Brunch', '2024-05-07', '2024-05-08', 'Special brunch menu available only on weekends!', 'Limited Time Offer', TRUE, NULL, NULL, 'Brunch', 50.00, 7.00, NULL),
(4, 'Happy Hour', '2024-05-01', '2024-05-31', 'Enjoy discounted drinks during happy hour!', 'Time-based', TRUE, NULL, NULL, 'Beverage', 20.00, 3.00, NULL),
(5, 'Combo Deal', '2024-05-01', '2024-05-31', 'Get a discount when you order a combo meal!', 'Promo Package', TRUE, NULL, NULL, 'Combo', 30.00, 4.00, NULL),
(6, 'New Menu Launch', '2024-06-01', '2024-06-30', 'Exciting new dishes now available on our menu!', 'New Offer', TRUE, 'All', NULL, NULL, 0.00, 0.00, NULL),
(7, 'Holiday Special', '2024-12-24', '2024-12-25', 'Celebrate the holidays with us and enjoy special discounts!', 'Seasonal', TRUE, 'All', NULL, NULL, 75.00, 8.00, NULL),
(8, 'Birthday Discount', '2024-05-10', '2024-05-10', 'Get a special discount on your birthday!', 'Special Occasion', TRUE, NULL, NULL, NULL, 25.00, 2.00, NULL),
(9, 'Anniversary Offer', '2024-05-10', '2024-05-10', 'Celebrate your anniversary with us and enjoy a complimentary dessert!', 'Special Occasion', TRUE, NULL, NULL, NULL, 0.00, 0.00, NULL),
(10, 'Student Discount', '2024-05-01', '2024-05-31', 'Exclusive discounts for students!', 'Customer Segment', TRUE, NULL, NULL, NULL, 50.00, 5.00, NULL);











INSERT INTO Shift (shift_id, shift_name, start_time, end_time, shift_duration, is_active, shift_type, is_weekend) 
VALUES 
(1, 'Morning', '08:00:00', '16:00:00', 8, TRUE, 'Regular', FALSE),
(2, 'Afternoon', '12:00:00', '20:00:00', 8, TRUE, 'Regular', FALSE),
(3, 'Evening', '16:00:00', '00:00:00', 8, TRUE, 'Regular', FALSE),
(4, 'Night', '20:00:00', '04:00:00', 8, TRUE, 'Regular', FALSE),
(5, 'Weekend Morning', '08:00:00', '16:00:00', 8, TRUE, 'Weekend', TRUE),
(6, 'Weekend Afternoon', '12:00:00', '20:00:00', 8, TRUE, 'Weekend', TRUE),
(7, 'Weekend Evening', '16:00:00', '00:00:00', 8, TRUE, 'Weekend', TRUE),
(8, 'Weekend Night', '20:00:00', '04:00:00', 8, TRUE, 'Weekend', TRUE),
(9, 'Late Night', '22:00:00', '06:00:00', 8, TRUE, 'Late', FALSE),
(10, 'Early Morning', '06:00:00', '14:00:00', 8, TRUE, 'Early', FALSE);





INSERT INTO Expense (expense_id, expense_date, category, amount, description, payment_method) 
VALUES 
(1, '2024-05-01', 'Food & Beverage', 500.00, 'Purchase of ingredients', 'Credit Card'),
(2, '2024-05-02', 'Utilities', 300.00, 'Electricity bill', 'Bank Transfer'),
(3, '2024-05-03', 'Maintenance', 200.00, 'Repair of kitchen equipment', 'Cash'),
(4, '2024-05-04', 'Employee Salaries', 1500.00, 'Monthly payroll', 'Bank Transfer'),
(5, '2024-05-05', 'Marketing', 700.00, 'Advertisement campaign', 'Credit Card'),
(6, '2024-05-06', 'Rent', 1000.00, 'Monthly rent for premises', 'Bank Transfer'),
(7, '2024-05-07', 'Insurance', 400.00, 'Insurance premium', 'Credit Card'),
(8, '2024-05-08', 'Equipment', 600.00, 'Purchase of new kitchen equipment', 'Cash'),
(9, '2024-05-09', 'Cleaning Supplies', 150.00, 'Restocking cleaning supplies', 'Credit Card'),
(10, '2024-05-10', 'Repairs', 250.00, 'Repair of plumbing issue', 'Cash');





INSERT INTO Revenue (revenue_id, revenue_date, amount, description) 
VALUES 
(1, '2024-05-01', 1500.00, 'Revenue from dine-in customers'),
(2, '2024-05-02', 1200.00, 'Revenue from takeout orders'),
(3, '2024-05-03', 1800.00, 'Revenue from catering service'),
(4, '2024-05-04', 2000.00, 'Revenue from private event booking'),
(5, '2024-05-05', 1600.00, 'Revenue from online orders'),
(6, '2024-05-06', 1400.00, 'Revenue from bar sales'),
(7, '2024-05-07', 1900.00, 'Revenue from delivery service'),
(8, '2024-05-08', 1700.00, 'Revenue from gift card sales'),
(9, '2024-05-09', 1300.00, 'Revenue from special promotions'),
(10, '2024-05-10', 2200.00, 'Revenue from catering service');




INSERT INTO Discount (discount_id, discount_name, discount_type, amount, start_date, end_date, applicable_items, applicable_categories, applicable_menu_items, minimum_purchase_amount, is_active) 
VALUES 
(1, '10% Off', 'Percentage', 0.10, '2024-05-01', '2024-05-31', NULL, NULL, NULL, 50.00, TRUE),
(2, 'Combo Discount', 'Fixed Amount', 5.00, '2024-05-01', '2024-05-31', NULL, NULL, 'Combo', 30.00, TRUE),
(3, 'Free Dessert', 'Free Item', 0.00, '2024-05-10', '2024-05-10', NULL, NULL, NULL, 0.00, TRUE),
(4, 'Student Discount', 'Percentage', 0.05, '2024-05-01', '2024-05-31', NULL, NULL, NULL, 20.00, TRUE),
(5, 'Spring Special', 'Fixed Amount', 2.00, '2024-04-01', '2024-04-30', NULL, NULL, NULL, 10.00, TRUE),
(6, 'Birthday Discount', 'Percentage', 0.02, '2024-05-10', '2024-05-10', NULL, NULL, NULL, 25.00, TRUE),
(7, 'Weekend Brunch Discount', 'Percentage', 0.07, '2024-05-07', '2024-05-08', NULL, 'Brunch', NULL, 50.00, TRUE),
(8, 'Happy Hour Discount', 'Percentage', 0.03, '2024-05-01', '2024-05-31', NULL, 'Beverage', NULL, 20.00, TRUE),
(9, 'Loyalty Reward', 'Percentage', 0.10, '2024-05-01', '2024-05-31', NULL, NULL, NULL, 100.00, TRUE),
(10, 'Holiday Special', 'Percentage', 0.08, '2024-12-24', '2024-12-25', NULL, NULL, NULL, 75.00, FALSE);





INSERT INTO Event (event_id, customer_id, event_name, event_date, event_time, description) 
VALUES 
(1, 1, 'Birthday Party', '2024-05-10', '19:00:00', 'Celebrating Sarah birthday!'),
(2, 2, 'Anniversary Dinner', '2024-06-15', '20:00:00', 'Celebrating John and Lisas anniversary'),
(3, 3, 'Corporate Event', '2024-07-20', '18:00:00', 'Annual company dinner'),
(4, 4, 'Baby Shower', '2024-08-10', '14:00:00', 'Welcoming the newest member of the family'),
(5, 5, 'Wedding Reception', '2024-09-05', '17:00:00', 'Join us as we celebrate the newlyweds!'),
(6, 6, 'Graduation Party', '2024-10-12', '19:00:00', 'Congratulations, Class of 2024!'),
(7, 7, 'Family Reunion', '2024-11-18', '12:00:00', 'Bringing the family together for a day of fun'),
(8, 8, 'Holiday Celebration', '2024-12-24', '18:00:00', 'Festive gathering to celebrate the holiday season'),
(9, 9, 'Retirement Party', '2025-01-10', '16:00:00', 'Wishing John a happy retirement!'),
(10, 10, 'Engagement Party', '2025-02-14', '20:00:00', 'Celebrating the newly engaged couple');





INSERT INTO Waste_Management (waste_id, item_id, quantity, disposal_date, disposal_method, reason_for_disposal, disposal_cost) 
VALUES 
(1, 1, 2, '2024-05-01', 'Trash', 'Expired', 2.00),
(2, 2, 1, '2024-05-02', 'Compost', 'Spoiled', 1.00),
(3, 3, 1, '2024-05-03', 'Recycling', 'Damaged', 0.50),
(4, 4, 2, '2024-05-04', 'Trash', 'Expired', 2.00),
(5, 5, 1, '2024-05-05', 'Compost', 'Spoiled', 1.00),
(6, 6, 1, '2024-05-06', 'Recycling', 'Damaged', 0.50),
(7, 7, 2, '2024-05-07', 'Trash', 'Expired', 2.00),
(8, 8, 1, '2024-05-08', 'Compost', 'Spoiled', 1.00),
(9, 9, 1, '2024-05-09', 'Recycling', 'Damaged', 0.50),
(10, 10, 2, '2024-05-10', 'Trash', 'Expired', 2.00);


-- View to list all active suppliers
-- This view helps in quickly accessing details of suppliers who are currently active
CREATE VIEW ActiveSuppliers AS
SELECT supplier_id, supplier_name, phone_number, email, address
FROM Supplier
WHERE is_active = TRUE;

-- View to get customer order summary
-- This view provides a summary of orders made by each customer, including total price and order count
CREATE VIEW CustomerOrderSummary AS
SELECT c.customer_id, c.name, COUNT(o.order_id) AS order_count, SUM(o.total_price) AS total_spent
FROM Customer c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;

-- Trigger function to update inventory after an order is placed
-- This function decreases the inventory quantity based on the items ordered
CREATE OR REPLACE FUNCTION update_inventory_after_order() RETURNS TRIGGER AS $$
BEGIN
    UPDATE Inventory_Item
    SET quantity_available = quantity_available - NEW.quantity
    WHERE item_id = NEW.item_id;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger function to maintain loyalty points
-- This function updates the customer's loyalty points based on the total price of an order
CREATE OR REPLACE FUNCTION update_loyalty_points() RETURNS TRIGGER AS $$
BEGIN
    UPDATE Customer
    SET loyalty_points = loyalty_points + (NEW.total_price / 10)
    WHERE customer_id = NEW.customer_id;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger to call update_inventory_after_order function after an order is inserted
CREATE TRIGGER trg_update_inventory_after_order
AFTER INSERT ON Orders
FOR EACH ROW
EXECUTE FUNCTION update_inventory_after_order();

-- Trigger to call update_loyalty_points function after an order is inserted
CREATE TRIGGER trg_update_loyalty_points
AFTER INSERT ON Orders
FOR EACH ROW
EXECUTE FUNCTION update_loyalty_points();

-- Index to improve query performance on Orders table by order date
-- This index helps in faster retrieval of orders based on the order date
CREATE INDEX idx_order_date ON Orders(order_date);

-- Index to speed up searches on the Inventory_Item table by item name
-- This index optimizes the search queries that filter by item_name
CREATE INDEX idx_item_name ON Inventory_Item(item_name);

-- Index on Employee table by department
-- This index helps in efficiently retrieving employees by their department
CREATE INDEX idx_department ON Employee(department);


-- View 1: Customer Orders
CREATE VIEW CustomerOrders AS
SELECT c.customer_id, c.name, o.order_id, o.order_date, o.total_price
FROM Customer c
JOIN Orders o ON c.customer_id = o.customer_id;



-- View 3: Inventory Summary
CREATE VIEW InventorySummary AS
SELECT category, COUNT(item_id) AS item_count, SUM(quantity_available) AS total_quantity
FROM Inventory_Item
GROUP BY category;

-- View 4: Employee Contact Info
CREATE VIEW EmployeeContactInfo AS
SELECT employee_id, name, phone_number, email, department
FROM Employee;

-- View 5: Order Details
CREATE VIEW OrderDetails AS
SELECT o.order_id, c.name AS customer_name, o.order_date, o.total_price, o.payment_status
FROM Orders o
JOIN Customer c ON o.customer_id = c.customer_id;

-- View 6: Supplier Details
CREATE VIEW SupplierDetails AS
SELECT supplier_id, supplier_name, address, phone_number, email, payment_terms
FROM Supplier;

-- View 7: Perishable Inventory
CREATE VIEW PerishableInventory AS
SELECT item_id, item_name, quantity_available, expiration_date
FROM Inventory_Item
WHERE is_perishable = TRUE;

-- View 8: Employee Salaries
CREATE VIEW EmployeeSalaries AS
SELECT employee_id, name, job_title, department, salary
FROM Employee
WHERE is_active = TRUE;

-- View 9: Recent Orders
CREATE VIEW RecentOrders AS
SELECT order_id, customer_id, order_date, total_price
FROM Orders
WHERE order_date > NOW() - INTERVAL '30 days';

-- View 10: High Value Orders
CREATE VIEW HighValueOrders AS
SELECT order_id, customer_id, total_price
FROM Orders
WHERE total_price > 1000;









-- Index 1: Customer Name Index
CREATE INDEX idx_customer_name ON Customer (name);



-- Index 3: Supplier Name Index
CREATE INDEX idx_supplier_name ON Supplier (supplier_name);

-- Index 4: Inventory Category Index
CREATE INDEX idx_inventory_category ON Inventory_Item (category);

-- Index 5: Employee Name Index
CREATE INDEX idx_employee_name ON Employee (name);

-- Index 6: Customer Email Index
CREATE INDEX idx_customer_email ON Customer (email);

-- Index 7: Order Total Price Index
CREATE INDEX idx_order_total_price ON Orders (total_price);

-- Index 8: Supplier Email Index
CREATE INDEX idx_supplier_email ON Supplier (email);

-- Index 9: Inventory Expiration Date Index
CREATE INDEX idx_inventory_expiration_date ON Inventory_Item (expiration_date);

-- Index 10: Employee Department Index
CREATE INDEX idx_employee_department ON Employee (department);







-- Procedure 1: Add New Customer
CREATE OR REPLACE PROCEDURE AddCustomer(
    p_name VARCHAR, 
    p_phone_number VARCHAR, 
    p_email VARCHAR, 
    p_address VARCHAR, 
    p_DOB DATE, 
    p_gender VARCHAR, 
    p_loyalty_points INT, 
    p_city VARCHAR, 
    p_membership_status VARCHAR)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Customer(name, phone_number, email, address, DOB, gender, loyalty_points, city, membership_status)
    VALUES (p_name, p_phone_number, p_email, p_address, p_DOB, p_gender, p_loyalty_points, p_city, p_membership_status);
END;
$$;

-- Procedure 2: Update Order Status
CREATE OR REPLACE PROCEDURE UpdateOrderStatus(p_order_id INT, p_status VARCHAR)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Orders
    SET order_status = p_status
    WHERE order_id = p_order_id;
END;
$$;

-- Procedure 3: Add New Supplier
CREATE OR REPLACE PROCEDURE AddSupplier(
    p_supplier_name VARCHAR, 
    p_phone_number VARCHAR, 
    p_email VARCHAR, 
    p_address VARCHAR, 
    p_payment_terms VARCHAR, 
    p_is_active BOOLEAN, 
    p_is_preferred_supplier BOOLEAN, 
    p_delivery_lead_time INT, 
    p_delivery_schedule VARCHAR)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Supplier(supplier_name, phone_number, email, address, payment_terms, is_active, is_preferred_supplier, delivery_lead_time, delivery_schedule)
    VALUES (p_supplier_name, p_phone_number, p_email, p_address, p_payment_terms, p_is_active, p_is_preferred_supplier, p_delivery_lead_time, p_delivery_schedule);
END;
$$;

-- Procedure 4: Add New Inventory Item
CREATE OR REPLACE PROCEDURE AddInventoryItem(
    p_item_name VARCHAR, 
    p_category VARCHAR, 
    p_description TEXT, 
    p_quantity_available INT, 
    p_unit_price DECIMAL, 
    p_supplier_id INT, 
    p_purchase_date DATE, 
    p_expiration_date DATE, 
    p_storage_location VARCHAR, 
    p_is_available BOOLEAN, 
    p_is_perishable BOOLEAN, 
    p_manufacturer VARCHAR, 
    p_country_of_origin VARCHAR)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Inventory_Item(item_name, category, description, quantity_available, unit_price, supplier_id, purchase_date, expiration_date, storage_location, is_available, is_perishable, manufacturer, country_of_origin)
    VALUES (p_item_name, p_category, p_description, p_quantity_available, p_unit_price, p_supplier_id, p_purchase_date, p_expiration_date, p_storage_location, p_is_available, p_is_perishable, p_manufacturer, p_country_of_origin);
END;
$$;

-- Procedure 5: Add New Employee
CREATE OR REPLACE PROCEDURE AddEmployee(
    p_name VARCHAR, 
    p_phone_number VARCHAR, 
    p_email VARCHAR, 
    p_address VARCHAR, 
    p_DOB DATE, 
    p_gender VARCHAR, 
    p_hire_date DATE, 
    p_job_title VARCHAR, 
    p_department VARCHAR, 
    p_salary DECIMAL, 
    p_is_active BOOLEAN, 
    p_manager_id INT)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Employee(name, phone_number, email, address, DOB, gender, hire_date, job_title, department, salary, is_active, manager_id)
    VALUES (p_name, p_phone_number, p_email, p_address, p_DOB, p_gender, p_hire_date, p_job_title, p_department, p_salary, p_is_active, p_manager_id);
END;
$$;

-- Procedure 6: Update Customer Info
CREATE OR REPLACE PROCEDURE UpdateCustomer(
    p_customer_id INT, 
    p_name VARCHAR, 
    p_phone_number VARCHAR, 
    p_email VARCHAR, 
    p_address VARCHAR, 
    p_DOB DATE, 
    p_gender VARCHAR, 
    p_loyalty_points INT, 
    p_city VARCHAR, 
    p_membership_status VARCHAR)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Customer
    SET name = p_name, phone_number = p_phone_number, email = p_email, address = p_address, DOB = p_DOB, gender = p_gender, loyalty_points = p_loyalty_points, city = p_city, membership_status = p_membership_status
    WHERE customer_id = p_customer_id;
END;
$$;

-- Procedure 7: Delete Customer
CREATE OR REPLACE PROCEDURE DeleteCustomer(p_customer_id INT)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM Customer
    WHERE customer_id = p_customer_id;
END;
$$;

-- Procedure 8: Add Loyalty Points
CREATE OR REPLACE PROCEDURE AddLoyaltyPoints(p_customer_id INT, p_points INT)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Customer
    SET loyalty_points = loyalty_points + p_points
    WHERE customer_id = p_customer_id;
END;
$$;

-- Procedure 9: Update Supplier Info
CREATE OR REPLACE PROCEDURE UpdateSupplier(
    p_supplier_id INT, 
    p_supplier_name VARCHAR, 
    p_phone_number VARCHAR, 
    p_email VARCHAR, 
    p_address VARCHAR, 
    p_payment_terms VARCHAR, 
    p_is_active BOOLEAN, 
    p_is_preferred_supplier BOOLEAN, 
    p_delivery_lead_time INT, 
    p_delivery_schedule VARCHAR)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Supplier
    SET supplier_name = p_supplier_name, phone_number = p_phone_number, email = p_email, address = p_address, payment_terms = p_payment_terms, is_active = p_is_active, is_preferred_supplier = p_is_preferred_supplier, delivery_lead_time = p_delivery_lead_time, delivery_schedule = p_delivery_schedule
    WHERE supplier_id = p_supplier_id;
END;
$$;

-- Procedure 10: Update Inventory Item
CREATE OR REPLACE PROCEDURE UpdateInventoryItem(
    p_item_id INT, 
    p_item_name VARCHAR, 
    p_category VARCHAR, 
    p_description TEXT, 
    p_quantity_available INT, 
    p_unit_price DECIMAL, 
    p_supplier_id INT, 
    p_purchase_date DATE, 
    p_expiration_date DATE, 
    p_storage_location VARCHAR, 
    p_is_available BOOLEAN, 
    p_is_perishable BOOLEAN, 
    p_manufacturer VARCHAR, 
    p_country_of_origin VARCHAR)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Inventory_Item
    SET item_name = p_item_name, category = p_category, description = p_description, quantity_available = p_quantity_available, unit_price = p_unit_price, supplier_id = p_supplier_id, purchase_date = p_purchase_date, expiration_date = p_expiration_date, storage_location = p_storage_location, is_available = p_is_available, is_perishable = p_is_perishable, manufacturer = p_manufacturer, country_of_origin = p_country_of_origin
    WHERE item_id = p_item_id;
END;
$$;






-- Trigger 1: Update Loyalty Points After Order
CREATE TRIGGER UpdateLoyaltyPointsAfterOrder
AFTER INSERT ON Orders
FOR EACH ROW
EXECUTE FUNCTION AddLoyaltyPoints();

-- Trigger 2: Update Inventory After Order
CREATE TRIGGER UpdateInventoryAfterOrder
AFTER INSERT ON Orders
FOR EACH ROW
EXECUTE FUNCTION UpdateInventoryAfterOrder();

-- Trigger 3: Update Order Status After Payment
CREATE TRIGGER UpdateOrderStatusAfterPayment
AFTER UPDATE ON Orders
FOR EACH ROW
WHEN (NEW.payment_status = 'Paid')
EXECUTE FUNCTION UpdateOrderStatus();

-- Trigger 4: Notify Supplier After Low Inventory
CREATE TRIGGER NotifySupplierAfterLowInventory
AFTER UPDATE ON Inventory_Item
FOR EACH ROW
WHEN (NEW.quantity_available < 10)
EXECUTE FUNCTION NotifySupplier();

-- Trigger 5: Log Employee Changes
CREATE TRIGGER LogEmployeeChanges
AFTER INSERT OR UPDATE OR DELETE ON Employee
FOR EACH ROW
EXECUTE FUNCTION LogEmployeeChanges();

-- Trigger 6: Archive Old Orders
CREATE TRIGGER ArchiveOldOrders
AFTER UPDATE ON Orders
FOR EACH ROW
WHEN (NEW.order_status = 'Completed' AND NEW.order_date < NOW() - INTERVAL '1 year')
EXECUTE FUNCTION ArchiveOrder();

-- Trigger 7: Check Inventory Expiration
CREATE TRIGGER CheckInventoryExpiration
AFTER INSERT OR UPDATE ON Inventory_Item
FOR EACH ROW
WHEN (NEW.expiration_date < NOW() + INTERVAL '1 month')
EXECUTE FUNCTION NotifyExpiration();

-- Trigger 8: Update Customer Membership Status
CREATE TRIGGER UpdateCustomerMembershipStatus
AFTER UPDATE ON Customer
FOR EACH ROW
EXECUTE FUNCTION UpdateMembershipStatus();

-- Trigger 9: Validate Employee Data
CREATE TRIGGER ValidateEmployeeData
BEFORE INSERT OR UPDATE ON Employee
FOR EACH ROW
EXECUTE FUNCTION ValidateEmployeeData();

-- Trigger 10: Track Supplier Activity
CREATE TRIGGER TrackSupplierActivity
AFTER INSERT OR UPDATE ON Supplier
FOR EACH ROW
EXECUTE FUNCTION TrackSupplierActivity();



CREATE FUNCTION AddLoyaltyPoints() RETURNS trigger AS $$
BEGIN
    -- Your logic here, using NEW.customer_id and NEW.total_price
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION UpdateInventoryAfterOrder() RETURNS trigger AS $$
BEGIN
    -- Your logic here, using NEW.order_id
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION UpdateOrderStatus() RETURNS trigger AS $$
BEGIN
    -- Your logic here, using NEW.order_id
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION NotifySupplier() RETURNS trigger AS $$
BEGIN
    -- Your logic here, using NEW.supplier_id
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION LogEmployeeChanges() RETURNS trigger AS $$
BEGIN
    -- Your logic here
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION ArchiveOrder() RETURNS trigger AS $$
BEGIN
    -- Your logic here, using NEW.order_id
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION NotifyExpiration() RETURNS trigger AS $$
BEGIN
    -- Your logic here, using NEW.item_id
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION UpdateMembershipStatus() RETURNS trigger AS $$
BEGIN
    -- Your logic here, using NEW.customer_id
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION ValidateEmployeeData() RETURNS trigger AS $$
BEGIN
    -- Your logic here, using NEW.employee_id
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION TrackSupplierActivity() RETURNS trigger AS $$
BEGIN
    -- Your logic here, using NEW.supplier_id
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;









SELECT * FROM Customer;
SELECT * FROM Orders;
SELECT * FROM Inventory_Item;
SELECT * FROM Employee;
SELECT * FROM Delivery_Boy;
SELECT * FROM Waiter;
SELECT * FROM Payment;
SELECT * FROM Menu_Item;
SELECT * FROM Reservation;
SELECT * FROM Restaurant_Table;
SELECT * FROM Feedback;
SELECT * FROM Promotion;
SELECT * FROM Supplier;
SELECT * FROM Shift;
SELECT * FROM Expense;
SELECT * FROM Revenue;
SELECT * FROM Discount;
SELECT * FROM Event;
SELECT * FROM Waste_Management;
SELECT * FROM userinfo;
