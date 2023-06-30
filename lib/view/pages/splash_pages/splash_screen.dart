import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tell_me_news/config/app_route.dart';
import 'package:tell_me_news/config/assets.dart';
import 'package:tell_me_news/controller/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  var pagCtrl = Get.put<SplashController>(SplashController());
  late AnimationController animCtrl;
  @override
  void initState() {
    super.initState();
    pagCtrl.initAnimController(this);
    animCtrl = pagCtrl.animationController;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: animCtrl,
              child: Text(
                'welcome'.tr,
                style: GoogleFonts.alfaSlabOne(
                  fontSize: 29,
                  color: Colors.white,
                ),
              ),
            ),
            ScaleTransition(
              scale: animCtrl,
              child: Image.asset(Assets.appLogo),
            ),
            GetBuilder<SplashController>(
              builder: (pageCtrl) {
                return Visibility(
                  visible: pagCtrl.isAnmatedDone,
                  child: Column(
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          Get.toNamed(Routes.loginRegPage);
                        },
                        icon: const Icon(Icons.person),
                        label: Text(
                          'loginReg'.tr,
                          style: TextStyle(
                            color: context.theme.secondaryHeaderColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () async {
                          var crid =
                              await FirebaseAuth.instance.signInAnonymously();
                          await crid.user!.updateDisplayName('Guest');
                          if (crid.user!.isAnonymous) {
                            debugPrint(crid.toString());
                            Get.offAndToNamed(Routes.homePage);
                          }
                        },
                        icon: const Icon(Icons.public),
                        label: Text(
                          'skiplogin'.tr,
                          style: TextStyle(
                            color: context.theme.secondaryHeaderColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
              init: SplashController(),
            )
          ],
        ),
      ),
    );
  }
}
