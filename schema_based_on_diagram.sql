CREATE DATABASE clinic;
 -- create table patients 
 CREATE TABLE patients( id INTEGER PRIMARY KEY, name VARCHAR(255) NOT NULL, date_of_birth DATE NOT NULL, );
-- create table medical_histories 
CREATE TABLE medical_histories( id INTEGER PRIMARY KEY, admitted_at TIMESTAMP, patient_id INTEGER REFERENCES patients(id), status VARCHAR(255), );
-- create table invoices 
CREATE TABLE invoices( id INTEGER PRIMARY KEY, total_amount DECIMAL, generated_at TIMESTAMP, payed_at TIMESTAMP, medical_history_id INTEGER REFERENCES medical_histories(id), ); 
