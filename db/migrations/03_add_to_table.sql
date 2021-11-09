
#once database and table have been created, insert following commands to add data.

#add data into table to correspond with the 'Create Table' SQL command - example is below:
CREATE TABLE spaces (id SERIAL PRIMARY KEY, name VARCHAR(60), description VARCHAR(60), price INTEGER, fromdate DATE, todate DATE, booking_id INTEGER, host INTEGER);

INSERT INTO spaces VALUES(1,'Blossom Villa', 'Pretty villa', 150.00, '2021-10-01', '2021-10-07', 10 , 1 );