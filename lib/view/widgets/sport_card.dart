import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tell_me_news/config/assets.dart';
import 'package:tell_me_news/model/live%20score/game_model.dart';

import 'package:tell_me_news/repository/sport/sport_image_fetch_helper.dart';

class SportCard extends StatelessWidget {
  const SportCard({Key? key, required this.game}) : super(key: key);
  final GameModel game;
  @override
  Widget build(BuildContext context) {
    final formater = DateFormat(
      'EEEE , d MMM  hh:mm a',
      Get.locale!.languageCode,
    ).format(
      DateTime.parse(game.startTime!).toLocal(),
    );

    return Column(
      children: [
        Container(
          height: context.height * .03,
          width: context.width * .59,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Theme.of(context).secondaryHeaderColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                SportImageFetchHelper.getLeagueImage(game.competitionId!),
                height: 30,
                width: 30,
                scale: 3,
              ),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: context.width * .50),
                child: Text(
                  game.competitionDisplayName!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22),
            ),
            elevation: 3,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    HexColor.fromHex(game.homeCompetitor!.color!)
                        .withOpacity(0.25),
                    HexColor.fromHex(game.awayCompetitor!.color!)
                        .withOpacity(0.25),
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
              ),
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //SECTION - Teams logos and names
                  Flexible(
                    flex: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.network(
                                  SportImageFetchHelper.getTeamImage(
                                    game.homeCompetitor!.id!,
                                  ),
                                  height: 50,
                                  width: 100,
                                  scale: 3,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(1),
                                  child: Text(
                                    game.homeCompetitor!.name!,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(1),
                                  child: Text(
                                    game.homeCompetitor!.symbolicName ?? '--',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  game.statusText!,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                Visibility(
                                  visible: game.gameTime != -1,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    decoration: BoxDecoration(
                                      color: Colors.red.shade700,
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Text(
                                      '${game.gameTime!.toInt()}\'',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: game.gameTime != -1,
                                  child: Text(
                                    '${game.homeCompetitor!.score!.toInt()}'
                                    " : "
                                    '${game.awayCompetitor!.score!.toInt()}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: game.gameTime == -1,
                                  child: const Text(
                                    'VS',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.network(
                                  SportImageFetchHelper.getTeamImage(
                                    game.awayCompetitor!.id!,
                                  ),
                                  height: 50,
                                  width: 100,
                                  scale: 3,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(1),
                                  child: Text(
                                    game.awayCompetitor!.name!,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(1),
                                  child: Text(
                                    game.awayCompetitor!.symbolicName ?? '--',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Flexible(
                    flex: 1,
                    child: Text(
                      formater,
                      style: TextStyle(
                        shadows: <Shadow>[
                          Shadow(
                            color: Theme.of(context).secondaryHeaderColor,
                            offset: Offset.fromDirection(
                              1,
                              2,
                            ),
                          )
                        ],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Flexible(
                    flex: 2,
                    child: Text(
                      game.venue != null ? game.venue!.name! : '',
                      style: TextStyle(
                        shadows: <Shadow>[
                          Shadow(
                            color: Theme.of(context).secondaryHeaderColor,
                            offset: Offset.fromDirection(
                              1,
                              2,
                            ),
                          )
                        ],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
