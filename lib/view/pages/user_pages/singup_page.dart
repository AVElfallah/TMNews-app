import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:tell_me_news/controller/login_registaration_controller.dart';

class SingupWidget extends StatefulWidget {
  const SingupWidget({Key? key}) : super(key: key);

  @override
  State<SingupWidget> createState() => _SingupWidgetState();
}

class _SingupWidgetState extends State<SingupWidget> {
  var controller = Get.find<LoginRegistrationController>(tag: 'loginReg_ctrl')
      .singupController;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(
              10,
            ),
            child: Text(
              'singup_slogan'.tr,
              style: GoogleFonts.righteous(
                fontSize: 18,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: Center(
              child: Container(
                width: context.width * .8,
                height: context.height * .65,
                padding: const EdgeInsets.all(
                  10,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1.4,
                  ),
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                ),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      /*
                            *User Name
                            */

                      _TFBox(
                        tfCtrl: controller.userTXTCtrl,
                        validator: controller.usernameValidator,
                        hintText: 'inp_name'.tr,
                        boxText: 'user_name'.tr,
                        icon: Icons.person,
                        keyboardType: TextInputType.name,
                      ),
                      //End UserName//

                      //Email Start//
                      _TFBox(
                        tfCtrl: controller.emailCtrl,
                        validator: controller.emailValidator,
                        hintText: 'inp_email'.tr,
                        boxText: 'email'.tr,
                        icon: Icons.mail_outline,
                        keyboardType: TextInputType.emailAddress,
                      ),

                      //Email End//

                      //Password Start//

                      _TFBox(
                        tfCtrl: controller.passowordTXTCtrl,
                        validator: controller.passwordValidator,
                        hintText: 'inp_password'.tr,
                        boxText: 'password'.tr,
                        icon: Icons.lock,
                        isPassword: true,
                        keyboardType: TextInputType.visiblePassword,
                      ),

                      //Password End//

                      _TFBox(
                        tfCtrl: TextEditingController(),
                        validator: controller.confirmationValidator,
                        hintText: 'inp_password'.tr,
                        boxText: 'confirmation'.tr,
                        icon: Icons.lock,
                        isPassword: true,
                        keyboardType: TextInputType.visiblePassword,
                      ),

                      ///
                      TextButton.icon(
                        onPressed: () {
                          //create user
                          controller.createUser();
                        },
                        icon: const Icon(
                          Icons.input,
                          size: 34,
                        ),
                        label: Text(
                          'singup'.tr,
                          style: GoogleFonts.righteous(
                            fontSize: 18,
                          ),
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

// ignore: must_be_immutable
class _TFBox extends StatelessWidget {
  _TFBox({
    required this.tfCtrl,
    this.validator,
    this.hintText,
    this.boxText,
    this.icon,
    this.keyboardType,
    this.isPassword = false,
  });
  final TextEditingController? tfCtrl;
  final String? hintText, boxText;
  final IconData? icon;
  final bool? isPassword;
  String? Function(String?)? validator;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    var isHidenPassword = isPassword;

    return Padding(
      padding: const EdgeInsets.all(8),
      child: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return TextFormField(
            controller: tfCtrl,
            validator: validator,
            obscureText: isHidenPassword!,
            style: const TextStyle(fontSize: 18),
            keyboardType: keyboardType,
            decoration: InputDecoration(
              constraints: BoxConstraints(
                maxWidth: width * .72,
                minWidth: width * .72,
              ),
              contentPadding: const EdgeInsets.all(10),
              hintText: hintText,
              label: Text(
                boxText!,
                style: GoogleFonts.righteous(fontSize: 20),
              ),
              floatingLabelAlignment: FloatingLabelAlignment.center,
              prefixIcon: Icon(icon),
              suffixIcon: Visibility(
                visible: isPassword!,
                child: IconButton(
                  onPressed: () {
                    setState(
                      () => isHidenPassword = !isHidenPassword!,
                    );
                  },
                  tooltip: 'unhide password',
                  icon: const Icon(
                    Icons.visibility,
                  ),
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  30,
                ),
                borderSide: BorderSide(
                  color: Colors.lightBlue.shade800,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
