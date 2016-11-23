DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS houses;

CREATE TABLE houses(
id serial8 primary key,
name varchar(255),
logo varchar(255)
);

CREATE TABLE students (
  id serial8 primary key,
  first_name varchar(255),
  second_name varchar(255),
  house varchar(255),
  age int2
);
