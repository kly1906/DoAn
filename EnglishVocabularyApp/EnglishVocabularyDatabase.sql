-- Tạo database và chọn sử dụng
CREATE DATABASE EnglishVocabularyApp;
GO
USE EnglishVocabularyApp;
GO

-- Bảng người dùng
CREATE TABLE Users (
    UserId NVARCHAR(8) PRIMARY KEY,            -- USR00001
    Username NVARCHAR(50) NOT NULL UNIQUE,
    Password NVARCHAR(100) NOT NULL,           
    FullName NVARCHAR(100),
    Email NVARCHAR(100),
    DateCreated DATETIME DEFAULT GETDATE()
);

-- Bảng quản trị viên 
CREATE TABLE Admins (
    AdminId NVARCHAR(8) PRIMARY KEY,           -- VD: ADM000001
    Username NVARCHAR(50) NOT NULL UNIQUE,
    Password NVARCHAR(100) NOT NULL,
    FullName NVARCHAR(100),
    Email NVARCHAR(100),
    Role NVARCHAR(50) NOT NULL CHECK (Role IN ('VocabularyManager', 'SystemAdmin')),
    DateCreated DATETIME DEFAULT GETDATE()
);

-- Bảng chủ đề từ vựng
CREATE TABLE Topics (
    TopicId NVARCHAR(8) PRIMARY KEY,           -- TOP00001
    TopicName NVARCHAR(100) NOT NULL UNIQUE,
    Description NVARCHAR(200),
    CreatedBy NVARCHAR(8) NOT NULL,            -- Admin tạo chủ đề
    CreatedAt DATETIME DEFAULT GETDATE(),
    LastUpdatedAt DATETIME,
    LastModifiedBy NVARCHAR(8) NULL,           -- Admin sửa gần nhất
    FOREIGN KEY (CreatedBy) REFERENCES Admins(AdminId),
    FOREIGN KEY (LastModifiedBy) REFERENCES Admins(AdminId)
);

-- Bảng từ vựng
CREATE TABLE Vocabulary (
    WordId NVARCHAR(8) PRIMARY KEY,            -- WRD00001
    Word NVARCHAR(100) NOT NULL,
    Meaning NVARCHAR(200),
    Pronunciation NVARCHAR(100),
    ExampleSentences NVARCHAR(MAX),
    TopicId NVARCHAR(8),
    CreatedBy NVARCHAR(8) NOT NULL,            -- Admin tạo từ
    CreatedAt DATETIME DEFAULT GETDATE(),
    LastUpdatedAt DATETIME,
    LastModifiedBy NVARCHAR(8) NULL,           -- Admin sửa gần nhất
    FOREIGN KEY (TopicId) REFERENCES Topics(TopicId),
    FOREIGN KEY (CreatedBy) REFERENCES Admins(AdminId),
    FOREIGN KEY (LastModifiedBy) REFERENCES Admins(AdminId)
);

-- Bảng ghi nhớ từ vựng của người dùng
CREATE TABLE User_Vocabulary (
    UserId NVARCHAR(8),
    WordId NVARCHAR(8),
    IsLearned BIT DEFAULT 0,
    LastReviewed DATETIME,
    PRIMARY KEY (UserId, WordId),
    FOREIGN KEY (UserId) REFERENCES Users(UserId),
    FOREIGN KEY (WordId) REFERENCES Vocabulary(WordId)
);

-- Kết quả trò chơi
CREATE TABLE GameResults (
    ResultId NVARCHAR(8) PRIMARY KEY,           -- RES00001
    UserId NVARCHAR(8),
    TopicId NVARCHAR(8),
    CorrectCount INT,                           -- Số câu đúng
    PlayedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (UserId) REFERENCES Users(UserId),
    FOREIGN KEY (TopicId) REFERENCES Topics(TopicId)
);

-- Bảng file âm thanh
CREATE TABLE AudioFiles (
    AudioId NVARCHAR(8) PRIMARY KEY,            -- AUD00001
    WordId NVARCHAR(8) NOT NULL,
    AudioPath NVARCHAR(255) NOT NULL,
    FOREIGN KEY (WordId) REFERENCES Vocabulary(WordId)
);