CREATE DATABASE IF NOT EXISTS quan_ly_phong_khamm;


CREATE TABLE phong_kham(
    ma_pk INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    ten_pk VARCHAR(100) NOT NULL,
    dia_chi VARCHAR(150) NOT NULL,
    sđt VARCHAR(10) NOT NULL CHECK(LENGTH(sđt) = 10)
);

CREATE TABLE bac_si(
    ma_bs INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    ho_ten VARCHAR(150) NOT NULL,
    chuyen_khoa VARCHAR(150) NOT NULL,
    kinh_nghiem INT NOT NULL,
    ma_pk INT,
    FOREIGN KEY (ma_pk) REFERENCES phong_kham(ma_pk)
);
CREATE TABLE lich_lam_viec(
gio_bat_dau TIME NOT NULL,
    gio_ket_thuc TIME NOT NULL,
    ngay DATE NOT NULL,
    ma_lich_lam_viec INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    ma_bs INT,
    FOREIGN KEY(ma_bs) REFERENCES bac_si(ma_bs)
);
CREATE TABLE benh_nhan(
    tai_khoan VARCHAR(50) NOT NULL,
    mat_khau VARCHAR(50) NOT NULL,
    ho_ten VARCHAR(150) NOT NULL,
    sđt VARCHAR(10) NOT NULL CHECK(LENGTH(sđt) = 10),
    gioi_tinh VARCHAR(20),
    ma_bn INT PRIMARY KEY AUTO_INCREMENT NOT NULL
);
CREATE TABLE lich_hen(
    ma_lh INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    trang_thai VARCHAR(40) NOT NULL,
    ngay_dat DATE NOT NULL,
    ma_bn INT,
    -- Sửa: Thêm cột ma_bs và khóa ngoại vào đây
    ma_bs INT, 
    FOREIGN KEY(ma_bn) REFERENCES benh_nhan(ma_bn),
    FOREIGN KEY(ma_bs) REFERENCES bac_si(ma_bs)
);
CREATE TABLE ho_so_benh_nhan(
    don_thuoc VARCHAR(200),
    -- Sửa: 'ngay_kham' nên là DATETIME (ngày giờ) hoặc DATE (ngày) chứ không phải TIME
    ngay_kham DATETIME NOT NULL,
    ma_hs INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    chuan_doan VARCHAR(250) NOT NULL,
    ma_lh INT,
    FOREIGN KEY (ma_lh) REFERENCES lich_hen(ma_lh)
    );
    