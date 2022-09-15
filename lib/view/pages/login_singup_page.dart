import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tell_me_news/controller/login_registaration_controller.dart';
import 'package:tell_me_news/view/widgets/login_widget.dart';
import 'package:tell_me_news/view/widgets/singup_widget.dart';

class UserLoginRegistrationPage extends StatefulWidget {
  const UserLoginRegistrationPage({Key? key}) : super(key: key);

  @override
  State<UserLoginRegistrationPage> createState() =>
      _UserLoginRegistrationPageState();
}

class _UserLoginRegistrationPageState extends State<UserLoginRegistrationPage> {
  var pageCtrl = Get.put<LoginRegistrationController>(
    LoginRegistrationController(),
    tag: 'loginReg_ctrl',
  );

  @override
  Widget build(BuildContext context) {
    final mqSize = MediaQuery.of(context).size;
    pageCtrl.pageController.addListener(() {
      pageCtrl.changePageTitle();
      pageCtrl.changePageColor();
    });
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text(
            pageCtrl.title.value,
            style: GoogleFonts.aldrich(),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size(
            double.infinity,
            mqSize.height * .09,
          ),
          child: SizedBox(
            width: mqSize.width * .78,
            child: Obx(() {
              return Stack(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: mqSize.width * .44,
                      child: GFButton(
                        onPressed: () {
                          pageCtrl.pageController.animateToPage(
                            1,
                            duration: const Duration(milliseconds: 1300),
                            curve: Curves.bounceInOut,
                          );
                        },
                        fullWidthButton: true,
                        text: 'singup',
                        borderSide: const BorderSide(color: Colors.black),
                        textStyle: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                        color: pageCtrl.singupButtonColor.value,
                        shape: GFButtonShape.pills,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: mqSize.width * .44,
                      child: GFButton(
                        onPressed: () {
                          pageCtrl.pageController.animateToPage(
                            0,
                            duration: const Duration(milliseconds: 1300),
                            curve: Curves.bounceInOut,
                          );
                        },
                        fullWidthButton: true,
                        text: 'login',
                        color: pageCtrl.loginButtonColor.value,
                        borderSide: const BorderSide(color: Colors.black),
                        textStyle: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                        shape: GFButtonShape.pills,
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 30,
          ),
        ),
      ),
      body: GetBuilder<LoginRegistrationController>(
        tag: 'loginReg_ctrl',
        builder: (_) {
          return PageView(
            controller: pageCtrl.pageController,
            children: const [
              LoginWidget(),
              SingupWidget(),
            ],
          );
        },
      ),
    );
  }
}
