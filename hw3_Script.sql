create table if not exists genre(
	id serial primary key,
	name varchar(30) not null unique
	);

create table if not exists executor(
	id serial primary key,
	name varchar(50) not null
	);

create table if not exists album(
	id serial primary key,
	name varchar(50) not null unique,
	year_of_release integer check(year_of_release > 0)
	);

create table if not exists track(
	id serial primary key,
	name varchar(100) not null unique,
	duration integer check(duration > 0),
	album_id integer references album(id)
	);

create table if not exists collection(
	id serial primary key,
	name varchar(50) not null unique,
	year_of_release integer check(year_of_release > 0)
	);

create table if not exists genre_exeuter(
	genre_id integer references genre(id),
	executor_id integer references executor(id),
	constraint genre_exeuter_pk primary key (genre_id, executor_id)
	);

create table if not exists executor_album(
	executor_id integer references executor(id),
	album_id integer references album(id),
	constraint executor_album_pk primary key (executor_id, album_id)
	);
	
create table if not exists collection_track(
	collection_id integer references collection(id),
	track_id integer references track(id),
	constraint collection_track_pk primary key (collection_id, track_id)
	);
