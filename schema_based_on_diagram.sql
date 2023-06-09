CREATE DATABASE clinic;

 -- create table patients 
 CREATE TABLE patients(id INTEGER PRIMARY KEY, name VARCHAR(255) NOT NULL, date_of_birth DATE NOT NULL);

-- create table medical_histories 
CREATE TABLE medical_histories(id INTEGER PRIMARY KEY, admitted_at TIMESTAMP, patient_id INTEGER REFERENCES patients(id), status VARCHAR(255), CONSTRAINT fk_patient);

-- create table invoices 
CREATE TABLE invoices(id INTEGER PRIMARY KEY, total_amount DECIMAL, generated_at TIMESTAMP, payed_at TIMESTAMP, medical_history_id INTEGER REFERENCES medical_histories(id), CONSTRAINT fk_medical_history); 

--create table treatments
CREATE TABLE treatments(id INTEGER  medical_histories(id), type VARCHAR(255), name VARCHAR(255));

-- create table invoice_items
CREATE TABLE invoice_items(id INTEGER PRIMARY KEY, unit_price DECIMAL, quantity INTEGER, total_price DECIMAL, invoice_id INTEGER, treatment_id INTEGER REFERENCES treatments(id), CONSTRAINT fk_treatments);

-- create table medical_histories_has_treatments joint table
CREATE TABLE medical_histories_has_treatments (
  treatment_id INTEGER REFERENCES treatments(id),
  medical_history_id INTEGER REFERENCES medical_histories(id),
  PRIMARY KEY(treatment_id, medical_history_id),
  CONSTRAINT fk_treatment,
  CONSTRAINT fk_medical_history
)

-- create indexes
CREATE INDEX ON medical_histories(patient_id);
CREATE INDEX ON invoices(medical_history_id);
CREATE INDEX ON invoice_items(invoice_id);
CREATE INDEX ON invoice_items(treatment_id);
CREATE INDEX ON medical_histories_has_treatments(medical_history_id);
CREATE INDEX ON medical_histories_has_treatments(treatment_id);