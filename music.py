import sqlite3


if __name__ == "__main__":
    connection = sqlite3.connect("music.db")
    cursor = connection.cursor()

    cursor.execute("DROP TABLE IF EXISTS song")
    cursor.execute("DROP TABLE IF EXISTS album")
    cursor.execute("DROP TABLE IF EXISTS artist")

    cursor.execute("""CREATE TABLE artist(
            artist_id INTEGER PRIMARY KEY AUTOINCREMENT,
            artist_name VARCHAR(30) UNIQUE
        )
    """)
    cursor.execute("INSERT INTO artist(artist_name) VALUES('Kendrick Lamar')")
    cursor.execute("INSERT INTO artist(artist_name) VALUES('Daft Punk')")
    cursor.execute("INSERT INTO artist(artist_name) VALUES('Metallica')")

    cursor.execute("""CREATE TABLE album(
            album_id INTEGER PRIMARY KEY AUTOINCREMENT,
            album_name VARCHAR(50) UNIQUE,
            artist_id INTEGER,
            FOREIGN KEY(artist_id) REFERENCES artist(artist_id) ON DELETE CASCADE
        )
    """)

    cursor.execute("INSERT INTO album(album_name, artist_id) VALUES('DAMN.', 1)")
    cursor.execute("INSERT INTO album(album_name, artist_id) VALUES('Discovery', 2)")
    cursor.execute("INSERT INTO album(album_name, artist_id) VALUES('Ride The Lightning', 3)")

    cursor.execute("""CREATE TABLE song(
            track_id INTEGER,
            song_name VARCHAR(50),
            song_length INTEGER,
            album_name VARCHAR(50),
            artist_id INTEGER,
            PRIMARY KEY (song_name, album_name),
            FOREIGN KEY(album_name) REFERENCES album(album_name) ON DELETE CASCADE,
            FOREIGN KEY(artist_id) REFERENCES artist(artist_id) ON DELETE CASCADE
            )
    """)
    cursor.execute("INSERT INTO song(song_name, album_name, track_id, artist_id, song_length) VALUES('BLOOD.','DAMN.',01,1,120)")
    cursor.execute("INSERT INTO song(song_name, album_name, track_id, artist_id, song_length) VALUES('DNA.','DAMN.',02,1,185)")
    cursor.execute("INSERT INTO song(song_name, album_name, track_id, artist_id, song_length) VALUES('YAH.','DAMN.',03,1,160)")

    cursor.execute("INSERT INTO song(song_name, album_name, track_id, artist_id, song_length) VALUES('One More Time','Discovery',01,2,320)")
    cursor.execute("INSERT INTO song(song_name, album_name, track_id, artist_id, song_length) VALUES('Aerodynamic','Discovery',02,2,212)")
    cursor.execute("INSERT INTO song(song_name, album_name, track_id, artist_id, song_length) VALUES('Digital Love','Discovery',03,2,301)")

    cursor.execute("INSERT INTO song(song_name, album_name, track_id, artist_id, song_length) VALUES('Fight Fire With Fire','Ride The Lightning',01,3,284)")
    cursor.execute("INSERT INTO song(song_name, album_name, track_id, artist_id, song_length) VALUES('Ride The Lightning','Ride The Lightning',02,3,396)")
    cursor.execute("INSERT INTO song(song_name, album_name, track_id, artist_id, song_length) VALUES('For Whom The Bell Tolls','Ride The Lightning',03,3,309)")


    cursor.execute("""Select 
            artist.artist_name 'Artist',
            song.album_name 'Album',
            song.track_id 'Track',
            song.song_name 'Song',
            song.song_length 'Length'
            FROM artist
            LEFT OUTER JOIN song
            ON artist.artist_id = song.artist_id
            ORDER BY artist_name, track_id
    """)

    connection.commit()
