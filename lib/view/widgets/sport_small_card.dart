import 'package:flutter/material.dart';

import '../../config/assets.dart';
import '../../model/live score/game_model.dart';
import '../../repository/sport/sport_image_fetch_helper.dart';

class SportSmallCard extends StatelessWidget {
  const SportSmallCard({Key? key, required this.game}) : super(key: key);
  final GameModel game;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 3,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              HexColor.fromHex(game.homeCompetitor!.color!).withOpacity(0.25),
              HexColor.fromHex(game.awayCompetitor!.color!).withOpacity(0.25),
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.network(
                          SportImageFetchHelper.getTeamImage(
                            game.homeCompetitor!.id!,
                          ),
                          height: 25,
                          width: 50,
                          scale: 3,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(1),
                          child: Text(
                            game.homeCompetitor!.name!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(1),
                          child: Text(
                            game.homeCompetitor!.symbolicName ?? '--',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          game.statusText!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        Visibility(
                          visible: game.gameTime != -1,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                              color: Colors.red.shade700,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Text(
                              '${game.gameTime!.toInt()}\'',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
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
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Visibility(
                          visible: game.gameTime == -1,
                          child: const Text(
                            'VS',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.network(
                          SportImageFetchHelper.getTeamImage(
                            game.awayCompetitor!.id!,
                          ),
                          height: 25,
                          width: 50,
                          scale: 3,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(1),
                          child: Text(
                            game.awayCompetitor!.name!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(1),
                          child: Text(
                            game.awayCompetitor!.symbolicName ?? '--',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
