import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:tell_me_news/config/assets.dart';
import 'package:tell_me_news/controller/search_controller.dart';

import '../../model/news_model.dart';
import '../widgets/news_card_widget.dart';

class NewsSearchResultPage extends StatelessWidget {
  const NewsSearchResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<SearchController>(tag: 'search');
    return Scaffold(
      appBar: AppBar(
        title: Text('searchresult'.tr),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: ctrl.searchForNews(),
        builder: ((context, AsyncSnapshot<List<NewsModel>> snapshot) {
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return NewsCardWidget.fromModel(
                  snapshot.data![index],
                );
              },
            );
          }
          return GFCard(
            elevation: 40,
            title: GFListTile(
              titleText: 'searchmsg'.tr,
            ),
            showImage: true,
            image: const Image(
              image: AssetImage(
                Assets.appError,
              ),
            ),
          );
        }),
      ),
    );
  }
}
