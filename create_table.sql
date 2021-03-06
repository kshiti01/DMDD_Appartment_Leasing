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

create or replace procedure contractor_details_creation is table_name varchar2(3000);
BEGIN
-- table creation query
table_name:='CREATE TABLE contractor_details
             (

co_id Number GENERATED BY DEFAULT AS IDENTITY(START WITH 1000 INCREMENT BY 1),
staff_role varchar(255) NOT NULL,
co_specialty varchar(255) NOT NULL,
co_hours Number NOT NULL,
co_rate Number NOT NULL,
co_employment_start_date date NOT NULL,
co_employment_end_date date NOT NULL,
mgid Number,
CONSTRAINT PK_COID PRIMARY KEY (co_id),
CONSTRAINT FK_MG_ID FOREIGN KEY (MGID) REFERENCES ADMIN.MANAGEMENT_DETAILS(MGID);
    )';

EXECUTE IMMEDIATE table_name;
end contractor_details_creation;



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


create or replace procedure booking_details_creation is table_name varchar2(3000);
BEGIN
-- table creation query
table_name:='CREATE TABLE booking
             (
  bookid Number GENERATED BY DEFAULT AS IDENTITY(START WITH 600 INCREMENT BY 1),
  user_id Number NOT NULL,
  aid Number NOT NULL,
  mgid Number NOT NULL,
  booking_fees Number NOT NULL,
  booking_status char(1) NOT NULL,
  booking_date date NOT NULL,

CONSTRAINT PK_BOOK_ID PRIMARY KEY (bookid),
CONSTRAINT FK_USER_ID FOREIGN KEY (user_id) REFERENCES ADMIN.USER_DETAILS(USER_ID),
CONSTRAINT FK_AID FOREIGN KEY (AID) REFERENCES ADMIN.APARTMENT_DETAILS(AID),
CONSTRAINT FK_MG_ID FOREIGN KEY (MGID) REFERENCES ADMIN.MANAGEMENT_DETAILS(MGID)
    )';
EXECUTE IMMEDIATE table_name;
end booking_details_creation;


create or replace procedure payment_details_creation is table_name varchar2(3000);
BEGIN
-- table creation query
table_name:='CREATE TABLE payment_details
             (

  pid Number GENERATED BY DEFAULT AS IDENTITY(START WITH 400 INCREMENT BY 1),
  lid Number NOT NULL,
  payment_date date NOT NULL,
  payment_method varchar(255) NOT NULL,
  payment_by_name varchar(255) NOT NULL,
  payment_to_name varchar(255) NOT NULL,
  payment_amount Number NOT NULL,
  payment_category varchar(255) NOT NULL,
  payment_status varchar(255) NOT NULL,

CONSTRAINT PK_P_ID PRIMARY KEY (pid),
CONSTRAINT FK_L_ID FOREIGN KEY (lid) REFERENCES ADMIN.LEASE_DETAILS(lid),

    )';
EXECUTE IMMEDIATE table_name;
end payment_details_creation;


########


###################################  SHABANA  ##########################################

CREATE TABLE TENANT_DETAILS(
tid NUMBER NOT NULL PRIMARY KEY,
lid NUMBER NOT NULL,
id_proof_submitted CHAR(1) NOT NULL,
id_proof_document_type VARCHAR(255) NOT NULL
);

CREATE TABLE NOTIFICATION(
nid NUMBER NOT NULL PRIMARY KEY,
notification_type VARCHAR(255) NOT NULL,
notification_comments VARCHAR(255) NOT NULL,
notification_date DATE NOT NULL,
FOREIGN KEY (mgid) REFERENCES MANAGEMENT_DETAILS(mgid),
FOREIGN KEY (tid) REFERENCES TENANT_DETAILS(tid)
);


CREATE TABLE COMPLAINT_DETAILS(
cdid Number NOT NULL PRIMARY KEY,
c_ref_no Number NOT NULL,
c_raised_by_name varchar(255) NOT NULL,
c_raised_by_apt Number NOT NULL,
c_raised_time Number NOT NULL,
c_raised_date date NOT NULL,
c_category varchar(255) NOT NULL,
c_severity varchar(255) NOT NULL,
c_description varchar(255) NOT NULL,
c_status char(1) NOT NULL,
c_closure_date date NOT NULL,
FOREIGN KEY (co_id) REFERENCES CONTRACTOR_DETAILS(co_id),
FOREIGN KEY (nid) REFERENCES NOTIFICATION(nid)
);


CREATE TABLE LAUNDRY_DETAILS(
la_id NUMBER NOT NULL PRIMARY KEY,
la_machine_no Number NOT NULL,
la_washing_load varchar(255) NOT NULL,
la_drying_load varchar(255) NOT NULL,
la_time_started date NOT NULL,
la_time_ended date NOT NULL,
la_status char(1) NOT NULL,
la_fee_washing Number NOT NULL,
la_fee_drying Number NOT NULL,
la_payment_received char(1) NOT NULL,
FOREIGN KEY (nid) REFERENCES NOTIFICATION (nid)
);

#########################################################################

