import 'package:flutter/material.dart';
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
          size: 40,
        ),
        title: const Text(
          'Search features',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        description: Text(
          featureTitle!,
          style: const TextStyle(fontSize: 18),
        ),
      ),
      showImage: true,
      image: Image(
        image: featureImage!,
      ),
    );
  }
}
