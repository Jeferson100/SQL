CREATE DATABASE MovieRecommendations;

DROP TABLE IF EXISTS Movies;

CREATE TABLE Movies (
    MovieID SERIAL NOT NULL,
    Title VARCHAR(255) NOT NULL,
    Genre VARCHAR(100),
    ReleaseYear INTEGER CHECK (ReleaseYear BETWEEN 1888 AND 2100),
    Rating DECIMAL(2, 1),
    Description TEXT,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (MovieID)
);

DROP TABLE IF EXISTS users;

CREATE TABLE Users (
    UserID Serial NOT NULL,
    Name VARCHAR(100),
    PhoneNumber VARCHAR(20) UNIQUE,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (UserID)
);

CREATE TABLE Recommendations (
    RecommendationID Serial NOT NULL,
    UserID INT,
    MovieID INT,
    RecommendedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (RecommendationID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID)
);


CREATE TABLE Interactions (
    InteractionID Serial NOT NULL,
    UserID INT,
    Message TEXT,
    InteractionTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
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