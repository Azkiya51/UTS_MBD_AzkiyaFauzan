-- ===== bi_dev: hanya SELECT =====
SET ROLE bi_dev;
SELECT * FROM salam.mahasiswas;                                  -- BERHASIL
INSERT INTO salam.mahasiswas (nim,nama,ipk,semester)
  VALUES ('333','Coba BI',3,1);                                  -- GAGAL (permission denied)
RESET ROLE;

-- ===== backend_dev: CRUD, tapi tidak boleh DDL =====
SET ROLE backend_dev;
INSERT INTO salam.mahasiswas (nim,nama,ipk,semester)
  VALUES ('444','Coba Backend',3.2,2);                           -- BERHASIL
UPDATE salam.mahasiswas SET ipk = 3.5 WHERE nim = '444';         -- BERHASIL
DELETE FROM salam.mahasiswas WHERE nim = '444';                  -- BERHASIL
CREATE TABLE salam.tes (id INT);                                 -- GAGAL
DROP TABLE salam.mahasiswas;                                     -- GAGAL
RESET ROLE;

-- ===== data_engineer: DDL + CRUD =====
SET ROLE data_engineer;
CREATE TABLE salam.tes (id INT);                                 -- BERHASIL
ALTER TABLE salam.tes ADD COLUMN ket TEXT;                       -- BERHASIL
INSERT INTO salam.tes (id) VALUES (1);                           -- BERHASIL
DROP TABLE salam.tes;                                            -- BERHASIL
RESET ROLE;