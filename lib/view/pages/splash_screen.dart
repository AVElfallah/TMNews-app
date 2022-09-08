import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tell_me_news/controller/splash_controller.dart';
import 'package:tell_me_news/repository/shared.dart';
import 'package:unicons/unicons.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  var pagCtrl = Get.put<SplashController>(SplashController());
  late Rx<AnimationController> animCtrl;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    pagCtrl.initAnimController(this);
    animCtrl = pagCtrl.animationController;

    return Scaffold(
      backgroundColor: Colors.lightBlue.shade900,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: animCtrl.value,
              child: Text('Welcome to TM-News',
                  style: GoogleFonts.alfaSlabOne(
                    fontSize: 29,
                    color: Colors.white,
                  )),
            ),
            ScaleTransition(
                scale: animCtrl.value,
                child: Image.asset('assets/images/tmlogo.png')),
            GetBuilder<SplashController>(
              builder: (pageCtrl) {
                return pageCtrl.placeholder;
              },
              init: SplashController(),
            )
          ],
        ),
      ),
    );
  }
}
