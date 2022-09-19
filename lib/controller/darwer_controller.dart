import 'package:flutter/cupertino.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';

class AppDarwerController extends GetxController {
  ZoomDrawerController zoomDrawerController = ZoomDrawerController();

  open() {
    zoomDrawerController.open!();
    update();
  }
}
