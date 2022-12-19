import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:tell_me_news/controller/app_settings_controller.dart';
import 'home_screens/currency_news_screen.dart';
import 'home_screens/newspaper_screen.dart';
import 'home_screens/sport_event_screen.dart';

class NewsContentPage extends StatelessWidget {
  const NewsContentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      tag: 'home_ctrl',
      builder: (ctrl) {
        return Scaffold(
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: ctrl.pageController,
            children: const [
              NewsPaperScreen(),
              SportsEventsScreen(),
              CurrencyNewsScreen(),
            ],
          ),
          bottomNavigationBar: Obx(
            () => GNav(
              tabs: [
                GButton(
                  padding: const EdgeInsets.all(10),
                  icon: Icons.newspaper,
                  text: 'newspaper'.tr,
                  rippleColor: Colors.grey,
                  gap: 20,
                ),
                GButton(
                  padding: const EdgeInsets.all(10),
                  icon: Icons.sports_soccer,
                  text: 'livesports'.tr,
                  rippleColor: Colors.grey,
                  gap: 20,
                ),
                GButton(
                  padding: const EdgeInsets.all(10),
                  icon: Icons.currency_bitcoin,
                  text: 'currency'.tr,
                  rippleColor: Colors.grey,
                  gap: 20,
                ),
              ],
              selectedIndex: ctrl.page.value,
              onTabChange: ctrl.goToPage,
              iconSize: 30,
              tabBorderRadius: 500,
              tabActiveBorder: Border.all(
                color: context.theme.primaryColor,
              ),
            ),
          ),
        );
      },
    );
  }
}
