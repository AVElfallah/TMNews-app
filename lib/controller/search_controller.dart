import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tell_me_news/model/news/news_enums.dart';
import 'package:tell_me_news/model/search_enums.dart';
import 'package:tell_me_news/repository/news_search_repository.dart';

import '../model/news/news_model.dart';
import 'dart:core';

class SearchController extends GetxController {
  TextEditingController searchCtrl = TextEditingController();

  Rx<DateTime> from = DateTime.now().obs;
  Rx<DateTime> to = DateTime.now().obs;
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
    printInfo(info: 'Change fromTime to $from');
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
    printInfo(info: 'Change toTime to $to');
  }

  Future<List<NewsReportModel>> searchForNews() async {
    if (searchCtrl.value.text != '') {
      return await NewsSearchRepository(
        searchIn: searchIn,
        supportedLanguage: supportedLanguage,
        dateTimeTo: to.value,
        dateTimeFrom: from.value,
        searchString: searchCtrl.text,
      ).getNews();
    }
    return <NewsReportModel>[];
  }
}
