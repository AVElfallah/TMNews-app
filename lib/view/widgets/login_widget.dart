import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final passowordTXTCtrl = TextEditingController();

  final userTXTCtrl = TextEditingController();

  bool isHidenPassword = true;

  @override
  Widget build(BuildContext context) {
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
          Padding(
            padding: const EdgeInsets.all(10),
            child: Hero(
              tag: 'welcome_text',
              child: Text(
                'Login and enjoy our services',
                style: GoogleFonts.righteous(fontSize: 18),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Center(
              child: Hero(
                tag: 'container_body',
                child: Container(
                  width: width * .8,
                  height: height * .5,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1.4),
                    borderRadius: BorderRadius.circular(20),
                  ),
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
                              hintText: 'Input your user name',
                              contentPadding: const EdgeInsets.all(10),
                              label: Text(
                                'User Name',
                                style: GoogleFonts.righteous(fontSize: 20),
                              ),
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.center,
                              prefixIcon: const Icon(Icons.person),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: BorderSide(
                                    color: Colors.lightBlue.shade800),
                              ),
                            ),
                          ),
                        ),
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
                                contentPadding: const EdgeInsets.all(10),
                                hintText: 'Input your password',
                                label: Text(
                                  'Password',
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
                                  tooltip: 'unhide password',
                                  icon: const Icon(
                                    Icons.visibility,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: BorderSide(
                                      color: Colors.lightBlue.shade800),
                                ),
                              ),
                            );
                          }),
                        ),
                        TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.input,
                            size: 34,
                          ),
                          label: Text(
                            'login',
                            style: GoogleFonts.righteous(fontSize: 18),
                          ),
                        )
                      ]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
