class SearchResult:

    """
    Contains the title and link of the result
    """

    def __init__(self, title, yt_id):
        self.title = title
        # self.link = "https://www.youtube.com/watch?v=" + yt_id
        self.yt_id = yt_id
        self.thumbnail = "http://img.youtube.com/vi/{id}/0.jpg".format(id=yt_id)

    def get_title(self):
        return self.title

    def get_thumbnail(self):
        return self.thumbnail

    def get_link(self):
        return self.yt_id

    def __str__(self):
        return self.get_title()
