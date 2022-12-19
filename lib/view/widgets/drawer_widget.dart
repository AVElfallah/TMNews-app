import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tell_me_news/config/app_route.dart';
import 'package:tell_me_news/config/assets.dart';
import 'package:tell_me_news/services/app_settings.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget(
      {Key? key,
      required this.changeAppTheme,
      required this.appSettings,
      required this.languageDialog})
      : super(key: key);
  final void Function(bool)? changeAppTheme;
  final AppSettingsService appSettings;
  final Widget languageDialog;
  final righteousStyle = GoogleFonts.righteous(
    fontWeight: FontWeight.bold,
    fontSize: 17,
  );

  @override
  Widget build(BuildContext context) {
    final xUser = FirebaseAuth.instance.currentUser;
    return Column(
      children: [
        SizedBox(
          height: context.height * .24,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding: const EdgeInsets.all(
                    8,
                  ), // Border width
                  decoration: BoxDecoration(
                    color: context.theme.secondaryHeaderColor,
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(
                        40,
                      ), // Image radius
                      child: xUser!.photoURL != null
                          ? Image.network(
                              xUser.photoURL!,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
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
                  xUser.displayName ?? appSettings.userPreferences!.name!,
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
        SwitchListTile(
          title: Text(
            'darkmode'.tr,
            style: righteousStyle,
          ),
          secondary: Icon(
            Icons.dark_mode,
            size: 38,
            color: context.theme.colorScheme.onBackground,
          ),
          value: context.isDarkMode,
          onChanged: ((value) => changeAppTheme!.call(value)),
        ),
        ListTile(
          onTap: () {
            Get.dialog(languageDialog);
          },
          title: Text(
            "applanguage".tr,
            style: righteousStyle,
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
            style: righteousStyle,
          ),
          leading: const Icon(
            Icons.bookmarks,
            size: 36,
          ),
        ),
        ListTile(
          title: Text(
            "usersettings".tr,
            style: righteousStyle,
          ),
          leading: const Icon(
            Icons.settings,
            size: 36,
          ),
        ),
        SizedBox(
          height: context.height * .15,
        ),
        ElevatedButton(
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            await Get.offAllNamed('/splash');
          },
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(
              150,
              40,
            ),
            elevation: 10,
            textStyle: GoogleFonts.righteous(
              fontSize: 18,
            ),
            shape: const RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(
                  25,
                ),
              ),
            ),
          ),
          child: Text(
            'logout'.tr,
          ),
        )
      ],
    );
  }
}
