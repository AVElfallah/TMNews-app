import 'dart:async';
import 'dart:isolate';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tell_me_news/config/app_route.dart';

class EmailActivisonPage extends StatefulWidget {
  const EmailActivisonPage({Key? key}) : super(key: key);

  @override
  State<EmailActivisonPage> createState() => _EmailActivisonPageState();
}

class MessageToIsolate {
  final SendPort sendPort;
  final FirebaseAuth auth;

  MessageToIsolate(this.sendPort, this.auth);
}

class _EmailActivisonPageState extends State<EmailActivisonPage> {
  final User user = FirebaseAuth.instance.currentUser!;
  final receivePort = ReceivePort();
  StreamController? ctrl;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    Future.microtask(
      () async {
        Stream checkStream = Stream<Future<bool>>.periodic(
          const Duration(milliseconds: 2200),
          (m) async {
            await FirebaseAuth.instance.currentUser?.reload();
            if (FirebaseAuth.instance.currentUser?.emailVerified ?? false) {
              return true;
            }
            debugPrint(m.toString());
            return false;
          },
        );
        StreamSubscription d = checkStream.listen((event) {});
        d.onData(
          (data) async {
            if (await data) {
              d.cancel();
              Get.offAllNamed(Routes.splashPage);
            }
          },
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              height: context.height * .14,
            ),
            Text('Email: ${user.email ?? 'not valid'}'),
            SizedBox(
              height: context.height * .04,
            ),
            Text('User Name: ${user.displayName}'),
            SizedBox(
              height: context.height * .04,
            ),
            Text('Verification: ${user.emailVerified}'),
            SizedBox(
              height: context.height * .04,
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


/* void computeIsolate(FirebaseAuth message) {
  Stream<User?> strV() async*{
while(true){
 await FirebaseAuth.instance.currentUser!.reload();
  yield  FirebaseAuth.instance.currentUser;
  sleep(const Duration(milliseconds:1700 ),);
}
  }
  

  final StreamController _controller = StreamController.broadcast();

  _controller.addStream(streamcompute(message.numb));

  _controller.stream.listen((event) {
    message.sendPort.send(event);
  });

  // streamcompute(message.numb).listen((event) {
  //   message.sendPort.send(event);
  // });
} */