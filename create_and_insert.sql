-- DDL
-- Create Database
CREATE DATABASE db_banksystem;

-- Create Table Customer
CREATE TABLE customer (
    customer_id SERIAL PRIMARY KEY,
    nik VARCHAR(20) NOT NULL UNIQUE,
    first_name VARCHAR(225) NOT NULL,
    last_name VARCHAR(225),
    birth_place VARCHAR(225) NOT NULL,
    birth_date DATE NOT NULL,
    address_desc VARCHAR(225) NOT NULL,
    nation VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone_number VARCHAR(20) NOT NULL,
    job VARCHAR(100) NOT NULL,
    salary INTEGER NOT NULL,
    acc_numb VARCHAR(50) NOT NULL,
    create_at DATE DEFAULT NOW()
)

-- Create Table Address Type
CREATE TABLE address_type (
    address_type_id SERIAL PRIMARY KEY,
    address_type_desc VARCHAR(100) NOT NULL,
)

-- Create Table Address
CREATE TABLE address (
    address_id SERIAL PRIMARY KEY,
    FOREIGN KEY (address_desc) REFERENCES customer(address_desc),
    descript TEXT NOT NULL,
    district VARCHAR(100) NOT NULL,
    province VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL,
    post_code VARCHAR(10) NOT NULL,
    create_at DATE DEFAULT NOW()
)

-- Create Table Account Type
CREATE TABLE account_type (
    account_type_id SERIAL PRIMARY KEY,
    account_type_desc VARCHAR(100) NOT NULL
)

-- Create Table Account
CREATE TABLE account (
    account_id SERIAL PRIMARY KEY,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (account_type_id) REFERENCES account_type(account_type_id),
    password VARCHAR(100) NOT NULL,
    pin VARCHAR(6) NOT NULL,
    balance INTEGER NOT NULL,
    create_at DATE DEFAULT NOW()
)

-- Create Table Transaction Type
CREATE TABLE transactions_type (
    transactions_type_id SERIAL PRIMARY KEY,
    transactions_type_desc VARCHAR(100) NOT NULL
)

-- Create Table Transaction
CREATE TABLE transactions (
    transactions_id SERIAL PRIMARY KEY,
    FOREIGN KEY (account_id) REFERENCES account(account_id),
    transactions_numb VARCHAR(50) NOT NULL,
    FOREIGN KEY (transactions_type_id) REFERENCES transactions_type(transactions_type_id),
    amount INTEGER NOT NULL,
    date TIMESTAMP NOT NULL DEFAULT NOW(),
    note TEXT
)

-- DML
INSERT INTO address_type(address_type_id, address_type_desc) 
VALUES (1, 'As Identity Card'), (2, 'As Domicile');

INSERT INTO account_type(account_type_id, account_type_desc)
VALUES (1, 'Personal'), (2, 'Joint'), (3, 'Investation');

INSERT INTO transactions_type(transactions_type_id, transactions_type_desc)
VALUES (1, 'Deposit'), (2, 'Withdraw'), (3, 'Transfer');

INSERT INTO customer(nik, first_name, last_name, birth_place, birth_date, address_desc, nation, email, phone_number, job, salary, acc_numb)
VALUES 
(3171245678901234, 'Mira', 'Setiawan', 'JAKARTA', '1986-02-18', 'JL. Pasti Cepat A7/66', 'WNI', 'mira.setiawan@gmail.com', '082123456789', 'Pegawai Swasta', 3000000, '6013012056379834'),
(3471140209790001, 'Riyanto', '', 'GROBOGAN', '1979-09-02', 'Prm Puri Domas D-3', 'WNI', 'riyanto.se@gmail.com', '085212097471', 'Pedagang', 10000000, '6012012156370512');

INSERT INTO address(address_desc, address_type_id, descript, district, province, country, post_code)
VALUES 
('Prm Puri Domas D-3', 2, 'Prm Puri Domas D-3, Sempu RT 01/ RW 24, Wedomartani, Ngemplak', 'Gresik', 'Jawa Timur', 'Indonesia', '58152'),
('JL. Pasti Cepat A7/66', 1, 'JL. Pasti Cepat A7/66 RT 07/RW 08, Pegadungan, Kalideres', 'Jakarta', 'Jakarta', 'Indonesia', '10110');

SELECT * FROM customer WHERE nik = '3471140209790001';

UPDATE customer SET phone_number = '084326112100' WHERE nik = '3471140209790001';