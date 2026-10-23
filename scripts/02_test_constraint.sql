-- 1. Data valid (BERHASIL)
INSERT INTO salam.mahasiswas (nim, nama, email, ipk, semester)
VALUES ('1247050102', 'Azkiya Fauzan Sri Hidayat', 'azkiyafauzan@gmail.com', 3.54, 5);

-- 2. Melanggar PRIMARY KEY (GAGAL)
INSERT INTO salam.mahasiswas (id, nim, nama, ipk, semester)
VALUES (1, '999', 'Duplikat ID', 3.0, 1);

-- 3. Melanggar UNIQUE (GAGAL)
INSERT INTO salam.mahasiswas (nim, nama, ipk, semester)
VALUES ('1247050102', 'NIM Kembar', 3.0, 1);

-- 4. Melanggar CHECK ipk (GAGAL)
INSERT INTO salam.mahasiswas (nim, nama, ipk, semester)
VALUES ('111', 'IPK Ngawur', 5.5, 1);

-- 5. Melanggar NOT NULL (GAGAL)
INSERT INTO salam.mahasiswas (nim, ipk) VALUES ('222', 3.0);