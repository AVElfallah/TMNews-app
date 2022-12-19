import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button_bar.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:tell_me_news/config/app_route.dart';
import 'package:tell_me_news/config/assets.dart';
import 'package:tell_me_news/controller/newscard_controller.dart';

import 'package:intl/intl.dart';

import '../../model/news/news_model.dart';

class NewsCardWidget extends StatelessWidget {
  const NewsCardWidget({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.newsProvider,
    required this.dateTime,
    required this.description,
    required this.newsUrl,
    required this.id,
    this.isBookmark = false,
  }) : super(key: key);
  final String imageUrl;
  final String title;
  final String newsProvider;
  final String dateTime;
  final String description;
  final String newsUrl;
  final String? id;
  final bool? isBookmark;
  factory NewsCardWidget.fromModel(NewsReportModel model,
      {isBookmarked = false}) {
    return NewsCardWidget(
      imageUrl: model.urlToImage ?? '',
      title: model.title ?? 'no title',
      newsProvider: model.sourceName ?? 'not found',
      dateTime: model.dateTime ?? DateTime.now().toIso8601String(),
      description: model.description ?? '',
      newsUrl: model.url!,
      id: model.id,
      isBookmark: isBookmarked!,
    );
  }

  @override
  Widget build(BuildContext context) {
    var date = DateFormat('EEEE d-M-y  hh:mm a', Get.locale!.languageCode)
        .format(DateTime.parse(dateTime));
    var ctrl = NewsCardController();
    return GFCard(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      elevation: 30,
      showImage: true,
      image: Image(
        image: CachedNetworkImageProvider(imageUrl),
        fit: BoxFit.contain,
        height: MediaQuery.of(context).size.height * .29,
        errorBuilder: ((context, error, stackTrace) {
          return Image.asset(Assets.placeholder);
        }),
      ),
      title: GFListTile(
        title: Text(
          title,
          maxLines: 2,
          softWrap: false,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
        subTitle: Text(
          newsProvider,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 15,
            color: Colors.grey.shade800,
            backgroundColor: Colors.black.withOpacity(.2),
          ),
        ),
        description: Text(
          date,
        ),
      ),
      content: Text(
        description,
        maxLines: 4,
        softWrap: false,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w500,
        ),
      ),
      borderRadius: BorderRadius.circular(25),
      buttonBar: GFButtonBar(
        children: [
          Visibility(
            //chck if user is regsterd or not
            visible: !FirebaseAuth.instance.currentUser!.isAnonymous,
            child: Visibility(
              //check if is bookMarked or not
              visible: !isBookmark!,
              child: TextButton.icon(
                onPressed: () {
                  ctrl.addOrRemoveBookmark(
                    NewsReportModel(
                      title: title,
                      dateTime: dateTime,
                      url: newsUrl,
                      sourceName: newsProvider,
                      urlToImage: imageUrl,
                      id: id,
                      description: description,
                    ),
                  );
                },
                label: Text('bookmark'.tr),
                icon: const Icon(
                  Icons.bookmark,
                  size: 28,
                ),
              ),
            ),
          ),
          TextButton.icon(
            onPressed: () {
              Get.toNamed(
                Routes.newsWebViewPage,
                parameters: {
                  'webUrl': newsUrl,
                  'title': title,
                },
              );
            },
            label: Text('readmore'.tr),
            icon: const Icon(
              Icons.auto_stories,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}
