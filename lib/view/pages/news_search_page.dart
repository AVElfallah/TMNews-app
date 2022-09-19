import 'package:flutter/material.dart';
import 'package:getwidget/components/text_field/gf_text_field_squared.dart';

class NewsSearchPage extends StatelessWidget {
  const NewsSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 30,
            pinned: true,
            title: GFTextFieldSquared(
              borderwidth: 2,
              editingbordercolor: Colors.black,
              hintText: '',
              idlebordercolor: Colors.black,
              iconPrefix: Icon(Icons.search),
            ),
          ),
        ],
      ),
    );
  }
}
