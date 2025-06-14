-- Tạo database và chọn sử dụng
CREATE DATABASE EnglishVocabularyApp;
GO
USE EnglishVocabularyApp;
GO

-- Bảng người dùng
CREATE TABLE NguoiDung (
    MaNguoiDung NVARCHAR(8) PRIMARY KEY,            -- USR00001
    TenDangNhap NVARCHAR(50) NOT NULL UNIQUE,
    MatKhau NVARCHAR(100) NOT NULL,           
    HoTen NVARCHAR(100),
    Email NVARCHAR(100),
    NgayTao DATETIME DEFAULT GETDATE()
)

-- Bảng quản trị viên 
CREATE TABLE QuanTriVien (
    MaAdmin NVARCHAR(8) PRIMARY KEY,           -- VD: ADM000001
    TenDangNhap NVARCHAR(50) NOT NULL UNIQUE,
    MatKhau NVARCHAR(100) NOT NULL,
    HoTen NVARCHAR(100),
    Email NVARCHAR(100),
    VaiTro NVARCHAR(50) NOT NULL CHECK (VaiTro IN ('QuanLy', 'QuanTriVien')),
    NgayTao DATETIME DEFAULT GETDATE()
)

-- Bảng chủ đề từ vựng
CREATE TABLE ChuDe (
    MaChuDe NVARCHAR(8) PRIMARY KEY,           -- TOP00001
    TenChuDe NVARCHAR(100) NOT NULL UNIQUE,
    MoTa NVARCHAR(200),
    MaAdminTao NVARCHAR(8) NOT NULL,            -- Admin tạo chủ đề
    NgayTao DATETIME DEFAULT GETDATE(),
    NgayCapNhat DATETIME,
    MaAdminCapNhat NVARCHAR(8) NULL,           -- Admin sửa gần nhất
    FOREIGN KEY (MaAdminTao) REFERENCES QuanTriVien(MaAdmin),
    FOREIGN KEY (MaAdminCapNhat) REFERENCES QuanTriVien(MaAdmin)
)

-- Bảng từ vựng
CREATE TABLE TuVung (
    MaTuVung NVARCHAR(8) PRIMARY KEY,            -- WRD00001
    TuVung NVARCHAR(100) NOT NULL,
    Nghia NVARCHAR(200),
    PhienAm NVARCHAR(100),
    ViDu NVARCHAR(MAX),
    MaChuDe NVARCHAR(8),
    MaAdminTao NVARCHAR(8) NOT NULL,            -- Admin tạo từ
    NgayTao DATETIME DEFAULT GETDATE(),
    NgayCapNhat DATETIME,
    MaAdminCapNhat NVARCHAR(8) NULL,           -- Admin sửa gần nhất
    FOREIGN KEY (MaChuDe) REFERENCES ChuDe(MaChuDe),
    FOREIGN KEY (MaAdminTao) REFERENCES QuanTriVien(MaAdmin),
    FOREIGN KEY (MaAdminCapNhat) REFERENCES QuanTriVien(MaAdmin)
)
-- Bảng file âm thanh
CREATE TABLE AmThanh (
    MaAudio NVARCHAR(8) PRIMARY KEY,            -- AUD00001
    MaTuVung NVARCHAR(8) NOT NULL,
    AudioPath NVARCHAR(255) NOT NULL,
    FOREIGN KEY (MaTuVung) REFERENCES TuVung(MaTuVung)
)
-- Bảng ghi nhớ từ vựng của người dùng
CREATE TABLE TuVungDaHoc (
    MaNguoiDung NVARCHAR(8),
    MaTuVung NVARCHAR(8),
    TinhTrang BIT DEFAULT 0,
    NgayXem DATETIME,
    FOREIGN KEY (MaNguoiDung) REFERENCES NguoiDung(MaNguoiDung),
    FOREIGN KEY (MaTuVung) REFERENCES TuVung(MaTuVung)
)

-- Kết quả trò chơi
CREATE TABLE KetQua (
	MaKetQua NVARCHAR(8) PRIMARY KEY,        -- Ví dụ: RST00001
    MaNguoiDung NVARCHAR(8),
    MaChuDe NVARCHAR(8),
    SoTuDung INT,                           -- Số câu đúng
    NgayOnTap DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (MaNguoiDung) REFERENCES NguoiDung(MaNguoiDung),
    FOREIGN KEY (MaChuDe) REFERENCES ChuDe(MaChuDe)
)
