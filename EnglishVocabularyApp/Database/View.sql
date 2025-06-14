
-- View: Danh sách từ vựng kèm chủ đề
CREATE VIEW view_TuVungChiTiet AS
SELECT 
    tv.MaTuVung,
    tv.TuVung,
    tv.Nghia,
    tv.PhienAm,
    tv.ViDu,
    tv.MaChuDe,
    cd.TenChuDe,
    cd.MoTa
FROM TuVung tv
JOIN ChuDe cd ON tv.MaChuDe = cd.MaChuDe
JOIN AmThanh am ON am.MaTuVung = tv.MaTuVung


-- View: Thống kê số lượng từ vựng theo chủ đề
CREATE VIEW view_ThongKeChuDe AS
SELECT 
    cd.MaChuDe,
    cd.TenChuDe,
    COUNT(tv.MaTuVung) AS SoLuongTu
FROM ChuDe cd
LEFT JOIN TuVung tv ON cd.MaChuDe = tv.MaChuDe
GROUP BY cd.MaChuDe, cd.TenChuDe;

-- View: Kết quả ôn tập của người dùng
CREATE VIEW view_KetQua AS
SELECT 
    kq.MaKetQua,
    kq.MaNguoiDung,
    nd.TenDangNhap,
    nd.HoTen,
    kq.MaChuDe,
    cd.TenChuDe,
    kq.SoTuDung,
    kq.NgayOnTap
FROM KetQua kq
JOIN NguoiDung nd ON kq.MaNguoiDung = nd.MaNguoiDung
JOIN ChuDe cd ON kq.MaChuDe = cd.MaChuDe;

-- View: Từ vựng đã học của người dùng
CREATE VIEW view_TuVungDaHoc AS
SELECT 
    ct.MaNguoiDung,
    nd.TenDangNhap,
    ct.MaTuVung,
    tv.TuVung,
    ct.TinhTrang,
    ct.NgayXem
FROM TuVungDaHoc ct
JOIN NguoiDung nd ON ct.MaNguoiDung = nd.MaNguoiDung
JOIN TuVung tv ON ct.MaTuVung = tv.MaTuVung;
