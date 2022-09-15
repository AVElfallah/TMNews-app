import 'package:shared_preferences/shared_preferences.dart';

class SharedAppSettings {
  Future getAppUse() async {
    final prefs = await SharedPreferences.getInstance();
    var firstUse = prefs.getBool('first_use');
    return firstUse;
  }
}
