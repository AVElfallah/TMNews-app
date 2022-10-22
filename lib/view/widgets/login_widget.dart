import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:tell_me_news/config/app_route.dart';
import 'package:tell_me_news/controller/login_registaration_controller.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final passowordTXTCtrl = TextEditingController();

  final userTXTCtrl = TextEditingController();

  bool isHidenPassword = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final constraints = BoxConstraints(
      maxWidth: width * .72,
      minWidth: width * .72,
    );
    var controller =
        Get.find<LoginRegistrationController>(tag: 'loginReg_ctrl');
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              "login_slogan".tr,
              style: GoogleFonts.righteous(fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Center(
              child: Container(
                width: width * .8,
                height: height * .4,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1.4),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: userTXTCtrl,
                          style: const TextStyle(fontSize: 18),
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            constraints: constraints,
                            hintText: 'inp_email'.tr,
                            contentPadding: const EdgeInsets.all(10),
                            label: Text(
                              'email'.tr,
                              style: GoogleFonts.righteous(fontSize: 20),
                            ),
                            floatingLabelAlignment:
                                FloatingLabelAlignment.center,
                            prefixIcon: const Icon(Icons.person),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide:
                                  BorderSide(color: Colors.lightBlue.shade800),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: StatefulBuilder(
                          builder:
                              (BuildContext context, StateSetter setState) {
                            return TextFormField(
                              controller: passowordTXTCtrl,
                              obscureText: isHidenPassword,
                              style: const TextStyle(fontSize: 18),
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                constraints: constraints,
                                contentPadding: const EdgeInsets.all(10),
                                hintText: 'inp_password'.tr,
                                label: Text(
                                  'password'.tr,
                                  style: GoogleFonts.righteous(fontSize: 18),
                                ),
                                floatingLabelAlignment:
                                    FloatingLabelAlignment.center,
                                prefixIcon: const Icon(Icons.lock),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() =>
                                        isHidenPassword = !isHidenPassword);
                                  },
                                  tooltip: 'unhidepassword'.tr,
                                  icon: const Icon(
                                    Icons.visibility,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: BorderSide(
                                    color: Colors.lightBlue.shade800,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await controller.loginController.loginUser(
                              userTXTCtrl.text,
                              passowordTXTCtrl.text,
                            );

                            if (FirebaseAuth
                                .instance.currentUser!.emailVerified) {
                              Get.offAllNamed(Routes.homePage);
                            } else {
                              Get.offAllNamed(Routes.emailActivisonPage);
                            }
                            // return false;
                          }
                        },
                        icon: const Icon(
                          Icons.input,
                          size: 34,
                        ),
                        label: Text(
                          'login'.tr,
                          style: GoogleFonts.righteous(fontSize: 18),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
