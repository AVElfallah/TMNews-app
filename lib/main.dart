import 'package:firebase_auth/firebase_auth.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tell_me_news/config/app_route.dart';

import 'package:tell_me_news/controller/user_controller.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:tell_me_news/localization/localization.dart';
import 'firebase_options.dart';

import 'repository/app_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedAppSettings().initialiGuestAccount();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put<UserController>(UserController(), tag: 'user_ctrl');

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
    String initialRoute() {
      var xUser = FirebaseAuth.instance.currentUser;
      if (xUser != null) {
        if (!xUser.emailVerified && !xUser.isAnonymous) {
          return Routes.emailActivisonPage;
        } else {
          return Routes.homePage;
        }
      }
      return Routes.splashPage;
    }

    return GetMaterialApp(
      title: 'Tell Me News',
      translations: Languages(),
      locale: Locale(userCtrl.userPreferences!.appLanguage!),
      debugShowCheckedModeBanner: false,
      theme: FlexThemeData.light(
        scheme: scheme,
        appBarElevation: 0.5,
      ),
      darkTheme: FlexThemeData.dark(
        scheme: scheme,
        appBarElevation: 2,
      ),
      getPages: GetRoutes().allRoutes,
      initialRoute: initialRoute(),
    );
  }
}
