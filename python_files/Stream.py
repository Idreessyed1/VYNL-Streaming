
class Stream:

    """
    Contains all the metadata on the stream
    """

    def __init__(self, yt_title, link, audio_url, track, artist, album, album_art, length, year, colors):
        self.yt_title = yt_title
        print(yt_title)
        self.link = link
        # print(link)
        self.audio_url = audio_url
        # print(audio_url)
        self.track = track
        # print(track)
        self.artist = artist
        # print(artist)
        self.album = album
        # print(album)
        self.album_art = album_art
        # print(album_art)
        self.length = length
        # print(length)
        self.year = year
        # print(year)
        self.main_color = colors[0]
        # print(self.main_color)
        self.second_color = colors[1]
        # print(self.second_color)
        self.third_color = colors[2]
        #print(self.third_color)

    def get_title(self):
        return self.yt_title

    def get_link(self):
        return self.link

    def get_audio_url(self):
        return self.audio_url

    def get_track(self):
        return self.track

    def get_artist(self):
        return self.artist

    def get_album(self):
        return self.album

    def get_album_art(self):
        return self.album_art

    def get_album_art_low(self):
        return self.album_art_low

    def get_album(self):
        return self.album

    def get_year(self):
        return self.year

    def get_length(self):
        return self.length

    def get_main_color(self):
        return self.main_color

    def get_second_color(self):
        return self.second_color

    def get_third_color(self):
        return self.third_color

    def get_colors(self):
        return self.main_color, self.second_color, self.third_color
