// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:tell_me_news/config/app_config.dart';
import 'package:tell_me_news/model/live%20score/game_model.dart';

class SportNetwork {
  static SportNetwork? _instance;

  SportNetwork._();

  static SportNetwork get instance {
    _instance ??= SportNetwork._();

    return _instance!;
  }

  Future<List<GameModel>> fetchGames() async {
    String url = '${sportWebAPI}games/featured/?'
        'appTypeId=${5}'
        "&langId=${27}"
        "&timezoneName=Africa/Cairo"
        "&userCountryId=131"
        "&sports=1"
        "&numberOfGames=4"
        "&context=1";

    try {
      var res = await Dio().get<Map>(url);
      var listGames = (res.data!['games'] as List)
          .map((game) => GameModel.fromJson(game))
          .toList();
      return listGames;
    } catch (e) {
      debugPrint('$e');
      return [];
    }
  }

  Future<List<GameModel>> fetchAllGamesInDay(String startDate,
      [String endDate = '']) async {
    String url = '${sportWebAPI}games/allscores/?'
        'appTypeId=5'
        '&langId=27'
        '&timezoneName=Africa/Cairo'
        '&userCountryId=131'
        '&sports=1'
        '&startDate=17/12/2022'
        '&endDate=${endDate.isEmpty ? DateFormat('d/M/y').format(DateTime.now()) : endDate}'
        '&showOdds=true'
        '&onlyMajorGames=true'
        '&favoriteCompetitions=553,5595,552'
        '&withTop=true';
    try {
      var res = await Dio().get<Map>(url);

      var list = (res.data!['games'] as List)
          .map((game) => GameModel.fromJson(game))
          .toList();
      return list;
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }
}