########### ATHARVA ###############


  CREATE TABLE "ADMIN"."APARTMENT_DETAILS" 
   (	"AID" NUMBER NOT NULL ENABLE, 
	"AVAILABILITY" VARCHAR2(255 BYTE) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"NO_OF_TENANTS" NUMBER NOT NULL ENABLE, 
	"BUILDING_TYPE" VARCHAR2(255 BYTE) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"BUILT_YEAR" NUMBER(4,0) NOT NULL ENABLE, 
	"LOCATION" VARCHAR2(255 BYTE) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"UNIT_NO" NUMBER NOT NULL ENABLE, 
	"SQT_AREA" NUMBER NOT NULL ENABLE, 
	"BUILDING_NO" NUMBER NOT NULL ENABLE, 
	"AC_SYSTEM" CHAR(1 BYTE) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"HEATER_SYSTEM" CHAR(1 BYTE) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"HOT_WATER" CHAR(1 BYTE) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"GAS_CONNECTION" CHAR(1 BYTE) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"ELECTRICITY" CHAR(1 BYTE) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"ASBESTOS" CHAR(1 BYTE) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"REFRIGARATOR" CHAR(1 BYTE) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"NO_OF_BEDROOMS" CHAR(1 BYTE) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"FLOOR_NO" CHAR(1 BYTE) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"PARKING_AVAILABLE" CHAR(1 BYTE) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"NO_OF_KEYS" CHAR(1 BYTE) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"OVEN" CHAR(1 BYTE) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"STATUS_KEYLOCK" CHAR(1 BYTE) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"STATUS_WINDOWS" CHAR(1 BYTE) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"STATUS_DOOR" CHAR(1 BYTE) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"STATUS_TOILETSINK" CHAR(1 BYTE) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"STATUS_WASHSINK" CHAR(1 BYTE) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"COLUMN1" VARCHAR2(255 BYTE) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"SPECIAL_DESCRIPTION" CHAR(1 BYTE) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"NO_OF_BATHROOMS" NUMBER NOT NULL ENABLE, 
	"NO_OF_BALCONY" NUMBER NOT NULL ENABLE, 
	"BROKER_COMMISSION" NUMBER NOT NULL ENABLE, 
	"MGID" NUMBER NOT NULL ENABLE, 
	 CONSTRAINT "APARTMENT_DETAILS_PK" PRIMARY KEY ("AID")
  USING INDEX (CREATE UNIQUE INDEX "ADMIN"."PARTMENT_DETAILS_PK" ON "ADMIN"."APARTMENT_DETAILS" ("AID") 
  PCTFREE 10 INITRANS 20 MAXTRANS 255 
  TABLESPACE "DATA" )  ENABLE, 
	 CONSTRAINT "MGID1" FOREIGN KEY ("MGID")
	  REFERENCES "ADMIN"."MANAGEMENT_DETAILS" ("MGID") ENABLE
   )  DEFAULT COLLATION "USING_NLS_COMP" SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 10 MAXTRANS 255 
 COLUMN STORE COMPRESS FOR QUERY HIGH ROW LEVEL LOCKING LOGGING
  TABLESPACE "DATA" ;

#######################################

###################Sannidhi###############

CREATE TABLE LEASE_DETAILS (
 lid Number GENERATED ALWAYS AS IDENTITY(START WITH 111111 INCREMENT BY 1),
 lease_type CHAR(1) NOT NULL,
 lease_start_date date NOT NULL,
 lease_end_date date NOT NULL,
 is_sublet_allowed char(1) NOT NULL,
 subletting_charges Number NOT NULL, 
 is_active char(1) NOT NULL,
 security_deposit Number NOT NULL,
 balance_amount Number,
 date_created  date DEFAULT SYSDATE NOT NULL,
 rent Number NOT NULL,
 is_cancellation_allowed char(1) NOT NULL,
 cancellation_charges Number, 
 cancel_status varchar(100),
 is_extension_allowed char(1) NOT NULL,
 extension_status char(1),
 extension_charges Number,
 extension_comments varchar(100),
 new_start_date date,
 new_end_date date,
 new_rent Number,
 CONSTRAINT PK_LID PRIMARY KEY (LID)  
 );
 
 
 CREATE TABLE PAYMENT_DETAILS ( 
  PID NUMBER,--to be incremented
  LID NUMBER,
  PAYMENT_DATE DATE NOT NULL,
  PAYMENT_METHOD VARCHAR(50),
  PAYMENT_BY_NAME VARCHAR(100) NOT NULL,
  PAYMENT_TO_NAME VARCHAR(100) NOT NULL,
  PAYMENT_AMOUNT NUMBER NOT NULL,
  PAYMENT_CATEGORY VARCHAR(50),
  PAYMENT_STATUS CHAR(1) NOT NULL,
  CONSTRAINT PK_PID PRIMARY KEY (PID),
  CONSTRAINT FK_LID FOREIGN KEY (LID)
  REFERENCES LEASE_DETAILS (LID) ON DELETE CASCADE
  );
  
  
 CREATE TABLE BOOKING (
  BOOKID NUMBER, --TO BE INCREMENTED 
  USID NUMBER NOT NULL,
  AID NUMBER NOT NULL,
  MGID NUMBER NOT NULL,
  BOOKING_FEES NUMBER NOT NULL,
  BOOKING_STATUS CHAR(1) NOT NULL,
  BOOKING_DATE DATE DEFAULT SYSDATE NOT NULL,
  CONSTRAINT PK_BOOKID PRIMARY KEY (BOOKID),
  CONSTRAINT FK_USID FOREIGN KEY (USID)
  REFERENCES USER_DETAILS (USID),
  CONSTRAINT FK_AID FOREIGN KEY (AID)
  REFERENCES APARTMENT_DETAILS (AID),
  CONSTRAINT FK_MGID FOREIGN KEY (MGID)
  REFERENCES MANAGEMENT_DETAILS (MGID)
  );
  
###########################################


