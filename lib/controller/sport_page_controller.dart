import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tell_me_news/model/live%20score/game_model.dart';
import 'package:tell_me_news/repository/sport/sport_network.dart';
import 'package:collection/collection.dart';

class SportPageController extends GetxController {
  List<GameModel> importantGames = [];

  Map<int, List<GameModel>> filterDayGames = {};

  @override
  void onInit() async {
    super.onInit();
    await reSetFilterDayGames();
    await reSetImportantGames();
  }

  Future<void> reSetImportantGames() async {
    importantGames = await SportNetwork.instance.fetchGames();
    update(['importantGames']);
  }

  Future<void> reSetFilterDayGames() async {
    SportNetwork.instance
        .fetchAllGamesInDay(DateFormat('d/M/y').format(DateTime.now()))
        .then(
      (games) {
        filterDayGames = {};
        filterDayGames = filterDayGames = games
            .where((game) => game.competitionId != 42)
            .groupListsBy((game) => game.competitionId)
            .map((competitionId, games) =>
                MapEntry(competitionId!, games.toList()));
        update(['allGames']);
      },
    );
    update(['allGames']);
  }
}
