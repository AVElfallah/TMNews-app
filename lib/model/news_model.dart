class NewsModel {
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? sourceName;
  final DateTime? dateTime;

  NewsModel(
      {this.title,
      this.dateTime,
      this.description,
      this.url,
      this.urlToImage,
      this.sourceName});

  factory NewsModel.fromJson(Map jsonObject) {
    return NewsModel(
      title: jsonObject['title'],
      url: jsonObject['url'],
      urlToImage: jsonObject['urlToImage'],
      dateTime: DateTime.parse(
        jsonObject['publishedAt'],
      ),
      description: jsonObject['description'],
      sourceName: jsonObject['source']['name'],
    );
  }
}
