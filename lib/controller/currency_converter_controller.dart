import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getwidget/getwidget.dart';
import 'package:tell_me_news/controller/user_controller.dart';
import 'package:tell_me_news/repository/app_preferences.dart';
import 'package:tell_me_news/repository/currencies.dart';

class CurrencyConverterController extends GetxController {
  @override
  bool get initialized {
    var user = Get.find<UserController>(tag: 'user_ctrl').userPreferences;
    currency1st = user!.mainCurrency!;
    currency2nd = user.secondCurrency!;
    update();
    return super.initialized;
  }

  String currency1st = 'USD';
  String currency2nd = 'EGP';
  TextEditingController textCtrl1 = TextEditingController();
  TextEditingController textCtrl2 = TextEditingController();

  changeMainCurrency(String val) {
    currency1st = val;
    SharedAppSettings().changeMainCurrency(val);
    update();
  }

  changeSecondCurrency(String val) {
    currency2nd = val;
    SharedAppSettings().changeSecondCurrency(val);
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
