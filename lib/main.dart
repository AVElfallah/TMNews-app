import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tell_me_news/controller/user_controller.dart';
import 'package:tell_me_news/view/pages/bookmark_page.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tell_me_news/view/pages/login_singup_page.dart';
import 'package:tell_me_news/view/pages/news_main_page.dart';
import 'package:tell_me_news/view/pages/news_search_page.dart';
import 'package:tell_me_news/view/pages/news_web_view.dart';

import 'package:tell_me_news/view/pages/splash_screen.dart';

import 'repository/app_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedAppSettings().intialGuestAccount();
  await Get.put<UserController>(UserController(), tag: 'user_ctrl').initialized;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userCtrl = Get.find<UserController>(tag: 'user_ctrl');
    const scheme = FlexScheme.bigStone;
    Get.changeThemeMode(
      userCtrl.userPreferences!.isDarkMode! ? ThemeMode.dark : ThemeMode.light,
    );
    return GetMaterialApp(
      title: 'Tell Me News',
      debugShowCheckedModeBanner: false,
      theme: FlexThemeData.light(
        scheme: scheme,
        appBarElevation: 0.5,
      ),
      darkTheme: FlexThemeData.dark(
        scheme: scheme,
        appBarElevation: 2,
      ),
      getPages: [
        GetPage(
          name: '/splash',
          page: () => const SplashScreen(),
        ),
        GetPage(
          name: '/homepage',
          page: () => const NewsMainPage(),
        ),
        GetPage(
          name: '/login_reg',
          page: () => const UserLoginRegistrationPage(),
          transition: Transition.zoom,
          transitionDuration: const Duration(milliseconds: 1700),
          curve: Curves.easeInOutCubicEmphasized,
        ),
        GetPage(
          name: '/search',
          page: () => const NewsSearchPage(),
          transition: Transition.zoom,
          transitionDuration: const Duration(milliseconds: 1700),
          curve: Curves.easeInOutCubicEmphasized,
        ),
        GetPage(
          name: '/news_webview',
          page: () => const NewsWebView(),
          transition: Transition.zoom,
          transitionDuration: const Duration(milliseconds: 1700),
          curve: Curves.easeInOutCubicEmphasized,
        ),
        GetPage(
          name: '/bookmarks',
          page: () => const BookmarkPage(),
          transition: Transition.zoom,
          transitionDuration: const Duration(milliseconds: 1700),
          curve: Curves.easeInOutCubicEmphasized,
        ),
      ],
      initialRoute:
          userCtrl.userPreferences!.isLogin! ? '/homepage' : '/splash',
    );
  }
}
