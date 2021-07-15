# This Python file uses the following encoding: utf-8
import sys
import os
import threading
from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QObject, Signal, Slot, QTimer
from python_files.GetSearchResults import GetSearchResults
from python_files.StreamQueue import StreamQueue
from python_files.StreamGenerator import StreamGenerator
from python_files.DatabaseHelper import DatabaseHelper


class MainWindow(QObject):

    searchResult = Signal(str, str, str, str, str, str)
    updateQueue = Signal(str, str, str, str)
    setPlayer = Signal(str, str, str, str, str, str, str, str, str, str)
    setProgress = Signal(str, float)
    clearSearch = Signal()  # Clears search results in UI
    upDatePlayImg = Signal(str)
    setFavorites = Signal(str, str, str, str, str)
    clearFavorites = Signal()

    def __init__(self):
        QObject.__init__(self)
        self.timer = QTimer()
        self.timer.timeout.connect(lambda: self.update_progress())
        self.timer.start(100)
        self.play_img_val = 0
        self.database = DatabaseHelper()
        self.get_search_results = GetSearchResults()
        self.stream_queue = StreamQueue(self)  # Has an instance of main to update player
        self.stream_generator = StreamGenerator()
        #print(threading.get_ident())

    def play_queue(self):
        # If the stream to be played is the first stream, start playback of queue on a separate thread.
        if self.stream_queue.get_first_stream():
            self.queue_thread = threading.Thread(target=self.stream_queue.play_stream_queue, daemon=True)
            self.queue_thread.start()

    def update_player(self):
        """
        Updates the media player information in the UI. (Colors, track, artist, album art, track runtime)
        """
        track = self.stream_queue.get_current_stream().get_track()
        artist = self.stream_queue.get_current_stream().get_artist()
        album_art = self.stream_queue.get_current_stream().get_album_art()
        length = self.stream_queue.get_current_stream().get_length()
        main_color, secondary_color, third_color = self.stream_queue.get_current_stream().get_colors()
        try:
            up_next_track = self.stream_queue.get_stream(self.stream_queue.get_stream_position() + 1).get_track()
            up_next_artist = self.stream_queue.get_stream(self.stream_queue.get_stream_position() + 1).get_artist()
            up_next_album_art = self.stream_queue.get_stream(
                self.stream_queue.get_stream_position() + 1).get_album_art()
        except IndexError:
            up_next_track = "Add more songs"
            up_next_artist = ""
            up_next_album_art = ""

        self.setPlayer.emit(album_art.replace("https://", "http://"), track, artist, length, main_color,
                            secondary_color, third_color, up_next_track, up_next_artist, up_next_album_art)

    def update_progress(self):
        """ Updates stream playback progress in the UI (time and slider) """
        try:
            self.setProgress.emit(self.stream_queue.get_current_time_formatted(), self.stream_queue.get_percentage())
        except:
            pass

    @Slot(str)
    def add_to_queue(self, yt_id):
        """
        Adds a stream to the queue and plays it if its the first stream.
        :param yt_id: the YouTube ID of the search result to be added to queue
        """
        stream = self.stream_generator.create_stream(yt_id)
        self.stream_queue.add_to_queue(stream)
        image_url = stream.get_album_art().replace("https://", "http://")
        image_url = image_url.replace("600x600", "200x200")
        # Updates queue visual in UI
        self.updateQueue.emit(image_url, stream.get_track(), stream.get_artist(), stream.get_length())
        self.play_queue()

    @Slot(str)
    def add_fav_queue(self, yt_id):
        """
        Adds a saved stream from the database to the queue
        :param yt_id: YouTube ID of the stream
        """
        fav_stream = self.database.get_stream(yt_id)
        stream = self.stream_generator.create_db_stream(fav_stream[0], fav_stream[1], fav_stream[2], fav_stream[3],
                                                        fav_stream[4], fav_stream[5], fav_stream[6], fav_stream[7],
                                                        fav_stream[8], fav_stream[9], fav_stream[10])
        self.stream_queue.add_to_queue(stream)
        image_url = stream.get_album_art().replace("https://", "http://")
        image_url = image_url.replace("600x600", "200x200")
        self.updateQueue.emit(image_url, stream.get_track(), stream.get_artist(), stream.get_length())
        self.play_queue()

    @Slot(int)
    def remove_queue(self, position):
        self.stream_queue.remove(position)

    @Slot(int)
    def play_selected(self, pos):
        self.stream_queue.play_selected(pos)

    @Slot(str)
    def search(self, search_query):
        """
        Searched the query in the GetSearchResults class and sends it to the front end
        :param search_query: the query to be searched
        """
        search_results = self.get_search_results.search(search_query)
        self.clearSearch.emit()
        for search_result in search_results:
            if self.database.check_yt_id(search_result.get_yt_id()):
                self.searchResult.emit(search_result.get_yt_id(), search_result.get_title(),
                                       search_result.get_channel(), search_result.get_thumbnail(),
                                       "star_icon_pressed.png", "star_icon.png")
            else:
                self.searchResult.emit(search_result.get_yt_id(), search_result.get_title(),
                                       search_result.get_channel(), search_result.get_thumbnail(),
                                       "star_icon.png", "star_icon_pressed.png")

    @Slot(str)
    def save_delete_stream(self, yt_id):
        """
        Saves or deletes a stream from the database
        :param yt_id: the YouTube ID of the search result to be saved or deleted
        """
        if self.database.check_yt_id(yt_id):
            self.database.delete_stream(yt_id)
        else:
            stream = self.stream_generator.create_stream(yt_id)
            self.database.save_stream(stream.get_link(), stream.get_title(), stream.get_track(), stream.get_artist(),
                                      stream.get_album(), stream.get_album_art(), stream.get_length(), stream.get_year()
                                      , stream.get_main_color(), stream.get_second_color(), stream.get_third_color())


    @Slot()
    def get_favorites(self):
        """ Grabs all the favorites from the database and sends it to the UI"""
        self.clearFavorites.emit()
        favorites = self.database.get_favorites()
        for favorite in favorites:
            self.setFavorites.emit(favorite[0], favorite[1], favorite[2], favorite[3], favorite[4])

    @Slot(float)
    def seek(self, seek_time):
        """
        Seek to to a specific time using the slider
        :param seek_time: percentage to be seeked (0-1)
        """
        self.stream_queue.seek_to_time(seek_time)

    @Slot()
    def pause_stream(self):
        """
        Pause/play playback and changes pause/play icon
        """
        self.stream_queue.pause_stream()
        if self.play_img_val == 0:
            self.upDatePlayImg.emit("pause.png")
            self.play_img_val = 1
        else:
            self.upDatePlayImg.emit("play.png")
            self.play_img_val = 0

    # Moves to previous stream
    @Slot()
    def prev_stream(self):
        self.stream_queue.previous_stream()

    # Moves to next stream
    @Slot()
    def next_stream(self):
        self.stream_queue.next_stream()


if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()
    main = MainWindow()
    engine.load(os.path.join(os.path.dirname(__file__), "qml/main.qml"))
    engine.rootContext().setContextProperty("con", main)

    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
