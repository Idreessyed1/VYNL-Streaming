class SearchResult:

    """
    Contains the Youtube ID, title and channel of the search result
    """

    def __init__(self, yt_id, title, channel):
        self.yt_id = yt_id
        self.title = title
        self.channel = channel
        self.thumbnail = "http://img.youtube.com/vi/{id}/0.jpg".format(id=yt_id)
        self.link = "https://www.youtube.com/watch?v=" + yt_id

    def get_yt_id(self):
        return self.yt_id

    def get_title(self):
        return self.title

    def get_channel(self):
        return self.channel

    def get_thumbnail(self):
        return self.thumbnail

    def get_link(self):
        return self.link

    def __str__(self):
        return self.get_title()
