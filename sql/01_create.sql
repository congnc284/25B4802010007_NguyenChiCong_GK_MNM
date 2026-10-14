CREATE DATABASE gk_thuvien;

-- Bảng the_loai
CREATE TABLE the_loai (
    ma_tl VARCHAR(5) PRIMARY KEY,
    ten_tl VARCHAR(50) NOT NULL UNIQUE
);

-- Bảng doc_gia
CREATE TABLE doc_gia (
    ma_dg VARCHAR(10) PRIMARY KEY,
    ho_ten VARCHAR(80) NOT NULL,
    khoa VARCHAR(40) NULL,
    ngay_dang_ky DATE NOT NULL DEFAULT CURRENT_DATE
);

-- Bảng sach
CREATE TABLE sach (
    ma_sach VARCHAR(10) PRIMARY KEY,
    ten_sach VARCHAR(120) NOT NULL,
    tac_gia VARCHAR(80) NULL,
    nam_xb INTEGER CHECK (nam_xb >= 1900),
    so_ban INTEGER NOT NULL DEFAULT 1 CHECK (so_ban >= 0),
    ma_tl VARCHAR(5) NOT NULL,
    FOREIGN KEY (ma_tl) REFERENCES the_loai(ma_tl)
);

-- Bảng muon_sach
CREATE TABLE muon_sach (
    ma_dg VARCHAR(10) NOT NULL,
    ma_sach VARCHAR(10) NOT NULL,
    ngay_muon DATE NOT NULL,
    ngay_tra DATE NULL,
    CHECK (ngay_tra IS NULL OR ngay_tra >= ngay_muon),
    PRIMARY KEY (ma_dg, ma_sach, ngay_muon),
    FOREIGN KEY (ma_dg) REFERENCES doc_gia(ma_dg),
    FOREIGN KEY (ma_sach) REFERENCES sach(ma_sach)
);