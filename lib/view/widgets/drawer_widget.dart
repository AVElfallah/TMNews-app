import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tell_me_news/config/app_route.dart';
import 'package:tell_me_news/config/assets.dart';
import 'package:tell_me_news/controller/app_settings_controller.dart';

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
                      padding: const EdgeInsets.all(
                        8,
                      ), // Border width
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      child: ClipOval(
                        child: SizedBox.fromSize(
                          size: const Size.fromRadius(
                            40,
                          ), // Image radius
                          child: Image.asset(
                            Assets.person,
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
                    'darkmode'.tr,
                    style: GoogleFonts.righteous(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  secondary: Icon(
                    Icons.dark_mode,
                    size: 38,
                    color: context.theme.colorScheme.onBackground,
                  ),
                  value: isDarkVal,
                  onChanged: (val) {
                    c.changeTheme(val);
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
              onTap: () {
                Get.dialog(
                  StatefulBuilder(
                    builder: (context, setState) {
                      return SimpleDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        title: GFListTile(
                          title: Text(
                            'applanguage'.tr,
                            textAlign: TextAlign.center,
                          ),
                          icon: const Icon(
                            Icons.language,
                          ),
                        ),
                        children: [
                          GFListTile(
                            title: const Text('اللغة العربية'),
                            onTap: () {
                              c.changeToArabicLanguage();
                              setState(() {});
                            },
                          ),
                          const Divider(
                            color: Colors.amber,
                            indent: 30,
                            endIndent: 30,
                          ),
                          GFListTile(
                            title: const Text('English Language'),
                            onTap: () {
                              c.changeToEnglishLanguage();
                              setState(() {});
                            },
                          ),
                        ],
                      );
                    },
                  ),
                );
              },
              title: Text(
                "applanguage".tr,
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
                Get.toNamed(Routes.bookmarksPage);
              },
              title: Text(
                "bookmarks".tr,
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
                "usersettings".tr,
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
                await FirebaseAuth.instance.signOut();
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
              child: Text('logout'.tr),
            )
          ],
        );
      },
    );
  }
}
