import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:tell_me_news/model/news_enums.dart';
import 'package:tell_me_news/model/search_enums.dart';

import '../model/news_model.dart';
import 'date_time.dart';

class NewsSearchRepository {
  NewsSearchRepository({
    this.searchIn,
    this.dateTimeFrom,
    this.dateTimeTo,
    this.searchString,
    this.supportedLanguage,
  });
  final List<SearchIn>? searchIn;
  final DateTime? dateTimeFrom;
  final DateTime? dateTimeTo;
  final String? searchString;

  final SupportedLanguage? supportedLanguage;
  Future<List<NewsModel>> getNews() async {
    const apiKey = '2afa55caa3924c4080b5f3985e019145';
    final getSearchIn = searchIn!.isEmpty
        ? ''
        : '&searchIn=${searchIn!.map((e) => e.name).join(',')}';
    final String getLanguage = '&language=${supportedLanguage!.name}';
    final String getFromDate =
        '&from=${DateTimeFormat(dateTimeFrom!).getAPIDate()}';
    final String getToDate = '&to=${DateTimeFormat(dateTimeTo!).getAPIDate()}';
    final String newsRequest =
        'https://newsapi.org/v2/everything?q=$searchString&apiKey=$apiKey$getSearchIn$getLanguage$getFromDate$getToDate';

    print(newsRequest);
    try {
      var response = await Dio().get(newsRequest);
      var res = const JsonDecoder().convert(response.toString());
      if (res['status'] == 'ok') {
        return (res["articles"] as List)
            .map((e) => NewsModel.fromJson(e))
            .toList();
      } else {
        return [];
      }
    } catch (e) {
      rethrow;
    }
  }
}
