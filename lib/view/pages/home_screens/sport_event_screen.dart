// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';
import 'package:tell_me_news/controller/sport_page_controller.dart';
import 'package:tell_me_news/view/widgets/sport_card.dart';
import 'package:tell_me_news/view/widgets/sport_small_card.dart';

import '../../../repository/sport/sport_image_fetch_helper.dart';

class SportsEventsScreen extends StatefulWidget {
  const SportsEventsScreen({Key? key}) : super(key: key);

  @override
  State<SportsEventsScreen> createState() => _SportsEventsScreenState();
}

class _SportsEventsScreenState extends State<SportsEventsScreen> {
  @override
  Widget build(BuildContext context) {
    var ctrl = Get.put<SportPageController>(SportPageController());

    return Scaffold(
      appBar: AppBar(
        title: Text('livesports'.tr),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
        leading: IconButton(
          onPressed: () {
            ctrl.reSetFilterDayGames();
            ctrl.reSetImportantGames();
          },
          icon: const Icon(Icons.refresh),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          GetBuilder(
            init: ctrl,
            id: 'importantGames',
            builder: (_) {
              return FutureBuilder<void>(
                future: ctrl.reSetImportantGames(),
                builder: (__, _) {
                  if (ctrl.importantGames.isNotEmpty) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: GFCarousel(
                        autoPlay: false,
                        height: context.height * .27,
                        pauseAutoPlayOnTouch:
                            const Duration(milliseconds: 2000),
                        enlargeMainPage: true,
                        items: ctrl.importantGames
                            .map(
                              (game) => SportCard(game: game),
                            )
                            .toList(),
                      ),
                    );
                  } else {
                    return IconButton(
                      onPressed: () {
                        ctrl.reSetImportantGames();
                      },
                      icon: const Icon(Icons.refresh),
                    );
                  }
                },
              );
            },
          ),
          const Text('مباريات اليوم'),
          GetBuilder(
            init: ctrl,
            id: 'allGames',
            builder: (_) {
              return FutureBuilder<void>(
                future: ctrl.reSetFilterDayGames(),
                builder: (__, _) {
                  if (ctrl.filterDayGames.isNotEmpty) {
                    var keys = ctrl.filterDayGames.keys.toList();
                    return Expanded(
                      child: ListView.builder(
                        itemCount: keys.length,
                        itemBuilder: ((context, index) {
                          return ExpansionTile(
                            title: Text(
                              ctrl.filterDayGames[keys[index]]![0]
                                  .competitionDisplayName!,
                            ),
                            leading: Image.network(
                              SportImageFetchHelper.getLeagueImage(keys[index]),
                              height: 30,
                              width: 30,
                              scale: 3,
                            ),
                            children: ctrl.filterDayGames[keys[index]]!
                                .map(
                                  (game) => SportSmallCard(game: game),
                                )
                                .toList(),
                          );
                        }),
                      ),
                    );
                  } else {
                    return IconButton(
                      onPressed: () {
                        ctrl.reSetFilterDayGames();
                      },
                      icon: const Icon(Icons.refresh),
                    );
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
