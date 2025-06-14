
-- Cập nhật LastUpdatedAt khi sửa chủ đề
CREATE TRIGGER trg_CapNhatChuDe
ON ChuDe
AFTER UPDATE
AS
BEGIN
    UPDATE cd
    SET NgayCapNhat = GETDATE()
    FROM ChuDe cd
    JOIN inserted i ON cd.MaChuDe = i.MaChuDe;
END;

-- Cập nhật LastUpdatedAt khi sửa từ vựng
CREATE TRIGGER trg_CapNhatTuVung
ON TuVung
AFTER UPDATE
AS
BEGIN
    UPDATE tv
    SET NgayCapNhat = GETDATE()
    FROM TuVung tv
    JOIN inserted i ON tv.MaTuVung = i.MaTuVung;
END;


