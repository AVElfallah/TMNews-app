import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';

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
