create table if not exists employee(
	id serial primary key,
	name varchar(50) not null
	);
	
create table if not exists division(
	id serial primary key,
	name varchar(50) not null unique,
	chief integer references employee(id)
	);
	
create table if not exists employee_division(
	id_employee integer references employee(id),
	id_division integer references division(id),
	constraint employee_division_pk primary key (id_employee, id_division)
	);