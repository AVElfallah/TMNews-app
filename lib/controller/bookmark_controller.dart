import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../repository/bookmarks_shared.dart';

class BookmarkController extends GetxController {
  Rx<Future<List<Map<dynamic, dynamic>>>> getBookmarks =
      Bookmarks().getBookmarks().obs;

  removeFromBookmarks(String id) async {
    await Bookmarks().removeFromBookmark(id);
  }

  clearBookmarks() async {
    var i = await Bookmarks().clearAllBookmarks();
    if (i == 0) {
      Get.snackbar(
        'Info',
        'All Bookmarks has been deleted',
        snackPosition: SnackPosition.BOTTOM,
      );
      getBookmarks.value = Bookmarks().getBookmarks();
    } else {
      Get.snackbar(
        'Error',
        'Error event not completed',
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    getBookmarks.value = Bookmarks().getBookmarks();
  }
}
