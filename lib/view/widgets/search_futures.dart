import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:tell_me_news/config/assets.dart';

class SearchFeatures extends StatelessWidget {
  const SearchFeatures({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchFeatureWidget(
          featureTitle: 'search1'.tr,
          featureImage: const AssetImage(Assets.search),
        ),
        SearchFeatureWidget(
          featureTitle: 'search2'.tr,
          featureImage: const AssetImage(Assets.languages),
        ),
        SearchFeatureWidget(
          featureTitle: 'search3'.tr,
          featureImage: const AssetImage(Assets.countries),
        ),
        SearchFeatureWidget(
          featureTitle: 'search4'.tr,
          featureImage: const AssetImage(Assets.time),
        ),
      ],
    );
  }
}

class SearchFeatureWidget extends StatelessWidget {
  const SearchFeatureWidget({Key? key, this.featureTitle, this.featureImage})
      : super(key: key);

  final String? featureTitle;
  final ImageProvider? featureImage;

  @override
  Widget build(BuildContext context) {
    return GFCard(
      elevation: 50,
      title: GFListTile(
        icon: const Icon(
          Icons.star,
          color: Colors.yellow,
          size: 30,
        ),
        title: Text(
          'searchfeatures'.tr,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        description: Text(
          featureTitle!,
          style: const TextStyle(fontSize: 16),
        ),
      ),
      showImage: true,
      image: Image(
        image: featureImage!,
      ),
    );
  }
}
