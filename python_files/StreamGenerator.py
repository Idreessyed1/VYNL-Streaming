import re
import youtube_dl
import itunes
import extcolors
import urllib.request
import pafy
from python_files.Stream import Stream


class StreamGenerator:

    """
    Retrieves information for the stream and creates and populates a stream object
    """

    def __init__(self):
        self.ydl = youtube_dl.YoutubeDL({})

    def create_stream(self, title, yt_id):
        """
        Creates a stream and populates it from iTunes or YouTube
        :param title: stream title
        :param yt_id: youtube video id
        :return: populated stream
        """
        url = yt_id
        # Link starts with https://youtube.com/....
        video = self.ydl.extract_info(url, download=False)  # find out how to quiet print
        pafy_file = pafy.new(url)
        best_audio = pafy_file.getbestaudio()
        audio_url = best_audio.url

        try:
            if video['artist'] is not None:
                try:
                    item = itunes.search_track(query='{} {}'.format(video['artist'], video['track']), limit=1, order='popular')[0]
                    stream = self.set_metadata_api(item, video, title, url, audio_url)
                except KeyError:
                    stream = self.set_metadata_yt(video, title, url, audio_url)
                except IndexError:
                    stream = self.set_metadata_yt(video, title, url, audio_url)
                except AttributeError:
                    stream = self.set_metadata_yt(video, title, url, audio_url)
            else:
                stream = self.set_metadata_yt(video, title, url, audio_url)
        except KeyError:
            stream = self.set_metadata_yt(video, title, url, audio_url)
        return stream

    def create_db_stream(self, yt_title, link, audio_url, track, artist, album, album_art, length, year,
                         main_color, second_color, third_color):
        """
        Populates a saved stream stream from the db
        :return: populated stream
        """
        colors = [main_color, second_color, third_color]
        pafy_file = pafy.new("https://www.youtube.com/watch?v="+link)
        best_audio = pafy_file.getbestaudio()
        audio_url2 = best_audio.url
        stream = Stream(yt_title, link, audio_url2, track, artist, album, album_art, length, year, colors)
        return stream

    def save_stream(self):
        pass

    def set_metadata_api(self, item, video, title, url, audio_url):
        track = item.name
        artist = item.artist.name
        album = item.album.name
        album_art = item.album.artwork.get('600')
        length = self.format_time(video)
        year = item.release_date.year
        colors = self.get_album_color(album_art)
        stream = Stream(title, url, audio_url, track, artist, album, album_art, length, year, colors)
        return stream

    def set_metadata_yt(self, video, title, url, audio_url):
        track = video['title']
        artist = ""#self.video['channel']
        album = ""
        album_art = video["thumbnail"]
        length = self.format_time(video)
        year = video['upload_date']
        colors = self.get_album_color(album_art)
        stream = Stream(title, url, audio_url, track, artist, album, album_art, length, year, colors)
        return stream

    def format_time(self, video):
        """
        formats the time from milliseconds to min:sec
        :param video: video object from youtube_dl
        :return: formatted length as a string
        """
        duration = int(video['duration'])
        length = "%d:%02d" % ((duration / 60) % 60, duration % 60)
        return length

    def get_album_color(self, album_art):
        """
        Gets the 3 main colors of the album from the color library
        :param album_art: album art url
        :return: list of the 3 main colors
        """
        img_colors = []
        urllib.request.urlretrieve(album_art, "images/temp_image.jpg")
        colors, pixel_count = extcolors.extract_from_path("images/temp_image.jpg")
        img_colors.append('#%02x%02x%02x' % colors.__getitem__(0).__getitem__(0))
        img_colors.append('#%02x%02x%02x' % colors.__getitem__(1).__getitem__(0))
        img_colors.append('#%02x%02x%02x' % colors.__getitem__(2).__getitem__(0))
        print(img_colors[0], img_colors[1], img_colors[2])
        return img_colors
