insert rows

###Kshitija
USER_DETAILS
insert into user_details values ('301','Mark', 'Williams', '8123458971', 'mark@gmail.com', 'Apt 43', '1132 Jersey St', 'Boston', '02231', 'Massachusets', 'US', TO_DATE('03/02/2001', 'DD/MM/YYYY' ),'M', 'T',TO_DATE('01/04/2021', 'DD/MM/YYYY'));

MANAGEMENT_DETAILS
insert into management_details values ('501','RealEstate Properties', 'Y',TO_DATE('03/02/2001', 'DD/MM/YYYY' ));


####### Atharva

SET SERVEROUTPUT ON;
DECLARE
nCount NUMBER;
BEGIN
SELECT count(*) into nCount FROM user_tables where table_name = 'APARTMENT_DETAILS';
IF(nCount > 0)
THEN
DBMS_OUTPUT.PUT_LINE('TABLE APARTMENT_DETAILS ALREADY EXISTS');
ELSE
EXECUTE IMMEDIATE 'CREATE TABLE APARTMENT_DETAILS(
                          aid   NUMBER  PRIMARY KEY,
                          availability        varchar2(255) NOT NULL,
                          no_of_tenants       number NOT NULL,
                          building_type       varchar2(255) NOT NULL,
                          built_year          number(4) NOT NULL,
                          location            varchar2(255) NOT NULL,
                          unit_no             number NOT NULL,
                          sqt_area            number NOT NULL,
                          building_no         number NOT NULL,
                          ac_system           CHAR(1) NOT NULL,
                          heater_system       CHAR(1) NOT NULL,
                          hot_water           CHAR(1) NOT NULL,
                          gas_connection      CHAR(1) NOT NULL,
                          electricity         CHAR(1) NOT NULL,
                          asbestos            CHAR(1) NOT NULL,
                          refrigarator        CHAR(1) NOT NULL,
                          no_of_bedrooms      CHAR(1) NOT NULL,
                          floor_no            number(2) NOT NULL,
                          parking_available   CHAR(1) NOT NULL,
                          no_of_keys          number(1) NOT NULL,
                          oven                CHAR(1) NOT NULL,
                          status_keylock      CHAR(1) NOT NULL,
                          status_windows      CHAR(1) NOT NULL,
                          status_door         CHAR(1) NOT NULL,
                          status_toiletsink   CHAR(1) NOT NULL,
                          status_washsink     CHAR(1) NOT NULL,
                          owner_name               varchar2(255) NOT NULL,
                          special_description varchar2(255) NOT NULL,
                          no_of_bathrooms     number NOT NULL,
                          no_of_balcony       varchar2(255) NOT NULL,
                          broker_commission   number NOT NULL,
                          mgid                number NOT NULL
             /*               CONSTRAINT pk_aid PRIMARY KEY (aid)  */
)';
EXECUTE IMMEDIATE 'INSERT INTO APARTMENT_DETAILS(aid, availability, no_of_tenants, building_type, built_year, location, unit_no, sqt_area, building_no, ac_system, heater_system,
hot_water, gas_connection, electricity, asbestos, refrigarator, no_of_bedrooms, floor_no, parking_available, no_of_keys, oven, 
status_keylock, status_windows, status_door, status_toiletsink, status_washsink, owner_name, special_description, no_of_bathrooms, 
no_of_balcony, broker_commission, mgid)
VALUES(''1'',''y'',''2'',''residential'',''2000'',''boston'',''101'',''750'',''1'',''y'',
''y'',''y'',''y'',''y'',''n'',''y'',''1'',''1'',''n'',''2'',''n'',''y'',''y'',''y'',''y'',''n'',''Mike Ross'',''Spacious'',''1'',''1'',
''0'',''500'')';



END IF;
commit;
END;

#########################SANNIDHI###########################
create or replace procedure lease_details_creation is table_name varchar2(4000);   
BEGIN
-- table creation query
   table_name:='CREATE TABLE LEASE_DETAILS (
 lid Number GENERATED ALWAYS AS IDENTITY(START WITH 111 INCREMENT BY 1),
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
 )';
   EXECUTE IMMEDIATE table_name;
end lease_details_creation;


