import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getwidget/getwidget.dart';
import 'package:tell_me_news/controller/currency_converter_controller.dart';
import 'package:tell_me_news/repository/currencies.dart';

class CurrencyNewsScreen extends GetView {
  const CurrencyNewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currencyCtrl = Get.put(
      CurrencyConverterController(),
    );

    final currenciesAsItem = Currencies().getAllCodes();

    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
        title: Text('currencyconverter'.tr),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Positioned(
            top: context.height * .045,
            left: 0,
            child: SizedBox(
              height: context.height * .26,
              width: context.width,
              child: GFCard(
                elevation: 20,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                title: GFListTile(
                  title: Center(
                    child: SizedBox(
                      width: context.width * .35,
                      child: DropdownSearch<String>(
                        dropdownDecoratorProps: DropDownDecoratorProps(
                          textAlign: TextAlign.center,
                          dropdownSearchDecoration: InputDecoration(
                            constraints: BoxConstraints(
                                maxHeight: context.height * .065),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        items: currenciesAsItem,
                        onChanged: ((value) {
                          currencyCtrl.changeMainCurrency(value!);
                        }),
                        selectedItem: currencyCtrl.currency1st,
                        popupProps: const PopupProps.dialog(
                          showSearchBox: true,
                          showSelectedItems: true,
                        ),
                      ),
                    ),
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
            top: context.height * .29,
            left: 0,
            child: SizedBox(
              height: context.height * .26,
              width: context.width,
              child: GFCard(
                elevation: 20,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                title: GFListTile(
                  title: Center(
                    child: SizedBox(
                      width: context.width * .35,
                      child: DropdownSearch<String>(
                        dropdownDecoratorProps: DropDownDecoratorProps(
                          textAlign: TextAlign.center,
                          dropdownSearchDecoration: InputDecoration(
                            constraints: BoxConstraints(
                                maxHeight: context.height * .065),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        items: currenciesAsItem,
                        onChanged: ((value) {
                          currencyCtrl.changeSecondCurrency(value!);
                        }),
                        selectedItem: currencyCtrl.currency2nd,
                        popupProps: const PopupProps.dialog(
                          showSearchBox: true,
                          showSelectedItems: true,
                        ),
                      ),
                    ),
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
            top: context.height * .265,
            left: context.width * .20,
            child: GFButton(
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
          ),
        ],
      ),
    );
  }
}
