import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tell_me_news/controller/login_registaration_controller.dart';
import 'package:unicons/unicons.dart';

class UserLoginRegistrationPage extends StatefulWidget {
  const UserLoginRegistrationPage({Key? key}) : super(key: key);

  @override
  State<UserLoginRegistrationPage> createState() =>
      _UserLoginRegistrationPageState();
}

class _UserLoginRegistrationPageState extends State<UserLoginRegistrationPage> {
  var pageCtrl = Get.put<LoginRegistrationController>(
      LoginRegistrationController(),
      tag: 'loginReg_ctrl');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Obx(
          () => Text(
            pageCtrl.title.value,
            style: GoogleFonts.aldrich(),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            UniconsThinline.previous,
            size: 30,
          ),
        ),
      ),
      body: GetBuilder<LoginRegistrationController>(
        tag: 'loginReg_ctrl',
        builder: (_) => pageCtrl.bodyWidget,
      ),
    );
  }
}
