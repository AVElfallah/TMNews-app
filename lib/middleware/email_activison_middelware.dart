import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tell_me_news/config/app_route.dart';

class EmailActivisonMiddelware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    //
    var xUser = FirebaseAuth.instance.currentUser;
    //
    if (xUser!.emailVerified && xUser.photoURL != null) {
      //
      return const RouteSettings(name: Routes.homePage);
      //
    }
    return null;
  }
}
