-- Buat user
CREATE USER backend_dev   WITH PASSWORD 'backend123';
CREATE USER bi_dev        WITH PASSWORD 'bi123';
CREATE USER data_engineer WITH PASSWORD 'engineer123';

-- Hak connect ke database
GRANT CONNECT ON DATABASE postgres TO backend_dev, bi_dev, data_engineer;

-- data_engineer: pemilik skema & tabel (bisa CREATE, ALTER, DROP + CRUD)
ALTER SCHEMA salam OWNER TO data_engineer;
ALTER TABLE salam.mahasiswas OWNER TO data_engineer;
ALTER SEQUENCE salam.mahasiswas_id_seq OWNER TO data_engineer;

-- backend_dev: CRUD semua tabel
GRANT USAGE ON SCHEMA salam TO backend_dev;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA salam TO backend_dev;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA salam TO backend_dev;

-- bi_dev: hanya SELECT
GRANT USAGE ON SCHEMA salam TO bi_dev;
GRANT SELECT ON ALL TABLES IN SCHEMA salam TO bi_dev;

-- Agar tabel BARU buatan data_engineer otomatis ikut hak yang sama
ALTER DEFAULT PRIVILEGES FOR ROLE data_engineer IN SCHEMA salam
  GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO backend_dev;
ALTER DEFAULT PRIVILEGES FOR ROLE data_engineer IN SCHEMA salam
  GRANT SELECT ON TABLES TO bi_dev;
ALTER DEFAULT PRIVILEGES FOR ROLE data_engineer IN SCHEMA salam
  GRANT USAGE, SELECT ON SEQUENCES TO backend_dev;