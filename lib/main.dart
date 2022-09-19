import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tell_me_news/view/pages/login_singup_page.dart';
import 'package:tell_me_news/view/pages/news_main_page.dart';
import 'package:tell_me_news/view/pages/news_search_page.dart';

import 'package:tell_me_news/view/pages/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const scheme = FlexScheme.bigStone;

    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: Get.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: FlexThemeData.light(
        scheme: scheme,
        appBarElevation: 0.5,
      ),
      darkTheme: FlexThemeData.dark(
        scheme: scheme,
        appBarElevation: 2,
      ),
      getPages: [
        GetPage(name: '/splash', page: () => const SplashScreen()),
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
      ],
      initialRoute: '/splash',
    );
  }
}
