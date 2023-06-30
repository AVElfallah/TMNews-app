import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tell_me_news/middleware/auth_middleware.dart';
import 'package:tell_me_news/middleware/bookmark_middleware.dart';
import 'package:tell_me_news/view/pages/user_pages/user_photo_uploader_page.dart';

import '../middleware/email_activison_middelware.dart';
import '../test_page/test_page_page.dart';
import '../view/pages/auth_pages/login_singup_page.dart';
import '../view/pages/bookmark_page.dart';

import '../view/pages/error.dart';
import '../view/pages/news_main_page.dart';

import '../view/pages/news_search/news_search_page.dart';
import '../view/pages/news_search/news_search_result_page.dart';
import '../view/pages/news_web_view.dart';
import '../view/pages/user_pages/email_activision_page.dart';
import '../view/pages/splash_pages/splash_screen.dart';

class Routes {
  static const String splashPage = "/splash";
  static const String homePage = "/home";
  static const String loginRegPage = '/login_reg';
  static const String searchPage = '/search';
  static const String searchResultPage = '/search_result';
  static const String newsWebViewPage = '/news_webview';
  static const String emailActivisonPage = '/emailActivison';
  static const String bookmarksPage = '/bookmarks';
  static const String errorPage = '/error';
  static const String testPage = '/test';

  static const String userPhotoUploader = '/user_photo_uploader';
}

class GetRoutes {
  static List<GetPage<dynamic>>? allRoutes = [
    GetPage(
      name: Routes.splashPage,
      page: () => const SplashScreen(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.homePage,
      page: () => const NewsMainPage(), /*  middlewares: [AuthMiddleware()] */
    ),
    GetPage(
      name: Routes.loginRegPage,
      page: () => const UserLoginRegistrationPage(),
      transition: Transition.zoom,
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.elasticInOut,
    ),
    GetPage(
      name: Routes.searchResultPage,
      page: () => const NewsSearchResultPage(),
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
        middlewares: [BookmarkMiddleware()]),
    GetPage(
      name: Routes.emailActivisonPage,
      page: () => const EmailActivisonPage(),
      transition: Transition.zoom,
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.elasticInOut,
      middlewares: [EmailActivisonMiddelware()],
    ),
    GetPage(
      name: Routes.errorPage,
      page: () => const ErrorPage(),
      transition: Transition.zoom,
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.elasticInOut,
    ),
    GetPage(
      name: Routes.testPage,
      page: () => const TestPagePage(),
      transition: Transition.zoom,
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.elasticInOut,
    ),
    GetPage(
      name: Routes.userPhotoUploader,
      page: () => const UserPhotoUploaderPage(),
      transition: Transition.zoom,
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.elasticInOut,
    ),
  ];
}
