import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getwidget/getwidget.dart';
import 'package:tell_me_news/controller/newspaper_controller.dart';
import 'package:tell_me_news/controller/search_controller.dart';

import 'package:tell_me_news/view/widgets/news_filter_widget.dart';
import 'package:tell_me_news/view/widgets/search_feature_widget.dart';
import 'package:tell_me_news/view/widgets/search_filter_widget.dart';
import 'package:tell_me_news/view/widgets/search_futures.dart';

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
                    //    Get.toNamed('/search');
                    showCupertinoDialog(
                        barrierDismissible: true,
                        context: context,
                        barrierLabel: 'Search',
                        builder: ((context) {
                          var searchCtrl = Get.put<SearchController>(
                            SearchController(),
                            tag: 'search',
                          );
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 80),
                            child: SimpleDialog(
                              backgroundColor: context.theme.primaryColor,
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Search Box'),
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(
                                      Icons.arrow_back,
                                    ),
                                  )
                                ],
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(28),
                              ),
                              children: [
                                const SearchFilterWidget(),
                                SizedBox(
                                  height: 60,
                                  child: GFTextFieldPill(
                                    controller: searchCtrl.searchCtrl,
                                    editingbordercolor: Colors.white,
                                    idlebordercolor: Colors.black,
                                    borderwidth: 1,
                                    hintText: 'search word',
                                    iconPrefix: const Icon(Icons.search),
                                    style: const TextStyle(
                                      fontSize: 19,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: GFButtonBadge(
                                    onPressed: () {
                                      Get.toNamed('/search');
                                    },
                                    elevation: 10,
                                    text: 'Search Now',
                                    textStyle: const TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SearchFeatures()
                              ],
                            ),
                          );
                        }));
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
                    future: newspaperCtrl.getNews(),
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
                          child: GFLoader(
                            type: GFLoaderType.square,
                            size: GFSize.LARGE,
                          ),
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
