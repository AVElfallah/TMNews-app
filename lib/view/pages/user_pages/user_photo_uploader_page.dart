import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tell_me_news/config/app_route.dart';
import 'package:tell_me_news/config/assets.dart';
import 'package:tell_me_news/controller/user_photo_uploader_controller.dart';

class UserPhotoUploaderPage extends StatefulWidget {
  const UserPhotoUploaderPage({Key? key}) : super(key: key);

  @override
  State<UserPhotoUploaderPage> createState() => _UserPhotoUploaderPageState();
}

class _UserPhotoUploaderPageState extends State<UserPhotoUploaderPage> {
  var pageCtrl =
      Get.put<UserPhotoUploaderController>(UserPhotoUploaderController());

  @override
  Widget build(BuildContext context) {
    final xUser = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome ${xUser!.displayName}'),
        leading: IconButton(
          icon: const Icon(Icons.logout),
          onPressed: (() async {
            await FirebaseAuth.instance.signOut();
            await Get.offAllNamed(Routes.splashPage);
          }),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'Upload your profile pic',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(18.0),
            child: Center(
              child: Text(
                'there is only one step left',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 19),
              ),
            ),
          ),
          Obx(() {
            return Padding(
              padding: const EdgeInsets.all(18.0),
              child: CircleAvatar(
                backgroundColor: context.theme.secondaryHeaderColor,
                radius: 100,
                backgroundImage: pageCtrl.pathToImage!.value == ''
                    ? Image.asset(Assets.person).image
                    : FileImage(File(pageCtrl.pathToImage!.value)),
              ),
            );
          }),
          TextButton.icon(
            onPressed: pageCtrl.getPicFromDevice,
            icon: Icon(
              Icons.image_search,
              color: Colors.green.shade300,
              size: 25,
            ),
            label: Text(
              'choose image',
              style: TextStyle(
                color: Colors.green.shade300,
                fontSize: 17,
              ),
            ),
          ),
          TextButton.icon(
            onPressed: pageCtrl.uploadPic,
            icon: Icon(
              Icons.upload,
              color: Colors.green.shade300,
              size: 25,
            ),
            label: Text(
              'upload picture',
              style: TextStyle(
                color: Colors.green.shade300,
                fontSize: 17,
              ),
            ),
          )
        ],
      ),
    );
  }
}