CREATE OR REPLACE PACKAGE INSERTION
AS
PROCEDURE INSERT_LEASE_DETAILS(l_type in CHAR, l_start_date in DATE,l_end_date in DATE, is_sub_allowed in DATE, sub_charges in NUMBER, is_active in CHAR,sec_deposit in NUMBER, bal_amt in NUMBER, dat_created in DATE, rent in NUMBER, is_cancel_allowed in CHAR,cancel_charges in NUMBER, cancel_status in VARCHAR, is_ext_allowed in CHAR, ext_status in CHAR,ext_charges in NUMBER, ext_comments in VARCHAR, new_start_dat in DATE, new_end_dat in DATE, new_rent in NUMBER);
end;
/
CREATE OR REPLACE PACKAGE BODY INSERTION
AS
PROCEDURE INSERT_LEASE_DETAILS(l_type in CHAR, l_start_date in DATE,l_end_date in DATE, is_sub_allowed in DATE, sub_charges in NUMBER, is_active in CHAR,sec_deposit in NUMBER, bal_amt in NUMBER, dat_created in DATE, rent in NUMBER, is_cancel_allowed in CHAR,cancel_charges in NUMBER, cancel_status in VARCHAR, is_ext_allowed in CHAR, ext_status in CHAR,ext_charges in NUMBER, ext_comments in VARCHAR, new_start_dat in DATE, new_end_dat in DATE, new_rent in NUMBER)
AS
BEGIN
dbms_output.put_line('----------------------------------------------------------');
insert into LEASE_DETAILS(LEASE_TYPE,LEASE_START_DATE,LEASE_END_DATE,IS_SUBLET_ALLOWED,SUBLETTING_CHARGES,IS_ACTIVE,SECURITY_DEPOSIT,BALANCE_AMOUNT,DATE_CREATED,RENT,IS_CANCELLATION_ALLOWED,CANCELLATION_CHARGES,CANCEL_STATUS,IS_EXTENSION_ALLOWED,EXTENSION_STATUS,EXTENSION_CHARGES,EXTENSION_COMMENTS,NEW_START_DATE,NEW_END_DATE,NEW_RENT) values (l_type,l_start_date,l_end_date,is_sub_allowed,sub_charges,is_active,sec_deposit,bal_amt,dat_created,rent,is_cancel_allowed,cancel_charges,cancel_status,is_ext_allowed,ext_status,ext_charges,ext_comments,new_start_dat,new_end_dat,new_rent);
dbms_output.put_line('Row inserted into LEASE_DETAILS Table');
dbms_output.put_line('----------------------------------------------------------');
commit;
exception
when dup_val_on_index then
dbms_output.put_line('Duplicate Value Found!! Insert Different Value');
when others then
dbms_output.put_line('Error while inserting data into LEASE_DETAILS Table');
rollback;
dbms_output.put_line('The error encountered is: ');
dbms_output.put_line(dbms_utility.format_error_stack);
dbms_output.put_line('----------------------------------------------------------');
end INSERT_LEASE_DETAILS;
end;

create or replace procedure user_login_creation is table_name varchar2(1000);   
BEGIN
-- table creation query
   table_name:='
CREATE TABLE USER_LOGIN(
USERNAME VARCHAR(50),
PASSWORD VARCHAR(50) NOT NULL,
USID NUMBER NOT NULL,
CHECK(REGEXP_LIKE(USERNAME,''^[A-Za-z0-9]{1,16}$'')),
constraint PK_USERNAME PRIMARY KEY(USERNAME),
FOREIGN KEY (USID) REFERENCES USER_DETAILS(USID)
)';
   EXECUTE IMMEDIATE table_name;
end user_login_creation;

create or replace procedure management_details_creation is table_name varchar2(1000);   
BEGIN
-- table creation query
   table_name:='
CREATE TABLE MANAGEMENT_DETAILS(
MGID NUMBER,
M_COMPANY_NAME VARCHAR(100) NOT NULL,
M_REGISTRATION_STATUS CHAR(1) NOT NULL,
M_DATE_CREATED DATE DEFAULT SYSDATE NOT NULL,
constraint PK_MGID PRIMARY KEY(MGID)
)';
   EXECUTE IMMEDIATE table_name;
end management_details_creation;
#####################################################################################

