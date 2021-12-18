create views

#### Kshitija

create view OR REPLACE view_login_usertype_broker as 
select ul.username, ul.password, us.user_type, us.last_login
from user_login ul inner join user_details us
on ul.usid = us.usid
where us.user_type = 'B';


/*create view OR REPLACE  view_login_usertype_admin as 
select ul.username, ul.password, us.user_type, us.last_login
from user_login ul inner join user_details us
on ul.usid = us.usid
where us.user_type = 'A';*/

create view OR REPLACE  view_login_usertype_management as 
select ul.username, ul.password, us.user_type, us.last_login
from user_login ul inner join user_details us
on ul.usid = us.usid
where us.user_type = 'M';


CREATE OR REPLACE FORCE EDITIONABLE VIEW "ADMIN"."VIEW_LOGIN_USERTYPE_USER" ("USERNAME", "PASSWORD", "USER_TYPE", "LAST_LOGIN") DEFAULT COLLATION "USING_NLS_COMP"  AS 
SELECT ul.username, ul.password, us.user_type, us.last_login
FROM user_login ul inner join user_details us
on ul.usid = us.usid
where us.user_type = 'U';

CREATE OR REPLACE FORCE EDITIONABLE VIEW "ADMIN"."VIEW_LOGIN_USERTYPE_TENANT" ("USERNAME", "PASSWORD", "USER_TYPE", "LAST_LOGIN") DEFAULT COLLATION "USING_NLS_COMP"  AS 
SELECT ul.username, ul.password, us.user_type, us.last_login
FROM user_login ul inner join user_details us
on ul.usid = us.usid
where us.user_type = 'T';

CREATE OR REPLACE FORCE EDITIONABLE VIEW "ADMIN"."VIEW_LOGIN_USERTYPE_CONTRACTOR" ("USERNAME", "PASSWORD", "USER_TYPE", "LAST_LOGIN") DEFAULT COLLATION "USING_NLS_COMP"  AS 
SELECT ul.username, ul.password, us.user_type, us.last_login
FROM user_login ul inner join user_details us
on ul.usid = us.usid
where us.user_type = 'C';



#############################################################################################


CREATE OR REPLACE FORCE EDITIONABLE VIEW "ADMIN"."VIEW_LEASE_CHANGE_TENANT_DETAILS" ("USERNAME", "PASSWORD", "USER_TYPE", "FIRST_NAME", "LAST_NAME", "CONTACT_NO", "EMAIL", "ADDRESS_LINE1", "ADDRESS_LINE2", "CITY", "ZIPCODE", "COUNTRY", "RESIDENCE_STATE") DEFAULT COLLATION "USING_NLS_COMP"  AS 
select ul.username, ul.password, us.user_type, us.first_name, us.last_name, us.contact_no, us.email, us.address_line1, us.address_line2, us.city, us.zipcode, us.country, us.residence_state
from user_login ul inner join user_details us
on ul.usid = us.usid
where us.user_type = 'T';

CREATE OR REPLACE FORCE EDITIONABLE VIEW "ADMIN"."VIEW_ADMIN_DETAILS" ("USERNAME", "PASSWORD", "USER_TYPE", "FIRST_NAME", "LAST_NAME", "CONTACT_NO", "EMAIL", "ADDRESS_LINE1", "ADDRESS_LINE2", "CITY", "ZIPCODE", "COUNTRY", "RESIDENCE_STATE") DEFAULT COLLATION "USING_NLS_COMP"  AS 
select ul.username, ul.password, us.user_type, us.first_name, us.last_name, us.contact_no, us.email, us.address_line1, us.address_line2, us.city, us.zipcode, us.country, us.residence_state
from user_login ul inner join user_details us
on ul.usid = us.usid
where us.user_type = 'C';
----------------------###############SHABANA##################-----------------------

------------------user details---------------------------------
CREATE OR REPLACE VIEW VIEW_USER_'||user_name||' AS
SELECT
FIRST_NAME,
LAST_NAME,
PHONE_NO,
EMAIL,
USER_NAME,
PASS_WORD,
ADDRESS_LINE1,
ADDRESS_LINE2,
CITY,
ZIPCODE,
RESIDENCE_STATE,
COUNTRY,
DOB,
SEX
FROM
user_details
where user_name='||user_name||';

