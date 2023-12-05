CREATE DATABASE myITS_classroom

CREATE Table Dosen(
    NIDN char(10) NOT NULL,
    dsn_nama VARCHAR(60) NOT NULL,
    dsn_email VARCHAR(100) NOT NULL,
    PRIMARY KEY (NIDN)
);

CREATE Table Mahasiswa(
    nrp char(10) NOT NULL,
    mhs_nama VARCHAR(60) NOT NULL,
    mhs_email VARCHAR(100)  NOT NULL,
    mhs_jurusan VARCHAR(30) NOT NULL,
    PRIMARY KEY (nrp)
);

CREATE Table Private_File(
    pf_id char(8) NOT NULL,
    pf_nama VARCHAR(30) NOT NULL,
    pf_jenis VARCHAR(5) NOT NULL,
    pf_tanggal_upload datetime NOT NULL,  
    Mahasiswa_nrp char(10) NOT NULL,
    PRIMARY KEY (pf_id),
    FOREIGN KEY (Mahasiswa_nrp) REFERENCES Mahasiswa(nrp)
);

CREATE Table Mata_Kuliah(
    mk_id char(8) NOT NULL,
    mk_nama VARCHAR(30) NOT NULL,
    mk_semester VARCHAR(5) NOT NULL,
    Kelas_kls_ID  char(8)  NOT NULL,
    Dosen_NIDN char(10) NOT NULL,
    PRIMARY KEY (mk_id),
    FOREIGN KEY (Dosen_NIDN) REFERENCES Dosen(NIDN)
);

CREATE Table Kelas(
    kls_id char(8) NOT NULL,
    kls_nama VARCHAR(30) NOT NULL,
    Mata_Kuliah_mk_ID char(8) NOT NULL,
    PRIMARY KEY (kls_id),
    FOREIGN KEY (Mata_Kuliah_mk_ID) REFERENCES Mata_Kuliah(mk_id)
);

CREATE Table Sesi_Pertemuan(
    sp_id               char(8)     NOT NULL,
    sp_nama             VARCHAR(30) NOT NULL,
    sp_deskripsi        Text,
    sp_tanggal_dibuat   date        NOT NULL,
    sp_file             VARCHAR(30),
    sp_tugas            VARCHAR(30),
    sp_lampiran         VARCHAR(30),
    Kelas_kls_ID        char(8),
    PRIMARY KEY (sp_id),
    FOREIGN KEY (Kelas_kls_ID) REFERENCES Kelas(kls_id)
);

CREATE Table Files(
    f_id    char(10) NOT NULL,
    f_nama int NOT NULL,
    f_jenis VARCHAR(5) NOT NULL,
    f_tanggal_upload datetime NOT NULL,
    Sesi_Pertemuan_sp_id    char(8) NOT NULL,
    PRIMARY KEY (f_id),
    FOREIGN KEY (Sesi_Pertemuan_sp_id) REFERENCES Sesi_Pertemuan(sp_id)
);

CREATE Table Mahasiswa_Kelas(
    Mahasiswa_nrp char(10) NOT NULL,
    Kelas_kls_ID char(8) NOT NULL,
    PRIMARY KEY (Mahasiswa_nrp, Kelas_kls_ID),
    FOREIGN KEY (Mahasiswa_nrp) REFERENCES Mahasiswa(nrp),
    FOREIGN KEY (Kelas_kls_ID) REFERENCES Kelas(kls_id)
);

CREATE Table Tugas(
    t_id                            char(8) NOT NULL,
    t_nama                          VARCHAR(30) NOT NULL,
    t_deskripsi                     Text ,
    t_tanggal_dibuat                datetime NOT NULL,
    t_deadline_tugas                datetime ,
    t_file_lampiran                 integer ,
    t_status_tugas                  VARCHAR(10) ,
    t_nilai_tugas                   integer ,    
    t_tanggal_pengumpulan_terakhir  datetime ,
    t_file_dikumpulkan              VARCHAR(30) ,
    t_comment                       VARCHAR(30) ,
    Sesi_Pertemuan_sp_ID             char(8)     NOT NULL,
    PRIMARY KEY(t_id),
    FOREIGN KEY(Sesi_Pertemuan_sp_ID) References Sesi_Pertemuan(sp_ID)
);

COMMIT;
