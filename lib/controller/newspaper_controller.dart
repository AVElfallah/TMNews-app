import 'package:get/get.dart';

import 'package:tell_me_news/repository/app_preferences.dart';

import '../model/news/news_enums.dart';
import '../model/news/news_model.dart';
import '../repository/news_repository.dart';

class NewspaperController extends GetxController {
  Rx<SupportedCategories> category = SupportedCategories.general.obs;
  Rx<SupportedCountry> country = SupportedCountry.eg.obs;
  Rx<SupportedLanguage> language = SupportedLanguage.ar.obs;

  void changeCategory(SupportedCategories cat) {
    category.value = cat;
  }

  void changeLanguage(SupportedLanguage lang) async {
    language.value = lang;
    await SharedAppSettings.instance.changeNewsLanguage(lang);
  }

  void changeCountry(SupportedCountry coun) async {
    country.value = coun;
    await SharedAppSettings.instance.changeNewsCountry(coun);
  }

  Future<List<NewsReportModel>> getNews() async {
    return GetNews(
      category: category.value,
      country: country.value,
      language: language.value,
    ).getNews();
  }
}
