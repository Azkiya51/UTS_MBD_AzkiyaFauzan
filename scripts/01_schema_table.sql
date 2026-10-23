CREATE SCHEMA IF NOT EXISTS salam;

CREATE TABLE salam.mahasiswas (
    id          SERIAL PRIMARY KEY,
    nim         VARCHAR(15)  NOT NULL UNIQUE,
    nama        VARCHAR(100) NOT NULL,
    email       VARCHAR(100) UNIQUE,
    ipk         NUMERIC(3,2) CHECK (ipk >= 0 AND ipk <= 4),
    semester    INT CHECK (semester BETWEEN 1 AND 14),
    created_at  TIMESTAMP DEFAULT NOW(),
    CONSTRAINT chk_email_format CHECK (email LIKE '%@%')
);