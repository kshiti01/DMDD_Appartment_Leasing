create views

#### Kshitija

create view  view_login_usertype_broker as 
select ul.username, ul.password, us.user_type, us.last_login
from user_login ul inner join user_details us
on ul.usid = us.usid
where us.user_type = 'b';


create view  view_login_usertype_admin as 
select ul.username, ul.password, us.user_type, us.last_login
from user_login ul inner join user_details us
on ul.usid = us.usid
where us.user_type = 'a';

############## Atharva

CREATE OR REPLACE FORCE EDITIONABLE VIEW "ADMIN"."VIEW_LOGIN_USERTYPE_USER" ("USERNAME", "PASSWORD", "USER_TYPE", "LAST_LOGIN") DEFAULT COLLATION "USING_NLS_COMP"  AS 
SELECT ul.username, ul.password, us.user_type, us.last_login
FROM user_login ul inner join user_details us
on ul.usid = us.usid
where us.user_type = 'u';

CREATE OR REPLACE FORCE EDITIONABLE VIEW "ADMIN"."VIEW_LEASE_CHANGE_TENANT_DETAILS" ("USERNAME", "PASSWORD", "USER_TYPE", "FIRST_NAME", "LAST_NAME", "CONTACT_NO", "EMAIL", "ADDRESS_LINE1", "ADDRESS_LINE2", "CITY", "ZIPCODE", "COUNTRY", "RESIDENCE_STATE") DEFAULT COLLATION "USING_NLS_COMP"  AS 
select ul.username, ul.password, us.user_type, us.first_name, us.last_name, us.contact_no, us.email, us.address_line1, us.address_line2, us.city, us.zipcode, us.country, us.residence_state
from user_login ul inner join user_details us
on ul.usid = us.usid
where us.user_type = 't';

CREATE OR REPLACE FORCE EDITIONABLE VIEW "ADMIN"."VIEW_ADMIN_DETAILS" ("USERNAME", "PASSWORD", "USER_TYPE", "FIRST_NAME", "LAST_NAME", "CONTACT_NO", "EMAIL", "ADDRESS_LINE1", "ADDRESS_LINE2", "CITY", "ZIPCODE", "COUNTRY", "RESIDENCE_STATE") DEFAULT COLLATION "USING_NLS_COMP"  AS 
select ul.username, ul.password, us.user_type, us.first_name, us.last_name, us.contact_no, us.email, us.address_line1, us.address_line2, us.city, us.zipcode, us.country, us.residence_state
from user_login ul inner join user_details us
on ul.usid = us.usid
where us.user_type = 'a';

