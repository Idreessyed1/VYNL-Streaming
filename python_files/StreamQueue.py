from python_files.StreamPlayerVLC import StreamPlayerVLC


class StreamQueue:

    def __init__(self, main_instance):
        self.stream_queue = []
        self.stream_player_vlc = StreamPlayerVLC()
        self.first_stream = True
        self.curr_pos = 0  # Tracks the position of the current stream in the queue
        self.main_instance = main_instance

    def play_stream_queue(self):
        """
        Handles the queue for playing the streams
        """
        while self.curr_pos < self.get_size():
            self.first_stream = False
            self.main_instance.update_player()
            self.play_stream(self.get_stream(self.curr_pos))
            if self.curr_pos == self.get_size() - 1:
                self.curr_pos = 0
                while not self.first_stream:
                    pass
            else:
                self.curr_pos += 1
        self.first_stream = True

    def play_stream(self, stream):
        self.stream_player_vlc.start(stream)

    def stop_stream(self):
        self.stream_player_vlc.stop_stream()

    def play_selected(self, pos):
        self.curr_pos = pos - 1
        self.stream_player_vlc.stop_stream()

    def add_to_queue(self, stream, pos=None):
        if pos is None:
            self.stream_queue.append(stream)
        else:
            self.stream_queue.insert(pos, stream)

    def remove(self, pos):
        if pos <= self.curr_pos:
            print(True)
            del(self.stream_queue[pos])
            self.curr_pos -= 1
        else:
            print(False)
            del(self.stream_queue[pos])
        # print("Remove:", pos)
        # print("Re Size", self.get_size())

    def get_size(self):
        """
        :return: length of queue
        """
        return len(self.stream_queue)

    def get_stream(self, i):
        """
        Gets stream from the queue at a specific position
        :param i: position of stream
        :return: stream
        """
        return self.stream_queue[i]

    def get_current_stream(self):
        if len(self.stream_queue) > 0:
            return self.stream_queue[self.curr_pos]
        else:
            return None

    def get_stream_position(self):
        return self.curr_pos

    def get_first_stream(self):
        return self.first_stream

    def pause_stream(self):
        self.stream_player_vlc.pause_audio()

    def next_stream(self):
        if self.curr_pos == self.get_size() - 1:
            print("Currently on the last stream in the queue!")
            self.first_stream = True
        else:
            self.stream_player_vlc.stop_stream()

    def previous_stream(self):
        """
        For going to previous stream
        if -> Checks if its the first stream in the queue
        elif -> If the stream has played for less than 5 seconds repeat
        else -> Go to previous stream
        """
        if self.curr_pos <= 0 or self.get_size() == 1:
            self.curr_pos = -1
        elif self.stream_player_vlc.get_time_milli() > 5000:
            self.curr_pos -= 1
        else:
            self.curr_pos -= 2
        self.stream_player_vlc.stop_stream()

    def get_queue(self):
        return self.stream_queue

    def seek_to_time(self, seek_time):
        self.stream_player_vlc.seek_to_time(seek_time)

    def get_current_time(self):
        try:
            return self.stream_player_vlc.get_current_time()
        except:
            return 0

    def get_percentage(self):
        try:
            return self.stream_player_vlc.get_percentage()
        except:
            return 0

