from python_files import config
from googleapiclient.discovery import build
from python_files.SearchResult import SearchResult


class GetSearchResults:

    """
    This class manages the search results from YouTube.
    """

    def __init__(self):
        self.API_KEY = config.YT_API_KEY
        self.SERVICE = 'youtube'
        self.API_VERSION = 'v3'
        self.youtube = build(self.SERVICE, self.API_VERSION, developerKey=self.API_KEY)

    def search(self, search_query):
        """
        Searches the    query using YouTube API and creates a list of search results
        :param search_query: query to be searched in YouTube
        """
        self.search_results = []
        self.search_request = self.youtube.search().list(part="snippet", q=search_query, type="video", maxResults="20",
                                                         videoCategoryId="10")
        self.search_response = self.search_request.execute()
        for search_result in self.search_response.get('items', []):
            if search_result['id']['kind'] == 'youtube#video':
                # Append a search result object containing title and video ID to the list
                self.search_results.append(SearchResult(self.html_decode(search_result['snippet']['title']),
                                                        search_result['id']['videoId']))

    def display_results(self):
        """
        Prints search results in console. Used in console version of Vynl
        """
        for i in range(len(self.search_results)):
            print(f"[{i + 1}]: {self.search_results[i]}")

    def get_results(self):
        return self.search_results

    def select_result(self, index):
        """
        :param index: index of the search result
        :return: search result
        """
        return self.search_results[index]

    def html_decode(self, s):
        """
        Returns the ASCII decoded version of the given HTML string. This does
        NOT remove normal HTML tags like <p>.
        :param s: data to be formatted
        """
        htmlCodes = (
                ("'", '&#39;'),
                ('"', '&quot;'),
                ('>', '&gt;'),
                ('<', '&lt;'),
                ('&', '&amp;')
            )
        for code in htmlCodes:
            s = s.replace(code[1], code[0])
        return s
