import tkinter
from tkinter import filedialog
import os
import pafy


class Downloader:

    def __init__(self):
        self.root = tkinter.Tk()
        self.root.withdraw()  # use to hide tkinter window

    def file_path(self):
        """
        Opens file explorer to select path
        Source: https://stackoverflow.com/a/55099951/12672085
        """
        currdir = os.getcwd()
        tempdir = filedialog.askdirectory(parent=self.root, initialdir=currdir, title='Please select a directory')
        if len(tempdir) > 0:
            print("You chose: %s" % tempdir)
        return tempdir

    def download(self, yt_id):
        pafy_file = pafy.new(yt_id)
        path = self.file_path()
        best_audio = pafy_file.getbestaudio()
        best_audio.download(quiet=True, filepath=path)


d = Downloader()
d.download("https://www.youtube.com/watch?v=oRdxUFDoQe0")
