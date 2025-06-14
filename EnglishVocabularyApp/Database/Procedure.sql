
-- Đăng nhập người dùng
CREATE PROCEDURE sp_DangNhapNguoiDung
    @TenDangNhap NVARCHAR(50),
    @MatKhau NVARCHAR(100)
AS
BEGIN
    SELECT MaNguoiDung, TenDangNhap, HoTen
    FROM NguoiDung
    WHERE TenDangNhap = @TenDangNhap AND MatKhau = @MatKhau;
END;

-- Ghi nhận kết quả ôn tập
CREATE PROCEDURE sp_ThemKetQua
    @MaKetQua NVARCHAR(8),
    @MaNguoiDung NVARCHAR(8),
    @MaChuDe NVARCHAR(8),
    @SoTuDung INT
AS
BEGIN
    INSERT INTO KetQua(MaKetQua, MaNguoiDung, MaChuDe, SoTuDung, NgayOnTap)
    VALUES (@MaKetQua, @MaNguoiDung, @MaChuDe, @SoTuDung, GETDATE());
END;

-- Đánh dấu từ đã học
CREATE PROCEDURE sp_DanhDauTuVung
    @MaNguoiDung NVARCHAR(8),
    @MaTuVung NVARCHAR(8)
AS
BEGIN
    IF EXISTS (SELECT * FROM TuVungDaHoc WHERE MaNguoiDung = @MaNguoiDung AND MaTuVung = @MaTuVung)
        UPDATE TuVungDaHoc
        SET TinhTrang = 1, NgayXem = GETDATE()
        WHERE MaNguoiDung = @MaNguoiDung AND MaTuVung = @MaTuVung;
    ELSE
        INSERT INTO TuVungDaHoc(MaNguoiDung, MaTuVung, TinhTrang, NgayXem)
        VALUES (@MaNguoiDung, @MaTuVung, 1, GETDATE());
END;
