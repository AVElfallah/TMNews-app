import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tell_me_news/controller/app_settings_controller.dart';
import 'package:tell_me_news/repository/app_preferences.dart';

import '../../controller/user_controller.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDarkVal = Get.isDarkMode;
    var userCtrl = Get.find<UserController>(tag: 'user_ctrl');
    return GetBuilder<AppSettingsController>(
      tag: "appSettings",
      builder: (c) {
        return Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .24,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: const EdgeInsets.all(8), // Border width
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      child: ClipOval(
                        child: SizedBox.fromSize(
                          size: const Size.fromRadius(40), // Image radius
                          child: Image.asset(
                            'assets/images/person.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      userCtrl.userPreferences!.name!,
                      maxLines: 1,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.alfaSlabOne(
                        fontSize: 25,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            StatefulBuilder(
              builder: (ctx, StateSetter setter) {
                return SwitchListTile(
                  title: Text(
                    'Dark Mode',
                    style: GoogleFonts.righteous(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  secondary: Icon(
                    Icons.dark_mode,
                    size: 38,
                    color: Get.rootController.theme?.primaryColor,
                  ),
                  value: isDarkVal,
                  onChanged: (val) {
                    Get.changeThemeMode(
                      val == true ? ThemeMode.dark : ThemeMode.light,
                    );
                    SharedAppSettings().changeThemeMode(val);
                    setter(
                      () {
                        isDarkVal = val;
                      },
                    );
                  },
                );
              },
            ),
            ListTile(
              title: Text(
                "App Language",
                style: GoogleFonts.righteous(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              leading: const Icon(
                Icons.g_translate,
                size: 36,
              ),
            ),
            ListTile(
              onTap: () {
                Get.toNamed('/bookmarks');
              },
              title: Text(
                "Bookmarks",
                style: GoogleFonts.righteous(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              leading: const Icon(
                Icons.bookmarks,
                size: 36,
              ),
            ),
            ListTile(
              title: Text(
                "User Settings",
                style: GoogleFonts.righteous(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              leading: const Icon(
                Icons.settings,
                size: 36,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .15,
            ),
            ElevatedButton(
              onPressed: () async {
                userCtrl.refresh();
                await Get.offAllNamed('/splash');
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(150, 40),
                elevation: 10,
                textStyle: GoogleFonts.righteous(fontSize: 18),
                shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
              ),
              child: const Text('Logout'),
            )
          ],
        );
      },
    );
  }
}
