import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:tell_me_news/controller/search_controller.dart';

import '../../model/news_model.dart';
import '../widgets/news_card_widget.dart';

class NewsSearchPage extends StatelessWidget {
  const NewsSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<SearchController>(tag: 'search');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Result'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: ctrl.searchForNews(),
        builder: ((context, AsyncSnapshot<List<NewsModel>> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isNotEmpty) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return NewsCardWidget.fromModel(
                    snapshot.data![index],
                  );
                },
              );
            } else {
              return const GFCard(
                elevation: 40,
                title: GFListTile(
                  titleText: 'There are no matching search words',
                ),
                showImage: true,
                image: Image(
                  image: AssetImage(
                    'assets/images/error.png',
                  ),
                ),
              );
            }
          }
          return const GFCard(
            elevation: 40,
            title: GFListTile(
              titleText: 'There are no matching search words',
            ),
            showImage: true,
            image: Image(
              image: AssetImage(
                'assets/images/error.png',
              ),
            ),
          );
        }),
      ),
    );
  }
}
