create table 
--Apartment details (32)- Atharva
--lease, payment and booking (37) - Sannidhi
--User details, user login, contractor, management and maintenance (37) - Kshitija
--Tenant, Notification, complaint and laundry (35) - Shabana
--Total : 141 columns



USER_DETAILS
CREATE TABLE USER_DETAILS(
usid NUMBER(3) PRIMARY KEY,
first_name VARCHAR(255) NOT NULL,
last_name VARCHAR(255) NOT NULL,
contact_no NUMBER(10) NOT NULL,
email VARCHAR(255) NOT NULL,
address_line1 VARCHAR(255) NOT NULL,
address_line2 VARCHAR(255) NOT NULL,
city VARCHAR(100) NOT NULL,
zipcode NUMBER(6) NOT NULL,
residence_state VARCHAR(255) NOT NULL,
country VARCHAR(255) NOT NULL,
dob DATE NOT NULL,
sex VARCHAR(10) NOT NULL,
user_type char(1) NOT NULL,
last_login date NOT NULL
)
