import sqlite3


class DatabaseHelper:

    """
    Used for all database operations with the database.
    """

    def __init__(self):
        # Connecting to database
        self.vynl_db = sqlite3.connect("Vynl_Database")
        self.cur = self.vynl_db.cursor()
        # Creating table if it does not exist
        self.cur.execute("""
            CREATE TABLE if NOT EXISTS SavedStreams(
                yt_id text primary key,
                title text,
                track text,
                artist text,
                album text,
                album_art text,
                stream_length text,
                stream_year text,
                mainColor text,
                secondColor text,
                thirdColor text)
            """)
        self.vynl_db.commit()
        self.vynl_db.close()

    def save_stream(self, yt_id, title, track, artist, album, album_art, stream_length, stream_year,
                    color1, color2, color3):
        """
        Saves stream to database
        """
        #  ADD TR EXCEPT block in case id is the same
        self.vynl_db = sqlite3.connect("Vynl_Database")
        self.cur = self.vynl_db.cursor()
        self.cur.execute("INSERT INTO SavedStreams VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
                         (yt_id, title, track, artist, album, album_art, stream_length, stream_year,
                          color1, color2, color3))
        self.vynl_db.commit()
        self.vynl_db.close()

    def delete_stream(self, yt_id):
        print(yt_id)
        """
        Deletes stream from DB
        :param yt_id: YouTube ID
        """
        self.vynl_db = sqlite3.connect("Vynl_Database")
        self.cur = self.vynl_db.cursor()
        self.cur.execute("""
                        DELETE FROM SavedStreams
                        WHERE yt_id == (?);
                        """, (yt_id,))
        self.vynl_db.commit()
        self.vynl_db.close()

    def get_favorites(self):
        """
        Grabs all stream from database
        :return: tuple of all streams
        """
        self.vynl_db = sqlite3.connect("Vynl_Database")
        self.cur = self.vynl_db.cursor()
        self.cur.execute("""
                        SELECT yt_id, track, artist, album_art, stream_length
                        FROM SavedStreams
                        """)
        return self.cur.fetchall()

    def get_stream(self, yt_id):
        """
        Gets stream with matching yt_id from database
        :param yt_id: YouTube ID
        :return: stream
        """
        self.vynl_db = sqlite3.connect("Vynl_Database")
        self.cur = self.vynl_db.cursor()
        self.cur.execute("""
                        SELECT title, yt_id, track, artist, album, album_art, stream_length, stream_year,
                                mainColor, secondColor, thirdColor
                        FROM SavedStreams
                        WHERE yt_id == (?)
                        """, (yt_id,))

        return self.cur.fetchone()

    def get_yt_ids(self):
        self.vynl_db = sqlite3.connect("Vynl_Database")
        self.cur = self.vynl_db.cursor()
        try:
            self.cur.execute("""
                            SELECT yt_id
                            FROM SavedStreams;
                             """)
            return self.cur.fetchall()
        except TypeError:
            return 0

    def check_yt_id(self, yt_id):
        self.vynl_db = sqlite3.connect("Vynl_Database")
        self.cur = self.vynl_db.cursor()
        self.cur.execute("""SELECT yt_id
                            FROM SavedStreams
                            WHERE yt_id=?
                           """, (yt_id,))
        result = self.cur.fetchone()
        if result:
            return True
        else:
            return False

    def get_last_id(self):
        self.vynl_db = sqlite3.connect("Vynl_Database")
        self.cur = self.vynl_db.cursor()
        try:
            self.cur.execute("""
                            SELECT stream_id
                            FROM SavedStreams
                            WHERE stream_id = (SELECT MAX(stream_id) FROM SavedStreams)
                            """)
            return self.cur.fetchone()[0]
        except TypeError:
            return 0


# db = DatabaseHelper()
# db.get_stream("FKV2oeS4vw8")
# db.save_stream(3, "Sami Yusuf - Forgotten Promises", "FKV2oeS4vw8",
#             "https://r4---sn-cxaaj5o5q5-tt1ez.googlevideo.com/videoplayback?expire=1619434367&ei=H0eGYKOSArSrir4Pi-2d-A4&ip=184.146.170.254&id=o-ACE0OjhUhWLTKQkOWAw0flVKkxEsFg0pBf9V2MiFepn9&itag=251&source=youtube&requiressl=yes&mh=5R&mm=31%2C26&mn=sn-cxaaj5o5q5-tt1ez%2Csn-vgqsknlz&ms=au%2Conr&mv=m&mvi=4&pl=24&initcwndbps=1623750&vprv=1&mime=audio%2Fwebm&ns=J9JYHOdk2ZCdvbKlAX89lP4F&gir=yes&clen=5380381&dur=325.361&lmt=1540355193368800&mt=1619412279&fvip=4&keepalive=yes&fexp=24001373%2C24007246&c=WEB&txp=5511222&n=in3Dqz3zNrpBGbCoFV&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cvprv%2Cmime%2Cns%2Cgir%2Cclen%2Cdur%2Clmt&lsparams=mh%2Cmm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpl%2Cinitcwndbps&lsig=AG3C_xAwRAIgQYFdCwmUy5v5aMuIONJd8ssgrrOBDS2bXSIxYpyPAgYCIG6dxGGDvSdLEfh_PyT_2jyNxEJopBerxoxMtM0_C9-t&sig=AOq0QJ8wRAIgLq2urlqIHhkUlnhmvlXG04lgg11GT6oLoh6tuIJpaE4CIDbxniHODDvdRbsGW-yw35LLDoquEqK2IOc0O2jMArHA&ratebypass=yes",
#             "Forgotten Promises", "Sami Yusuf", "Forgotten Promises - Single",
#             "https://is5-ssl.mzstatic.com/image/thumb/Music/v4/9c/4d/28/9c4d28a5-6c1a-10de-50cb-c33d94355b00/source/600x600bb.jpg",
#             "5:25", "2011", "#f6d8a6", "#924d16", "#17120c")
# l= db.get_streams()
# print(l[0])
