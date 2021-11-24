create table 
--Apartment details (32)- Atharva
--lease, payment and booking (37) - Sannidhi
--User details, user login, contractor, management and maintenance (37) - Kshitija
--Tenant, Notification, complaint and laundry (35) - Shabana
--Total : 141 columns

#####KSHITIJA

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

CREATE TABLE USER_LOGIN(
USERNAME VARCHAR(255) NOT NULL,
PASSWORD VARCHAR(255) NOT NULL,
USID NUMBER NOT NULL,
FOREIGN KEY (USID) REFERENCES USER_DETAILS(USID)
)

CREATE TABLE MANAGEMENT_DETAILS(
MGID NUMBER NOT NULL PRIMARY KEY,
M_COMPANY_NAME VARCHAR(255) NOT NULL,
M_REGISTRATION_STATUS CHAR(1) NOT NULL,
M_DATE_CREATED DATE NOT NULL
)


CREATE TABLE CONTRACTOR_DETAILS(
CO_ID NUMBER NOT NULL PRIMARY KEY,
STAFF_ROLE VARCHAR(255) NOT NULL,
CO_SPECIALITY VARCHAR(255) NOT NULL,
CO_HOURS NUMBER NOT NULL,
CO_RATE NUMBER NOT NULL,
CO_EMP_START_DATE DATE NOT NULL,
CO_EMP_END_DATE DATE NOT NULL,
MGID NUMBER NOT NULL,
FOREIGN KEY (MGID) REFERENCES MANAGEMENT_DETAILS(MGID)
)

CREATE TABLE MAINTENANCE_DETAILS(
MT_ID NUMBER NOT NULL PRIMARY KEY,
MAINTENANCE_TYPE VARCHAR(255) NOT NULL,
MAINTENANCE_COMMENTS VARCHAR(255) NOT NULL,
FREQUENCY NUMBER NOT NULL,
DATE_LAST_DONE DATE NOT NULL,
COMPLIANCE_STATUS CHAR(1)NOT NULL,
MGID NUMBER NOT NULL,
FOREIGN KEY (MGID) REFERENCES MANAGEMENT_DETAILS(MGID)
)

########
