import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:tell_me_news/controller/newspaper_controller.dart';
import 'package:tell_me_news/model/news_enums.dart';
import 'package:tell_me_news/repository/news_repository.dart';
import 'package:tell_me_news/view/widgets/news_filter_widget.dart';

import '../../controller/darwer_controller.dart';
import '../../model/news_model.dart';
import '../widgets/categories_widget.dart';
import '../widgets/news_card_widget.dart';

class NewsPaperPage extends StatelessWidget {
  const NewsPaperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newspaperCtrl = Get.put(
      NewspaperController(),
      tag: 'newspaper',
    );
    return GetBuilder<AppDarwerController>(
      tag: 'drawer_ctrl',
      builder: (ctrl) {
        return Obx(
          () => Scaffold(
            appBar: AppBar(
              title: const Text('News'),
              centerTitle: true,
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.search,
                  ),
                  onPressed: () {
                    Get.toNamed('/search');
                  },
                ),
                const NewsFilterWidget()
              ],
              leading: GestureDetector(
                onTap: () {
                  ctrl.open();
                },
                child: Container(
                  margin: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black54,
                    image: DecorationImage(
                      image: AssetImage('assets/images/person.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            body: ListView(
              children: [
                const CategoriesWidget(),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: FutureBuilder(
                    future: GetNews(
                      category: newspaperCtrl.category.value,
                      country: newspaperCtrl.country.value,
                      language: newspaperCtrl.language.value,
                    ).getNews(),
                    builder: (
                      context,
                      AsyncSnapshot<List<NewsModel>> snapshot,
                    ) {
                      if (snapshot.hasData) {
                        if (snapshot.data!.isEmpty) {
                          return const GFCard(
                            elevation: 50,
                            title: GFListTile(
                              title: Text(
                                'News not found',
                                textAlign: TextAlign.center,
                              ),
                              description: Text(
                                  'no data has been found change language or country'),
                            ),
                            showImage: true,
                            image: Image(
                                image: AssetImage('assets/images/error.png')),
                          );
                        }
                        return SizedBox(
                          height: MediaQuery.of(context).size.height * .9,
                          child: ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: ((
                              context,
                              index,
                            ) {
                              if (index < snapshot.data!.length - 1) {
                                return NewsCardWidget.fromModel(
                                  snapshot.data![index],
                                );
                              } else {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 150),
                                  child: NewsCardWidget.fromModel(
                                    snapshot.data![index],
                                  ),
                                );
                              }
                            }),
                          ),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}