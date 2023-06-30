import 'package:flutter/cupertino.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

extension ContextExtensions on BuildContext {
  static final _zoom = ZoomDrawerController();
  ZoomDrawerController get zoomController => _zoom;
  void changeZoomDrawerState() {
    //NOTE -  this open and close zoom drawer
    if (_zoom.isOpen!()) {
      _zoom.close!();
    }
    _zoom.open!();
  }
}
