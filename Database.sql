
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