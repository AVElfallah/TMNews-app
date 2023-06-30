import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getwidget/getwidget.dart';
import 'package:tell_me_news/controller/currency_converter_controller.dart';

import '../../widgets/currency_card_widget.dart';

class CurrencyNewsScreen extends GetView {
  const CurrencyNewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currencyCtrl = Get.put(
      CurrencyConverterController(),
    );

    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
        title: Text('currencyconverter'.tr),
        centerTitle: true,
      ),
      body: Column(
        children: [
          CurrencyCardWidget(
            controller: currencyCtrl.textCtrl1,
            selectedItem: currencyCtrl.currency1st,
            onChanged: (v) {
              currencyCtrl.changeMainCurrency(v!);
            },
          ),
          GFButton(
            type: (context.isDarkMode)
                ? GFButtonType.outline2x
                : GFButtonType.solid,
            shape: GFButtonShape.pills,
            padding: EdgeInsets.symmetric(
              horizontal: context.width * .15,
            ),
            size: GFSize.LARGE,
            icon: Icon(
              Icons.compare_arrows_rounded,
              color: (context.isDarkMode) ? GFColors.PRIMARY : GFColors.WHITE,
            ),
            child: Text(
              'convert'.tr,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            onPressed: () {
              currencyCtrl.currencyConvert();
            },
          ),
          CurrencyCardWidget(
            controller: currencyCtrl.textCtrl2,
            selectedItem: currencyCtrl.currency2nd,
            onChanged: (v) {
              currencyCtrl.changeSecondCurrency(v!);
            },
          ),
        ],
      ),
    );
  }
}
