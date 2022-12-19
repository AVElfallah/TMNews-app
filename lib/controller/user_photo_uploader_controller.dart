import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tell_me_news/config/app_route.dart';

class UserPhotoUploaderController extends GetxController {
  RxString? pathToImage = ''.obs;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  Future getPicFromDevice() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);

    pathToImage?.value = image?.path ?? '';
  }

  Future? uploadPic() async {
    if (pathToImage!.value != '') {
      try {
        //Create a reference to the location you want to upload to in firebase
        Reference reference = _storage
            .ref('${FirebaseAuth.instance.currentUser!.uid}/pics')
            .child('${FirebaseAuth.instance.currentUser!.uid}.png');

        //Upload the file to firebase
        Get.showOverlay(
          asyncFunction: () => reference.putFile(File(pathToImage!.value)),
          loadingWidget: const Center(
            child: CircularProgressIndicator(),
          ),
        );

        var task = await reference.getDownloadURL();
        // Get.dialog(Material(child: Center(child: Image.network(task))));
        await _recoredPictuerToFirebase(task);
        return null;
      } on FirebaseException catch (e) {
        Get.snackbar(e.toString(), e.toString());
        return null;
      }
    }
  }

  Future<String> _recoredPictuerToFirebase(String url) async {
    FirebaseAuth.instance.currentUser!.updatePhotoURL(url).then((value) async {
      await Get.offAllNamed(Routes.splashPage);
    }).onError((error, stackTrace) {
      Get.offAllNamed(Routes.errorPage);
    });
    return url;
  }
}
