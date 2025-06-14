
-- Đăng nhập người dùng
CREATE PROCEDURE sp_LoginUser
    @Username NVARCHAR(50),
    @Password NVARCHAR(100)
AS
BEGIN
    SELECT UserId, Username, FullName
    FROM Users
    WHERE Username = @Username AND Password = @Password;
END;

-- Đăng nhập admin
CREATE PROCEDURE sp_LoginAdmin
    @Username NVARCHAR(50),
    @Password NVARCHAR(100)
AS
BEGIN
    SELECT AdminId, Username, FullName, Role
    FROM Admins
    WHERE Username = @Username AND Password = @Password;
END;

-- Thêm chủ đề
CREATE PROCEDURE sp_InsertTopic
    @TopicId NVARCHAR(8),
    @TopicName NVARCHAR(100),
    @Description NVARCHAR(200),
    @CreatedBy NVARCHAR(8)
AS
BEGIN
    INSERT INTO Topics(TopicId, TopicName, Description, CreatedBy)
    VALUES (@TopicId, @TopicName, @Description, @CreatedBy);
END;

-- Cập nhật chủ đề
CREATE PROCEDURE sp_UpdateTopic
    @TopicId NVARCHAR(8),
    @TopicName NVARCHAR(100),
    @Description NVARCHAR(200),
    @ModifiedBy NVARCHAR(8)
AS
BEGIN
    UPDATE Topics
    SET TopicName = @TopicName,
        Description = @Description,
        LastModifiedBy = @ModifiedBy,
        LastUpdatedAt = GETDATE()
    WHERE TopicId = @TopicId;
END;

-- Thêm từ vựng
CREATE PROCEDURE sp_InsertVocabulary
    @WordId NVARCHAR(8),
    @Word NVARCHAR(100),
    @Meaning NVARCHAR(200),
    @Pronunciation NVARCHAR(100),
    @ExampleSentences NVARCHAR(MAX),
    @TopicId NVARCHAR(8),
    @CreatedBy NVARCHAR(8)
AS
BEGIN
    INSERT INTO Vocabulary(WordId, Word, Meaning, Pronunciation, ExampleSentences, TopicId, CreatedBy)
    VALUES (@WordId, @Word, @Meaning, @Pronunciation, @ExampleSentences, @TopicId, @CreatedBy);
END;

-- Cập nhật từ vựng
CREATE PROCEDURE sp_UpdateVocabulary
    @WordId NVARCHAR(8),
    @Word NVARCHAR(100),
    @Meaning NVARCHAR(200),
    @Pronunciation NVARCHAR(100),
    @ExampleSentences NVARCHAR(MAX),
    @TopicId NVARCHAR(8),
    @ModifiedBy NVARCHAR(8)
AS
BEGIN
    UPDATE Vocabulary
    SET Word = @Word,
        Meaning = @Meaning,
        Pronunciation = @Pronunciation,
        ExampleSentences = @ExampleSentences,
        TopicId = @TopicId,
        LastModifiedBy = @ModifiedBy,
        LastUpdatedAt = GETDATE()
    WHERE WordId = @WordId;
END;

-- Ghi kết quả chơi
CREATE PROCEDURE sp_InsertGameResult
    @ResultId NVARCHAR(8),
    @UserId NVARCHAR(8),
    @TopicId NVARCHAR(8),
    @CorrectCount INT
AS
BEGIN
    INSERT INTO GameResults(ResultId, UserId, TopicId, CorrectCount)
    VALUES (@ResultId, @UserId, @TopicId, @CorrectCount);
END;

-- Đánh dấu từ đã học
CREATE PROCEDURE sp_MarkWordAsLearned
    @UserId NVARCHAR(8),
    @WordId NVARCHAR(8)
AS
BEGIN
    IF EXISTS (SELECT * FROM User_Vocabulary WHERE UserId = @UserId AND WordId = @WordId)
        UPDATE User_Vocabulary
        SET IsLearned = 1, LastReviewed = GETDATE()
        WHERE UserId = @UserId AND WordId = @WordId;
    ELSE
        INSERT INTO User_Vocabulary(UserId, WordId, IsLearned, LastReviewed)
        VALUES (@UserId, @WordId, 1, GETDATE());
END;
