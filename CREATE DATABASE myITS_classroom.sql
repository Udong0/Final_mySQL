CREATE DATABASE myITS_classroom

CREATE Table Dosen(
    NIDN         char(10) NOT NULL,
    dsn_nama     VARCHAR(60) NOT NULL,
    dsn_email    VARCHAR(100) NOT NULL,
    PRIMARY KEY (NIDN)
);

CREATE Table Mahasiswa(
    nrp          char(10) NOT NULL,
    mhs_nama     VARCHAR(60) NOT NULL,
    mhs_email    VARCHAR(100)  NOT NULL,
    mhs_jurusan  VARCHAR(30) NOT NULL,
    PRIMARY KEY (nrp)
);

CREATE Table Mata_Kuliah(
    mk_id       char(8) NOT NULL,
    mk_nama     VARCHAR(30) NOT NULL,
    mk_semester VARCHAR(5) NOT NULL,
    PRIMARY KEY (mk_id)
);

CREATE Table Kelas(
    kls_id               char(8) NOT NULL,
    kls_nama             VARCHAR(30) NOT NULL,
    kls_semester         varchar(5) NOT NULL,
    kls_tahun_ajar       varchar(10) NOT NULL,
    Mata_Kuliah_mk_ID    char(8) NOT NULL,   
    PRIMARY KEY (kls_id),
    FOREIGN KEY (Mata_Kuliah_mk_ID) REFERENCES Mata_Kuliah(mk_id)
);

CREATE Table Sesi_Pertemuan(
    sp_id               char(8)     NOT NULL,
    sp_nama             VARCHAR(30) NOT NULL,
    sp_deskripsi        Text,
    sp_tanggal_dibuat   date        NOT NULL,
    Kelas_kls_ID        char(8),
    PRIMARY KEY (sp_id),
    FOREIGN KEY (Kelas_kls_ID) REFERENCES Kelas(kls_id)
);

CREATE Table File(
    f_id                    char(10) NOT NULL,
    f_nama                  int NOT NULL,
    f_jenis                 VARCHAR(5) NOT NULL,
    f_tanggal_upload        datetime NOT NULL,
    Sesi_Pertemuan_sp_id     char(8) NOT NULL,
    PRIMARY KEY (f_id),
    FOREIGN KEY (Sesi_Pertemuan_sp_id) REFERENCES Sesi_Pertemuan(sp_id)
);

CREATE Table Kelas_Mahasiswa(
    km_Mahasiswa_nrp    char(10) NOT NULL,
    km_Kelas_kls_ID     char(8) NOT NULL,
    PRIMARY KEY (km_Mahasiswa_nrp, km_Kelas_kls_ID),
    FOREIGN KEY (km_Mahasiswa_nrp) REFERENCES Mahasiswa(nrp),
    FOREIGN KEY (km_Kelas_kls_ID) REFERENCES Kelas(kls_id)
);

CREATE Table Kelas_Dosen(
    kd_Dosen_NIDN      char(10) NOT NULL,
    kd_Kelas_kls_ID    char(8) NOT NULL,
    PRIMARY KEY (kd_Dosen_NIDN, kd_Kelas_kls_ID),
    FOREIGN KEY (kd_Dosen_NIDN) REFERENCES Dosen(NIDN),
    FOREIGN KEY (kd_Kelas_kls_ID) REFERENCES Kelas(kls_id)
);

CREATE Table Tugas(
    t_id                            char(8) NOT NULL,
    t_nama                          VARCHAR(30) NOT NULL,
    t_deskripsi                     Text,
    t_tanggal_dibuat                datetime NOT NULL,
    t_deadline_tugas                datetime,
    t_file_lampiran                 integer,
    Sesi_Pertemuan_sp_ID            char(8)     NOT NULL,
    PRIMARY KEY (t_id),
    FOREIGN KEY (Sesi_Pertemuan_sp_ID) REFERENCES Sesi_Pertemuan(sp_ID)
);

CREATE Table Pengumpulan(
    p_id                            char(8) NOT NULL,
    p_nama                          varchar(30) NOT NULL,
    p_deskripsi                     Text,
    p_deadline_tugas                datetime,
    p_file_lampiran                 integer,
    p_status_tugas                  VARCHAR(10) NOT NULL,
    p_nilai_tugas                   integer NOT NULL,    
    p_tanggal_pengumpulan_terakhir  datetime,
    p_file_dikumpulkan              VARCHAR(30),
    p_comment                       VARCHAR(255),
    Dosen_NIDN                      char(10) NOT NULL,
    Mahasiswa_nrp                   char(10) NOT NULL,
    PRIMARY KEY (p_id),
    FOREIGN KEY (Dosen_NIDN) REFERENCES Dosen(NIDN),
    FOREIGN KEY (Mahasiswa_nrp) REFERENCES Mahasiswa(nrp)
);

COMMIT;
