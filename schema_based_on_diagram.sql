CREATE DATABASE human_clinic;

create table patients (
id SERIAL PRIMARY KEY,
name VARCHAR(50),
date_of_birth DATE
);

create table treatments (
id SERIAL PRIMARY KEY,
type VARCHAR,
name VARCHAR(50)
);

create table invoices (
id SERIAL PRIMARY KEY,
total_amoung DECIMAL,
generated_at TIMESTAMP,
payed_at TIMESTAMP,
medical_history_id INT
);

create table medical_histories (
  id SERIAL PRIMARY KEY,
  admitted_at TIMESTAMP,
  patient_id INT,
  status VARCHAR
);

create table invoice_items (
  id SERIAL PRIMARY KEY,
  unit_price DECIMAL,
  quantity INT,
  total_price DECIMAL,
  invoice_id INT,
  treatment_id INT
);


alter table medical_histories ADD CONSTRAINT fk_patient foreign key(patient_id) references patients(id);

alter table invoices add CONSTRAINT fk_medical_history foreign key(medical_history_id) references medical_histories(id);

alter table invoice_items add CONSTRAINT fk_invoice_id foreign key(invoice_id) references invoices(id);

alter table invoice_items add CONSTRAINT fk_treatment_id foreign key(treatment_id) references treatments(id);

create table prescribed_treatments (
  id INT,
  treatment_id INT,
  medical_history INT,
  PRIMARY KEY (treatment_id, medical_history)
);

alter table prescribed_treatments add CONSTRAINT fk_treatment_id foreign key(treatment_id) references treatments(id);

alter table prescribed_treatments add CONSTRAINT fk_medical_history foreign key(medical_history) references medical_histories(id);