DROP TABLE students;

CREATE TABLE students (
  id serial8 primary key,
  first_name varchar(255),
  second_name varchar(255),
  house varchar(255),
  age int2
);