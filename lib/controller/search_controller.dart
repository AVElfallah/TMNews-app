import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tell_me_news/model/news_enums.dart';
import 'package:tell_me_news/model/search_enums.dart';
import 'package:tell_me_news/repository/news_search_repository.dart';

import '../model/news_model.dart';

class SearchController extends GetxController {
  Rx<TextEditingController> searchCtrl = TextEditingController().obs;
  Rx<DateTime> from = DateTime.now().obs;
  Rx<DateTime> to = DateTime.now().obs;
  Rx<SupportedLanguage> supportedLanguage = SupportedLanguage.ar.obs;

  RxList<SearchIn> searchIn = <SearchIn>[].obs;

  void changeSearchIn(SearchIn se) {
    if (searchIn.contains(se)) {
      searchIn.remove(se);
    } else {
      searchIn.add(se);
    }
  }

  void changeLanguage(SupportedLanguage suLanguage) {
    supportedLanguage.value = suLanguage;
  }

  void changefrom(DateTime dateTime) {
    if (to.value.isAfter(dateTime) || to.value.isAtSameMomentAs(dateTime)) {
      from.value = dateTime;
    } else {
      Get.snackbar(
        'Date Erorr',
        'Can\'t set the date',
        icon: const Icon(Icons.error),
        duration: const Duration(seconds: 5),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade900,
      );
    }
  }

  void changeto(DateTime dateTime) {
    if (dateTime.isAfter(from.value) || dateTime.isAtSameMomentAs(from.value)) {
      to.value = dateTime;
    } else {
      Get.snackbar(
        'Date Erorr',
        'Can\'t set the date',
        icon: const Icon(Icons.error),
        duration: const Duration(seconds: 5),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade900,
      );
    }
  }

  Future<List<NewsModel>> searchForNews() async {
    final searchn = searchIn.value;
    final toVal = to.value;
    final fromVal = from.value;
    final supVal = supportedLanguage.value;
    final text = searchCtrl.value.text;
    if (text != '') {
      return await NewsSearchRepository(
        searchIn: searchn,
        supportedLanguage: supVal,
        dateTimeTo: toVal,
        dateTimeFrom: fromVal,
        searchString: searchCtrl.value.text,
      ).getNews();
    } else {
      Get.snackbar(
        'Empty Filed',
        'Type any thing to search',
        icon: const Icon(Icons.error),
        duration: const Duration(seconds: 5),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade900,
      );
      return <NewsModel>[];
    }
  }
}
