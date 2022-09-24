import 'package:flutter/material.dart';

import 'search_feature_widget.dart';

class SearchFeatures extends StatelessWidget {
  const SearchFeatures({Key? key}) : super(key: key);

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
