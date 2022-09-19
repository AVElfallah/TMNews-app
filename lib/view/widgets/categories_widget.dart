import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tell_me_news/controller/newspaper_controller.dart';
import 'package:tell_me_news/model/news_enums.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle =
        GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 15);

    return GetX<NewspaperController>(
      tag: 'newspaper',
      builder: (ctrl) => SizedBox(
        height: MediaQuery.of(context).size.height * .075,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  ctrl.changeCategory(SupportedCategories.general);
                },
                child: Chip(
                  avatar: const Icon(Icons.public),
                  backgroundColor:
                      ctrl.category.value == SupportedCategories.general
                          ? Colors.green.shade800
                          : context.theme.chipTheme.backgroundColor,
                  label: Text(
                    'General',
                    style: textStyle,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  ctrl.changeCategory(SupportedCategories.business);
                },
                child: Chip(
                  avatar: const Icon(Icons.work),
                  backgroundColor:
                      ctrl.category.value == SupportedCategories.business
                          ? Colors.green.shade800
                          : context.theme.chipTheme.backgroundColor,
                  label: Text('Business', style: textStyle),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  ctrl.changeCategory(SupportedCategories.entertainment);
                },
                child: Chip(
                  avatar: const Icon(Icons.sports_esports),
                  backgroundColor:
                      ctrl.category.value == SupportedCategories.entertainment
                          ? Colors.green.shade800
                          : context.theme.chipTheme.backgroundColor,
                  label: Text('Entertainment', style: textStyle),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  ctrl.changeCategory(SupportedCategories.health);
                },
                child: Chip(
                  avatar: const Icon(Icons.monitor_heart),
                  backgroundColor:
                      ctrl.category.value == SupportedCategories.health
                          ? Colors.green.shade800
                          : context.theme.chipTheme.backgroundColor,
                  label: Text('Health', style: textStyle),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  ctrl.changeCategory(SupportedCategories.science);
                },
                child: Chip(
                  avatar: const Icon(Icons.science),
                  backgroundColor:
                      ctrl.category.value == SupportedCategories.science
                          ? Colors.green.shade800
                          : context.theme.chipTheme.backgroundColor,
                  label: Text('Science', style: textStyle),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  ctrl.changeCategory(SupportedCategories.sports);
                },
                child: Chip(
                  avatar: const Icon(Icons.sports_soccer),
                  backgroundColor:
                      ctrl.category.value == SupportedCategories.sports
                          ? Colors.green.shade800
                          : context.theme.chipTheme.backgroundColor,
                  label: Text('Sports', style: textStyle),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  ctrl.changeCategory(SupportedCategories.technology);
                },
                child: Chip(
                  avatar: const Icon(Icons.laptop_mac),
                  backgroundColor:
                      ctrl.category.value == SupportedCategories.technology
                          ? Colors.green.shade800
                          : context.theme.chipTheme.backgroundColor,
                  label: Text('Technology', style: textStyle),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
