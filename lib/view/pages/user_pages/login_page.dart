import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tell_me_news/controller/login_registaration_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = Get.find<LoginRegistrationController>(
    tag: 'loginReg_ctrl',
  ).loginController;

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
              "login_slogan".tr,
              style: GoogleFonts.righteous(
                fontSize: 18,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 40,
            ),
            child: Center(
              child: Container(
                width: context.width * .8,
                height: context.height * .4,
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
                      _TFBox(
                        tfCtrl: controller.userTXTCtrl,
                        icon: Icons.person,
                        hintText: 'inp_email'.tr,
                        boxText: 'email'.tr,
                        keyboardType: TextInputType.emailAddress,
                        isPassword: false,
                        validator: controller.userValidator,
                      ),
                      _TFBox(
                        tfCtrl: controller.passowordTXTCtrl,
                        icon: Icons.lock,
                        hintText: 'inp_password'.tr,
                        boxText: 'password'.tr,
                        keyboardType: TextInputType.visiblePassword,
                        isPassword: true,
                        validator: controller.passwordValidator,
                      ),
                      TextButton.icon(
                        onPressed: () {
                          controller.login();
                        },
                        icon: const Icon(
                          Icons.input,
                          size: 34,
                        ),
                        label: Text(
                          'login'.tr,
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
    required this.icon,
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
