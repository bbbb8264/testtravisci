CREATE USER 'adder'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON *.* TO 'adder'@'%';
FLUSH PRIVILEGES;
create database counter;
use counter;
create table counter(
	counter int(6)
);
insert into counter values (1);
update counter set counter=2