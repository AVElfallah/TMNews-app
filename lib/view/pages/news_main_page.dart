import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:tell_me_news/controller/app_settings_controller.dart';

import 'package:tell_me_news/view/pages/news_displayer_page.dart';

import 'package:tell_me_news/view/widgets/drawer_widget.dart';

class NewsMainPage extends StatelessWidget {
  const NewsMainPage({Key? key}) : super(key: key);

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
            slideWidth: MediaQuery.of(context).size.width * 0.78,
            menuScreen: const DrawerWidget(),
            mainScreen: const NewsDisplayer(),
          );
        });
  }
}
