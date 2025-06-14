
-- View: Chi tiết từ vựng và chủ đề liên quan
CREATE VIEW vw_VocabularyDetails AS
SELECT 
    v.WordId,
    v.Word,
    v.Meaning,
    v.Pronunciation,
    v.ExampleSentences,
    v.TopicId,
    t.TopicName,
    t.Description AS TopicDescription,
    v.CreatedBy,
    v.CreatedAt,
    v.LastUpdatedAt,
    v.LastModifiedBy
FROM Vocabulary v
JOIN Topics t ON v.TopicId = t.TopicId;

-- View: Thống kê số từ vựng theo từng chủ đề
CREATE VIEW vw_TopicWordCount AS
SELECT 
    t.TopicId,
    t.TopicName,
    COUNT(v.WordId) AS WordCount
FROM Topics t
LEFT JOIN Vocabulary v ON t.TopicId = v.TopicId
GROUP BY t.TopicId, t.TopicName;

-- View: Kết quả ôn tập của từng người dùng
CREATE VIEW vw_UserGameResults AS
SELECT 
    g.ResultId,
    g.UserId,
    u.Username,
    u.FullName,
    g.TopicId,
    t.TopicName,
    g.CorrectCount,
    g.PlayedAt
FROM GameResults g
JOIN Users u ON g.UserId = u.UserId
JOIN Topics t ON g.TopicId = t.TopicId;

-- View: Danh sách từ đã học của từng người dùng
CREATE VIEW vw_UserLearnedWords AS
SELECT 
    uv.UserId,
    u.Username,
    uv.WordId,
    v.Word,
    v.Meaning,
    uv.IsLearned,
    uv.LastReviewed
FROM User_Vocabulary uv
JOIN Users u ON uv.UserId = u.UserId
JOIN Vocabulary v ON uv.WordId = v.WordId;
