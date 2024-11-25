CREATE DATABASE MovieRecommendations;


USE MovieRecommendations;


DROP TABLE IF EXISTS dbo.Interactions ;
DROP TABLE IF EXISTS dbo.Recommendations;
DROP TABLE IF EXISTS dbo.Users;
DROP TABLE IF EXISTS dbo.Movies;

CREATE TABLE Movies (
    MovieID INT IDENTITY(1,1) NOT NULL,
    Title VARCHAR(255) NOT NULL,
    Genre VARCHAR(50),
    ReleaseYear INT,
    Rating DECIMAL(2, 1),
    Description TEXT,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (MovieID)
);


CREATE TABLE Users (
    UserID INT IDENTITY(1,1) NOT NULL,
    Name VARCHAR(100),
    PhoneNumber VARCHAR(20) UNIQUE,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (UserID)
);

CREATE TABLE Recommendations (
    RecommendationID INT IDENTITY(1,1) NOT NULL,
    UserID INT,
    MovieID INT,
    RecommendedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (RecommendationID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID)
); 

CREATE TABLE Interactions (
    InteractionID INT IDENTITY(1,1) NOT NULL,
    UserID INT,
    Message TEXT,
    InteractionTime DATETIME DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (InteractionID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

INSERT INTO Movies (Title, Genre, ReleaseYear, Rating, Description)
VALUES 
('Inception', 'Sci-Fi', 2010, 8.8, 'A mind-bending thriller about dream manipulation.'),
('The Shawshank Redemption', 'Drama', 1994, 9.3, 'A story of hope and resilience inside a prison.'),
('The Dark Knight', 'Action', 2008, 9.0, 'Batman faces the Joker in this gritty action movie.');

INSERT INTO Users (Name, PhoneNumber)
VALUES 
('Maria Silva', '+5511987654321'),
('João Pereira', '+5511981234567');


INSERT INTO Recommendations (UserID, MovieID)
VALUES 
(1, 1), 
(2, 2);