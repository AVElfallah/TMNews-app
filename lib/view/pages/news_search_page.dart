import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tell_me_news/controller/search_controller.dart';
import 'package:tell_me_news/model/news_model.dart';
import 'package:tell_me_news/view/widgets/search_feature_widget.dart';
import 'package:tell_me_news/view/widgets/search_filter_widget.dart';

import '../widgets/news_card_widget.dart';

class NewsSearchPage extends StatelessWidget {
  const NewsSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SearchController>(
        init: SearchController(),
        tag: 'search',
        builder: (ctrl) {
          var mqsize = MediaQuery.of(context).size;

          return CustomScrollView(
            slivers: [
              SliverAppBar(
                collapsedHeight: mqsize.height * .09,
                expandedHeight: mqsize.height * .20,
                floating: true,
                pinned: true,
                snap: false,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(70),
                      bottomRight: Radius.circular(70)),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  expandedTitleScale: 1,
                  centerTitle: true,
                  background: const SearchFilterWidget(),
                  title: SizedBox(
                    height: 50,
                    width: mqsize.width * .78,
                    child: TextField(
                      controller: ctrl.searchCtrl.value,
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(35),
                          ),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                        suffix: Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: IconButton(
                            icon: const Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 30,
                            ),
                            onPressed: () {
                              printInfo(info: 'clicked');
                            },
                          ),
                        ),
                        hintText: 'Search in news',
                        hintStyle: TextStyle(color: Colors.grey.shade800),
                      ),
                    ),
                  ),
                ),
              ),
              /*  SliverToBoxAdapter(
                child: FutureBuilder(
                  future: ctrl.searchForNews(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<NewsModel>> snapshot) {
                    if (snapshot.hasData) {
                      //  print(snapshot.data);
                      if (snapshot.data!.isNotEmpty) {
                        return  SizedBox(
                          height: mqsize.height * .9,
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
                      }
                      return _SearchFeatures();
                    } else {
                      return _SearchFeatures();
                    }
                  },
                ),
              ), */
              FutureBuilder(
                future: ctrl.searchForNews(),
                builder: ((context, AsyncSnapshot<List<NewsModel>> snapshot) {
                  if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return NewsCardWidget.fromModel(
                            snapshot.data![index],
                          );
                        },
                        childCount: snapshot.data!.length,
                      ),
                    );
                  } else if (snapshot.data!.isEmpty) {
                    return const SliverToBoxAdapter();
                  } else {
                    return SliverToBoxAdapter(
                      child: _SearchFeatures(),
                    );
                  }
                }),
              ),
            ],
          );
        },
      ),
    );
  }
}
/*
search features private class
*/

class _SearchFeatures extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SearchFeatureWidget(
          featureTitle:
              'You can specify the search by title or the entire article',
          featureImage: AssetImage('assets/images/search.png'),
        ),
        SearchFeatureWidget(
          featureTitle: 'You can specify the article language',
          featureImage: AssetImage('assets/images/languages.png'),
        ),
        SearchFeatureWidget(
          featureTitle: 'Searching for articles around the world',
          featureImage: AssetImage('assets/images/countries.png'),
        ),
        SearchFeatureWidget(
          featureTitle: 'You can search articles by date from and to',
          featureImage: AssetImage('assets/images/time.png'),
        ),
      ],
    );
  }
}
