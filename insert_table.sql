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

