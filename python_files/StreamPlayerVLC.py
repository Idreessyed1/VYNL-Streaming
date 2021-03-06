import vlc
import time
import threading


class StreamPlayerVLC:

    """
    Manages stream playback
    """

    def __init__(self):
        self.instance = vlc.Instance()
        self.player = self.instance.media_player_new()
        self.running = None
        self.paused = None

    def start(self, stream):
        """
        Plays the stream. Thread needs to run while stream is playing therefore we have a while loop.
        :param stream: stream to be played
        """
        self.running = True
        self.paused = False
        media = self.instance.media_new(stream.get_audio_url())
        media.get_mrl()
        self.player.set_media(media)
        self.player.play()
        while self.player.is_playing() == 0:
            pass
        while self.running:
            time.sleep(1)
            if self.player.is_playing() == 0 and not self.paused:
                break
        # print("OUT OF START METHOD", threading.get_ident())

    def pause_audio(self):
        if not self.paused:
            self.paused = True
        else:
            self.paused = False
        self.player.pause()

    def stop_stream(self):
        self.running = False
        self.player.stop()

    def get_is_playing(self):
        return self.player.is_playing()

    def get_length(self):
        return self.format_length(self.player.get_length())

    def get_current_time_formatted(self):
        return self.format_length(self.get_current_time())

    def get_current_time(self):
        """
        Gets time in milliseconds. If no stream is playing return 0.
        """
        if self.player.get_time() == -1:
            return 0
        else:
            return self.player.get_time()

    def seek_to_time(self, seek_time):
        # Multiple the percentage of seek by total length to get seek time 
        seek_time = seek_time * self.player.get_length()
        self.player.set_time(int(seek_time))

    def get_percentage(self):
        return round(self.get_current_time() / self.player.get_length(), 5)

    def format_length(self, length):
        millis = int(length)
        seconds = (millis / 1000) % 60
        seconds = int(seconds)
        minutes = (millis / (1000 * 60)) % 60
        return "%d:%02d" % (minutes, seconds)
