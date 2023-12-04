CREATE DATABASE myITS_classroom

CREATE Table Dosen(
    NIDN char(10) NOT NULL,
    dsn_nama VARCHAR(60) NOT NULL,
    dsn_email VARCHAR(100) NOT NULL,
    PRIMARY KEY (NIDN)
);


CREATE Table Private_File(
    pf_id char(8) NOT NULL,
    pf_nama VARCHAR(30) NOT NULL,
    pf_jenis VARCHAR(5) NOT NULL,
    pf_tanggal_upload datetime NOT NULL,
    PRIMARY KEY (pf_id)
);

CREATE Table Mahasiswa(
    mhs_nrp char(10) NOT NULL,
    mhs_nama VARCHAR(60) NOT NULL,
    mhs_email VARCHAR(100)  NOT NULL,
    mhs_jurusan VARCHAR(30) NOT NULL,
    Private_File_pf_ID char(8) NOT NULL,
    PRIMARY KEY (nrp),
    FOREIGN KEY (Private_File_pf_ID) REFERENCES Private_File(pf_id)
);

CREATE Table Files(
    f_id char(10) NOT NULL,
    f_nama int NOT NULL,
    f_jenis VARCHAR(5) NOT NULL,
    f_tanggal_upload datetime NOT NULL,
    PRIMARY KEY (f_id)
);

CREATE Table Sesi_Pertemuan(
    s_id                char(8)     NOT NULL,
    s_nama              VARCHAR(30) NOT NULL,
    sp_deskripsi        Text,
    sp_tanggal_dibuat   date        NOT NULL,
    sp_file             VARCHAR(30),
    sp_tugas            VARCHAR(30),
    sp_lampiran         VARCHAR(30),
    Files_f_ID           char(10)    NOT NULL,
    PRIMARY KEY (s_id),
    FOREIGN KEY (Files_f_ID) REFERENCES Files(f_id)
);

CREATE Table Kelas(
    kls_id char(8) NOT NULL,
    kls_nama VARCHAR(30) NOT NULL,
    Sesi_Pertemuan_s_ID char(8) NOT NULL,
    PRIMARY KEY (kls_id),
    FOREIGN KEY (Sesi_Pertemuan_s_ID) REFERENCES Sesi_Pertemuan(s_id)
);

CREATE Table Mahasiswa_Kelas(
    Mahasiswa_nrp char(10) NOT NULL,
    Kelas_kls_ID char(8) NOT NULL,
    FOREIGN KEY (Mahasiswa_nrp) REFERENCES Mahasiswa(mhs_nrp),
    FOREIGN KEY (Kelas_kls_ID) REFERENCES Kelas(kls_id)
);

CREATE Table Mata_Kuliah(
    mk_id char(8) NOT NULL,
    mk_nama VARCHAR(30) NOT NULL,
    mk_semester VARCHAR(5) NOT NULL,
    Kelas_kls_ID  char(8)  NOT NULL,
    PRIMARY KEY (mk_id),
    FOREIGN KEY (Kelas_kls_ID) REFERENCES Kelas(kls_id)
);

CREATE Table Mata_Kuliah_Dosen(
    Mata_Kuliah_mk_ID   char(8) NOT NULL,
    Dosen_NIDN          char(10) NOT NULL,
    FOREIGN KEY (Mata_Kuliah_mk_ID) REFERENCES Mata_Kuliah(mk_id),
    FOREIGN KEY (Dosen_NIDN) REFERENCES Dosen(NIDN)
);

CREATE Table Detail_Tugas(
    t_id                            char(8) NOT NULL,
    t_nama                          VARCHAR(30) NOT NULL,
    t_deskripsi                     Text NOT NULL,
    t_tanggal_dibuat                datetime NOT NULL,
    t_deadline_tugas                datetime NOT NULL,
    t_file_lampiran                 integer NOT NULL,
    t_status_tugas                  VARCHAR(10) NOT NULL,
    t_nilai_tugas                   integer NOT NULL,    
    t_tanggal_pengumpulan_terakhir  datetime NOT NULL,
    t_file_dikumpulkan              VARCHAR(30) NOT NULL,
    t_comment                       VARCHAR(30) NOT NULL,
    PRIMARY KEY(t_id)
);

COMMIT;





