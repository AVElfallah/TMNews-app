import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:tell_me_news/model/news_enums.dart';

import '../model/news_model.dart';

class GetNews {
  GetNews({
    this.category = SupportedCategories.general,
    this.country = SupportedCountry.eg,
    this.language = SupportedLanguage.ar,
  });
  final SupportedCategories category;
  final SupportedCountry country;
  final SupportedLanguage language;

  Future<List<NewsModel>> getNews() async {
    const apiKey = '2afa55caa3924c4080b5f3985e019145';
    final getCountry = country.name == 'ind' ? 'in' : country.name;
    final getLanguage = language.name;
    final getCategory = category.name;
    final String newsRequest =
        'https://newsapi.org/v2/top-headlines?country=$getCountry&language=$getLanguage&apiKey=$apiKey&category=$getCategory';

    try {
      var response = await Dio().get(newsRequest);
      var res = const JsonDecoder().convert(response.toString());

      return (res["articles"] as List)
          .map((e) => NewsModel.fromJson(e))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
