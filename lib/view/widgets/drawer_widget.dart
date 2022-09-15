import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tell_me_news/controller/darwer_controller.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppDarwerController>(
        tag: "drawer_ctrl",
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
                        'Guest Account',
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
                    value: Get.rootController.isDarkMode,
                    onChanged: (val) {
                      setter(
                        () {
                          Get.rootController.reverseTheme();
                        },
                      );
                    },
                  );
                },
              ),
              ListTile(
                title: Text(
                  "Change Language",
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
                title: Text(
                  "Change Country",
                  style: GoogleFonts.righteous(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                leading: const Icon(
                  Icons.public,
                  size: 36,
                ),
              ),
              ListTile(
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
                onPressed: () {},
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
        });
  }
}

extension ChangeMode on GetMaterialController {
  void reverseTheme() {
    themeMode = themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    update();
  }

  bool get isDarkMode {
    return themeMode == ThemeMode.dark;
  }
}
