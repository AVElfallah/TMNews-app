import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tell_me_news/controller/newspaper_controller.dart';

import '../../model/news_enums.dart';

class NewsFilterWidget extends StatelessWidget {
  const NewsFilterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var supcount =
        SupportedCountry.values.map(((e) => e.name.toUpperCase())).toList();
    return PopupMenuButton(
      icon: const Icon(Icons.filter_alt),
      tooltip: 'news filters',
      splashRadius: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      position: PopupMenuPosition.under,
      itemBuilder: (ctx) {
        return [
          PopupMenuItem(
            child: GetX<NewspaperController>(
                tag: 'newspaper',
                builder: (newspaperCtrl) {
                  return DropdownButton<String>(
                    borderRadius: BorderRadius.circular(25),
                    menuMaxHeight: 250,
                    value: newspaperCtrl.language.value.name,
                    hint: const Text('News language'),
                    onChanged: (o) {
                      newspaperCtrl.changeLanguage(
                        SupportedLanguage.values
                            .firstWhere((element) => element.name == o),
                      );
                    },
                    items: SupportedLanguage.values
                        .map(
                          (e) => DropdownMenuItem<String>(
                            value: e.name,
                            child: Text(
                              e.name.toUpperCase(),
                            ),
                          ),
                        )
                        .toList(),
                  );
                }),
            onTap: () {},
          ),
          PopupMenuItem(
            child: GetX<NewspaperController>(
              tag: 'newspaper',
              builder: (newspaperCtrl) {
                return CountryPickerDropdown(
                  itemFilter: (country) {
                    return supcount.contains(country.isoCode);
                  },
                  itemBuilder: (country) {
                    return Row(
                      children: <Widget>[
                        CountryPickerUtils.getDefaultFlagImage(country),
                        const SizedBox(
                          width: 20,
                        ),
                        Text("(${country.isoCode})"),
                      ],
                    );
                  },
                  initialValue: newspaperCtrl.country.value.name.toUpperCase(),
                  onValuePicked: (c) {
                    newspaperCtrl.changeCountry(
                      SupportedCountry.values.firstWhere(
                        (country) => country.name == c.isoCode.toLowerCase(),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ];
      },
    );
  }
}
