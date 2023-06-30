import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:get/get.dart';

import '../../repository/currencies.dart';

class CurrencyCardWidget extends StatelessWidget {
  final void Function(String?)? onChanged;
  final String? selectedItem;
  final TextEditingController? controller;

  const CurrencyCardWidget({
    Key? key,
    required this.onChanged,
    required this.controller,
    required this.selectedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currenciesAsItem = Currencies().getAllCodes();

    return SizedBox(
      height: context.height * .28,
      width: context.width,
      child: Card(
        elevation: 6,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: context.theme.primaryColor.withOpacity(.15),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                child: SizedBox(
                  width: context.width * .38,
                  child: DropdownSearch<String>(
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      textAlign: TextAlign.center,
                      dropdownSearchDecoration: InputDecoration(
                        constraints:
                            BoxConstraints(maxHeight: context.height * .065),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    items: currenciesAsItem,
                    onChanged: onChanged,
                    selectedItem: selectedItem,
                    popupProps: const PopupProps.dialog(
                      showSearchBox: true,
                      showSelectedItems: true,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: controller,
                  style: const TextStyle(
                    fontSize: 19,
                  ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(
                      10,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        15,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
