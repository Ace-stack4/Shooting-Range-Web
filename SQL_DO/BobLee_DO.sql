

USE DATABASE L11_Okpachui_56037_mid2_DO;
-- Create Members table
CREATE TABLE members_DO (
    member_id_DO INT PRIMARY KEY AUTO_INCREMENT,
    first_name_DO VARCHAR(50) NOT NULL,
    last_name_DO VARCHAR(50) NOT NULL,
    license_number_DO VARCHAR(20) UNIQUE NOT NULL,
    join_date_DO DATE NOT NULL
);

-- Create Firearms table
CREATE TABLE firearms_DO (
    firearm_id_DO INT PRIMARY KEY AUTO_INCREMENT,
    model_DO VARCHAR(50) NOT NULL,
    caliber_DO VARCHAR(20) NOT NULL,
    serial_number_DO VARCHAR(50) UNIQUE NOT NULL,
    condition_DO ENUM('New', 'Excellent', 'Good', 'Fair', 'Poor') NOT NULL
);

-- Create Training Programs table
CREATE TABLE training_programs_DO (
    program_id_DO INT PRIMARY KEY AUTO_INCREMENT,
    program_name_DO VARCHAR(100) NOT NULL,
    duration_hours_DO INT NOT NULL,
    difficulty_level_DO ENUM('Beginner', 'Intermediate', 'Advanced', 'Expert') NOT NULL,
    price_DO DECIMAL(10,2) NOT NULL
);

-- Create Competitions table
CREATE TABLE competitions_DO (
    competition_id_DO INT PRIMARY KEY AUTO_INCREMENT,
    comp_name_DO VARCHAR(100) NOT NULL,
    comp_date_DO DATE NOT NULL,
    type_DO VARCHAR(50) NOT NULL,
    prize_pool_DO DECIMAL(10,2) NOT NULL
);

-- Create Competition Results table
CREATE TABLE competition_results_DO (
    result_id_DO INT PRIMARY KEY AUTO_INCREMENT,
    competition_id_DO INT,
    member_id_DO INT,
    score_DO INT NOT NULL,
    ranking_DO INT NOT NULL,
    FOREIGN KEY (competition_id_DO) REFERENCES competitions_DO(competition_id_DO),
    FOREIGN KEY (member_id_DO) REFERENCES members_DO(member_id_DO)
);

-- Create Member Training table
CREATE TABLE member_training_DO (
    enrollment_id_DO INT PRIMARY KEY AUTO_INCREMENT,
    member_id_DO INT,
    program_id_DO INT,
    start_date_DO DATE NOT NULL,
    completion_date_DO DATE,
    FOREIGN KEY (member_id_DO) REFERENCES members_DO(member_id_DO),
    FOREIGN KEY (program_id_DO) REFERENCES training_programs_DO(program_id_DO)
);

-- Create Firearm Rentals table
CREATE TABLE firearm_rentals_DO (
    rental_id_DO INT PRIMARY KEY AUTO_INCREMENT,
    member_id_DO INT,
    firearm_id_DO INT,
    rental_date_DO DATE NOT NULL,
    return_date_DO DATE,
    FOREIGN KEY (member_id_DO) REFERENCES members_DO(member_id_DO),
    FOREIGN KEY (firearm_id_DO) REFERENCES firearms_DO(firearm_id_DO)
);

-- Insert sample data for Members
INSERT INTO members_DO (first_name_DO, last_name_DO, license_number_DO, join_date_DO) VALUES
('John', 'Smith', 'LSC001-DO', '2024-01-01'),
('Sarah', 'Johnson', 'LSC002-DO', '2024-01-05'),
('Michael', 'Brown', 'LSC003-DO', '2024-01-10'),
('Emma', 'Davis', 'LSC004-DO', '2024-01-15'),
('James', 'Wilson', 'LSC005-DO', '2024-01-20');

-- Insert sample data for Firearms
INSERT INTO firearms_DO (model_DO, caliber_DO, serial_number_DO, condition_DO) VALUES
('Glock 19', '9mm', 'GL19-001-DO', 'New'),
('Smith & Wesson M&P', '9mm', 'SW-001-DO', 'Excellent'),
('Ruger 10/22', '.22 LR', 'RG-001-DO', 'Good'),
('AR-15', '5.56mm', 'AR15-001-DO', 'Excellent'),
('Remington 870', '12 Gauge', 'RM-001-DO', 'Good');

-- Insert sample data for Training Programs
INSERT INTO training_programs_DO (program_name_DO, duration_hours_DO, difficulty_level_DO, price_DO) VALUES
('Basic Firearm Safety', 4, 'Beginner', 199.99),
('Intermediate Marksmanship', 8, 'Intermediate', 299.99),
('Advanced Tactical Training', 16, 'Advanced', 499.99),
('Competition Shooting Prep', 12, 'Expert', 399.99),
('Defensive Pistol Course', 8, 'Intermediate', 349.99);

-- Insert sample data for Competitions
INSERT INTO competitions_DO (comp_name_DO, comp_date_DO, type_DO, prize_pool_DO) VALUES
('Spring Shootout 2024', '2024-03-15', 'Pistol', 1000.00),
('Rifle Challenge 2024', '2024-04-20', 'Rifle', 1500.00),
('Tactical Tournament', '2024-05-10', 'Mixed', 2000.00),
('Speed Shooting Cup', '2024-06-01', 'Pistol', 1200.00),
('Precision Rifle Match', '2024-07-15', 'Rifle', 1800.00);

-- Insert sample data for Competition Results
INSERT INTO competition_results_DO (competition_id_DO, member_id_DO, score_DO, ranking_DO) VALUES
(1, 1, 95, 1),
(1, 2, 88, 2),
(1, 3, 85, 3),
(2, 4, 92, 1),
(2, 5, 87, 2);

-- Insert sample data for Member Training
INSERT INTO member_training_DO (member_id_DO, program_id_DO, start_date_DO, completion_date_DO) VALUES
(1, 1, '2024-01-05', '2024-01-06'),
(2, 2, '2024-01-10', '2024-01-11'),
(3, 3, '2024-01-15', '2024-01-17'),
(4, 4, '2024-01-20', '2024-01-22'),
(5, 5, '2024-01-25', '2024-01-26');

-- Insert sample data for Firearm Rentals
INSERT INTO firearm_rentals_DO (member_id_DO, firearm_id_DO, rental_date_DO, return_date_DO) VALUES
(1, 1, '2024-01-05', '2024-01-05'),
(2, 2, '2024-01-10', '2024-01-10'),
(3, 3, '2024-01-15', '2024-01-15'),
(4, 4, '2024-01-20', '2024-01-20'),
(5, 5, '2024-01-25', '2024-01-25');