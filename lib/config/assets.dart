import 'package:flutter/animation.dart';

import '../model/news/news_enums.dart';

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

class HexaColor {
  static Color c(String hexa) =>
      Color(int.parse('0xFF${hexa.substring(1)}', radix: 16));
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
