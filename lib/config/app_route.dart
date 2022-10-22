import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/pages/bookmark_page.dart';
import '../view/pages/email_activision_page.dart';
import '../view/pages/login_singup_page.dart';
import '../view/pages/news_main_page.dart';
import '../view/pages/news_search_page.dart';
import '../view/pages/news_web_view.dart';
import '../view/pages/splash_screen.dart';

class Routes {
  static const String splashPage = "/splash";
  static const String homePage = "/home";
  static const String loginRegPage = '/login_reg';
  static const String searchPage = '/search';
  static const String newsWebViewPage = '/news_webview';
  static const String emailActivisonPage = '/emailActivison';
  static const String bookmarksPage = '/bookmarks';
}

class GetRoutes {
  List<GetPage<dynamic>>? allRoutes = [
    GetPage(
      name: Routes.splashPage,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routes.homePage,
      page: () => const NewsMainPage(),
    ),
    GetPage(
      name: Routes.loginRegPage,
      page: () => const UserLoginRegistrationPage(),
      transition: Transition.zoom,
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.elasticInOut,
    ),
    GetPage(
      name: Routes.searchPage,
      page: () => const NewsSearchPage(),
      transition: Transition.zoom,
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.elasticInOut,
    ),
    GetPage(
      name: Routes.newsWebViewPage,
      page: () => const NewsWebView(),
      transition: Transition.zoom,
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.elasticInOut,
    ),
    GetPage(
      name: Routes.bookmarksPage,
      page: () => const BookmarkPage(),
      transition: Transition.zoom,
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.elasticInOut,
    ),
    GetPage(
      name: Routes.emailActivisonPage,
      page: () => const EmailActivisonPage(),
      transition: Transition.zoom,
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.elasticInOut,
    ),
  ];
}
