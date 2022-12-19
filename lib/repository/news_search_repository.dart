import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:tell_me_news/model/search_enums.dart';

import '../config/app_config.dart';
import 'package:intl/intl.dart';

import '../model/news/news_enums.dart';
import '../model/news/news_model.dart';

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
  Future<List<NewsReportModel>> getNews() async {
    var fromStr = DateFormat('y-M-d').format(dateTimeFrom!).toString();
    var toStr = DateFormat('y-M-d').format(dateTimeTo!).toString();
    final getSearchIn = searchIn!.isEmpty
        ? ''
        : '&searchIn=${searchIn!.map((e) => e.name).join(',')}';
    final String getLanguage = '&language=${supportedLanguage!.name}';
    final String getFromDate = '&from=$fromStr';
    final String getToDate = '&to=$toStr';
    final String newsRequest =
        'https://newsapi.org/v2/everything?q=$searchString&apiKey=$newsAPI$getSearchIn$getLanguage$getFromDate$getToDate';

    try {
      var response = await Dio().get(newsRequest);
      var res = const JsonDecoder().convert(response.toString());
      if (res['status'] == 'ok') {
        return (res["articles"] as List)
            .map((e) => NewsReportModel.fromJson(e))
            .toList();
      } else {
        return [];
      }
    } catch (e) {
      rethrow;
    }
  }
}
