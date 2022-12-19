import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:tell_me_news/controller/app_settings_controller.dart';
import 'package:tell_me_news/extensions/context_extensions.dart';

import 'package:tell_me_news/view/pages/news_content_page.dart';
import 'package:tell_me_news/view/widgets/change_language_dialog.dart';

import 'package:tell_me_news/view/widgets/drawer_widget.dart';

import '../../services/app_settings.dart';

class NewsMainPage extends StatefulWidget {
  const NewsMainPage({Key? key}) : super(key: key);

  @override
  State<NewsMainPage> createState() => _NewsMainPageState();
}

class _NewsMainPageState extends State<NewsMainPage> {
  var settingsServ = Get.find<AppSettingsService>(tag: 'settings_service');
  var homeSettingsCtrl =
      Get.put<HomeController>(HomeController(), tag: 'home_ctrl');
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: context.zoomController,
      menuBackgroundColor: context.theme.backgroundColor,
      borderRadius: 40.0,
      overlayBlend: BlendMode.lighten,
      showShadow: true,
      angle: -10.0,
      isRtl: Get.locale!.languageCode == 'ar',
      slideWidth: context.width * 0.78,
      menuScreen: DrawerWidget(
        changeAppTheme: homeSettingsCtrl.changeTheme,
        appSettings: settingsServ,
        languageDialog: ChangeLanguageDialog(
          selectArabic: homeSettingsCtrl.changeToArabicLanguage,
          selectEnglish: homeSettingsCtrl.changeToEnglishLanguage,
        ),
      ),
      mainScreen: const NewsContentPage(),
    );
  }
}
