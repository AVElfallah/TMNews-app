import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tell_me_news/model/search_enums.dart';

import '../../model/news/news_enums.dart';

class SearchFilterWidget extends StatelessWidget {
  const SearchFilterWidget({
    Key? key,
    required this.changeSearchIn,
    required this.searchIn,
    required this.changeLanguage,
    required this.from,
    required this.to,
    required this.changefrom,
    required this.changeto,
  }) : super(key: key);
  final void Function(SearchIn) changeSearchIn;
  final RxList<SearchIn> searchIn;
  final void Function(SupportedLanguage) changeLanguage;
  final void Function(DateTime) changeto, changefrom;
  final Rx<DateTime> from, to;
  @override
  Widget build(BuildContext context) {
    var lang = SupportedLanguage.values
        .map(
          (lan) => PopupMenuItem<SupportedLanguage>(
            value: lan,
            child: Text(
              lan.name.toUpperCase(),
            ),
          ),
        )
        .toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //search query
          StatefulBuilder(
            builder: (context, setState) {
              return PopupMenuButton(
                icon: const Icon(
                  Icons.manage_search,
                  size: 40,
                ),
                tooltip: 'to specify where search in',
                position: PopupMenuPosition.under,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35),
                ),
                itemBuilder: ((context) {
                  return [
                    PopupMenuItem(
                      child: Obx(
                        () => SwitchListTile(
                          onChanged: (val) {
                            changeSearchIn.call(SearchIn.title);
                            setState(() {});
                          },
                          title: Text('title'.tr),
                          value: searchIn.contains(SearchIn.title).obs.value,
                        ),
                      ),
                    ),
                    PopupMenuItem(
                      child: Obx(
                        () => SwitchListTile(
                          onChanged: (val) {
                            changeSearchIn.call(SearchIn.description);
                            //  ctrl.changeSearchIn(SearchIn.description);
                            setState(() {});
                          },
                          title: Text(
                            'description'.tr,
                            maxLines: 1,
                            overflow: TextOverflow.visible,
                            softWrap: false,
                          ),
                          value:
                              searchIn.contains(SearchIn.description).obs.value,
                        ),
                      ),
                    ),
                    PopupMenuItem(
                      child: Obx(
                        () => SwitchListTile(
                          onChanged: (val) {
                            changeSearchIn.call(SearchIn.content);
                            setState(() {});
                          },
                          title: Text('content'.tr),
                          value: searchIn.contains(SearchIn.content).obs.value,
                        ),
                      ),
                    ),
                  ];
                }),
              );
            },
          ),
          //selection language
          PopupMenuButton<SupportedLanguage>(
            constraints: BoxConstraints.expand(
              width: context.width * .35,
              height: context.height * .35,
            ),
            position: PopupMenuPosition.under,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35),
            ),
            itemBuilder: ((context) {
              return lang;
            }),
            icon: const Icon(
              Icons.translate,
              size: 35,
            ),
            onSelected: (supported) {
              changeLanguage.call(supported);
            },
          ),

          //from ro
          PopupMenuButton<String>(
            position: PopupMenuPosition.under,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35),
            ),
            itemBuilder: ((context) {
              return [
                PopupMenuItem(
                  child: TextButton.icon(
                    onPressed: () {
                      var now = DateTime.now();
                      showDatePicker(
                        context: context,
                        initialDate: from.value,
                        firstDate: DateTime(now.year - 1),
                        lastDate: now,
                      ).then(
                        (from) => changefrom.call(from!),
                      );
                    },
                    label: Text('from'.tr),
                    icon: const Icon(Icons.date_range),
                  ),
                ),
                PopupMenuItem(
                  child: TextButton.icon(
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        initialDate: to.value,
                        firstDate: DateTime(1999),
                        lastDate: DateTime.now(),
                      ).then(
                        (to) => changeto.call(to!),
                      );
                    },
                    label: Text('to'.tr),
                    icon: const Icon(Icons.date_range),
                  ),
                ),
              ];
            }),
            icon: const Icon(
              Icons.calendar_month,
              size: 35,
            ),
          ),
        ],
      ),
    );
  }
}
