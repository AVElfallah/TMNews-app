import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tell_me_news/model/app_user.dart';
import 'package:tell_me_news/model/news_enums.dart';

enum User {
  guest,
  registered,
}

//boxes

Future<GetStorage> _getOpenUserBox() async {
  var dir = await getApplicationDocumentsDirectory();
  var getStorage = GetStorage('app_user', dir.path);
  await getStorage.initStorage;
  return getStorage;
}

class SharedAppSettings {
//guestAccount
  // ignore: body_might_complete_normally_nullable
  Future<AppUserPreferences?> getAppUserAccount() async {
    var userBox = await _getOpenUserBox();
    if (await userBox.initStorage) {
      var name = userBox.read('name');
      var isDarkMode = userBox.read('isDarkMode');
      var appLanguage = userBox.read('appLanguage');
      var mainCurrency = userBox.read('mainCurrency');
      var secondCurrency = userBox.read('secondCurrency');
      var newsCountry = userBox.read('newsCountry');
      var newsLanguage = userBox.read('newsLanguage');

      return AppUserPreferences(
        name: name,
        isDarkMode: isDarkMode,
        appLanguage: appLanguage,
        mainCurrency: mainCurrency,
        secondCurrency: secondCurrency,
        newsCountry: newsCountry,
        newsLanguage: newsLanguage,
      );
    }
  }

  intialGuestAccount() async {
    var box = await _getOpenUserBox();

    var app = AppUserPreferences(
      appLanguage: 'ar',
      isDarkMode: true,
      mainCurrency: 'USD',
      secondCurrency: 'EGP',
      name: 'Guest Account',
      newsCountry: SupportedCountry.eg.name,
      newsLanguage: SupportedLanguage.ar.name,
    ).toMap();

    app.forEach(
      (key, value) {
        box.writeIfNull(key.toString(), value);
      },
    );
  }

//func

  changeThemeMode(bool isDarkMode) async {
    var guestBox = await _getOpenUserBox();
    guestBox.write("isDarkMode", isDarkMode);
  }

  changeNewsLanguage(SupportedLanguage newsLanguage) async {
    var guestBox = await _getOpenUserBox();
    guestBox.write("newsLanguage", newsLanguage.name);
  }

  changeAppLanguage(String lang) async {
    var guestBox = await _getOpenUserBox();
    guestBox.write("newsLanguage", lang);
  }

  changeMainCurrency(String mC) async {
    var guestBox = await _getOpenUserBox();
    guestBox.write("mainCurrency", mC);
  }

  changeSecondCurrency(String sC) async {
    var guestBox = await _getOpenUserBox();
    guestBox.write("secondCurrency", sC);
  }

  changeName(String name) async {
    var guestBox = await _getOpenUserBox();
    guestBox.write("name", name);
  }

  changeNewsCountry(SupportedCountry nC) async {
    var guestBox = await _getOpenUserBox();
    guestBox.write("newsCountry", nC.name);
  }
}
