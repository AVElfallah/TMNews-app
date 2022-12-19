import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getwidget/getwidget.dart';
import 'package:tell_me_news/repository/app_preferences.dart';
import 'package:tell_me_news/repository/currencies.dart';
import 'package:tell_me_news/services/app_settings.dart';

class CurrencyConverterController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    var user =
        Get.find<AppSettingsService>(tag: 'settings_service').userPreferences;
    currency1st = user!.mainCurrency!;
    currency2nd = user.secondCurrency!;
    update();
  }

  String currency1st = 'USD';
  String currency2nd = 'EGP';
  TextEditingController textCtrl1 = TextEditingController();
  TextEditingController textCtrl2 = TextEditingController();

  changeMainCurrency(String val) {
    currency1st = val;
    SharedAppSettings.instance.changeMainCurrency(val);
    update();
  }

  changeSecondCurrency(String val) {
    currency2nd = val;
    SharedAppSettings.instance.changeSecondCurrency(val);
    update();
  }

  currencyConvert() async {
    if (textCtrl1.text != '') {
      Get.showOverlay<String>(
        asyncFunction: () async {
          textCtrl2.text = await CurrencyConverter()
              .cConvert(currency1st, currency2nd, double.parse(textCtrl1.text));
          return '';
        },
        loadingWidget: const Center(
          child: GFLoader(
            type: GFLoaderType.square,
            size: GFSize.LARGE,
          ),
        ),
      );
    } else {
      Get.snackbar(
        'Error',
        'you must insert a number',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
