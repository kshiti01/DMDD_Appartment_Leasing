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
