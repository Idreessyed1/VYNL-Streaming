import tkinter
from tkinter import filedialog
import os
import pafy
import youtube_dl

class Downloader:

    def __init__(self):
        self.root = tkinter.Tk()
        self.root.withdraw()  # use to hide tkinter window

    def convert(self):
        pass

    def file_path(self):
        """
        Opens file explorer to select path
        Source: https://stackoverflow.com/a/55099951/12672085
        """
        currdir = os.getcwd()
        tempdir = filedialog.askdirectory(parent=self.root, initialdir=currdir, title='Please select a directory')
        # if len(tempdir) > 0:
        #     print("You chose: %s" % tempdir)
        return tempdir

    def download(self, yt_id, title):
        path = self.file_path()
        ydl_opts = {
            'format': 'bestaudio/best',
            'quiet': True,
            'outtmpl': '{}/{}.mp3'.format(path, title),
            'postprocessors': [{
                'key': 'FFmpegExtractAudio',
                'preferredcodec': 'mp3',
                'preferredquality': '192',
            }],
        }
        with youtube_dl.YoutubeDL(ydl_opts) as ydl:
            ydl.download([yt_id])
