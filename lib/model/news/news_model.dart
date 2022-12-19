class NewsReportModel {
  final String? id;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? sourceName;
  final String? dateTime;

  NewsReportModel({
    this.title,
    this.dateTime,
    this.description,
    this.url,
    this.urlToImage,
    this.sourceName,
    this.id,
  });

  Map convertToMap() {
    return {
      'id': id,
      'title': title!,
      'url': url!,
      'urlToImage': urlToImage!,
      'publishedAt': dateTime.toString(),
      "description": description!,
      'source': {
        'name': sourceName!,
      },
    };
  }

  factory NewsReportModel.fromJson(Map jsonObject) {
    var id = jsonObject['source']['name'] + jsonObject['publishedAt'];
    return NewsReportModel(
      id: jsonObject['id'] ?? id,
      title: jsonObject['title'],
      url: jsonObject['url'],
      urlToImage: jsonObject['urlToImage'],
      dateTime: jsonObject['publishedAt'],
      description: jsonObject['description'],
      sourceName: jsonObject['source']['name'],
    );
  }
}
