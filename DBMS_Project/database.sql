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

INSERT INTO users (name, email) VALUES
('Tania Rahman','tania.rahman@example.com'),
('Mizanur Khan','mizanur.khan@example.com'),
('Farzana Akter','farzana.akter@example.com'),
('Shakil Hossain','shakil.hossain@example.com');

INSERT INTO service_provider
(name, service_type, languages, phone, price, verification_status) VALUES
('Sadia Islam','Guide','English, Bangla, Japanese','01755555555',1800,'Verified'),
('Tareq Mahmud','Translator','French, English, Bangla','01866666666',1500,'Verified'),
('Rubina Begum','Security Escort','English, Bangla','01977777777',2200,'Verified'),
('Arif Chowdhury','Guide','English, Bangla, Spanish','01688888888',1600,'Pending'),
('Nusrat Jahan','Translator','English, Bangla, German','01599999999',1300,'Pending');

INSERT INTO booking
(user_id, provider_id, booking_date, start_time, status) VALUES
(1,1,'2026-10-05','09:00:00','Confirmed'),
(1,2,'2026-10-06','14:00:00','Pending'),
(2,5,'2026-10-10','10:00:00','Confirmed'),
(3,3,'2026-11-01','08:30:00','Pending'),
(4,4,'2026-11-15','11:00:00','Cancelled'),
(5,1,'2026-12-20','09:30:00','Confirmed');

INSERT INTO provider_verification
(provider_id, document_type, document_no, status) VALUES
(1,'National ID','1234567890','Verified'),
(2,'Passport','PA5678901','Verified'),
(3,'National ID','0987654321','Pending'),
(4,'Passport','PA1122334','Pending');

INSERT INTO partner
(partner_name, category, description, discount, featured, status) VALUES
('Sundarban Eco Lodge','Hotel','Eco-friendly lodge near the mangrove forest.',12,0,'Active'),
('Chittagong Hill Tracks Tours','Tour Company','Adventurous trekking and tribal village tours.',18,1,'Active'),
('Rooftop Café Dhaka','Restaurant','Modern café with a heritage city view.',8,0,'Active');

INSERT INTO advertisement
(partner_id, title, description, start_date, end_date, status) VALUES
(4,'12% Eco Lodge Offer','Save 12% on Sundarban Eco Lodge stays.','2026-03-01','2027-06-30','Active'),
(5,'18% Trekking Offer','Save 18% on Hill Tracks trek packages.','2026-04-01','2027-08-31','Active'),
(6,'Café Discount','8% off on select rooftop café orders.','2026-05-01','2027-05-31','Inactive');
