import 'package:tell_me_news/model/news_enums.dart';

class CountryFlag {
  String getFlag(SupportedCountry supportedCountry) {
    return 'assets/images/countries/${supportedCountry.name.substring(0, 2)}.png';
  }
}
