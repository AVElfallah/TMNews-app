import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tell_me_news/controller/login_registaration_controller.dart';
import 'package:unicons/unicons.dart';

class SingupWidget extends StatefulWidget {
  const SingupWidget({Key? key}) : super(key: key);

  @override
  State<SingupWidget> createState() => _SingupWidgetState();
}

class _SingupWidgetState extends State<SingupWidget> {
  final passowordTXTCtrl = TextEditingController();

  final userTXTCtrl = TextEditingController();

  bool isHidenPassword = true;

  @override
  Widget build(BuildContext context) {
    final prevPage =
        Get.find<LoginRegistrationController>(tag: 'loginReg_ctrl');
    final _formKey = GlobalKey<FormState>();

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final constraints = BoxConstraints(
      maxWidth: width * .6,
      minWidth: width * .6,
    );
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: 'welcome_text',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/tmlogo.png',
                  width: width * .14,
                  height: height * .2,
                ),
                Text(
                  'Singup be one of us',
                  style: GoogleFonts.righteous(fontSize: 18),
                ),
              ],
            ),
          ),
          Center(
            child: Hero(
              tag: 'container_body',
              child: Container(
                width: width * .8,
                height: height * .8,
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
                        /*
                        *User Name
                        */

                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            style: const TextStyle(fontSize: 18),
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              constraints: constraints,
                              contentPadding: const EdgeInsets.all(10),
                              hintText: 'Input your user name',
                              label: Text(
                                'User Name',
                                style: GoogleFonts.righteous(fontSize: 25),
                              ),
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.center,
                              prefixIcon: const Icon(UniconsLine.user),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                  color: Colors.lightBlue.shade800,
                                ),
                              ),
                            ),
                          ),
                        ),
                        //End UserName//

                        //Email Start//

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: userTXTCtrl,
                            style: const TextStyle(fontSize: 18),
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(10),
                              constraints: constraints,
                              hintText: 'Input your E-mail',
                              label: Text(
                                'Email',
                                style: GoogleFonts.righteous(fontSize: 24),
                              ),
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.center,
                              prefixIcon: const Icon(UniconsLine.mailbox),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: BorderSide(
                                  color: Colors.lightBlue.shade800,
                                ),
                              ),
                            ),
                          ),
                        ),
                        //Email End//

                        //Password Start//

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: StatefulBuilder(builder:
                              (BuildContext context, StateSetter setState) {
                            return TextFormField(
                              controller: passowordTXTCtrl,
                              obscureText: isHidenPassword,
                              style: const TextStyle(fontSize: 18),
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                constraints: constraints,
                                hintText: 'Input your password',
                                label: Text(
                                  'Password',
                                  style: GoogleFonts.righteous(fontSize: 25),
                                ),
                                contentPadding: const EdgeInsets.all(10),
                                prefixIcon: const Icon(UniconsLine.lock),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() =>
                                        isHidenPassword = !isHidenPassword);
                                  },
                                  tooltip: 'unhide password',
                                  icon: const Icon(
                                    UniconsLine.eye,
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
                          }),
                        ),
                        //Password End//

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: StatefulBuilder(builder:
                              (BuildContext context, StateSetter setState) {
                            return TextFormField(
                              obscureText: isHidenPassword,
                              style: const TextStyle(fontSize: 18),
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(10),
                                constraints: constraints,
                                hintText: 'Input your password',
                                label: Text(
                                  'Password Confirmation',
                                  style: GoogleFonts.righteous(
                                    fontSize: 20,
                                  ),
                                ),
                                prefixIcon: const Icon(UniconsLine.lock),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(
                                      () => isHidenPassword = !isHidenPassword,
                                    );
                                  },
                                  tooltip: 'unhide password',
                                  icon: const Icon(
                                    UniconsLine.eye,
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
                          }),
                        ),
                        TextButton.icon(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              print('valid');
                            }
                          },
                          icon: const Icon(
                            UniconsLine.sign_in_alt,
                            size: 34,
                          ),
                          label: Text(
                            'Singup',
                            style: GoogleFonts.righteous(fontSize: 18),
                          ),
                        )
                      ]),
                ),
              ),
            ),
          ),
          Hero(
            tag: 'changeUI_button',
            child: ElevatedButton(
              onPressed: () {
                prevPage.changeBodyWidget();
              },
              child: Text(
                'Login',
                style: GoogleFonts.righteous(fontSize: 18),
              ),
            ),
          )
        ],
      ),
    );
  }
}