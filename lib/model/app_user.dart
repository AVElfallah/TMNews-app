class AppUserPreferences {
  final String? name;

  final bool? isDarkMode;

  final bool? isLogin;

  final String? appLanguage;

  final String? mainCurrency;

  final String? secondCurrency;

  final String? newsCountry;

  final String? newsLanguage;

  Map toMap() {
    return {
      'name': name,
      'isDarkMode': isDarkMode,
      'appLanguage': appLanguage,
      'mainCurrency': mainCurrency,
      'secondCurrency': secondCurrency,
      'newsCountry': newsCountry,
      "newsLanguage": newsLanguage,
      'isLogin': isLogin,
    };
  }

  AppUserPreferences({
    this.name,
    this.isDarkMode,
    this.appLanguage,
    this.mainCurrency,
    this.secondCurrency,
    this.newsCountry,
    this.newsLanguage,
    this.isLogin = false,
  });
}
