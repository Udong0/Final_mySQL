CREATE DATABASE myITS_classroom;

CREATE TABLE Dosen(
    NIDN         CHAR(10) NOT NULL,
    dsn_nama     VARCHAR(60) NOT NULL,
    dsn_email    VARCHAR(100) NOT NULL,
    PRIMARY KEY (NIDN)
);

CREATE TABLE Mahasiswa(
    nrp          CHAR(10) NOT NULL,
    mhs_nama     VARCHAR(60) NOT NULL,
    mhs_email    VARCHAR(100)  NOT NULL,
    mhs_jurusan  VARCHAR(30) NOT NULL,
    PRIMARY KEY (nrp)
);

CREATE TABLE Mata_Kuliah(
    mk_id       CHAR(8) NOT NULL,
    mk_nama     VARCHAR(30) NOT NULL,
    mk_semester VARCHAR(11) NOT NULL,
    PRIMARY KEY (mk_id)
);

CREATE TABLE Kelas(
    kls_id               CHAR(8) NOT NULL,
    kls_nama             VARCHAR(30) NOT NULL,
    kls_semester         VARCHAR(5) NOT NULL,
    kls_tahun_ajar       VARCHAR(10) NOT NULL,
    Mata_Kuliah_mk_ID    CHAR(8) NOT NULL,   
    PRIMARY KEY (kls_id),
    FOREIGN KEY (Mata_Kuliah_mk_ID) REFERENCES Mata_Kuliah(mk_id)
);

CREATE TABLE Sesi_Pertemuan(
    sp_id               CHAR(8)     NOT NULL,
    sp_nama             VARCHAR(30) NOT NULL,
    sp_deskripsi        TEXT,
    sp_tanggal_dibuat   DATE        NOT NULL,
    Kelas_kls_ID        CHAR(8),
    PRIMARY KEY (sp_id),
    FOREIGN KEY (Kelas_kls_ID) REFERENCES Kelas(kls_id)
);

CREATE TABLE File(
    f_id                    CHAR(10) NOT NULL,
    f_nama                  VARCHAR(255) NOT NULL,
    f_jenis                 VARCHAR(5) NOT NULL,
    f_tanggal_upload        DATETIME NOT NULL,
    Sesi_Pertemuan_sp_id     CHAR(8) NOT NULL,
    PRIMARY KEY (f_id),
    FOREIGN KEY (Sesi_Pertemuan_sp_id) REFERENCES Sesi_Pertemuan(sp_id)
);

CREATE TABLE Kelas_Mahasiswa(
    km_Mahasiswa_nrp    CHAR(10) NOT NULL,
    km_Kelas_kls_ID     CHAR(8) NOT NULL,
    PRIMARY KEY (km_Mahasiswa_nrp, km_Kelas_kls_ID),
    FOREIGN KEY (km_Mahasiswa_nrp) REFERENCES Mahasiswa(nrp),
    FOREIGN KEY (km_Kelas_kls_ID) REFERENCES Kelas(kls_id)
);

CREATE TABLE Kelas_Dosen(
    kd_Dosen_NIDN      CHAR(10) NOT NULL,
    kd_Kelas_kls_ID    CHAR(8) NOT NULL,
    PRIMARY KEY (kd_Dosen_NIDN, kd_Kelas_kls_ID),
    FOREIGN KEY (kd_Dosen_NIDN) REFERENCES Dosen(NIDN),
    FOREIGN KEY (kd_Kelas_kls_ID) REFERENCES Kelas(kls_id)
);

CREATE TABLE Tugas(
    t_id                            CHAR(8) NOT NULL,
    t_nama                          VARCHAR(30) NOT NULL,
    t_deskripsi                     TEXT,
    t_tanggal_dibuat                DATETIME NOT NULL,
    t_deadline_tugas                DATETIME,
    t_file_lampiran                 VARCHAR(255),
    Sesi_Pertemuan_sp_ID            CHAR(8)     NOT NULL,
    PRIMARY KEY (t_id),
    FOREIGN KEY (Sesi_Pertemuan_sp_ID) REFERENCES Sesi_Pertemuan(sp_ID)
);

CREATE TABLE Pengumpulan(
    p_id                            CHAR(8) NOT NULL,
    p_nama                          VARCHAR(60) NOT NULL,
    p_deskripsi                     TEXT,
    p_deadline_tugas                DATETIME,
    p_file_lampiran                 VARCHAR(255),
    p_status_tugas                  VARCHAR(30) NOT NULL,
    p_nilai_tugas                   INTEGER NOT NULL,    
    p_tanggal_pengumpulan_terakhir  DATETIME,
    p_file_dikumpulkan              VARCHAR(255),
    p_comment                       VARCHAR(255),
    Mahasiswa_nrp                   CHAR(10) NOT NULL,
    Tugas_t_id                            CHAR(8) NOT NULL,
    PRIMARY KEY (p_id),
    FOREIGN KEY (tugas_t_id) REFERENCES Tugas(t_id),
    FOREIGN KEY (Mahasiswa_nrp) REFERENCES Mahasiswa(nrp)
    FOREIGN KEY (Tugas_t_id) REFERENCES Tugas(t_id)
);

COMMIT;
