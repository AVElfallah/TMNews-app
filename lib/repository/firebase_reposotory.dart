import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirebaseRepo {
  static User getUser() {
    return FirebaseAuth.instance.currentUser!;
  }

  static Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  static Future<bool> signIn(String email, String password) async {
    try {
      var back = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      // ignore: unnecessary_null_comparison
      return back != null;
    } on FirebaseAuthException catch (exp) {
      Get.snackbar(
        'error'.tr,
        exp.message!,
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        barBlur: 40,
      );
      return false;
    } catch (exp) {
      Get.snackbar(
        'error'.tr,
        exp.toString(),
        backgroundColor: Colors.red,
        barBlur: 30,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
  }

  static Future<bool> createNewUser(
      String userName, String email, String password) async {
    try {
      UserCredential userCredential = await (FirebaseAuth.instance
            ..setLanguageCode(
              Get.locale!.countryCode,
            ))
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await userCredential.user!.sendEmailVerification();
      await userCredential.user!.updateDisplayName(
        userName,
      );
      return true;
    } on FirebaseAuthException catch (exp) {
      Get.snackbar(
        'error'.tr,
        exp.message!,
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        barBlur: 40,
      );
      return false;
    } catch (exp) {
      Get.snackbar(
        'error'.tr,
        exp.toString(),
        backgroundColor: Colors.red,
        barBlur: 30,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
  }
}
