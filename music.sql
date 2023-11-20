-- This program was made in MySQL and works as the assignment intends
-- Must be ran in MySQL

CREATE TABLE artist(
	artist_id INT PRIMARY KEY AUTO_INCREMENT,
    artist_name VARCHAR(30) UNIQUE
);
SELECT * FROM artist;

INSERT INTO artist(artist_name) VALUES("Kendrick Lamar");
INSERT INTO artist(artist_name) VALUES("Daft Punk");
INSERT INTO artist(artist_name) VALUES("Metallica");


CREATE TABLE album(
	album_id INT PRIMARY KEY AUTO_INCREMENT,
    album_name VARCHAR(50) UNIQUE,
    artist_id INT,
    FOREIGN KEY(artist_id) REFERENCES artist(artist_id) ON DELETE CASCADE
);
ALTER TABLE album AUTO_INCREMENT=1001;
SELECT * FROM album;

INSERT INTO album(album_name, artist_id) VALUES("DAMN.", 1);
INSERT INTO album(album_name, artist_id) VALUES("Discovery", 2);
INSERT INTO album(album_name, artist_id) VALUES("Ride The Lightning", 3);


CREATE TABLE song(
	track_id INT,
	song_name VARCHAR(50),
    song_length INT,
    album_name VARCHAR(50),
    artist_id INT,
    PRIMARY KEY (song_name, album_name),
    FOREIGN KEY(album_name) REFERENCES album(album_name) ON DELETE CASCADE,
    FOREIGN KEY(artist_id) REFERENCES artist(artist_id) ON DELETE CASCADE
);
SELECT * FROM song;

INSERT INTO song(song_name, album_name, track_id, artist_id, song_length) VALUES("BLOOD.","DAMN.",01,1,120);
INSERT INTO song(song_name, album_name, track_id, artist_id, song_length) VALUES("DNA.","DAMN.",02,1,185);
INSERT INTO song(song_name, album_name, track_id, artist_id, song_length) VALUES("YAH.","DAMN.",03,1,160);
INSERT INTO song(song_name, album_name, track_id, artist_id, song_length) VALUES("ELEMENT.","DAMN.",04,1,208);
INSERT INTO song(song_name, album_name, track_id, artist_id, song_length) VALUES("FEEL.","DAMN.",05,1,214);
INSERT INTO song(song_name, album_name, track_id, artist_id, song_length) VALUES("LOYALTY.","DAMN.",06,1,227);
INSERT INTO song(song_name, album_name, track_id, artist_id, song_length) VALUES("PRIDE.","DAMN.",07,1,275);
INSERT INTO song(song_name, album_name, track_id, artist_id, song_length) VALUES("HUMBLE.","DAMN.",08,1,177);
INSERT INTO song(song_name, album_name, track_id, artist_id, song_length) VALUES("LUST.","DAMN.",09,1,307);
INSERT INTO song(song_name, album_name, track_id, artist_id, song_length) VALUES("LOVE.","DAMN.",10,1,213);
INSERT INTO song(song_name, album_name, track_id, artist_id, song_length) VALUES("XXX.","DAMN.",11,1,254);
INSERT INTO song(song_name, album_name, track_id, artist_id, song_length) VALUES("FEAR.","DAMN.",12,1,460);
INSERT INTO song(song_name, album_name, track_id, artist_id, song_length) VALUES("GOD.","DAMN.",13,1,248);
INSERT INTO song(song_name, album_name, track_id, artist_id, song_length) VALUES("DUCKWORTH.","DAMN.",14,1,248);

INSERT INTO song(song_name, album_name, track_id, artist_id, song_length) VALUES("One More Time","Discovery",01,2,320);
INSERT INTO song(song_name, album_name, track_id, artist_id, song_length) VALUES("Aerodynamic","Discovery",02,2,212);
INSERT INTO song(song_name, album_name, track_id, artist_id, song_length) VALUES("Digital Love","Discovery",03,2,301);
INSERT INTO song(song_name, album_name, track_id, artist_id, song_length) VALUES("Harder, Better, Faster, Stronger","Discovery",04,2,224);
INSERT INTO song(song_name, album_name, track_id, artist_id, song_length) VALUES("Crescendolls","Discovery",05,2,211);
INSERT INTO song(song_name, album_name, track_id, artist_id, song_length) VALUES("Nightvision","Discovery",06,2,104);
INSERT INTO song(song_name, album_name, track_id, artist_id, song_length) VALUES("Superheroes","Discovery",07,2,237);
INSERT INTO song(song_name, album_name, track_id, artist_id, song_length) VALUES("High Life","Discovery",08,2,201);
INSERT INTO song(song_name, album_name, track_id, artist_id, song_length) VALUES("Something About Us","Discovery",09,2,232);
INSERT INTO song(song_name, album_name, track_id, artist_id, song_length) VALUES("Voyager","Discovery",10,2,227);
INSERT INTO song(song_name, album_name, track_id, artist_id, song_length) VALUES("Verdis Quo","Discovery",11,2,345);
INSERT INTO song(song_name, album_name, track_id, artist_id, song_length) VALUES("Short Circuit","Discovery",12,2,206);
INSERT INTO song(song_name, album_name, track_id, artist_id, song_length) VALUES("Face to Face","Discovery",13,2,240);
INSERT INTO song(song_name, album_name, track_id, artist_id, song_length) VALUES("Too Long","Discovery",14,2,600);

INSERT INTO song(song_name, album_name, track_id, artist_id, song_length) VALUES("Fight Fire With Fire","Ride The Lightning",01,3,284);
INSERT INTO song(song_name, album_name, track_id, artist_id, song_length) VALUES("Ride The Lightning","Ride The Lightning",02,3,396);
INSERT INTO song(song_name, album_name, track_id, artist_id, song_length) VALUES("For Whom The Bell Tolls","Ride The Lightning",03,3,309);
INSERT INTO song(song_name, album_name, track_id, artist_id, song_length) VALUES("Fade To Black","Ride The Lightning",04,3,417);
INSERT INTO song(song_name, album_name, track_id, artist_id, song_length) VALUES("Trapped Under Ice","Ride The Lightning",05,3,244);
INSERT INTO song(song_name, album_name, track_id, artist_id, song_length) VALUES("Escape","Ride The Lightning",06,3,263);
INSERT INTO song(song_name, album_name, track_id, artist_id, song_length) VALUES("Creeping Death","Ride The Lightning",07,3,395);
INSERT INTO song(song_name, album_name, track_id, artist_id, song_length) VALUES("The Call Of Ktulu","Ride The Lightning",08,3,533);


SELECT
artist.artist_name 'Artist',
song.album_name 'Album',
song.track_id 'Track',
song.song_name 'Song',
song.song_length 'Length'
FROM artist
LEFT JOIN song
ON artist.artist_id = song.artist_id
ORDER BY artist_name, track_id;


DROP TABLE song;
DROP TABLE album;
DROP TABLE artist;