----------------------------------broker to view apartment details-------------------------------
CREATE OR REPLACE VIEW VIEW_BROKER AS
SELECT
a.NO_OF_TENANTS,
a.BUILDING_TYPE,
a.BUILT_YEAR,
a.LOCATION,
a.UNIT_NO,
a.SQT_AREA,
a.BUILDING_NO,
a.AC_SYSTEM,
a.HEATER_SYSTEM,
a.HOT_WATER,
a.GAS_CONNECTION,
a.ELECTRICITY,
a.ASBESTOS,
a.REFRIGARATOR,
a.NO_OF_BEDROOMS,
a.FLOOR_NO,
a.PARKING_AVAILABLE,
a.NO_OF_KEYS,
a.OVEN,
a.STATUS_KEYLOCK,
a.STATUS_WINDOWS,
a.STATUS_DOOR,
a.STATUS_TOILETSINK,
a.STATUS_WASHSINK,
a.OWNER_NAME,
a.SPECIAL_DESCRIPTION,
a.NO_OF_BATHROOMS,
a.NO_OF_BALCONY,
a.BROKER_COMMISSION,
l.LEASE_TYPE,
l.LEASE_START_DATE,
l.LEASE_END_DATE,
l.SECURITY_DEPOSIT,
l.RENT,
l.IS_CANCELLATION_ALLOWED,
l.CANCELLATION_CHARGES,
l.IS_EXTENSION_ALLOWED,
l.EXTENSION_CHARGES

FROM
apartment_details a
INNER JOIN  lease_details l on a.aid=l.aid where a.AVAILABILITY='Y';

----------------------------tenant to view apartment & lease details------------------------------------
CREATE OR REPLACE VIEW VIEW_TENANT AS
SELECT
l.LEASE_START_DATE,
l.LEASE_END_DATE,
l.IS_SUBLET_ALLOWED,
l.SUBLETTING_CHARGES,
l.SECURITY_DEPOSIT,
l.BALANCE_AMOUNT,
l.RENT,
l.IS_CANCELLATION_ALLOWED,
l.CANCELLATION_CHARGES,
l.CANCEL_STATUS,
l.IS_EXTENSION_ALLOWED,
l.EXTENSION_STATUS,
l.EXTENSION_CHARGES,
a.NO_OF_TENANTS,
a.LOCATION,
a.UNIT_NO,
a.SQT_AREA,
a.BUILDING_NO,
a.NO_OF_BEDROOMS,
a.FLOOR_NO,
a.PARKING_AVAILABLE,
a.OWNER_NAME,
a.NO_OF_BATHROOMS,
a.NO_OF_BALCONY,
n.NOTIFICATION_TYPE,
n.NOTIFICATION_COMMENTS,
n.DATE_CREATED,
n.NOTIFICATION_DATE
FROM tenant_details t
INNER JOIN lease_details l on t.lid=l.lid
INNER JOIN apartment_details a on a.aid=l.aid
INNER JOIN notification n on t.tid=n.tid;


-----------contractor to view complaints and management details---------
CREATE OR REPLACE VIEW VIEW_CONTRACTOR AS
SELECT
co.STAFF_ROLE,
co.CO_SPECIALTY,
co.CO_HOURS,
co.CO_RATE,
co.CO_EMP_START_DATE,
co.CO_EMP_END_DATE,
c.C_REF_NO,
c.C_RAISED_BY_NAME,
c.C_RAISED_BY_APT,
c.C_RAISED_TIME,
c.C_RAISED_DATE,
c.C_CATEGORY,
c.C_SEVERITY,
c.C_DESCRIPTION,
c.C_STATUS,
c.C_CLOSURE_DATE,
m.M_COMPANY_NAME
FROM contractor_details co
INNER JOIN complaint_details c on co.co_id=c.co_id
INNER JOIN management_details m on co.mgid=m.mgid;

---------------------------------------------



