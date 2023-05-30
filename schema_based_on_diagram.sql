CREATE DATABASE clinic;
 -- create table patients 
 CREATE TABLE patients( id INTEGER PRIMARY KEY, name VARCHAR(255) NOT NULL, date_of_birth DATE NOT NULL, );
-- create table medical_histories 
CREATE TABLE medical_histories( id INTEGER PRIMARY KEY, admitted_at TIMESTAMP, patient_id INTEGER REFERENCES patients(id), status VARCHAR(255), ); 