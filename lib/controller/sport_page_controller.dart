import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tell_me_news/model/live%20score/game_model.dart';
import 'package:tell_me_news/repository/sport/sport_network.dart';

class SportPageController extends GetxController {
  List<GameModel> importantGames = [];

  Map<int, List<GameModel>> filterDayGames = {};

  @override
  void onInit() {
    super.onInit();
    reSetFilterDayGames();
    reSetImportantGames();
  }

  Future<void> reSetImportantGames() async {
    importantGames = await SportNetwork.instance.fetchGames();
    update(['importantGames']);
  }

  Future<void> reSetFilterDayGames() async {
    SportNetwork.instance
        .fetchAllGamesInDay(DateFormat('d/M/y').format(DateTime.now()))
        .then((games) {
      filterDayGames = {};
      for (var game in games) {
        if (game.competitionId != 42) {
          filterDayGames[game.competitionId!] =
              (filterDayGames[game.competitionId!] ?? [])..add(game);
        }
      }
      update();
    });
    update(['allGames']);
  }
}
