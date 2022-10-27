import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tell_me_news/config/app_route.dart';

class EmailActivisonPage extends StatefulWidget {
  const EmailActivisonPage({Key? key}) : super(key: key);

  @override
  State<EmailActivisonPage> createState() => _EmailActivisonPageState();
}

class _EmailActivisonPageState extends State<EmailActivisonPage>
    with TickerProviderStateMixin {
  User user = FirebaseAuth.instance.currentUser!;
  @override
  void initState() {
    super.initState();
    if (user.emailVerified) {
      Get.offAndToNamed(Routes.homePage);
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    bool sender = true;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Get.theme.backgroundColor,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Email Verification',
          style: TextStyle(color: Colors.green),
        ),
        leading: IconButton(
          onPressed: () async {
            FirebaseAuth.instance.currentUser!.reload();
            var xUser = await FirebaseAuth.instance.authStateChanges().first;
            xUser!.emailVerified;

            if (xUser.emailVerified) {
              Get.offAndToNamed(Routes.homePage);
            }
          },
          icon: const Icon(
            Icons.compare_arrows_rounded,
            color: Colors.green,
          ),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: height * .14,
            ),
            Text('Email: ${user.email ?? 'not valid'}'),
            SizedBox(
              height: height * .04,
            ),
            Text('User Name: ${user.displayName}'),
            SizedBox(
              height: height * .04,
            ),
            Text('Verification: ${user.emailVerified}'),
            SizedBox(
              height: height * .04,
            ),
            ElevatedButton.icon(
              onPressed: () {
                if (sender) {
                  FirebaseAuth.instance.currentUser!.sendEmailVerification();
                  sender = false;
                  Get.snackbar(
                    'Verification',
                    "Message has been sent check your email",
                    backgroundColor: Colors.green,
                  );
                } else {
                  Get.snackbar(
                    'Verification',
                    "Restart the app",
                    backgroundColor: Colors.green,
                  );
                }
              },
              icon: const Icon(Icons.repeat_sharp),
              label: const Text('Resend activation'),
            ),
            ElevatedButton.icon(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Get.offAllNamed(Routes.splashPage);
              },
              icon: const Icon(Icons.logout),
              label: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
