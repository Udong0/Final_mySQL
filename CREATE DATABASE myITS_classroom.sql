CREATE DATABASE myITS_classroom

CREATE Table Dosen(
    NIDN char(10) NOT NULL
    dsn_nama VARCHAR(60) NOT NULL
    dsn_email VARCHAR(100) NOT NULL
    PRIMARY KEY (NIDN)
);

CREATE Table Mata_Kuliah(
    mk_id char(8) NOT NULL
    mk_nama VARCHAR(30) NOT NULL
    mk_semester VARCHAR(5) NOT NULL
    PRIMARY KEY (mk_id)
);

CREATE Table Kelas(
    kls_id char(8) NOT NULL
    kls_nama VARCHAR(30) NOT NULL
    PRIMARY KEY (kls_id)
);

CREATE Table Mahasiswa(
    nrp char(10) NOT NULL
    mhs_nama VARCHAR(60) NOT NULL
    mhs_email VARCHAR(100)  NOT NULL
    mhs_jurusan VARCHAR(30) NOT NULL
    PRIMARY KEY (nrp)
);

CREATE Table Private_File(
    pf_id char(8) NOT NULL
    pf_nama VARCHAR(30) NOT NULL
    pf_jenis VARCHAR(5) NOT NULL
    pf_tanggal_upload datetime NOT NULL
);

CREATE Table Sesi_Pertemuan(
    s_id                char(8)     NOT NULL
    s_nama              VARCHAR(30) NOT NULL
    sp_deskripsi        Text        NOT NULL
    sp_tanggal_dibuat   date        NOT NULL
    sp_file             VARCHAR(30)
    sp_tugas            VARCHAR(30)
    sp_lampiran         VARCHAR(30)
);

CREATE Table Detail_Tugas(

);

CREATE Table File(

);



