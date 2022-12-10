import 'package:tell_me_news/model/news_enums.dart';

class Assets {
  static const appLogo = 'assets/images/tmlogo.png';
  static const appError = 'assets/images/error.png';
  static const person = 'assets/images/person.png';
  static const placeholder = 'assets/images/placeholder.png';
  static const search = 'assets/images/search.png';
  static const languages = 'assets/images/languages.png';
  static const countries = 'assets/images/countries.png';
  static const time = 'assets/images/time.png';
}

class CountryFlag {
  String getFlag(SupportedCountry supportedCountry) {
    return 'assets/images/countries/${supportedCountry.name.substring(0, 2)}.png';
  }
}
