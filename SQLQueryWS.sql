create table CardInfo
(CardNo bigint primary key ,
cvvno int not null,
expdate varchar(10) not null,
balance money not null)

create table productinfo
(prodid int primary key identity,
pname varchar(50) not null,
price money not null)

insert into CardInfo values(1234567890123456,123,'12/23',50000)
insert into CardInfo values(1111222233334444,999,'12/21',5000)

insert into productinfo values('Mobiles',7500)
insert into productinfo values('headphone',750)
insert into productinfo values('tab',11500)
insert into productinfo values('charger',1200)