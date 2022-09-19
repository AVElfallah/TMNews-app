import 'package:get/get.dart';
import 'package:tell_me_news/model/news_enums.dart';

class NewspaperController extends GetxController {
  Rx<SupportedCategories> category = SupportedCategories.general.obs;
  Rx<SupportedCountry> country = SupportedCountry.eg.obs;
  Rx<SupportedLanguage> language = SupportedLanguage.ar.obs;

  changeCategory(SupportedCategories cat) {
    category.value = cat;
  }

  changeLanguage(SupportedLanguage lang) {
    language.value = lang;
  }

  changeCountry(SupportedCountry coun) {
    country.value = coun;
  }
}
