
-- Cập nhật LastUpdatedAt khi sửa chủ đề
CREATE TRIGGER trg_Topics_AfterUpdate
ON Topics
AFTER UPDATE
AS
BEGIN
    UPDATE t
    SET LastUpdatedAt = GETDATE()
    FROM Topics t
    JOIN inserted i ON t.TopicId = i.TopicId;
END;

-- Cập nhật LastUpdatedAt khi sửa từ vựng
CREATE TRIGGER trg_Vocabulary_AfterUpdate
ON Vocabulary
AFTER UPDATE
AS
BEGIN
    UPDATE v
    SET LastUpdatedAt = GETDATE()
    FROM Vocabulary v
    JOIN inserted i ON v.WordId = i.WordId;
END;

-- Ghi log thêm từ vựng (yêu cầu có bảng VocabularyLog)
CREATE TRIGGER trg_Log_InsertVocabulary
ON Vocabulary
AFTER INSERT
AS
BEGIN
    INSERT INTO VocabularyLog(WordId, ActionType, ActionTime)
    SELECT WordId, 'INSERT', GETDATE()
    FROM inserted;
END;
