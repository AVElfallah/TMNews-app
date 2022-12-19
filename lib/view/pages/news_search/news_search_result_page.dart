import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:tell_me_news/config/assets.dart';

import '../../../model/news/news_model.dart';
import '../../widgets/news_card_widget.dart';

class NewsSearchResultPage extends StatelessWidget {
  const NewsSearchResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var newsModel = (Get.arguments as Map<String, dynamic>)['model'];

    return Scaffold(
      appBar: AppBar(
        title: Text('searchresult'.tr),
        centerTitle: true,
      ),
      body: Builder(
        builder: ((context) {
          if (newsModel!.isNotEmpty) {
            return ListView.builder(
              itemCount: newsModel!.length,
              itemBuilder: (context, index) {
                return NewsCardWidget.fromModel(
                  newsModel![index] as NewsReportModel,
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
