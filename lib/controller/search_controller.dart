import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tell_me_news/model/news_enums.dart';
import 'package:tell_me_news/model/search_enums.dart';
import 'package:tell_me_news/repository/news_search_repository.dart';

import '../model/news_model.dart';

class SearchController extends GetxController {
  TextEditingController searchCtrl = TextEditingController();

  DateTime from = DateTime.now();
  DateTime to = DateTime.now();
  SupportedLanguage supportedLanguage = SupportedLanguage.ar;

  final searchIn = <SearchIn>[].obs;
  RxBool get isHaveTitle => searchIn.contains(SearchIn.title).obs;

  void changeSearchIn(SearchIn se) {
    if (searchIn.contains(se)) {
      searchIn.remove(se);
    } else {
      searchIn.add(se);
    }
    update();
    printInfo(info: 'Change search in to $searchIn');
  }

  void changeLanguage(SupportedLanguage suLanguage) {
    supportedLanguage = suLanguage;
    printInfo(info: 'Change language to $suLanguage');
  }

  void changefrom(DateTime dateTime) {
    if (to.isAfter(dateTime) || to.isAtSameMomentAs(dateTime)) {
      from = dateTime;
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
    printInfo(info: 'Change fromTime to $from');
  }

  void changeto(DateTime dateTime) {
    if (dateTime.isAfter(from) || dateTime.isAtSameMomentAs(from)) {
      to = dateTime;
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
    printInfo(info: 'Change fromTime to $to');
  }

  Future<List<NewsModel>> searchForNews() async {
    if (searchCtrl.value.text != '') {
      return await NewsSearchRepository(
        searchIn: searchIn,
        supportedLanguage: supportedLanguage,
        dateTimeTo: to,
        dateTimeFrom: from,
        searchString: searchCtrl.text,
      ).getNews();
    } else {
      return <NewsModel>[];
    }
  }
}
