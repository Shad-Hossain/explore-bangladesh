CREATE DATABASE IF NOT EXISTS heritage_db;
USE heritage_db;

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL
);

INSERT INTO users (name, email) VALUES
('Demo User', 'demo@example.com');

CREATE TABLE service_provider (
    provider_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    service_type ENUM('Guide','Translator','Security Escort') NOT NULL,
    languages VARCHAR(200) NOT NULL,
    phone VARCHAR(30),
    price DECIMAL(10,2) NOT NULL,
    verification_status ENUM('Pending','Verified','Rejected') DEFAULT 'Pending'
);

INSERT INTO service_provider
(name, service_type, languages, phone, price, verification_status) VALUES
('Rahim Ahmed','Guide','English, Bangla','01711111111',1500,'Verified'),
('Karim Hasan','Translator','English, Arabic, Bangla','01822222222',1200,'Verified'),
('Hasan Ali','Security Escort','English, Bangla','01933333333',2000,'Pending'),
('Nadia Sultana','Guide','English, Hindi, Bangla','01644444444',1400,'Verified');

CREATE TABLE booking (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    provider_id INT NOT NULL,
    booking_date DATE NOT NULL,
    start_time TIME NOT NULL,
    status ENUM('Pending','Confirmed','Cancelled') DEFAULT 'Pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (provider_id) REFERENCES service_provider(provider_id)
);

CREATE TABLE provider_verification (
    verification_id INT AUTO_INCREMENT PRIMARY KEY,
    provider_id INT NOT NULL,
    document_type VARCHAR(100),
    document_no VARCHAR(100),
    status ENUM('Pending','Verified','Rejected') DEFAULT 'Pending',
    FOREIGN KEY (provider_id) REFERENCES service_provider(provider_id)
);

CREATE TABLE partner (
    partner_id INT AUTO_INCREMENT PRIMARY KEY,
    partner_name VARCHAR(150) NOT NULL,
    category VARCHAR(100) NOT NULL,
    description TEXT,
    discount INT DEFAULT 0,
    featured TINYINT(1) DEFAULT 0,
    status ENUM('Active','Inactive') DEFAULT 'Active'
);

INSERT INTO partner
(partner_name, category, description, discount, featured, status) VALUES
('Heritage Grand Hotel','Hotel','Comfortable stay near heritage attractions.',15,1,'Active'),
('Old Dhaka Kitchen','Restaurant','Traditional Bangladeshi food experience.',10,1,'Active'),
('Dhaka City Tours','Tour Company','Easy guided city tour packages.',20,0,'Active');

CREATE TABLE advertisement (
    ad_id INT AUTO_INCREMENT PRIMARY KEY,
    partner_id INT NOT NULL,
    title VARCHAR(200) NOT NULL,
    description TEXT,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status ENUM('Active','Inactive') DEFAULT 'Active',
    FOREIGN KEY (partner_id) REFERENCES partner(partner_id) ON DELETE CASCADE
);

INSERT INTO advertisement
(partner_id, title, description, start_date, end_date, status) VALUES
(1,'15% Hotel Discount','Save 15% on selected hotel bookings.','2026-01-01','2027-12-31','Active'),
(2,'Food Experience Offer','Enjoy traditional Bangladeshi food.','2026-01-01','2027-12-31','Active'),
(3,'20% City Tour Offer','Save 20% on selected city tours.','2026-01-01','2027-12-31','Active');
