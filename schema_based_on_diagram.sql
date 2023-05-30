CREATE DATABASE clinic;
 -- create table patients 
 CREATE TABLE patients(id INTEGER PRIMARY KEY, name VARCHAR(255) NOT NULL, date_of_birth DATE NOT NULL);
-- create table medical_histories 
CREATE TABLE medical_histories(id INTEGER PRIMARY KEY, admitted_at TIMESTAMP, patient_id INTEGER REFERENCES patients(id), status VARCHAR(255));
-- create table invoices 
CREATE TABLE invoices(id INTEGER PRIMARY KEY, total_amount DECIMAL, generated_at TIMESTAMP, payed_at TIMESTAMP, medical_history_id INTEGER REFERENCES medical_histories(id)); 
--create table treatments
CREATE TABLE treatments(id INTEGER  medical_histories(id), type VARCHAR(255), name VARCHAR(255));

-- create table invoice_items
CREATE TABLE invoice_items(id INTEGER PRIMARY KEY, unit_price DECIMAL, quantity INTEGER, total_price DECIMAL, invoice_id INTEGER, treatment_id INTEGER REFERENCES treatments(id));
