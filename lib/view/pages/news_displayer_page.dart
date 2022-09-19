import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:tell_me_news/controller/news_displayer_controller.dart';
import 'package:tell_me_news/view/pages/Live_sport_event_page.dart';
import 'package:tell_me_news/view/pages/currency_news_page.dart';

import 'package:tell_me_news/view/pages/newspaper_page.dart';

class NewsDisplayer extends StatelessWidget {
  const NewsDisplayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsDisplayerController>(
      init: NewsDisplayerController(),
      builder: (ctrl) {
        var page = 0.obs;
        ctrl.pageController.addListener(() {
          page.value = ctrl.pageController.page!.toInt();
        });
        return Scaffold(
          body: PageView(
            controller: ctrl.pageController,
            children: const [
              NewsPaperPage(),
              LiveSportsEventsPage(),
              CurrencyNewsPage(),
            ],
          ),
          bottomNavigationBar: Obx(
            () => GNav(
              tabs: const [
                GButton(
                  padding: EdgeInsets.all(10),
                  icon: Icons.newspaper,
                  text: 'Newspaper',
                  rippleColor: Colors.grey,
                  gap: 20,
                ),
                GButton(
                  padding: EdgeInsets.all(10),
                  icon: Icons.sports_soccer,
                  text: 'Live Sports Events',
                  rippleColor: Colors.grey,
                  gap: 20,
                ),
                GButton(
                  padding: EdgeInsets.all(10),
                  icon: Icons.currency_bitcoin,
                  text: 'Currency news',
                  rippleColor: Colors.grey,
                  gap: 20,
                ),
              ],
              selectedIndex: page.value,
              onTabChange: (value) {
                ctrl.pageController.animateToPage(
                  value,
                  duration: const Duration(milliseconds: 1200),
                  curve: Curves.easeInExpo,
                );
              },
              iconSize: 30,
              tabBorderRadius: 500,
              tabActiveBorder: Border.all(color: Get.theme.primaryColor),
            ),
          ),
        );
      },
    );
  }
}
