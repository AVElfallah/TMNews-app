import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:tell_me_news/controller/app_settings_controller.dart';

import 'package:tell_me_news/view/pages/news_displayer_page.dart';

import 'package:tell_me_news/view/widgets/drawer_widget.dart';

class NewsMainPage extends StatefulWidget {
  const NewsMainPage({Key? key}) : super(key: key);

  @override
  State<NewsMainPage> createState() => _NewsMainPageState();
}

class _NewsMainPageState extends State<NewsMainPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSettingsController>(
      init: AppSettingsController(),
      tag: 'appSettings',
      builder: (ctrl) {
        return ZoomDrawer(
          controller: ctrl.zoomDrawerController,
          menuBackgroundColor: context.theme.backgroundColor,
          borderRadius: 40.0,
          overlayBlend: BlendMode.lighten,
          showShadow: true,
          angle: -10.0,
          isRtl: Get.locale!.languageCode == 'ar',
          slideWidth: MediaQuery.of(context).size.width * 0.78,
          menuScreen: const DrawerWidget(),
          mainScreen: const NewsDisplayer(),
        );
      },
    );
  }
}
