import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/app_route.dart';

class AuthMiddleware extends GetMiddleware {
  //SECTION -  middleware using on splashScreen call
  @override
  RouteSettings? redirect(String? route) {
    var xUser = FirebaseAuth.instance.currentUser;
    if (xUser != null) {
      if ((xUser.emailVerified && xUser.photoURL != null) ||
          xUser.isAnonymous) {
        //
        return const RouteSettings(name: Routes.homePage);
        //
      } else if (!xUser.emailVerified && !xUser.isAnonymous) {
        //
        return const RouteSettings(name: Routes.emailActivisonPage);
        //
      } else if (xUser.emailVerified && xUser.photoURL == null) {
        //
        return const RouteSettings(name: Routes.userPhotoUploader);
        //
      }
    }
    return null;
  }
}
