import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tell_me_news/config/app_route.dart';

class BookmarkMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    //
    var xUser = FirebaseAuth.instance.currentUser;
    if (xUser!.isAnonymous) {
      //
      Get.snackbar(
          'Error', 'You can\'t open bookmark you are unregistered user');
      return const RouteSettings(name: Routes.errorPage);
      //
    }
    return null;
  }
}
