import 'dart:convert';

import 'package:dio/dio.dart';

import '../config/app_config.dart';
import '../model/news/news_enums.dart';
import '../model/news/news_model.dart';

class GetNews {
  GetNews({
    this.category = SupportedCategories.general,
    this.country = SupportedCountry.eg,
    this.language = SupportedLanguage.ar,
  });
  final SupportedCategories category;
  final SupportedCountry country;
  final SupportedLanguage language;

  Future<List<NewsReportModel>> getNews() async {
    final getCountry = country.name.substring(0, 2);
    final getLanguage = language.name;
    final getCategory = category.name;

    final String newsRequest =
        'https://newsapi.org/v2/top-headlines?country=$getCountry&language=$getLanguage&apiKey=$newsAPI&category=$getCategory';

    try {
      var response = await Dio().get(newsRequest);
      var res = const JsonDecoder().convert(
        response.toString(),
      );

      return (res["articles"] as List)
          .map(
            (e) => NewsReportModel.fromJson(e),
          )
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
