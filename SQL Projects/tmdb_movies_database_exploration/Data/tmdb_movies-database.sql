CREATE DATABASE movies;
USE movies;
CREATE TABLE movies (
    movie_id BIGINT PRIMARY KEY, 
    title VARCHAR(100),         
    budget BIGINT,              
    homepage VARCHAR(255),      
    original_language VARCHAR(50), 
    original_title VARCHAR(100), 
    overview TEXT,             
    popularity DOUBLE PRECISION, 
    release_date DATE,           
    revenue BIGINT,              
    runtime INTEGER,            
    status VARCHAR(50),         
    tagline TEXT,               
    vote_average DOUBLE PRECISION,
    vote_count INTEGER,          
    genres TEXT,                 
    keywords TEXT,               
    production_companies TEXT,  
    production_countries TEXT,   
    spoken_languages TEXT        
);

CREATE TABLE credits (
    movie_id BIGINT,            
    title VARCHAR(100),          
    cast TEXT,                  
    crew TEXT,                  
    PRIMARY KEY (movie_id),    
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id) 
);
