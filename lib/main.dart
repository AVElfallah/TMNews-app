import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:tell_me_news/config/app_route.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:tell_me_news/localization/localization.dart';
import 'package:tell_me_news/services/app_settings.dart';
import 'firebase_options.dart';

import 'repository/app_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SharedAppSettings.instance.initialiGuestAccount();
  await Get.putAsync<AppSettingsService>(() async => AppSettingsService(),
      tag: 'settings_service');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userCtrl = Get.find<AppSettingsService>(tag: 'settings_service');

    const scheme = FlexScheme.bigStone;

    return GetMaterialApp(
      title: 'Tell Me News',
      translations: Languages(),
      locale: Locale(userCtrl.userPreferences?.appLanguage! ?? 'ar'),
      debugShowCheckedModeBanner: false,
      themeMode: context.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: FlexThemeData.light(
        scheme: scheme,
        appBarElevation: 0.5,
      ),
      darkTheme: FlexThemeData.dark(
        scheme: scheme,
        appBarElevation: 2,
      ),
      getPages: GetRoutes.allRoutes,
      initialRoute: Routes.splashPage,
    );
  }
}
