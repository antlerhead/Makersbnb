
# Use psql to start pregresql and from there create the databases and tables.
# The BIT field is used because there is no boolean in SQL. So 1 is true and 0 is false.
# I wasnt sure about the format for fields using the ID (PRIMAY KEYs) of the other rows in tables, so I used INTEGER as the SERIAL command creates integers.

psql
CREATE DATABASE makersbnb;
\c makersbnb
CREATE TABLE spaces (id SERIAL PRIMARY KEY, name VARCHAR(60), description VARCHAR(60), price INTEGER, fromdate DATE, todate DATE, booking INTEGER, host INTEGER);
CREATE TABLE account (id SERIAL PRIMARY KEY, name VARCHAR(60), login VARCHAR(60), password VARCHAR(60), host BIT, signedin BIT, booking INTEGER);
CREATE TABLE booking (id SERIAL PRIMARY KEY, space INTEGER, booked_date DATE, resident INTEGER, requested BIT, confirmed BIT);

CREATE DATABASE makersbnb_test;
\c makersbnb_test
CREATE TABLE spaces (id SERIAL PRIMARY KEY, name VARCHAR(60), description VARCHAR(60), price INTEGER, fromdate DATE, todate DATE, booking INTEGER, host INTEGER);
CREATE TABLE account (id SERIAL PRIMARY KEY, name VARCHAR(60), login VARCHAR(60), password VARCHAR(60), host BIT, signedin BIT, booking INTEGER);
CREATE TABLE booking (id SERIAL PRIMARY KEY, space INTEGER, booked_date DATE, resident INTEGER, requested BIT, confirmed BIT);

#You can then use the queries to check for the tables:

SELECT * FROM spaces
SELECT * FROM account
SELECT * FROM booking
