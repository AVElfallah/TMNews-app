import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button_bar.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';

import 'package:tell_me_news/model/news_model.dart';

import '../../repository/date_time.dart';

class NewsCardWidget extends StatelessWidget {
  const NewsCardWidget(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.newsProvider,
      required this.dateTime,
      required this.description,
      required this.newsUrl})
      : super(key: key);
  final String imageUrl;
  final String title;
  final String newsProvider;
  final DateTime dateTime;
  final String description;
  final String newsUrl;
  factory NewsCardWidget.fromModel(NewsModel model) {
    return NewsCardWidget(
      imageUrl: model.urlToImage ?? '',
      title: model.title ?? 'no title',
      newsProvider: model.sourceName ?? 'not found',
      dateTime: model.dateTime ?? DateTime.now(),
      description: model.description ?? '',
      newsUrl: model.url!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GFCard(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      elevation: 30,
      showImage: true,
      image: Image(
        image: (imageUrl != '')
            ? NetworkImage(imageUrl)
            : Image.asset('assets/images/placeholder.png').image,
        fit: BoxFit.contain,
        height: MediaQuery.of(context).size.height * .29,
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
          "${DateTimeFormat(
            dateTime,
          ).getDate()}    ${DateTimeFormat(
            dateTime,
          ).getTime()}",
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
      buttonBar: GFButtonBar(children: [
        TextButton.icon(
          onPressed: () {},
          label: const Text('bookmark'),
          icon: const Icon(
            Icons.bookmark,
            size: 28,
          ),
        ),
        TextButton.icon(
          onPressed: () {},
          label: const Text('Read more'),
          icon: const Icon(
            Icons.auto_stories,
            size: 28,
          ),
        ),
      ]),
    );
  }
}
