import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:tell_me_news/model/news_model.dart';

import '../repository/bookmarks_shared.dart';

class NewsCardController {
  addOrRemoveBookmark(NewsModel model) async {
    if (!await Bookmarks().contains(model.id!)) {
      Bookmarks().addBookmark(model).then((value) {
        Get.snackbar(
          'Info',
          'Done! bookmark has been added',
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.BOTTOM,
        );
      });
    } else {
      Bookmarks().removeFromBookmark(model.id).then((value) {
        Get.snackbar(
          'Info',
          'Done! bookmark has been removed',
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
        );
      });
    }
  }
}
