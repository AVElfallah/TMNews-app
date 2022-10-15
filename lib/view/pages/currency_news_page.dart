import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getwidget/getwidget.dart';
import 'package:tell_me_news/controller/currency_converter_controller.dart';
import 'package:tell_me_news/repository/app_preferences.dart';
import 'package:tell_me_news/repository/currencies.dart';

class CurrencyNewsPage extends GetView {
  const CurrencyNewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currencyCtrl = Get.put(
      CurrencyConverterController(),
    );

    final currenciesAsItem = Currencies()
        .getAllCodes()
        .map(
          (item) => DropdownMenuItem(
            value: item,
            child: Text(
              item,
            ),
          ),
        )
        .toList();
    final mq = MediaQuery.of(
      context,
    ).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency Converter'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.changeThemeMode(
              context.isDarkMode ? ThemeMode.light : ThemeMode.dark,
            );
            SharedAppSettings().changeThemeMode(context.isDarkMode);
          },
          icon: Icon(context.isDarkMode ? Icons.sunny : Icons.dark_mode),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: mq.height * .045,
            left: 0,
            child: SizedBox(
              height: mq.height * .25,
              width: mq.width,
              child: GFCard(
                elevation: 20,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                title: GFListTile(
                  title: StatefulBuilder(
                    builder: (context, setState) {
                      return Center(
                        child: SizedBox(
                          width: mq.width * .35,
                          child: DropdownButton(
                            isExpanded: true,
                            elevation: 20,
                            value: currencyCtrl.currency1st,
                            items: currenciesAsItem,
                            icon: const Icon(Icons.arrow_drop_down),
                            onChanged: (String? value) {
                              currencyCtrl.changeMainCurrency(value!);

                              setState(() {});
                            },
                          ),
                        ),
                      );
                    },
                  ),
                  subTitle: GFTextFieldRounded(
                    controller: currencyCtrl.textCtrl1,
                    editingbordercolor: Colors.green,
                    idlebordercolor: Colors.black,
                    borderwidth: 1,
                    cornerradius: 15,
                    hintText: '',
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: mq.height * .29,
            left: 0,
            child: SizedBox(
              height: mq.height * .25,
              width: mq.width,
              child: GFCard(
                elevation: 20,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                title: GFListTile(
                  title: StatefulBuilder(
                    builder: (context, setState) {
                      return Center(
                        child: SizedBox(
                          width: mq.width * .35,
                          child: DropdownButton(
                            isExpanded: true,
                            elevation: 20,
                            value: currencyCtrl.currency2nd,
                            items: currenciesAsItem,
                            icon: const Icon(Icons.arrow_drop_down),
                            onChanged: (String? value) {
                              currencyCtrl.changeSecondCurrency(value!);

                              setState(() {});
                            },
                          ),
                        ),
                      );
                    },
                  ),
                  subTitle: GFTextFieldRounded(
                    controller: currencyCtrl.textCtrl2,
                    editingbordercolor: Colors.green,
                    idlebordercolor: Colors.black,
                    readOnly: true,
                    borderwidth: 1,
                    cornerradius: 15,
                    hintText: '',
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: mq.height * .265,
            left: mq.width * .20,
            child: GFButton(
              type: (context.isDarkMode)
                  ? GFButtonType.outline2x
                  : GFButtonType.solid,
              shape: GFButtonShape.pills,
              padding: EdgeInsets.symmetric(
                horizontal: mq.width * .15,
              ),
              size: GFSize.LARGE,
              icon: Icon(
                Icons.compare_arrows_rounded,
                color: (context.isDarkMode) ? GFColors.PRIMARY : GFColors.WHITE,
              ),
              child: const Text(
                'Convert',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              onPressed: () {
                currencyCtrl.currencyConvert();
              },
            ),
          ),
        ],
      ),
    );
  }
}
