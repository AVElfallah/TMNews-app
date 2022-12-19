import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tell_me_news/controller/login_registaration_controller.dart';

import 'login_page.dart';
import 'singup_page.dart';

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

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: context.theme.backgroundColor,
        title: Obx(
          () => Text(
            pageCtrl.title.value,
            style: GoogleFonts.aldrich(
              color: context.isDarkMode ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size(
            double.infinity,
            mqSize.height * .09,
          ),
          child: SizedBox(
            width: mqSize.width * .78,
            child: Obx(
              () {
                return Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        width: mqSize.width * .44,
                        child: GFButton(
                          onPressed: () {
                            pageCtrl.goToSingupPage();
                          },
                          fullWidthButton: true,
                          text: 'singup'.tr,
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
                            pageCtrl.goToLoginPage();
                          },
                          fullWidthButton: true,
                          text: 'login'.tr,
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
              },
            ),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 30,
            color: context.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
      ),
      body: GetBuilder<LoginRegistrationController>(
        tag: 'loginReg_ctrl',
        builder: (_) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: PageView(
              controller: pageCtrl.pageController,
              children: const [
                LoginPage(),
                SingupWidget(),
              ],
            ),
          );
        },
      ),
    );
  }
}
