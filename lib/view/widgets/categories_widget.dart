import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/news/news_enums.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget(
      {Key? key, required this.changeCategory, required this.category})
      : super(key: key);

  final void Function(SupportedCategories cat) changeCategory;
  final Rx<SupportedCategories> category;
  final supCat = SupportedCategories.values;
  @override
  Widget build(BuildContext context) {
    final textStyle = GoogleFonts.cairo(
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    final icons = [
      Icons.public,
      Icons.work,
      CupertinoIcons.tv_music_note_fill,
      CupertinoIcons.checkmark_shield_fill,
      CupertinoIcons.lab_flask,
      CupertinoIcons.sportscourt,
      Icons.laptop,
    ];

    return SizedBox(
      height: context.height * .075,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: supCat.length,
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.all(
              8.0,
            ),
            child: GestureDetector(
              onTap: () {
                changeCategory.call(
                  supCat[index],
                );
              },
              child: Chip(
                avatar: Icon(
                  icons[index],
                ),
                backgroundColor: category.value == supCat[index]
                    ? Colors.green.shade800
                    : context.theme.chipTheme.backgroundColor,
                label: Text(
                  supCat[index].name.tr,
                  style: textStyle,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
