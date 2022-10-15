import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tell_me_news/controller/newspaper_controller.dart';
import 'package:tell_me_news/repository/country_flag.dart';

import '../../model/news_enums.dart';

class NewsFilterWidget extends StatelessWidget {
  const NewsFilterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                return DropdownButton<SupportedCountry>(
                  value: newspaperCtrl.country.value.obs.value,
                  items: SupportedCountry.values
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Row(
                              children: <Widget>[
                                Image.asset(
                                  CountryFlag().getFlag(e),
                                  width: 40,
                                  height: 45,
                                  fit: BoxFit.contain,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(e.name.toUpperCase()),
                              ],
                            ),
                          ))
                      .toList(),
                  onChanged: (coun) {
                    newspaperCtrl.changeCountry(coun!);
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
